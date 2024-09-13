import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String username;
  final String imageUrl;

  ProfileHeader({required this.name, required this.username, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(width: 18,),
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
              radius: 60,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8,),
              Text(username),
              SizedBox(height: 8,),
              GestureDetector(
                onTap: () => context.push("/settings/account"),
                child: Container(
                  decoration: BoxDecoration(
                    color: accentTeal1,
                    boxShadow: [shadowMediumBrut],
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    border: Border.all(
                      color: black1,
                      width: 2.0
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Edit Profile')),
                ),
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
