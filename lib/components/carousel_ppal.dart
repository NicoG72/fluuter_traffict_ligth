import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CarouselPpal extends StatefulWidget {
  final double valueH;
  final bool? arrows;
  final bool? dots;
  final String? arrowsColor;
  final String? dotsColor;
  final String? activeDotColor;
  const CarouselPpal(this.valueH,
      {this.arrows,
      this.dots,
      this.arrowsColor,
      this.dotsColor,
      this.activeDotColor,
      super.key});

  @override
  State<CarouselPpal> createState() => _CarouselPpalState();
}

class _CarouselPpalState extends State<CarouselPpal> {
  final List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.valueH,
      child: carousel(images, widget.arrows, widget.dots, widget.arrowsColor,
          widget.dotsColor, widget.activeDotColor),
    );
  }
}

Widget carousel(List<String> images, bool? arrows, bool? dots,
    String? arrowsColor, String? dotsColor, String? activeDotColor) {
  final SwiperControl? control = arrows == false
      ? null
      : SwiperControl(color: getArrowColorFromString(arrowsColor));
  final SwiperPagination? pagination = dots == true
      ? SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: getDotColorFromString(dotsColor),
            activeColor: getActiveDotColorFromString(activeDotColor),
          ),
        )
      : null;

  return Swiper(
    itemBuilder: (BuildContext context, int index) {
      return Image.asset(images[index], fit: BoxFit.cover);
    },
    itemCount: images.length,
    pagination: pagination,
    control: control,
    autoplay: true,
    duration: 1000,
  );
}

Color getArrowColorFromString(String? colorHex) {
  return colorHex != null && colorHex.isNotEmpty
      ? Color(int.parse("0xFF$colorHex"))
      : Colors.black;
}

Color getDotColorFromString(String? colorHex) {
  return colorHex != null && colorHex.isNotEmpty
      ? Color(int.parse("0xFF$colorHex"))
      : Colors.white;
}

Color getActiveDotColorFromString(String? colorHex) {
  return colorHex != null && colorHex.isNotEmpty
      ? Color(int.parse("0xFF$colorHex"))
      : Colors.grey;
}
