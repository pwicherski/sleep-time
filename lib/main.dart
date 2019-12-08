import 'package:flutter/material.dart';
import 'strings.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Time',
      theme: ThemeData.dark(
      
      ),
      home: MyHomePage(title: 'Sleep Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    TextEditingController _c ;
    double _opacity = 0.0;
    var cycles = {'firstCycle':'','secondCycle':'', 'thirdCycle':'', 'forthCycle':'', 'fifthCycle':'', 'sixthCycle':''}; 
    
  @override
  void initState() {

      _c = new TextEditingController();
      super.initState();
    }
  
  @override
  void dispose(){
   _c?.dispose();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    cyclesMeasure() {   

          DateTime now = DateTime.now();

                    var first = now.add(new Duration(minutes: 90 + 14));
          cycles['firstCycle'] = first.toIso8601String().substring(11, 16);

                    var second = now.add(new Duration(minutes: 180 + 14));
          cycles['secondCycle'] = second.toIso8601String().substring(11, 16);
          
                    var third = now.add(new Duration(minutes: 270 + 14));
          cycles['thirdCycle'] = third.toIso8601String().substring(11, 16);
          
                    var forth = now.add(new Duration(minutes: 360 + 14));
          cycles['forthCycle'] = forth.toIso8601String().substring(11, 16);
          
                    var fifth = now.add(new Duration(minutes: 450 + 14));
          cycles['fifthCycle'] = fifth.toIso8601String().substring(11, 16);
          
                    var sixth = now.add(new Duration(minutes: 540 + 14));
          cycles['sixthCycle'] = sixth.toIso8601String().substring(11, 16);

    }

    showSleepTime(String sleepLength, double fontSize, int color, bool sleepTime) {

      if (sleepTime = true) {

        return RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: sleepLength,
                      style:
                        TextStyle(fontWeight:
                          FontWeight.bold,
                          color: Color(color),
                          fontSize: fontSize)),
                    ],
                  ),
                );
        
      } else {

        return AutoSizeText(
              Strings.topAutosizeText,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              maxLines: 2,
        );

      }               
    }

    showContainer(String cycleNumber, String sleepLength, double fontSize, int color) {
      return TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(cycleNumber, style: TextStyle(fontSize: 22), textAlign: TextAlign.center,),
                          showSleepTime(sleepLength, fontSize, color, true),
                        ],
                      ),
                    )
                  ],);
    }

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              Strings.topAutosizeText,
              style: TextStyle(fontSize: 22), textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
        ),
        
        const SizedBox(height: 30),

          Container(child: Padding(padding: const EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
            child: Table(
              children: [
                  showContainer('One cycle: ', cycles['firstCycle'], 22, 0xffb74093),
                  showContainer('Two cycles: ', cycles['secondCycle'], 22, 0xffc14f9f),
                  showContainer('Three cycles: ', cycles['thirdCycle'], 22, 0xff723e9c),
                  showContainer('Four cycles: ', cycles['forthCycle'], 22, 0xff7f45ae),
                  showContainer('Five cycles: ', cycles['fifthCycle'], 22, 0xff3e689c),
                  showContainer('Six cycles: ', cycles['sixthCycle'], 22, 0xff4574ae),
                  ]),),),

          RaisedButton(
          onPressed: () {cyclesMeasure();
          setState((){
                  _c.text = Strings.emptyValue;
                  _opacity = _opacity == 0.0 ? 1.0 : 1.0; 
                  Strings.stateButtonText = Strings.updatedStateButtonText;
                  Strings.topAutosizeText = Strings.updatedTopText;
                  Strings.fallAsleepText = Strings.updatedFallAsleepText;
                  Strings.slepCycleText = Strings.updatedSlepCycleText;
                });
            },
            child: Text(
                 Strings.stateButtonText, style: TextStyle(fontSize: 20))
          ),
          const SizedBox(height: 20),

          AutoSizeText(
              Strings.fallAsleepText,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
              maxLines: 2,
        ),

          const SizedBox(height: 20),

        AutoSizeText(
              Strings.slepCycleText,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
              maxLines: 2,
        ),

          const SizedBox(height: 20),

          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _opacity,
            child: Text('🌙 🌙 🌙 🌙 🌙',
            style: TextStyle(fontSize: 20),),
          )

          ],
          
        ),
      
      ),
      
    );
  }

}
