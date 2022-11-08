import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/screen/detail/detail_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.red,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Charizard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  '#001',
                  style: TextStyle(
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
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(
                            label: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Fire',
                                style: TextStyle(
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
                            backgroundColor: Colors.orange,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Chip(
                            label: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Flying',
                                style: TextStyle(
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
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
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
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '90.5 kg',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14.0,
                                ),
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
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
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '1.7 m',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14.0,
                                ),
                                Text(
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
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally. Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally. hen expelling a blast of super hot fire, the red flame at the tip of its tail burns more intensely.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Base Stats',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
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
                                      color: Colors.orange,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '080',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.4),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.orange),
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
                                      color: Colors.orange,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '080',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.4),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.orange),
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
                                      color: Colors.orange,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '080',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.4),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.orange),
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
                                      color: Colors.orange,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '080',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.4),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.orange),
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
                                      color: Colors.orange,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '080',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.4),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.orange),
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
                                      color: Colors.orange,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '080',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: LinearProgressIndicator(
                                    value: 80 / 255,
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.4),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.orange),
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
