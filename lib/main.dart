import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroDemo(),
    );
  }
}

class IntroDemo extends StatefulWidget {
  @override
  _IntroDemoState createState() => _IntroDemoState();
}

class _IntroDemoState extends State<IntroDemo> {

 final _key = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {

    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0,fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      titlePadding: EdgeInsets.all(5.0),
      imagePadding: EdgeInsets.zero,
      pageColor: Colors.white,
      contentPadding: EdgeInsets.all(5.0),
    );

    return IntroductionScreen(
        key: _key,
        pages: [
          PageViewModel(
            title: 'This is Page Number 1',
            body: 'This will contain all the description of '
                'your application',
            image: Image.asset('assets/img1.jpg',width: 350,alignment: Alignment.bottomCenter,),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'This is Page Number 2',
            body: 'This will contain all the description of '
                'your application with some more discription',
            image: Image.asset('assets/img2.jpg',width: 350,alignment: Alignment.bottomCenter),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'This is Page Number 3',
           bodyWidget: Container(
             child: Column(
               children: [
                 Text('You can also add custom widgets',style: bodyStyle,),
                 Container(
                   height: 20,
                   width: 20,
                   color: Colors.yellowAccent,
                 ),
               ],
             ),
           ),
            image: Image.asset('assets/img1.jpg',width: 350,alignment: Alignment.bottomCenter),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'This is Page Number 4',
            bodyWidget: Container(
              child: RaisedButton(
                  child: Text('More function'),
                  onPressed: (){
                    print('Success');
                  }),
            ),
            image: Image.asset('assets/img3.jpg',width: 350,alignment: Alignment.bottomCenter),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'This is the last Page',
            body: 'This will contain all the description of '
                'your application',
            image: Image.asset('assets/img1.jpg',width: 350,alignment: Alignment.bottomCenter),
            decoration: pageDecoration,
          ),

        ],
        skipFlex: 0,
        nextFlex: 0,
        showSkipButton: true,
        showNextButton: true,
        skip: Text('Skip'),
        dotsDecorator: DotsDecorator(
          color: Colors.grey,
          size: Size(10, 10),
          activeSize: Size(20, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          )
        ),
        next: Icon(Icons.navigate_next),
        onDone: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_)=> NextScreen(),
          ));
        },
        done: Text('Done',style: TextStyle(fontWeight: FontWeight.w600),));
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Home'),),
    );
  }
}








