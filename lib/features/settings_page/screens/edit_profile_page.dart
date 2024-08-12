import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';
import 'package:meal_ai/features/user/service/local_user_service.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  final UserModel user;

  const EditProfilePage({super.key, required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _roleController;
  late TextEditingController _pictureController;
  bool _isAuth = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.user.email);
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _roleController = TextEditingController(text: widget.user.role);
    _pictureController = TextEditingController(text: widget.user.picture);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _roleController.dispose();
    _pictureController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final updatedUser = UserModel(
      id: widget.user.id,
      email: _emailController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      picture: _pictureController.text,
      verify: widget.user.verify,
      premium: widget.user.premium,
      role: _roleController.text,
      location: widget.user.location,
      userinfo: widget.user.userinfo
    );
    ref.read(setAuthenticatedUserProvider(updatedUser));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              TextField(
                controller: _pictureController,
                decoration: const InputDecoration(labelText: 'Picture URL'),
              ),
              SwitchListTile(
                title: const Text('Authenticated'),
                value: _isAuth,
                onChanged: (bool value) {
                  setState(() {
                    _isAuth = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}