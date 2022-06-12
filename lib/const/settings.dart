/// global timeout
const int timeoutSeconds = 15;

/// pokeapi main
const String getPokemonURL = 'https://pokeapi.co/api/v2/pokemon';

/// pokeapi cache api to get pokemon types
/// pokemon detail api is full of unnecessary data for home page
/// check the docs in pkdek.rutesatu.com/docs
const String getPokemonMiniURL = 'https://pkdek.rutesatu.com/api/v1/pokemon';

/// POKEMON HOME(tm) img base url
/// use it for 3Dish images
const String getPokemonHomeIMG = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/';

/// in-game pokedex sprite
/// use it for pixelated style
const String getPokemonSpriteIMG = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';

/// official pokemon images
/// use it if you want to use official img
const String getPokemonOfficialIMG = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
