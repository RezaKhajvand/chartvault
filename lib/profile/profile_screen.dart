import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/router.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/signin/data/logout_datasource.dart';
import 'package:chartvault/utils/authmanager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingItems {
  final IconData iconData;
  final String title;
  final Function onTap;

  SettingItems(
      {required this.iconData, required this.title, required this.onTap});
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List<SettingItems> settingItems = [
    SettingItems(
        iconData: Icons.workspace_premium, title: 'Premium', onTap: () {}),
    SettingItems(
        iconData: Icons.adobe_outlined, title: 'About Us', onTap: () {}),
    SettingItems(iconData: Icons.message, title: 'Contact Us', onTap: () {}),
    SettingItems(iconData: Icons.support, title: 'Support', onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome", style: context.headlineSmall),
                const SizedBox(height: 4),
                Text('Profile Page', style: context.headlineLarge),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: CustomBorders.greyBorder,
                borderRadius: CustomRadius.cardRadius,
                color: Colors.white.withOpacity(0.07)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: const RoundedRectangleBorder(
                  borderRadius: CustomRadius.cardRadius),
              onTap: () {},
              leading: ClipRRect(
                  borderRadius: CustomRadius.btmRadius,
                  child: Image.asset(
                    'images/avatar.webp',
                    height: 50,
                    fit: BoxFit.cover,
                  )),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reza Khajvand', style: context.headlineMedium),
                  const SizedBox(height: 4),
                  Text('Username : Rezaasong', style: context.dateSmall),
                ],
              ),
              dense: true,
              trailing: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  border: CustomBorders.greyBorder,
                  borderRadius: CustomRadius.cardRadius,
                  color: Colors.white.withOpacity(0.07)),
              child: Column(
                children: List.generate(
                  settingItems.length,
                  (index) => ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: CustomRadius.cardRadius),
                    onTap: () => settingItems[index].onTap,
                    leading: Icon(
                      settingItems[index].iconData,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      settingItems[index].title,
                      style: context.labelMedium,
                    ),
                    dense: true,
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: CustomBorders.greyBorder,
                borderRadius: CustomRadius.cardRadius,
                color: Colors.white.withOpacity(0.07)),
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  builder: (context) => Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 6, 22, 44),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        border: Border(
                            top: BorderSide(color: CustomColors.borderGrey))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Are you sure you want to logout?'),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      getLogout();
                                      AuthManager.clearAuthData();
                                      context.pushReplacement(signinPage);
                                    },
                                    child: const Text('Yes'))),
                            const SizedBox(width: 20),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancle')))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: CustomRadius.cardRadius),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 16,
              ),
              title: Text(
                'Logout',
                style: context.labelMedium,
              ),
              dense: true,
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
