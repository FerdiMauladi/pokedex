import 'dart:async';

import 'package:pokedex/data/model/dekripsi_pokemon_model.dart';
import 'package:pokedex/data/model/detail_pokemon_model.dart';
import 'package:pokedex/data/model/pokemon_model.dart';


abstract class Repository {

  FutureOr<PokemonModel?> getDataPokemon(int offset, int limit, String namaPokemon);
  FutureOr<DetailPokemonModel?> getDetailPokemon(String id);
  FutureOr<List<DeksripsiPokemonModel?>> getDeksripsiPokemon(String id);
}