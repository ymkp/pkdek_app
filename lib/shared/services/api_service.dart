import 'package:get/get.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:poke/const/settings.dart';
import 'package:poke/shared/services/hive_box._service.dart';
import 'dart:convert';
import 'package:poke/shared/utils/string_helper.dart';

class ApiService extends GetxService {
  Box<dynamic>? _responseBox;
  @override
  onReady() {
    initBox();
  }

  /// initiate response box
  initBox() async {
    await Get.find<HiveBoxService>().init();
    _responseBox = Hive.box<String>('box-response');
  }

  /// GET operation
  Future<dynamic> get({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? query,
  }) async {
    Map<String, String> h = {
      'Content-Type': 'application/json',
    };
    if (header != null && header.isNotEmpty) {
      h.addAll(header);
    }
    final q = query ?? {};
    final u = '$url${getQueryStringFromMap(q)}';

    if (_responseBox != null) {
      if (_responseBox!.get(u) != null) {
        if (kDebugMode) log('response from cache');
        return json.decode(_responseBox!.get(u));
      }
    }
    final res = await http
        .get(
          Uri.parse('$url${getQueryStringFromMap(q)}'),
          headers: h,
        )
        .timeout(const Duration(seconds: timeoutSeconds));
    return _processResponse(res);
  }

  /// process resopnse, try to catch known errors
  dynamic _processResponse(http.Response response) {
    if (kDebugMode) {
      log('${response.request!.url} ${response.request?.method}');
      log('${response.statusCode} : ${response.body}');
    }
    final res = response.body == 'ok' ? {} : json.decode(response.body);
    if ([200, 201].contains(response.statusCode)) {
      if (_responseBox != null) {
        _responseBox!.put(response.request!.url.toString(), response.body);
      }
      return res;
    } else {
      String errMsg = '';
      String thrownMsg = '';
      try {
        errMsg = res['error']['message'];
      } catch (e) {
        if (kDebugMode) print('failed to catch error msg : $e');
      }
      switch (errMsg) {
        case 'Not Found':
          thrownMsg = 'Tidak ditemukan';
          break;
        case 'Unauthorized':
          thrownMsg = (response.request!.url.toString().split('/').last == 'login') ? 'Password salah' : 'Tidak terotorisasi';
          break;
        default:
          thrownMsg = errMsg;
          break;
      }
      throw thrownMsg;
    }
  }
}
