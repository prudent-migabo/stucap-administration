import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/presentation/screens/home_screen/components/components.dart';
import 'package:stucap_admin/utils/utils.dart';

import '../../../../statics/statics.dart';

class HomeScreenSection extends StatefulWidget {
  const HomeScreenSection({Key? key}) : super(key: key);

  @override
  State<HomeScreenSection> createState() => _HomeScreenSectionState();
}

class _HomeScreenSectionState extends State<HomeScreenSection> {
  String selectedValue = '';
  File? _pickedImage;
  String avatar = '';

  onUserImgUrl() {
    context.read<ImagesCubit>().getUserImgUrl(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagesCubit, ImagesState>(
      listener: (context, state) {
        if (state.imagesStatus == ImagesStatus.loaded) {
          avatar = state.studentImage;
        } else if (state.imagesStatus == ImagesStatus.error) {
          errorDialog(context, content: state.error);
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              DataValues.homeRegisterStudentSectionTitle,
              style: TextStyle(
                fontWeight: bold,
                fontSize:
                AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<ImagesCubit, ImagesState>(
              builder: (context, state) {
                return state.imagesStatus == ImagesStatus.loading
                    ? StateProfilePhotoLoader(
                  pickedImage: _pickedImage,
                )
                    : Stack(
                  children: [
                    _pickedImage == null
                        ? const CustomAvatarImage(
                      imgUrl: '',
                      radius: 90,
                      imageProvider:
                      AssetImage(Assets.avatar),
                    )
                        : CustomAvatarImage(
                      imgUrl: '',
                      radius: 80,
                      imageProvider:
                      FileImage(File(_pickedImage!.path)),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () async {
                          final picked =
                          await getWebImage();
                          setState(() {
                            _pickedImage = picked;
                          });
                          onUserImgUrl();
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: AppThemeData.primaryColor,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20,),
            RegisterStudentForm(avatar: avatar,),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DataValues.homeListStudentSectionTitle,
                  style: TextStyle(
                    fontWeight: bold,
                    fontSize:
                    AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
                  ),
                ),
                PopupMenuButton<String>(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context) {
                    return ListHelper.deadlineFilter.map((element) {
                      return PopupMenuItem(
                        value: element,
                        child: Text(
                          element, style: const TextStyle(fontSize: 13),),
                      );
                    }).toList();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(selectedValue),
                        const Icon(Icons.arrow_drop_down, size: 40,),
                      ],
                    ),
                  ),
                  onSelected: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            HomeListStudentsSection(),
          ],
        ),
      ),
    );
  }
}
