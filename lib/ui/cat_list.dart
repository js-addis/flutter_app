import 'package:flutter/material.dart';
import 'package:catbox/services/api.dart';
import 'package:catbox/models/cat.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => new _CatListState();
}

class _CatListState extends State<CatList> {

List<Cat> _cats = [];

@override
// Runs when app loads
void initState() {
  super.initState();
  _loadCats();
}
// ---------------------------------------------
// ----- FUNCTION THAT LOADS DATA INTO UI ------
// ---------------------------------------------
// 1. Gets JSON file from Assets
// 2. sends JSON file to CatApi 
// 3. Parses JSON file and adds each cat to an array called cats.
// 4. Sends each cat in the array to the state of CatList
_loadCats() async {
  String fileData = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
  for(Cat cat in CatApi.allCatsFromJson(fileData)) {
    _cats.add(cat);
  }
  print(_cats.toString());
}

  Widget _getAppTitleWidget() {
    return new Text(
      'Cats',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: _getAppTitleWidget(),
    );
  }
}