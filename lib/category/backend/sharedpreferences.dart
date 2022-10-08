import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWidget extends StatefulWidget {
  @override
  _SharedPreferencesWidgetState createState() => _SharedPreferencesWidgetState();
}

class _SharedPreferencesWidgetState extends State<SharedPreferencesWidget> {
  String _username = 'None';
  int _score = 0;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          TextField(
            controller: _scoreController,
            decoration: InputDecoration(hintText: 'Score'),
          ),
          ElevatedButton(
            onPressed: () {
              _saveSharedPreferences(
                _usernameController.value.text.toString(),
                int.parse(_scoreController.value.text.toString()),
              );
            },
            child: Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              _readSharedPreferences();
            },
            child: Text('Read'),
          ),
          ElevatedButton(
            onPressed: () {
              _clearSharedPreferences();
            },
            child: Text('Clear'),
          ),
          Text('Read from persistence User:$_username Score:$_score'),
        ],
      ),
    );
  }

  Future _saveSharedPreferences(String username, int score) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('USERNAME', username);
    await sharedPreferences.setInt('SCORE', score);
  }

  Future _readSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _username = sharedPreferences.getString('USERNAME');
    _score = sharedPreferences.getInt('SCORE');
    setState(() {});
  }

  Future _clearSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
