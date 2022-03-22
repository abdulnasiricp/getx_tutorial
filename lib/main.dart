import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetXHomeScreen(),
    );
  }
}

class GetXHomeScreen extends StatefulWidget {
  _GetXHomeScreenState createState() => _GetXHomeScreenState();
}

class _GetXHomeScreenState extends State<GetXHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Tutorial'),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('Snackbar'),
            onPressed: () {
              Get.snackbar('Snackbar', 'this is snackbar',
                  //properties of snackbar
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.black,
                  backgroundColor: Colors.black,
                  animationDuration: Duration(milliseconds: 1000),
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.yellowAccent,
                      Colors.blueAccent
                    ],
                  ), onTap: (val) {
                print('snackbar clicked');
              });
            },
          ),
          SizedBox(
            height: 25,
          ),
          RaisedButton(
              child: Text('Dailog Button'),
              onPressed: () {
                Get.defaultDialog(
                  title: 'warning',
                  middleText: 'please wait a moment',
                  content: Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: Text(
                        'Data Loding',
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  textCancel: 'Cancel',
                  textConfirm: 'confirm',
                  onCancel: () {},
                );
              }),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('bottom sheet'),
            onPressed: () {
              Get.bottomSheet(
                Container(
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.wb_sunny_outlined),
                        title: Text('Light Mode'),
                        onTap: () => {
                          Get.changeTheme(ThemeData.light())
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.wb_sunny),
                        title: Text('Dark Mode'),
                        onTap: () => {
                          Get.changeTheme(ThemeData.dark())
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('Home screen'),
            onPressed: () {
              Get.to(HomeScreen());
            },
          )
        ],
      )),
    );
  }
}
