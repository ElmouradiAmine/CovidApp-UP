import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/palette.dart';
import '../widgets/custom_app_bar.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<Widget> _list = <Widget>[];

  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 28.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            iconSize: 28.0,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            iconSize: 28.0,
            onPressed: () {
              var now = new DateTime.now();
              var formatter = new DateFormat('yyyy-MM-dd HH:mm');
              String formattedDate = formatter.format(now);
              setState(() {
                _list.add(
                  _buildTile('Amine Elmouradi', 'AE:DF:67:3P:DF:12:79:JD0',
                      '$formattedDate', 'Salé - Bettana'),
                );
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                color: Palette.primaryColor,
                width: double.infinity,
                child: Text(
                  'Mes contacts',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return _list[index];
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Card(
                color: Palette.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'La probabilité que vous soyez contaminé est de : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Text(
                          '4.57%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                              color: Colors.white),
                        ),
                      ), 
                     
                     
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTile(String name, String code, String dateTime, String location) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        dense: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(dateTime),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(code),
            SizedBox(
              width: 80,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 15,
                  color: Palette.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  setList() {
    _list.addAll([
      _buildTile('Imane Elmouradi', 'AE:DF:88:3P:DF:31:79:FD8',
          '10/07/2020 16:49', 'Salé - Bettana'),
      _buildTile('Said Jraif', 'AE:DF:88:90:DF:31:79:F38', '11/07/2020 13:21',
          'Salé - Bettana'),
      _buildTile('Ahmed Bougern', 'AE:DF:67:3P:DF:12:79:JD0',
          '13/07/2020 17:34', 'Rabat - Agdal'),
      _buildTile('Aymane Bakr', 'AE:DF:67:3P:DF:12:79:JD0', '14/07/2020 00:15',
          'Rabat - Agdal'),
      _buildTile('Zakaria Bouchkar', 'AE:DF:67:3P:DF:12:79:JD0',
          '17/07/2020 06:54', 'Rabat - Agdal'),
      _buildTile('Yassine Derkaoui', 'AE:DF:67:3P:DF:12:79:JD0',
          '21/07/2020 02:34', 'Rabat - Agdal'),
    ]);
  }
}
