import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/settings_page/widgets/menu_group.dart';
import 'package:meal_ai/features/settings_page/widgets/menu_tile.dart';
import 'package:meal_ai/features/settings_page/widgets/profile_header.dart';

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
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.group,
                  title: 'Community',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.favorite,
                  title: 'Favourites',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.download,
                  title: 'Downloads',
                  onTap: () {},
                ),
              ],
            ),
            MenuGroup(
              backgroundColor: Colors.blue.shade100,
              tiles: [
                MenuTile(
                  icon: Icons.message,
                  title: 'Messages',
                  onTap: () {},
                  
                ),
                MenuTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.history,
                  title: 'Activity History',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.emoji_events,
                  title: 'Achievements',
                  onTap: () {},
                ),
              ],
            ),
            MenuGroup(
              backgroundColor: Colors.yellow.shade100,
              tiles: [
                MenuTile(
                  icon: Icons.security,
                  title: 'Privacy and Security Settings',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.accessibility,
                  title: 'Accessibility Features',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.help,
                  title: 'Help and Support',
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
