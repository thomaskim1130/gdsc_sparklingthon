import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/pages/camera_page.dart';
import 'package:gdsc_sparklingthon/pages/login_page.dart';
import 'package:gdsc_sparklingthon/pages/user_page.dart';
import 'package:gdsc_sparklingthon/providers/voted_provider.dart';
import 'package:gdsc_sparklingthon/widgets/custom_avatar.dart';
import 'package:gdsc_sparklingthon/widgets/custom_popup.dart';
import 'package:gdsc_sparklingthon/widgets/idol_card.dart';
import 'package:gdsc_sparklingthon/widgets/idol_rank.dart';
import 'package:gdsc_sparklingthon/widgets/top_three.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  bool isLoading = true;

  List<IdolModel> idolData = [
    IdolModel(
        id: 'winter',
        groupName: 'aespa',
        koreanName: '윈터',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 1),
    IdolModel(
        id: 'karina',
        groupName: 'aespa',
        koreanName: '카리나',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 2),
    IdolModel(
        id: 'ningning',
        groupName: 'aespa',
        koreanName: '닝닝',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 3),
    IdolModel(
        id: 'giselle',
        groupName: 'aespa',
        koreanName: '지젤',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 4),
    IdolModel(
        id: 'yuqi',
        groupName: '여자(아이들)',
        koreanName: '우기',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 5),
    IdolModel(
        id: 'eunwoocha',
        groupName: '아스트로',
        koreanName: '차은우',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 6),
    IdolModel(
        id: 'jiheonbaek',
        groupName: 'fromis_9',
        koreanName: '백지헌',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 7),
    IdolModel(
        id: 'anton',
        groupName: 'RIIZE',
        koreanName: '앤톤',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 8),
    IdolModel(
        id: 'hanni',
        groupName: 'NewJeans',
        koreanName: '하니',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 9),
    IdolModel(
        id: 'haewon',
        groupName: 'NMIXX',
        koreanName: '오해원',
        votes: '123,456',
        votesPercentage: '12.34',
        rank: 10),
  ];

  Future<void> _getApiData() async {
    String uploadURL = 'http://123.123.123:8080/ranking/fannumber';
    Dio dio = Dio();
    try {
      Response response = await dio.get(uploadURL);
      debugPrint(response.data[0].toString());

      for (int i = 0; i < 10; i++) {
        idolData[i].votes = '${response.data[i]['totalCount']}';
        idolData[i].votesPercentage =
            response.data[i]['percentage'].toStringAsFixed(2);
      }
    } catch (error) {
      debugPrint('error : $error');
    }
  }

  @override
  void initState() {
    super.initState();

    DateTime startTime = DateTime.now();

    isLoading = true;

    //소요 시간 출력
    Future.wait([
      //TODO:랭킹 및 사진 호출하기!
      _getApiData()
    ]).then((results) {
      DateTime endTime = DateTime.now(); // 종료 시간 기록

      debugPrint("소요 시간: ${endTime.difference(startTime).inMilliseconds} ms");
    });

    isLoading = false;

    //Future.delayed(Duration(seconds: 3));

    WidgetsBinding.instance.addObserver(this); //WidgetsBindingObserver
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 옵저버 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    return isLoading
        ? LoadingPopUp()
        : Scaffold(
            backgroundColor: DefaultColors.lightGreen,
            appBar: AppBar(
              backgroundColor: DefaultColors.lightGreen,
              titleSpacing: 30,
              title: IconButton(
                iconSize: 90,
                icon: SvgPicture.asset(
                  'assets/icons/logo_white.svg',
                ),
                onPressed: () => {votedProvider.resetVote()},
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  iconSize: 70,
                  icon: Consumer<VotedProvider>(
                      builder: (context, votedProvider, child) {
                    return Image.asset(votedProvider.votedToday
                        ? 'assets/icons/heart_filled.png'
                        : 'assets/icons/heart_empty.png');
                  }),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserPage()));
                  },
                ),
                Container(
                  width: 20,
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0), // 둥근 모서리 적용
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    Row(
                      children: [
                        Text(
                          '2024년 8월 랭킹',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () => debugPrint('hi'), //TODO : button 구현
                          icon: SvgPicture.asset(
                            "assets/icons/navigator.svg",
                          ),
                          alignment: Alignment.centerLeft,
                        )
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      '총 123,456표', //TODO : DB연동
                      style: TextStyle(
                        color: DefaultColors.lightGreen,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    TopThreeWidget(idolData, true),
                    Divider(
                      height: 0.25,
                      color: DefaultColors.darkGreen,
                    ),
                    IdolRankWidget([idolData[3], idolData[4], idolData[5]]),
                    SizedBox(height: 32),
                    NewsSection(), // NEWS 전체
                  ],
                ),
              ),
            ),
            floatingActionButton: Container(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                onPressed: () {
                  if (!votedProvider.votedToday) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CameraPage()));
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) =>
                          AlreadyVotedPopUp(), //FailPopUp(),
                    );
                  }
                },
                child: SvgPicture.asset('assets/icons/camera.svg'),
                backgroundColor: DefaultColors.lightGreen,
              ),
            ),
          );
  }
}

class NewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'NEWS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => votedProvider.vote(), //TODO : button 구현
              icon: SvgPicture.asset(
                "assets/icons/navigator.svg",
              ),
              alignment: Alignment.centerLeft,
            )
          ],
        ),
        SizedBox(height: 8),
        GestureDetector(
          child: Card(
            child: ListTile(
              leading: Image.asset('assets/images/news.png'),
              title: Text('7월의 아이돌 지젤&마이, 천만원 기부'),
              subtitle: Text('August 2024'),
            ),
          ),
          onTap: () =>
              launchUrl(Uri.parse('https://www.instagram.com/gdsc.kaist/')),
        ),
        SizedBox(height: 8),
        GestureDetector(
          child: Card(
            child: ListTile(
              leading: Image.asset('assets/images/news.png'),
              title: Text('7월의 아이돌 지젤&마이, 천만원 기부'),
              subtitle: Text('August 2024'),
            ),
          ),
          onTap: () =>
              launchUrl(Uri.parse('https://www.instagram.com/gdsc.kaist/')),
        ),
      ],
    );
  }
}
