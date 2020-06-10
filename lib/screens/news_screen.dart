import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/screens/news_details_screen.dart';

import '../config/palette.dart';
import '../config/palette.dart';
import '../config/styles.dart';
import '../widgets/custom_app_bar.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Palette.primaryColor,
            height: 80,
            width: double.infinity,
            child: Text(
              'Nouveauté',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 12.0),
              color: Palette.primaryColor,
              child: _buildRegionTabBar()),
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                _buildCard(
                    context,
                    'https://i.le360.ma/fr/sites/default/files/styles/asset_image_in_body/public/assets/images/2020/04/92680588_2511648089086179_6661840703863128064_o.jpg',
                    'Urgent. Les détails des mesures d\'allègement du confinement au Maroc',
                    'Ces mesures d\'allègement, qui firgurent dans un communiqué counjoint des ministères de...',
                    '13'),
                _buildCard(
                    context,
                    'https://fr.hespress.com/wp-content/uploads/2020/06/RABAT-CORONA1-e1591781524262-730x410.jpg',
                    'Coronavirus/Maroc: Les nouveaux cas répartis entre Casablanca-Settat et Rabat',
                    'Le Royaume du maroc a rencensé dans la nuit de mardi à mercredi, 18 nouveaux cas de ce...',
                    '23'),
                _buildCard(
                    context,
                    'https://i.le360.ma/fr/sites/default/files/styles/asset_image_in_body/public/assets/images/2020/04/92680588_2511648089086179_6661840703863128064_o.jpg',
                    'Urgent. Les détails des mesures d\'allègement du confinement au Maroc',
                    'Ces mesures d\'allègement, qui firgurent dans un communiqué counjoint des ministères de...',
                    '13'),
                _buildCard(
                    context,
                    'https://i.le360.ma/fr/sites/default/files/styles/asset_image_in_body/public/assets/images/2020/04/92680588_2511648089086179_6661840703863128064_o.jpg',
                    'Urgent. Les détails des mesures d\'allègement du confinement au Maroc',
                    'Ces mesures d\'allègement, qui firgurent dans un communiqué counjoint des ministères de...',
                    '13'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRegionTabBar() {
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(
          indicator: BubbleTabIndicator(
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40.0,
            indicatorColor: Colors.white,
          ),
          labelStyle: Styles.tabTextStyle,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Text('Nationale'),
            Text('Internationale'),
          ],
          onTap: (index) {},
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String imgUrl, String title,
      String description, String heures) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NewsDetail()));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            Image.network(imgUrl),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 12.0, bottom: 6.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 6.0),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 12.0,
                        child: Image.asset(
                          'assets/images/ma_flag.png',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Maroc'),
                    ],
                  ),
                  Text('• Il y a $heures heures'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
