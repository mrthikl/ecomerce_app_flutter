import 'package:ecommerce_app/@share/widget/box/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/image.resource.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final controllerBanner = PageController(keepPage: true);
  final controllerNewPro = PageController(keepPage: true);

  List urlImageItemBanner = [
    "https://ii.loropiana.com/medias/sys_master/root/h5e/hed/9418857775134/LP-RESORT-MAY2022-720x900-002.jpg",
    "https://ii.loropiana.com/medias/sys_master/root/h42/hf1/9420400754718/LP-RESORT-MAY2022-411x514-004.jpg",
    "https://media.loropiana.com/HYBRIS/LOOKS/20220111122126582/D9E19D81-F8E4-4E02-B933-E064090463F1/20220111122126582_LOOKTBL.jpg"
  ];
  List<CardItem> itemsCardInfo = [
    const CardItem(
      urlImage:
          "https://media.loropiana.com/HYBRIS/LOOKS/20220111122129925/8896433D-799F-418E-8CC3-9A7B504F4F63/20220111122129925_LOOKTBL.jpg",
      title: "Suilt",
      price: "500",
    ),
    const CardItem(
      urlImage:
          "https://media.loropiana.com/HYBRIS/LOOKS/20220111122217160/023C165B-7CCD-4B89-9A30-E1E76C49E899/20220111122217160_LOOKTBL.jpg",
      title: "Shirt",
      price: "500",
    ),
    const CardItem(
      urlImage:
          "https://media.loropiana.com/HYBRIS/LOOKS/20220111122126582/D9E19D81-F8E4-4E02-B933-E064090463F1/20220111122126582_LOOKTBL.jpg",
      title: "Pant",
      price: "500",
    ),
    const CardItem(
      urlImage:
          "https://media.loropiana.com/HYBRIS/LOOKS/20220111121720176/EF8977DA-3528-4C26-870B-2005C33DEE9D/20220111121720176_LOOKTBL.jpg",
      title: "Pant",
      price: "500",
    ),
  ];
}
