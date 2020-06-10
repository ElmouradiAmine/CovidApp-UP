import 'package:flutter/material.dart';

import '../config/palette.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 28.0,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            iconSize: 28.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Palette.primaryColor,
            width: double.infinity,
            child: Text(
              'Urgent. Les détails des mesures d\'allègement du confinement au Maroc',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Image.network(
                    'https://i.le360.ma/fr/sites/default/files/styles/asset_image_in_body/public/assets/images/2020/04/92680588_2511648089086179_6661840703863128064_o.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    "Au cours de la première phase, qui débute le 11 juin 2020, les mesures d’assouplissement du confinement sanitaire seront comme suit (voir document ci-dessous).",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    """-Reprise des activités sportives individuelles en plein air (marche, vélos…etc);

-Maintien de l’ensemble des autres restrictions décrétées pendant l’état d’urgence sanitaire (interdiction des rassemblements, des réunions, des fêtes, des fêtes de mariage, des funérailles…etc);

C- Assouplissement des restrictions dans la Zone n°2:

-Obligation de disposer d’une autorisation exceptionnelle de déplacement pour toute sortie;

-Fermeture des commerces à 20H00

-Reprise du transport public urbain sans dépasser 50% de la capacité d’accueil;

-Maintien de l’ensemble des autres restrictions imposées lors de l’état d’urgence sanitaire (interdiction des rassemblements, des réunions, des fêtes, des fêtes de mariage, des funérailles…etc""",
                    style: TextStyle(),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    """-Reprise des activités sportives individuelles en plein air (marche, vélos…etc);

-Maintien de l’ensemble des autres restrictions décrétées pendant l’état d’urgence sanitaire (interdiction des rassemblements, des réunions, des fêtes, des fêtes de mariage, des funérailles…etc);

C- Assouplissement des restrictions dans la Zone n°2:

-Obligation de disposer d’une autorisation exceptionnelle de déplacement pour toute sortie;

-Fermeture des commerces à 20H00

-Reprise du transport public urbain sans dépasser 50% de la capacité d’accueil;

-Maintien de l’ensemble des autres restrictions imposées lors de l’état d’urgence sanitaire (interdiction des rassemblements, des réunions, des fêtes, des fêtes de mariage, des funérailles…etc""",
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
