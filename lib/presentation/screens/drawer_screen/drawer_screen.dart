import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
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
      this.onM2Pressed, this.isL0, this.isL1, this.isL2, this.isL3, this.isM1, this.isM2, this.isManagL0, this.onManagL0Pressed,
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

  final bool? isManagL0;
  final VoidCallback? onManagL0Pressed;

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
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Column(
              children: [
                ExpansionPanelList.radio(
                  elevation: 0,
                  initialOpenPanelValue: 1,
                    expandedHeaderPadding: const EdgeInsets.only(top: 0),
                    children: [
                      ExpansionPanelRadio(
                        value: 1,
                        headerBuilder: (BuildContext context, bool isExpanded){
                          return Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: Text(
                              DataValues.drawerTitle1,
                              style: TextStyle(
                                fontWeight: bold,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          children: [
                            Builder(
                              builder: (context) {
                                final state = context.select((DrawerCubit cubit) => cubit.state);
                                return customDrawerListTile(
                                  color: state == 'L0'  ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                  title: DataValues.drawerDescription1,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectIndex(0);
                                    print('################################# $state');
                                  },
                                );
                              }
                            ),
                            Builder(
                              builder: (context) {
                                final state = context.select((DrawerCubit cubit) => cubit.state);
                                return customDrawerListTile(
                                  color: state == 'L1' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                  title: DataValues.drawerDescription2,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectIndex(1);
                                  },
                                );
                              }
                            ),
                            Builder(
                              builder: (context) {
                                final state = context.select((DrawerCubit cubit) => cubit.state);
                                return customDrawerListTile(
                                  color: state == 'L2' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                  title: DataValues.drawerDescription3,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectIndex(2);
                                  },
                                );
                              }
                            ),
                            Builder(
                              builder: (context) {
                                final state = context.select((DrawerCubit cubit) => cubit.state);
                                return customDrawerListTile(
                                  color: state == 'L3' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                  title: DataValues.drawerDescription4,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectIndex(3);
                                  },
                                );
                              }
                            ),
                            Builder(
                              builder: (context) {
                                final state = context.select((DrawerCubit cubit) => cubit.state);
                                return customDrawerListTile(
                                    color: state == 'M1' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                    title: DataValues.drawerDescription5,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectIndex(4);
                                  },
                                );
                              }
                            ),
                            Builder(
                              builder: (context) {
                                final state = context.select((DrawerCubit cubit) => cubit.state);
                                return customDrawerListTile(
                                  color: state == 'M2' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                  title: DataValues.drawerDescription6,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectIndex(5);
                                  },
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
                const SizedBox(height: 10,),
                ExpansionPanelList.radio(
                  elevation: 0,
                  initialOpenPanelValue: 1,
                  expandedHeaderPadding: const EdgeInsets.only(top: 0),
                  children: [
                    ExpansionPanelRadio(
                      value: 1,
                      headerBuilder: (BuildContext context, bool isExpanded){
                        return Padding(
                          padding: const EdgeInsets.only(top: 13.0),
                          child: Text(
                            DataValues.settingsManageStudentsText,
                            style: TextStyle(
                              fontWeight: bold,
                            ),
                          ),
                        );
                      },
                      body: Column(
                        children: [
                          Builder(
                            builder: (context) {
                              final state = context.select((DrawerCubit cubit) => cubit.state);
                              return customDrawerListTile(
                                color: state == 'MGL0' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                title: DataValues.drawerManageStudentsDescription1,
                                onPressed: (){
                                  context.read<DrawerCubit>().selectManagementIndex(0);
                                },
                              );
                            }
                          ),
                          Builder(
                            builder: (context) {
                              final state = context.select((DrawerCubit cubit) => cubit.state);
                              return customDrawerListTile(
                                 color: state == 'MGL1' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                title: DataValues.drawerManageStudentsDescription2,
                                onPressed: (){
                                  context.read<DrawerCubit>().selectManagementIndex(1);
                                },
                              );
                            }
                          ),
                          Builder(
                            builder: (context) {
                              final state = context.select((DrawerCubit cubit) => cubit.state);
                              return customDrawerListTile(
                                color: state == 'MGL2' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                title: DataValues.drawerManageStudentsDescription3,
                                onPressed: (){
                                  context.read<DrawerCubit>().selectManagementIndex(2);
                                },
                              );
                            }
                          ),
                          Builder(
                            builder: (context) {
                              final state = context.select((DrawerCubit cubit) => cubit.state);
                              return customDrawerListTile(
                                color: state == 'MGL3' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                title: DataValues.drawerManageStudentsDescription4,
                                onPressed: (){
                                  context.read<DrawerCubit>().selectManagementIndex(3);
                                },
                              );
                            }
                          ),
                          Builder(
                            builder: (context) {
                              final state = context.select((DrawerCubit cubit) => cubit.state);
                              return customDrawerListTile(
                                  color: state == 'MGM1' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                  title: DataValues.drawerManageStudentsDescription5,
                                  onPressed: (){
                                    context.read<DrawerCubit>().selectManagementIndex(4);
                                  });
                            }
                          ),
                          Builder(
                            builder: (context) {
                              final state = context.select((DrawerCubit cubit) => cubit.state);
                              return customDrawerListTile(
                                color: state == 'MGM2' ? AppThemeData.backgroundGrey.withOpacity(0.4): null,
                                title: DataValues.drawerManageStudentsDescription6,
                                onPressed: (){
                                  context.read<DrawerCubit>().selectManagementIndex(5);
                                },
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
            child: CustomButton(
              backgroundColor: AppThemeData.backgroundRed,
              onPressed: () {
                context.read<LogoutCubit>().logout();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
              },
              text: 'Déconnexion',
            ),
          ),
        ],
      ),
    );
  }
}
