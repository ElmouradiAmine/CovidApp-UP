import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../widgets/custom_app_bar.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            color: Palette.primaryColor,
            height: 50,
            child: Text(
              'Nouveauté',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
