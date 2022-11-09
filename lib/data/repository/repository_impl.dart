import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokedex/data/model/dekripsi_pokemon_model.dart';
import 'package:pokedex/data/model/detail_pokemon_model.dart';
import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/data/network_core.dart';
import 'package:pokedex/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<PokemonModel?> getDataPokemon(
      int offset, int limit, String namaPokemon) async {
    try {
      var response =
          await network.dio.get("/pokemon/$namaPokemon", queryParameters: {
        "offset": offset,
        "limit": limit,
      });
      return PokemonModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  @override
  FutureOr<DeskripsiPokemonModel> getDeksripsiPokemon(String id) async {
    try {
      var response = await network.dio.get("/pokemon-species/$id");
      return DeskripsiPokemonModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<DetailPokemonModel> getDetailPokemon(String id) async {
    try {
      var response = await network.dio.get("/pokemon/$id");
      print(DetailPokemonModel.fromJson(response.data));
      return DetailPokemonModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }
}
