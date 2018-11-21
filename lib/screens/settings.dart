import 'package:flutter/material.dart';
import 'package:track_me/styles/texts.dart';

const _widgetHeight = 100.0;
const _iconSize = 60.0;
const _iconColoredBackgroundWidth = 70.0;
const _textSize = 24.0;


class CategoryItem extends StatelessWidget {
  String categoryName;
  String categoryIcon;

  CategoryItem(String categoryName, String categoryIcon) {
    this.categoryName = categoryName;
    this.categoryIcon = categoryIcon;
  }
  //It seems this is how Dart handles overloading
  CategoryItem.defaultIcon(String categoryName,) {
    this.categoryName = categoryName;
  }
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 0.0, bottom: 0.0),
        child: Container(

          decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Colors.grey))
          ),
          height: _widgetHeight,
          child: InkWell(
            highlightColor: Color.fromRGBO(255, 115, 167, 0),
            splashColor: Color.fromRGBO(255, 115, 167, 0.4),
            borderRadius: BorderRadius.circular(80),

            onTap: () {
              print('tapped');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    categoryName,
                    textAlign: TextAlign.center,
                    style: textStyles['normal_text'],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.cake),
                )
              ],
            ),


          ),

        ),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {

  ListView settingsList = new ListView(
    children: <Widget>[
      new CategoryItem.defaultIcon('Notifications'),
      new CategoryItem.defaultIcon('Sharing center'),
      new CategoryItem.defaultIcon('Account'),
    ],

  );

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      body: settingsList,
    );
  }
}