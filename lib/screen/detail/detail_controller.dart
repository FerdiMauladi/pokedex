import 'package:get/get.dart';
import 'package:pokedex/data/model/dekripsi_pokemon_model.dart';
import 'package:pokedex/data/repository/repository.dart';

class DetailController extends GetxController {
  final repository = Get.find<Repository>();
  List flavourText = [];
  var dataArgument = Get.arguments;


  @override
  void onInit() {
    getDekripsiPokemon();
    super.onInit();
  }

  Future<void> getDekripsiPokemon () async {
    String id = dataArgument['id'].toString();
    List<DeksripsiPokemonModel?> listText = await repository.getDeksripsiPokemon(id);
    print(listText);
    // if (listText.where((element) => element?.language?.name == "en" ) == true) {
    //   flavourText.add(listText.map((e) => e?.flavorText).toList());
    // }
    // print(flavourText);
  }

}
