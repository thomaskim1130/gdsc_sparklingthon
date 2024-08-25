import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/pages/login_page.dart';
import 'package:gdsc_sparklingthon/pages/vote_page.dart';
import 'package:gdsc_sparklingthon/providers/voted_provider.dart';
import 'package:provider/provider.dart';

class LoadingPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: DefaultColors.background,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '분석 중...',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class FailPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: DefaultColors.background,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/fail.svg'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '인증 실패',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.darkPink),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '쓰레기가 아닙니다.\n다시 촬영해주세요.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.lightPink,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 둥근 모서리 반경
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '다시 인증하기',
                    style: TextStyle(fontSize: 18, color: Colors.black // 텍스트 크기
                        ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VotedPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: DefaultColors.background,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/PickFin.svg'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Pick 완료',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.darkPink),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '오늘 내 픽은',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                Text(
                  '${votedProvider.myVote}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.lightPink,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 둥근 모서리 반경
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  },
                  child: Text(
                    '홈으로 이동',
                    style: TextStyle(fontSize: 18, color: Colors.black // 텍스트 크기
                        ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AlreadyVotedPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: DefaultColors.background,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/PickFin.svg'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '이미 Pick 완료',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.darkPink),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '오늘 내 픽은',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                Text(
                  '${votedProvider.myVote}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.lightPink,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 둥근 모서리 반경
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)..pop();
                  },
                  child: Text(
                    '홈으로 이동',
                    style: TextStyle(fontSize: 18, color: Colors.black // 텍스트 크기
                        ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RecyclePopUp extends StatelessWidget {
  final String kindOfTrash;
  const RecyclePopUp(this.kindOfTrash, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: Container(
            width: 337,
            height: 603,
            decoration: BoxDecoration(
                color: DefaultColors.background,
                borderRadius: BorderRadius.circular(20)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/images/Image$kindOfTrash.png'),
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset('assets/icons/success.svg'),
              Text(
                '$kindOfTrash',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.darkGreen),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '분리수거 인증에 성공했어요.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              Text(
                '오늘의 투표권을 얻었어요!',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.darkGreen),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '피키의 분리수거 팁!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                height: 50,
                child: Text(
                  '나는 언덕 잔디가 이 지나가는 헤는 것은 하나에 있습니다. 아무 가을 책상을 아이들의 위에도 하나에 이웃 내린 위에 봅니다.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: DefaultColors.darkGreen,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 둥근 모서리 반경
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VotePage()));
                },
                child: Text(
                  '투표하러 가기',
                  style: TextStyle(
                      fontSize: 18, color: DefaultColors.background // 텍스트 크기
                      ),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
