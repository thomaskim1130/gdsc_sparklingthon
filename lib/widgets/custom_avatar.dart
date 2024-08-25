import 'package:flutter/material.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/pages/idol_page.dart';

class CustomAvatar extends StatelessWidget {
  final ImageProvider<Object> backgroundImage;
  final double radius;
  final IdolModel idol;
  const CustomAvatar(this.radius, this.backgroundImage, this.idol, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => IdolPage(idol))),
      child: Center(
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: backgroundImage, // 이미지 경로
              fit: BoxFit.contain, // 이미지가 영역을 덮도록 비율 유지
              alignment: Alignment.center, // 이미지를 중앙에 정렬
            ),
          ),
        ),
      ),
    );
  }
}
