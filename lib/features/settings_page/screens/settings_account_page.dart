import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/settings_page/widgets/user_info_edit.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';
import 'package:meal_ai/features/user/service/auth_state_user_service.dart';

class SettingsAccountPage extends ConsumerWidget {
  const SettingsAccountPage({super.key});

  static const String name = "account-settings";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticatedUser = ref.watch(authStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: authenticatedUser == null
            ? const Center(child: CircularProgressIndicator())
            : authenticatedUser.userModel == null
            ? const Center(child: Text('Error: User not found'))
            : SettingsAccountPageBody(authenticatedUser: authenticatedUser.userModel!),
      ),
    );
  }
}

class SettingsAccountPageBody extends ConsumerStatefulWidget {
  final UserModel authenticatedUser;

  const SettingsAccountPageBody({super.key, required this.authenticatedUser});

  @override
  ConsumerState<SettingsAccountPageBody> createState() => _SettingsAccountPageBodyState();
}

class _SettingsAccountPageBodyState extends ConsumerState<SettingsAccountPageBody> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _pictureController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;
  late bool _verify;
  late bool _premium;
  late bool _isEditing;

  final GlobalKey<UserInfoEditState> _userInfoEditKey = GlobalKey<UserInfoEditState>();

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.authenticatedUser.firstName);
    _lastNameController = TextEditingController(text: widget.authenticatedUser.lastName);
    _pictureController = TextEditingController(text: widget.authenticatedUser.picture);
    _emailController = TextEditingController(text: widget.authenticatedUser.email);
    _roleController = TextEditingController(text: widget.authenticatedUser.role);
    _verify = widget.authenticatedUser.verify;
    _premium = widget.authenticatedUser.premium;
    _isEditing = false;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _pictureController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  void _updateUser(WidgetRef ref) {
    final updatedUserinfo = _userInfoEditKey.currentState?.getUpdatedUserinfo();
    final updatedUser = UserModel(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      picture: _pictureController.text,
      email: _emailController.text,
      verify: _verify,
      premium: _premium,
      role: _roleController.text,
      id: widget.authenticatedUser.id,
      userinfo: updatedUserinfo,
    );

    ref.read(authStateProvider.notifier).setUser(updatedUser);
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Profile',
          style: AppTextStyles().mThick.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PaddingSizes.mdl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarPicture(widget: widget),
              const SizedBox(height: PaddingSizes.xl),
              Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: black1, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [shadowMediumBrut],
                  ),
                  child: Column(
                    children: [
                      ProfileItem(icon: Icons.person, label: 'First Name', controller: _firstNameController),
                      ProfileItem(icon: Icons.person, label: 'Last Name', controller: _lastNameController),
                      ProfileItem(icon: Icons.email, label: 'Email', controller: _emailController),
                      ProfileItem(icon: Icons.abc, label: 'Role', controller: _roleController),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: PaddingSizes.sm),
              _buildSwitchTile(context, 'Verify', _verify, (value) {
                setState(() {
                  _verify = value;
                });
              }),
              const SizedBox(height: PaddingSizes.sm),
              _buildSwitchTile(context, 'Premium', _premium, (value) {
                setState(() {
                  _premium = value;
                });
              }),
              const SizedBox(height: PaddingSizes.sm),
              UserInfoEdit(key: _userInfoEditKey, userinfo: widget.authenticatedUser.userinfo ?? Userinfo(sex: 0, height: 170, weight: 70, birthdate: DateTime.now())),
              const SizedBox(height: PaddingSizes.xxl),
              ElevatedButton(
                onPressed: () {
                  _updateUser(ref);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Profile updated successfully!'),
                    ),
                  );
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: PaddingSizes.sm),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('Do you really want to log out?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              final isCleared = await ref.read(authStateProvider.notifier).logout();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isCleared != null
                                        ? 'logged out successfully!'
                                        : 'Failed to log out.',
                                  ),
                                ),
                              );
                              context.go('/session');
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Logout'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(BuildContext context, String label, bool value, ValueChanged<bool> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54, width: 1),
      ),
      child: SwitchListTile(
        title: Text(
          label,
          style: AppTextStyles().mRegular.copyWith(color: Colors.black),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: context.primaryColor,
      ),
    );
  }
}

class AvatarPicture extends StatelessWidget {
  const AvatarPicture({
    super.key,
    required this.widget,
  });

  final SettingsAccountPageBody widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: black1,
                  width: 2
              ),
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [shadowMediumBrut],
            ),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: widget.authenticatedUser.picture != null && widget.authenticatedUser.picture!.isNotEmpty
                  ? NetworkImage(widget.authenticatedUser.picture!)
                  : null,
              child: widget.authenticatedUser.picture == null || widget.authenticatedUser.picture!.isEmpty
                  ? Icon(Icons.person, size: 50, color: Colors.grey)
                  : null,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration:  BoxDecoration(
                border: Border.all(
                    color: black1,
                    width: 2
                ),
                color: context.primaryColor,
                shape: BoxShape.circle,
                boxShadow: [shadowSmallBrut],
              ),
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {
                  // Código para cambiar la foto
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final controller;

  ProfileItem({required this.icon, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              cursorColor: black1,
              controller: controller,
              decoration: InputDecoration(
                icon: Icon(icon, color: black1),
                labelText: label,
                labelStyle: TextStyle(color: black1),
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          Icon(Icons.edit, color: black1, size: 20,),
        ],
      ),
    );
  }
}