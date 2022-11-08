import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/data/model/pokemon_model.dart' as pokemon;
import 'package:pokedex/screen/detail/detail_screen.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.red,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icon/ic_pokeball.svg',
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                ),
                title: const Text(
                  'Pokedex',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  child: TextField(
                    onChanged: (text) => controller.updateList(text),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Cari Pokemon",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              PagedSliverGrid<int, pokemon.Results?>(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 180,
                ),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<pokemon.Results?>(
                  itemBuilder: (context, item, index) => Card(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                            () => const DetailScreen(),
                          arguments: {
                            'id': item.url!
                                .split("pokemon")
                                .last
                                .replaceAll("/", "")
                          },
                          transition: Transition.cupertino,
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Text(controller.formatter.format(
                                    int.parse(
                                      item!.url!
                                          .split("pokemon")
                                          .last
                                          .replaceAll("/", ""),
                                    ),
                                  ) ??
                                  "-"),
                            ),
                            Positioned(
                              top: 15,
                              right: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: Image.network(
                                //   "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${item.url?.split("pokemon").last.replaceAll("/", "")}.png",
                                //   loadingBuilder:
                                //       (context, child, loadingProgress) {
                                //     if (loadingProgress == null) {
                                //       return child;
                                //     }
                                //     return Lottie.asset(
                                //         "assets/lottie/pokeball_lottie.json");
                                //   },
                                // ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${item?.url?.split("pokemon").last.replaceAll("/", "")}.png",
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return Lottie.asset(
                                        "assets/lottie/pokeball_lottie.json");
                                  },
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${item.name?[0].toUpperCase()}${item.name?.substring(1)}' ??
                                        "-",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
