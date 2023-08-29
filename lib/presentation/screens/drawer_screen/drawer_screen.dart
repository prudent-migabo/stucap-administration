import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen(
      {Key? key,
      this.onL0Pressed,
      this.onL1Pressed,
      this.onL2Pressed,
      this.onL3Pressed,
      this.onM1Pressed,
      this.onM2Pressed, this.isL0, this.isL1, this.isL2, this.isL3, this.isM1, this.isM2,
      })
      : super(key: key);

  final VoidCallback? onL0Pressed;
  final VoidCallback? onL1Pressed;
  final VoidCallback? onL2Pressed;
  final VoidCallback? onL3Pressed;
  final VoidCallback? onM1Pressed;
  final VoidCallback? onM2Pressed;
  final bool? isL0;
  final bool? isL1;
  final bool? isL2;
  final bool? isL3;
  final bool? isM1;
  final bool? isM2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 170,
            width: double.infinity,
            color: AppThemeData.primaryColor,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppThemeData.backgroundGrey,
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  DataValues.appTitle,
                  style: TextStyle(
                    color: AppThemeData.textWhite,
                    fontWeight: AppThemeData
                        .lightTheme.textTheme.titleMedium!.fontWeight,
                    fontSize: AppThemeData
                        .lightTheme.textTheme.headlineSmall!.fontSize,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DataValues.drawerTitle1,
                  style: TextStyle(
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customDrawerListTile(
                  color: isL0 == true ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                  title: DataValues.drawerDescription1,
                  onPressed: onL0Pressed,
                ),
                customDrawerListTile(
                  title: DataValues.drawerDescription2,
                  onPressed: onL1Pressed,
                ),
                customDrawerListTile(
                  title: DataValues.drawerDescription3,
                  onPressed: onL2Pressed,
                ),
                customDrawerListTile(
                  title: DataValues.drawerDescription4,
                  onPressed: onL3Pressed,
                ),
                customDrawerListTile(
                    title: DataValues.drawerDescription5,
                    onPressed: onM1Pressed),
                customDrawerListTile(
                  title: DataValues.drawerDescription6,
                  onPressed: onM2Pressed,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  DataValues.drawerTitle2,
                  style: TextStyle(
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customDrawerSettingsListTile(
                  leading: const Icon(Icons.language),
                  title: DataValues.settingsDescription1,
                ),
                customDrawerSettingsListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: DataValues.settingsDescription2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
            child: CustomButton(
              backgroundColor: AppThemeData.backgroundRed,
              onPressed: () {},
              text: 'Déconnexion',
            ),
          ),
        ],
      ),
    );
  }
}
