import 'package:flutter/material.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';

class UserInfoEdit extends StatefulWidget {
  final Userinfo userinfo;

  const UserInfoEdit({Key? key, required this.userinfo}) : super(key: key);

  @override
  UserInfoEditState createState() => UserInfoEditState();
}

class UserInfoEditState extends State<UserInfoEdit> {
  late TextEditingController _sexController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _birthdateController;

  @override
  void initState() {

    super.initState();
    _sexController = TextEditingController(text: widget.userinfo.sex.toString());
    _heightController = TextEditingController(text: widget.userinfo.height.toString());
    _weightController = TextEditingController(text: widget.userinfo.weight.toString());
    _birthdateController = TextEditingController(text: widget.userinfo.birthdate.toIso8601String());
  }

  @override
  void dispose() {
    _sexController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  Userinfo getUpdatedUserinfo() {
    return Userinfo(
      sex: int.parse(_sexController.text),
      height: double.parse(_heightController.text),
      weight: double.parse(_weightController.text),
      birthdate: DateTime.parse(_birthdateController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEditableField('Sex', _sexController),
        _buildEditableField('Height', _heightController),
        _buildEditableField('Weight', _weightController),
        _buildEditableField('Birthdate', _birthdateController),
      ],
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}