import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/model/pokemon_model.dart' as pokemon;
import 'package:intl/intl.dart';
import 'package:pokedex/data/repository/repository.dart';

class HomeController extends GetxController {
  final repository = Get.find<Repository>();

  final limit = 9;

  var searchTerm = "";

  NumberFormat formatter = NumberFormat("#000");

  final PagingController<int, pokemon.Results?> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> fetchPage(offset) async {
    try {
      final newItems = await repository.getDataPokemon(offset, limit, searchTerm);
      final isLastPage = newItems!.results!.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results!);
      } else {
        final nextPageKey = offset + newItems.results!.length;
        pagingController.appendPage(newItems.results!, nextPageKey);
        // if(searchTerm.isNotEmpty) {
        //   pagingController.itemList?.clear();
        //   pagingController.appendPage(newItems.results!.where((e) => e.name!.toLowerCase().contains(searchTerm.toLowerCase())).toList(), nextPageKey);
        // }
      }

    } catch (error) {
      pagingController.error = error;
    }
  }

  void updateList (String dataText) {
    update();
    pagingController.refresh();
  }
}
