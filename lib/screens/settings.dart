import 'package:flutter/material.dart';
const _widgetHeight = 100.0;
const _iconSize = 60.0;
const _iconColoredBackgroundWidth = 70.0;
const _textSize = 24.0;
var name = 'name_1';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0),
        child: Container(

          decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Color.fromRGBO(117, 117, 117, 1)))
          ),
          height: _widgetHeight,
          child: InkWell(
            highlightColor: Color.fromRGBO(255, 115, 167, 0),
            splashColor: Color.fromRGBO(255, 115, 167, 0.4),

            onTap: () {
              print('tapped');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                      color: Colors.grey[700],
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,

                    ),
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