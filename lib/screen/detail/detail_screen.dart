import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/const/color.dart';
import 'package:pokedex/helper/extension_method.dart';
import 'package:pokedex/screen/detail/detail_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        if (controller.state == DetailViewState.loading) {
          return Scaffold(
            backgroundColor: controller.detailPokemon?.types?[0].type?.name
                ?.toPokemonTypeColor(),
            body: Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: controller.detailPokemon?.types?[0].type?.name
              ?.toPokemonTypeColor(),
          appBar: AppBar(
            backgroundColor: controller.detailPokemon?.types?[0].type?.name
                ?.toPokemonTypeColor(),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${controller.detailPokemon?.forms?[0].name?[0].toUpperCase()}${controller.detailPokemon?.forms?[0].name?.substring(1)}' ??
                      "-",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                '#${controller.formatter.format(int.parse(controller.dataArgument['id']))}' ??
                "-",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned(
                right: 20,
                top: 25,
                child: SvgPicture.asset(
                  'assets/icon/ic_pokeball.svg',
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              Positioned(
                right: 10,
                top: 140,
                left: 10,
                bottom: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          right: 18.0,
                          left: 16.0,
                          top: 20.0,
                          bottom: 4.0,
                        ),
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.detailPokemon?.types?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              child: Chip(
                                label: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    '${controller.detailPokemon?.types?[index].type?.name?[0].toUpperCase()}${controller.detailPokemon?.types?[index].type?.name?.substring(1)}' ?? '-',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                                backgroundColor: controller.detailPokemon?.types?[index].type?.name
                                    ?.toPokemonTypeColor(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: controller.detailPokemon?.types?[0].type?.name
                                ?.toPokemonTypeColor(),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon/ic_weight.svg',
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '${controller.detailPokemon?.weight.toString()} kg' ?? '-',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14.0,
                                ),
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                            child: VerticalDivider(
                              thickness: 2,
                              width: 50,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon/ic_height.svg',
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '${controller.detailPokemon?.height.toString()} m' ?? '-',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14.0,
                                ),
                                const Text(
                                  'Height',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          controller.flavourText.length == 0
                              ? '-'
                              : '${controller.flavourText[0]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}${controller.flavourText[1]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}${controller.flavourText[2]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Base Stats',
                        style: TextStyle(
                          color: controller.detailPokemon?.types?[0].type?.name
                              ?.toPokemonTypeColor(),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 24.0,
                          right: 24.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ATK',
                                    style: TextStyle(
                                      color: controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.detailPokemon?.stats?[1].baseStat.toString() ?? '-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: controller.detailPokemon!.stats![1].baseStat! / 255,
                                    backgroundColor:
                                    controller.detailPokemon?.types?[0].type?.name
                                        ?.toPokemonTypeColor().withOpacity(0.4),
                                    valueColor: AlwaysStoppedAnimation(
                                      controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor()),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'DEF',
                                    style: TextStyle(
                                      color: controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.detailPokemon?.stats?[2].baseStat.toString() ?? '-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: controller.detailPokemon!.stats![2].baseStat! / 255,
                                    backgroundColor:
                                    controller.detailPokemon?.types?[0].type?.name
                                        ?.toPokemonTypeColor().withOpacity(0.4),
                                    valueColor: AlwaysStoppedAnimation(
                                      controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor()),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'HP',
                                    style: TextStyle(
                                      color: controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.detailPokemon?.stats?[0].baseStat.toString() ?? '-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: controller.detailPokemon!.stats![0].baseStat! / 255,
                                    backgroundColor:
                                    controller.detailPokemon?.types?[0].type?.name
                                        ?.toPokemonTypeColor().withOpacity(0.4),
                                    valueColor: AlwaysStoppedAnimation(
                                        controller.detailPokemon?.types?[0].type?.name
                                            ?.toPokemonTypeColor()),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'SP-ATK',
                                    style: TextStyle(
                                      color: controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.detailPokemon?.stats?[3].baseStat.toString() ?? '-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                    controller.detailPokemon?.types?[0].type?.name
                                        ?.toPokemonTypeColor().withOpacity(0.4),
                                    valueColor: AlwaysStoppedAnimation(
                                        controller.detailPokemon?.types?[0].type?.name
                                            ?.toPokemonTypeColor()),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'SP-DEF',
                                    style: TextStyle(
                                      color: controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.detailPokemon?.stats?[4].baseStat.toString() ?? '-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: controller.detailPokemon!.stats![4].baseStat! / 255,
                                    backgroundColor:
                                    controller.detailPokemon?.types?[0].type?.name
                                        ?.toPokemonTypeColor().withOpacity(0.4),
                                    valueColor: AlwaysStoppedAnimation(
                                        controller.detailPokemon?.types?[0].type?.name
                                            ?.toPokemonTypeColor()),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'SPD',
                                    style: TextStyle(
                                      color: controller.detailPokemon?.types?[0].type?.name
                                          ?.toPokemonTypeColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.detailPokemon?.stats?[5].baseStat.toString() ?? '-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: controller.detailPokemon!.stats![5].baseStat! / 255,
                                    backgroundColor:
                                    controller.detailPokemon?.types?[0].type?.name
                                        ?.toPokemonTypeColor().withOpacity(0.4),
                                    valueColor: AlwaysStoppedAnimation(
                                        controller.detailPokemon?.types?[0].type?.name
                                            ?.toPokemonTypeColor()),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -25,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.dataArgument['id']}.png",
                    width: 220,
                    height: 220,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Lottie.asset(
                          "assets/lottie/pokeball_lottie.json",
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
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
