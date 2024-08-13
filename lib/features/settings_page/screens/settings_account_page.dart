import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';
import 'package:meal_ai/features/user/service/auth_state_user_service.dart';

class SettingsAccountPage extends ConsumerWidget {
  const SettingsAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticatedUser = ref.watch(authStateProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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

class SettingsAccountPageBody extends StatefulWidget {
  final UserModel authenticatedUser;

  const SettingsAccountPageBody({super.key, required this.authenticatedUser});

  @override
  State<SettingsAccountPageBody> createState() =>
      _SettingsAccountPageBodyState();
}

class _SettingsAccountPageBodyState extends State<SettingsAccountPageBody> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _pictureController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;
  late bool _verify;
  late bool _premium;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.authenticatedUser.firstName);
    _lastNameController =
        TextEditingController(text: widget.authenticatedUser.lastName);
    _pictureController =
        TextEditingController(text: widget.authenticatedUser.picture);
    _emailController =
        TextEditingController(text: widget.authenticatedUser.email);
    _roleController = TextEditingController(text: widget.authenticatedUser.role);
    _verify = widget.authenticatedUser.verify;
    _premium = widget.authenticatedUser.premium;
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
    final updatedUser = UserModel(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      picture: _pictureController.text,
      email: _emailController.text,
      verify: _verify,
      premium: _premium,
      role: _roleController.text,
      id: widget.authenticatedUser.id,
    );

    ref.read(authStateProvider.notifier).setUser(updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: context.primaryColor),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Settings',
              style: AppTextStyles().mThick.copyWith(color: context.primaryColor),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _updateUser(ref);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Profile updated successfully!'),
                    ),
                  );
                },
                child: Text(
                  'Save',
                  style: AppTextStyles().mThick.copyWith(color: context.primaryColor),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.mdl,
                vertical: PaddingSizes.mdl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: widget.authenticatedUser.picture != null && widget.authenticatedUser.picture!.isNotEmpty
                          ? NetworkImage(widget.authenticatedUser.picture!)
                          : null,
                      child: widget.authenticatedUser.picture == null ||
                          widget.authenticatedUser.picture!.isEmpty
                          ? Icon(Icons.person, size: 50, color: Colors.grey)
                          : null,
                    ),
                  ),
                  const SizedBox(height: PaddingSizes.mdl),
                  _buildEditableField(
                      context, 'First Name', _firstNameController, ref),
                  const SizedBox(height: PaddingSizes.sm),
                  _buildEditableField(
                      context, 'Last Name', _lastNameController, ref),
                  const SizedBox(height: PaddingSizes.sm),
                  _buildEditableField(
                      context, 'Picture URL', _pictureController, ref),
                  const SizedBox(height: PaddingSizes.sm),
                  _buildEditableField(context, 'Email', _emailController, ref,
                      enabled: false), // Email no editable
                  const SizedBox(height: PaddingSizes.sm),
                  _buildEditableField(context, 'Role', _roleController, ref),
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
                  const SizedBox(height: PaddingSizes.xxl),
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
                                onPressed: () async{
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEditableField(BuildContext context, String label,
      TextEditingController controller, WidgetRef ref,
      {bool enabled = true}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(PaddingSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles().sRegular.copyWith(color: Colors.black54)),
            const SizedBox(height: PaddingSizes.sm),
            TextField(
              controller: controller,
              enabled: enabled,
              style: AppTextStyles().mRegular,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
      BuildContext context, String label, bool value, ValueChanged<bool> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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