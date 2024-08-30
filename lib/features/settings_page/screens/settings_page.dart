import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/features/settings_page/screens/settings_account_page.dart';
import 'package:meal_ai/features/settings_page/screens/settings_general_page.dart';
import 'package:meal_ai/features/settings_page/screens/settings_how_to_add_recipe_page.dart';
import 'package:meal_ai/features/settings_page/widgets/menu_group.dart';
import 'package:meal_ai/features/settings_page/widgets/menu_tile.dart';
import 'package:meal_ai/features/settings_page/widgets/profile_header.dart';
import 'package:meal_ai/features/settings_page/widgets/settings_list_tile_widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100, body: const SettingsPageBody());
  }
}

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({super.key});

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTextStyles().lThick.copyWith(
            color: black1,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              name: 'Kim John',
              username: '@kimjohn87874flights',
              imageUrl: 'https://example.com/profile.jpg',
            ),
            Divider(color: black1,),
            MenuGroup(
              backgroundColor: Colors.pink.shade100,
              tiles: [
                MenuTile(
                  icon: Icons.post_add,
                  title: 'Posts',
                ),
                MenuTile(
                  icon: Icons.group,
                  title: 'Community',
                ),
                MenuTile(
                  icon: Icons.favorite,
                  title: 'Favourites',
                ),
                MenuTile(
                  icon: Icons.download,
                  title: 'Downloads',
                ),
              ],
            ),
            MenuGroup(
              backgroundColor: Colors.blue.shade100,
              tiles: [
                MenuTile(
                  icon: Icons.message,
                  title: 'Messages',
                  
                ),
                MenuTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),
                MenuTile(
                  icon: Icons.history,
                  title: 'Activity History',
                ),
                MenuTile(
                  icon: Icons.emoji_events,
                  title: 'Achievements',
                ),
              ],
            ),
            MenuGroup(
              backgroundColor: Colors.yellow.shade100,
              tiles: [
                MenuTile(
                  icon: Icons.security,
                  title: 'Privacy and Security Settings',
                ),
                MenuTile(
                  icon: Icons.accessibility,
                  title: 'Accessibility Features',
                ),
                MenuTile(
                  icon: Icons.help,
                  title: 'Help and Support',
                ),
                MenuTile(
                  icon: Icons.logout,
                  title: 'Logout',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
