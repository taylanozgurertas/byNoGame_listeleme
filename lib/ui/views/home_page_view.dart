import 'package:bynogame/data/entity/skins.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  String byNoGameLogoPath = "assets/bynogamelogo.png";
  String discountText = "%36 İndirim";
  String fieldTestedText = "FT";
  String rocketPath = "assets/rocket-removebg-preview.png";
  String deliveryText = "Hızlı Teslimat";

  Future<List<Skins>> skinList() async {
    var skinList = <Skins>[];
    var skin1 = Skins(
        imagePath: "skin1.png", itemName: "USP-S Cortex (Field-Tested)", priceRange: "50 TL - 750 TL", howMany: 10);
    var skin2 = Skins(
        imagePath: "skin2.png",
        itemName: "Glock-18 Vogue (Field-Tested)",
        priceRange: "75.97 TL - 200 TL",
        howMany: 15);
    var skin3 = Skins(
        imagePath: "skin3.png",
        itemName: "★ StatTrak™ Butterfly Knife | Freehand (Field-Tested)",
        priceRange: "29870 TL",
        howMany: 3);
    var skin4 = Skins(
        imagePath: "skin4.png",
        itemName: "M4A4 | Neo-Noir (Field-Tested)",
        priceRange: "922 TL - 1000 TL",
        howMany: 17);
    var skin5 = Skins(
        imagePath: "skin5.png",
        itemName: "AK-47 | Neon Revolution (Field-Tested)",
        priceRange: "310 TL - 999.99 TL",
        howMany: 67);

    skinList.add(skin1);
    skinList.add(skin2);
    skinList.add(skin3);
    skinList.add(skin4);
    skinList.add(skin5);

    return skinList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(46.0),
          child: byNoGameLogo(),
        ),
      ),
      body: FutureBuilder<List<Skins>>(
        future: skinList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var skinList = snapshot.data;
            return ListView.builder(
              itemCount: skinList!.length,
              itemBuilder: (context, index) {
                var skin = skinList[index];
                return GestureDetector(
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              skinImageWidget(skin),
                              discountWidget(),
                              Positioned(
                                left: 12,
                                bottom: 0,
                                child: fieldTestedWidget(),
                              ),
                            ],
                          ),
                          spaceWidget(),
                          itemNameWidget(skin),
                          spaceWidget(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [rocketImageWidget(), deliveryTextWidget(), howManyTextContainer(skin)],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: priceTextWidget(skin),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }

  Widget byNoGameLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            byNoGameLogoPath,
            fit: BoxFit.fill,
          ),
          spaceWidget(),
        ],
      ),
    );
  }

  Image skinImageWidget(Skins skin) => Image.asset("assets/${skin.imagePath}");

  Container discountWidget() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0)),
        color: Colors.red,
      ),
      padding: const EdgeInsets.all(8),
      child: Text(discountText, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Container fieldTestedWidget() {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 35,
      color: Colors.yellow[600],
      child: Text(fieldTestedText, style: const TextStyle(color: Colors.white)),
    );
  }

  SizedBox spaceWidget() {
    return const SizedBox(
      height: 10,
    );
  }

  Text itemNameWidget(Skins skin) {
    return Text(skin.itemName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ));
  }

  Container howManyTextContainer(Skins skin) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0)),
      ),
      child: howManyTextWidget(skin),
    );
  }

  Image rocketImageWidget() => Image.asset(rocketPath);

  Text deliveryTextWidget() {
    return Text(deliveryText, style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold));
  }

  Text howManyTextWidget(Skins skin) {
    return Text("${skin.howMany.toString()} Ad.",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ));
  }

  Text priceTextWidget(Skins skin) {
    return Text(
      skin.priceRange,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
