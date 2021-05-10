import 'dart:convert';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/pages/countryPage.dart';
import 'package:covid_tracker/panels/infoPanel.dart';
import 'package:covid_tracker/panels/mostaffectedcountries.dart';
import 'package:covid_tracker/panels/wordwidepanel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  var url = Uri.parse("https://corona.lmao.ninja/v3/covid-19/all");
  fetchWorldWideData() async {
    http.Response response = await http.get(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  var url2 = Uri.parse("https://corona.lmao.ninja/v3/covid-19/countries");
  fetchCountryData() async {
    http.Response response = await http.get(url2);
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  Future fetchData() async{
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],

        centerTitle: false,
        title: Center(
          child: Text(
            'COVID-TRACKER',
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  color: Colors.deepPurple[100],
                  child: Text(
                    DataSource.quote,
                    style: TextStyle(
                        color: Colors.deepPurple[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Worldwide',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CountryPage()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Regional',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                worldData == null
                    ? CircularProgressIndicator()
                    : WorldWidePanel(
                  worldData: worldData,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: Text(
                    'Most affected Countries',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                countryData == null
                    ? Container()
                    : MostAffectedPanel(
                  countryData: countryData,
                ),
                InfoPanel(),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                      'WE ARE TOGETHER IN THE FIGHT',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: Text(
                      'FROM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
                    )),
                Center(
                    child: Text(
                      'VISHAL PATEL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
