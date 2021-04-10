import 'package:eshopcompany/app_properties.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'package:eshopcompany/page_transitions/slide_page_transition.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage>with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController(text: 'example@email.com');
  TextEditingController password = TextEditingController(text: '12345678');
  AnimationController _controller;
  Animation _animation ,_delayAnimation,_muchDelayAnimation,_veryMuchDelayAnimation;
  @override
  void initState() {
    super.initState();
    _controller=AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation=Tween<double>(begin: -1.0,end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
    _delayAnimation=Tween<double>(begin: -1.0,end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2,1.0,curve: Curves.fastOutSlowIn),
    ));
    _muchDelayAnimation=Tween<double>(begin: -1.0,end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn),
    ));
    _veryMuchDelayAnimation=Tween<double>(begin: -1.0,end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn),
    ));
    _controller.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    Widget welcomeBack = Text(
      'Welcome Back Ahmed,',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account using\nMobile number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(SlideRightTransition(page: RegisterPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Log In",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: password,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          loginButton,
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Forgot your password? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Reset password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: transparentYellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                AnimatedBuilder(animation: _controller, builder:(BuildContext context,Widget child){
                  return Transform(
                      transform:Matrix4.translationValues(_animation.value*width, 0, 0) ,
                      child:welcomeBack,
                  );
                }),
                Spacer(),
                AnimatedBuilder(animation: _controller, builder:(BuildContext context,Widget child){
                  return Transform(
                      transform:Matrix4.translationValues(_delayAnimation.value*width, 0, 0) ,
                      child:subTitle,
                  );
                }),
                Spacer(flex: 2),
                AnimatedBuilder(animation: _controller, builder:(BuildContext context,Widget child){
                  return Transform(
                      transform:Matrix4.translationValues(_muchDelayAnimation.value*width, 0, 0) ,
                      child:loginForm,
                  );
                }),
                Spacer(flex: 2),
                AnimatedBuilder(animation: _controller, builder:(BuildContext context,Widget child){
                  return Transform(
                      transform:Matrix4.translationValues(_veryMuchDelayAnimation.value*width, 0, 0) ,
                      child:forgotPassword,
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
