import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


  final PageController pageController=PageController(initialPage: 0);
  int pageNum=4;
  int currentPage=0;

  List<Widget> pageBuilder()
  {

    List<Widget> list=[];
    for(int i=0;i < pageNum;i++)
      {
        list.add(i==currentPage? indicator(true):indicator(false));
      }
    return list;


  }

  Widget indicator(bool isActive)
  {
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 8,
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: isActive?25:13,
      decoration: BoxDecoration(
        color: isActive? Colors.white:Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
    );



  }


  @override



  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff2948ff),Color(0xff2F80ED)],begin: Alignment.topLeft,end: Alignment.bottomCenter)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  },
                  child: Text('Skip',style: TextStyle(
                      fontWeight: FontWeight.w600,color: Colors.white,fontSize: 25
                  ),),
                ),
              ),
              Container(
                height: 500,
                child: PageView(
                  onPageChanged: (int page){
                    setState(() {
                      currentPage=page;
                    });
                  },
                  physics: ClampingScrollPhysics(),
                  controller: pageController,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/self.png'),
                            height: 300,

                          ),
                        ),
                        Center(
                          child: Text('Wear a Facemask',style: TextStyle(
                            fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 10),
                          child: Center(
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqu Ut enim ad minim veniamquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white
                            ),),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/cough.png'),
                            height: 300,

                          ),
                        ),
                        Center(
                          child: Text('Cough Into Elbow',style: TextStyle(
                              fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 10),
                          child: Center(
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqu Ut enim ad minim veniamquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white
                            ),),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/wash.png'),
                            height: 300,

                          ),
                        ),
                        Center(
                          child: Text('Always Wash Your Hands',style: TextStyle(
                              fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 10),
                          child: Center(
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqu Ut enim ad minim veniamquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white
                            ),),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/sodis.png'),
                            height: 300,


                          ),
                        ),
                        Center(
                          child: Text('Keep The Social Distance',style: TextStyle(
                              fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 10),
                          child: Center(
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqu Ut enim ad minim veniamquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white
                            ),),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),


              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  pageBuilder(),

                ),
              ),
              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('Swipe ',style: TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white
                  ),),
                  Icon(Icons.arrow_forward_rounded,color: Colors.white,)
                ],
              )

            ],
          ),
        ),
      ),

      bottomSheet: currentPage==pageNum-1 ? GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white
          ),
          child: Text('Get Started',style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.w700,color: Colors.red
          ),),


        ),
      ):Text(''),
      
    );
  }
}

