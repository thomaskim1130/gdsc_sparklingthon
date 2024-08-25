import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/widgets/custom_popup.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatelessWidget {
  Future<void> _APICall(BuildContext context, File? imageFile) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => LoadingPopUp(),
    );

    try {
      //API 호출
      await Future.delayed(Duration(seconds: 5));

      if (imageFile == null) {
        print('No image to upload.');
        return;
      }

      /*String uploadURL = ''; // 서버 URL

      try {
        Dio dio = Dio();
        FormData formData = FormData.fromMap({
          "email": "a",
          "file": await MultipartFile.fromFile(imageFile!.path,
              filename: "upload.jpg"),
        });
        debugPrint('시작');

        Response response = await dio.put(
          uploadURL,
          data: formData,
          //options: Options(
          // validateStatus: (status) {
          //    return status! < 500; // 모든 상태 코드를 예외로 처리하지 않도록 설정
          //  },
          //),
        );

        debugPrint(response.data[0]);
        if (response.statusCode == 200) {
          print('Image uploaded successfully.');
        } else {
          print('Failed to upload image.');
        }
      } catch (e) {
        print('Error occurred while uploading image: $e');
      }*/

      Navigator.of(context).pop();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            RecyclePopUp('Plastic'), //FailPopUp(),
      );
    } catch (error) {
      debugPrint('error : $error');
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => FailPopUp(),
      );
    }
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // 선택한 이미지 파일을 사용하여 원하는 작업 수행
      debugPrint("Image selected: ${imageFile.path}");
      // 여기서 API 호출을 수행할 수 있습니다.
      _APICall(context, imageFile);
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => FailPopUp(),
      );
      debugPrint('Image Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/CameraBackground.png',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 70,
          right: 150,
          child: Text(
            '스캔하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    _pickImageFromGallery(context);
                  },
                  backgroundColor: DefaultColors.lightGreen,
                  child: SvgPicture.asset('assets/icons/camera.svg'),
                ),
              ),
            )),
      ],
    ));
  }
}
