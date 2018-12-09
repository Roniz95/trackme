import 'package:flutter/material.dart';
import 'package:track_me/styles/texts.dart';
import 'package:track_me/styles/colors.dart';

final items = List<companyTileAccepted>.generate(6, (i) => companyTileAccepted('Name ${i + 1}', 'Type', 'date'));

class SharingPage extends StatefulWidget {
  static String tag = 'sharing-page';
  @override
  _SharingPageState createState() => new _SharingPageState();
}

class _SharingPageState extends State<SharingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              new Text('Pending requests', style: textStyles['title_text']),
              SizedBox(height: 32.0,),
              new ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  new companyTileRequest('Adidas', 'Sportwear'),
                  new companyTileRequest('Nike', 'Sportwear')
                ],
              ),
              SizedBox(height: 32.0),
              new Text('Active requests', style: textStyles['title_text'],),
              SizedBox(height: 32.0,),
              ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Dismissible(
                    // Show a red background as the item is swiped away
                    background: Container(color: Colors.transparent),
                    key: Key(item.companyName),
                    onDismissed: (direction) {

                      setState(() {
                        item.refuse();  //this function modify the database
                        items.removeAt(index);
                      });

                      Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content: Text("${item.companyName} request dismissed")));
                    },
                    child:  items[index]
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }
}


//a widget that display a sharing request tile to the user
class companyTileRequest extends StatelessWidget {
  String companyName;
  Image companyImage; //TODO how does server send images ?
  String companyType;

  companyTileRequest(String companyName, String companyType) {
    this.companyName = companyName;
    this.companyType = companyType;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 0.0, right: 0.0, top: 8.0, bottom: 0.0),
        child: Container(
          child: Center(
            child: Card(
                child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 36,
                    child: Image.asset('assets/icons/logo.png'),
                  ),
                ),
                new Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        companyName,
                        style: new TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      new Text(
                        companyType,
                        style: new TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                new IconButton(
                    icon: Icon(Icons.check),
                    highlightColor: colorStyles['primary_pink'],
                    splashColor: colorStyles['splashColor_pink'],
                    onPressed: accept),//TODO implement those methods
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: new IconButton(
                      icon: Icon(Icons.clear),
                      highlightColor: colorStyles['primary_pink'],
                      splashColor: colorStyles['splashColor_pink'],
                      onPressed: refuse),
                )

              ],
            )),
          ),
        ),
      ),
    );
  }
  accept() {
    print('accepted!');
  }

  refuse(){
    print('refused!');
  }

}

class companyTileAccepted extends StatelessWidget {
  String companyName;
  Image companyImage; //TODO how does server send images ?
  String companyType;
  String sharingSince;

  companyTileAccepted(String companyName, String companyType, String sharingSince) {
    this.companyName = companyName;
    this.companyType = companyType;
    this.sharingSince = sharingSince;
  }
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 0.0, right: 0.0, top: 8.0, bottom: 0.0),
        child: Container(
          child: Center(
            child: Card(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 36,
                        child: Image.asset('assets/icons/logo.png'),
                      ),
                    ),
                    new Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Text(
                            companyName,
                            style: new TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          new Text(
                            companyType,
                            style: new TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                            ),
                          ),
                          new Text(
                            'since: ' + sharingSince,
                            style: new TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: new IconButton(
                          icon: Icon(Icons.clear),
                          highlightColor: colorStyles['primary_pink'],
                          splashColor: colorStyles['splashColor_pink'],
                          onPressed: refuse
                      ),
                    )

                  ],
                )),
          ),
        ),
      ),
    );
  }

  refuse(){
    print('refused!');
  }
}
