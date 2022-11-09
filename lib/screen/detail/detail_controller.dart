import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/data/model/dekripsi_pokemon_model.dart';
import 'package:pokedex/data/model/detail_pokemon_model.dart';
import 'package:pokedex/data/repository/repository.dart';

enum DetailViewState {
  none,
  loading,
  error,
}

class DetailController extends GetxController {
  NumberFormat formatter = NumberFormat("#000");
  DetailViewState _state = DetailViewState.none;
  DetailViewState get state => _state;
  final repository = Get.find<Repository>();
  List<String?> flavourText = [];
  List<String?> flavourTextEn = [];
  Set<String?> listFilter = {};
  DetailPokemonModel? detailPokemon;
  var dataArgument = Get.arguments;

  changeState(DetailViewState s) {
    _state = s;
    update();
  }
  
  @override
  void onInit() {
    getDekripsiPokemon();
    super.onInit();
  }


  Future getDekripsiPokemon () async {
    changeState(DetailViewState.loading);
    String id = dataArgument['id'].toString();

    try {
      var dataDetail = await repository.getDetailPokemon(id);
      detailPokemon = dataDetail;
      var dataDeksripsi = await repository.getDeksripsiPokemon(id);
      for (int index = 0; index <= dataDeksripsi.flavorTextEntries!.length; index++) {
        if (dataDeksripsi.flavorTextEntries?[index].language!.name == 'en') {
          flavourText = dataDeksripsi.flavorTextEntries!.map((e) => e.flavorText).toList();
        }
        listFilter = flavourText.toSet();
        flavourText = listFilter.toList();
        update();
        changeState(DetailViewState.none);
      }
    }
    catch (e){
      changeState(DetailViewState.error);
      return e;
    }
  }

}
