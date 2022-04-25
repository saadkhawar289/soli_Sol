import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_icons/animate_icons.dart';

import 'Providers/auth_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool upper = true;
  bool lower = false;
  AnimateIconController animController = AnimateIconController();

  final con = ScrollController();
  @override
  void initState() {
    con.addListener(() {
      if (con.position.pixels == 0) {
        setState(() {
          upper = true;
          lower = false;
        });
      } else if(con.position.atEdge){
        setState(() {
          lower = true;
          upper = false;
        });

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('homepage build');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Container(
              height: height,
              color: Colors.grey[200],
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: height * 0.55,
                          width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.orange[700]!,
                                  Colors.pink[600]!,
                                  Colors.pink[600]!,
                                  Colors.orange[700]!,
                                  Colors.yellow[400]!,
                                ],
                              ),
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(600), bottomRight: Radius.circular(1200))),
                        ),
                      ),///upper background curved shape
                      Positioned(
                        top: height * 0.50,
                        left: width * 0.70,
                        child: Container(
                          height: height * 0.60,
                          width: 515,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.orange[700]!,
                                  Colors.pink[600]!,
                                  Colors.pink[600]!,
                                  Colors.orange[700]!,
                                  Colors.yellow[400]!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(700)),
                        ),
                      ),///lower background curved shape
                      SizedBox(
                        height: height,
                        width: width,
                        child: ListView(
                          controller: con,
                          children: [
                            Stack(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ClipPath(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.90,
                                            height: MediaQuery.of(context).size.height * 0.70,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurStyle: BlurStyle.solid,
                                                  color: Colors.grey,
                                                  blurRadius: 6,
                                                  offset: Offset(2, -3), // Shadow position
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(top: height * 0.07),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'LOGO',
                                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                                    child: TextFormField(
                                                        controller: context.read<AuthProvider>().email,
                                                        keyboardType: TextInputType.emailAddress,
                                                        decoration: const InputDecoration(suffixIcon: Icon(Icons.account_circle), border: InputBorder.none, hintText: 'User Name')),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                                                    child: Divider(
                                                      thickness: 2,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                                    child: TextFormField(
                                                        controller: context.read<AuthProvider>().pass,
                                                        style: const TextStyle(decoration: TextDecoration.none),
                                                        obscureText: true,
                                                        keyboardType: TextInputType.visiblePassword,
                                                        decoration: const InputDecoration(suffixIcon: Icon(Icons.key), border: InputBorder.none, hintText: 'Password')),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                                                    child: Divider(
                                                      thickness: 2,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(top: height * 0.17, right: 10),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          Map<dynamic, dynamic> xx = await context.read<AuthProvider>().login();
                                                          if (xx['success']) {
                                                            Navigator.of(context).pushNamed('/profile');
                                                          } else {
                                                            var snackBar = SnackBar(
                                                              content: Text(xx['msg']),
                                                            );
                                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                          }
                                                        },
                                                        child: Container(
                                                            height: 45,
                                                            width: width <= 367 ? width * 0.35 : width * 0.41,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20),
                                                              gradient: LinearGradient(
                                                                begin: Alignment.topRight,
                                                                end: Alignment.bottomLeft,
                                                                stops: [0, 13, 20, 40, 50],
                                                                colors: [
                                                                  Colors.orange[700]!,
                                                                  Colors.pink[600]!,
                                                                  Colors.pink[600]!,
                                                                  Colors.orange[700]!,
                                                                  Colors.yellow[400]!,
                                                                ],
                                                              ),
                                                            ),
                                                            child: Center(
                                                                child: Provider.of<AuthProvider>(context, listen: true).loading
                                                                    ? const CircularProgressIndicator(
                                                                        backgroundColor: Colors.red,
                                                                        color: Colors.yellow,
                                                                      )
                                                                    : const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        clipper: BackgroundClipper(),
                                      ),
                                    ),///first login container
                                    ClipPath(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          height: MediaQuery.of(context).size.height * 0.83,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurStyle: BlurStyle.solid,
                                                color: Colors.grey,
                                                blurRadius: 6,
                                                offset: Offset(0, 6), // Shadow position
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(top: height * 0.17),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Text(
                                                    'LOGO',
                                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 20.0, left: 20, top: height * 0.03),
                                                  child: TextFormField(
                                                      controller: context.read<AuthProvider>().firstName,
                                                      style: const TextStyle(decoration: TextDecoration.none),
                                                      keyboardType: TextInputType.text,
                                                      decoration: const InputDecoration(suffixIcon: Icon(Icons.person), border: InputBorder.none, hintText: 'Name')),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 20.0, left: 20, top: height * 0.01),
                                                  child: TextFormField(
                                                      controller: context.read<AuthProvider>().email2,
                                                      style: const TextStyle(decoration: TextDecoration.none),
                                                      keyboardType: TextInputType.emailAddress,
                                                      decoration: const InputDecoration(suffixIcon: Icon(Icons.mail), border: InputBorder.none, hintText: 'Email')),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 20.0, left: 20, top: height * 0.01),
                                                  child: TextFormField(
                                                      controller: context.read<AuthProvider>().password,
                                                      style: const TextStyle(decoration: TextDecoration.none),
                                                      obscureText: true,
                                                      keyboardType: TextInputType.visiblePassword,
                                                      decoration: const InputDecoration(suffixIcon: Icon(Icons.key), border: InputBorder.none, hintText: 'Password')),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 20.0, left: 20, top: height * 0.01),
                                                  child: TextFormField(
                                                      controller: context.read<AuthProvider>().userName,
                                                      style: const TextStyle(decoration: TextDecoration.none),
                                                      keyboardType: TextInputType.text,
                                                      decoration: const InputDecoration(suffixIcon: Icon(Icons.account_circle), border: InputBorder.none, hintText: 'User Name')),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 20.0, left: 20, top: height * 0.01),
                                                  child: TextFormField(
                                                      controller: context.read<AuthProvider>().phone,
                                                      style: const TextStyle(decoration: TextDecoration.none),
                                                      keyboardType: TextInputType.phone,
                                                      decoration: const InputDecoration(suffixIcon: Icon(Icons.call), border: InputBorder.none, hintText: 'Phone Number')),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(top: 0, right: 10, bottom: 10),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          bool xx = await context.read<AuthProvider>().Signup();
                                                          if (xx) {
                                                            const snackBar = SnackBar(
                                                              content: Text('Signup Successful'),
                                                            );
                                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                            con.position.pointerScroll(height * -0.90);
                                                          } else {
                                                            var snackBar = const SnackBar(
                                                              content: Text('error try again'),
                                                            );
                                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                          }
                                                        },
                                                        child: Container(
                                                            height: width <= 367 ? 39 : 45,
                                                            width: width <= 367 ? width * 0.35 : width * 0.41,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20),
                                                              gradient: LinearGradient(
                                                                begin: Alignment.topRight,
                                                                end: Alignment.bottomLeft,
                                                                stops: const [13, 23, 40, 50, 50],
                                                                colors: [
                                                                  Colors.orange[700]!,
                                                                  Colors.pink[600]!,
                                                                  Colors.pink[600]!,
                                                                  Colors.orange[700]!,
                                                                  Colors.yellow[400]!,
                                                                ],
                                                              ),
                                                            ),
                                                            child: Provider.of<AuthProvider>(context, listen: true).loading
                                                                ? const Center(
                                                                    child: CircularProgressIndicator(
                                                                      backgroundColor: Colors.red,
                                                                      color: Colors.yellow,
                                                                    ),
                                                                  )
                                                                : const Center(child: Text('Signup', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)))),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      clipper: BackgroundClipper2(),
                                    ),///second  signup container
                                    const SizedBox(
                                      height: 0,
                                    )
                                  ],
                                ), /// main scrolling body

                                Positioned(
                                    top: MediaQuery.of(context).size.height * 0.66,
                                    left: MediaQuery.of(context).size.width * 0.82,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(color: Colors.red[500], borderRadius: BorderRadius.circular(50)),
                                      child: AnimateIcons(
                                        startIcon: Icons.arrow_upward,
                                        endIcon: Icons.arrow_downward,
                                        size: 25.0,
                                        controller: animController,
                                        onStartIconPress: () {
                                          con.position.pointerScroll(height * 0.90);

                                          return true;
                                        },
                                        onEndIconPress: () {
                                          con.position.pointerScroll(-height * 0.90);

                                          return true;
                                        },
                                        duration: const Duration(milliseconds: 100),
                                        startIconColor: Colors.white,
                                        endIconColor: Colors.white,
                                        clockwise: false,
                                      ),
                                    )), /// login Form navigation icons
                                Positioned(
                                    top: MediaQuery.of(context).size.height * 0.76,
                                    left: MediaQuery.of(context).size.width * 0.05,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(color: Colors.red[500], borderRadius: BorderRadius.circular(50)),
                                      child: AnimateIcons(
                                        startIcon: Icons.arrow_upward,
                                        endIcon: Icons.arrow_downward,
                                        size: 25.0,
                                        controller: animController,
                                        onStartIconPress: () {
                                          con.position.pointerScroll(-height * 0.90);

                                          return true;
                                        },
                                        onEndIconPress: () {
                                          con.position.pointerScroll(height * 0.90);

                                          return true;
                                        },
                                        duration: const Duration(milliseconds: 100),
                                        startIconColor: Colors.white,
                                        endIconColor: Colors.white,
                                        clockwise: false,
                                      ),
                                    )), /// signup Form navigation icons
                                Visibility(
                                  visible: upper,
                                  child: Positioned(
                                      top: MediaQuery.of(context).size.height * 0.55,
                                      left: MediaQuery.of(context).size.width * 0.10,
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(30)),
                                          child: SvgPicture.asset(
                                            'assets/fb.svg',
                                            fit: BoxFit.fill,
                                            // color: Colors.white,
                                          ))),
                                ), ///login Form fb icons
                                Visibility(
                                  visible: upper,
                                  child: Positioned(
                                      top: MediaQuery.of(context).size.height * 0.61,
                                      left: MediaQuery.of(context).size.width * 0.30,
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(color: Colors.blue[200], borderRadius: BorderRadius.circular(30)),
                                          child: SvgPicture.asset(
                                            'assets/twitter.svg',
                                            fit: BoxFit.fill,
                                            color: Colors.blue,
                                          ))),
                                ), ///login Form twitter icons
                                Visibility(
                                  visible: upper,
                                  child: Positioned(
                                      top: MediaQuery.of(context).size.height * 0.68,
                                      left: MediaQuery.of(context).size.width * 0.53,
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(color: Colors.red[100], borderRadius: BorderRadius.circular(30)),
                                          child: SvgPicture.asset(
                                            'assets/google.svg',
                                            fit: BoxFit.fill,
                                            height: 20,
                                            width: 20,
                                          ))),
                                ), ///login Form google icons
                                Visibility(
                                  visible: lower,
                                  child: Positioned(
                                      top: MediaQuery.of(context).size.height * 0.72,
                                      left: MediaQuery.of(context).size.width * 0.27,
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                          child: SvgPicture.asset(
                                            'assets/fb.svg',
                                            fit: BoxFit.fill,
                                          ))),
                                ), ///Signup Form Fb icons
                                Visibility(
                                  visible: lower,
                                  child: Positioned(
                                      top: MediaQuery.of(context).size.height * 0.79,
                                      left: MediaQuery.of(context).size.width * 0.50,
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                          child: SvgPicture.asset(
                                            'assets/twitter.svg',
                                            fit: BoxFit.fill,
                                            color: Colors.blue,
                                          ))),
                                ), /// Signup Form Twitter icon
                                Visibility(
                                  visible: lower,
                                  child: Positioned(
                                      top: MediaQuery.of(context).size.height * 0.87,
                                      left: MediaQuery.of(context).size.width * 0.74,
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                        child: SvgPicture.asset('assets/google.svg', fit: BoxFit.fill, height: 20, width: 20),
                                      )),
                                ) /// Signup Form Google icon
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      )/// scrolling body area on stack
                    ],
                  ),
                ],
              )),

          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.60);
    path.lineTo(size.width * 0.92, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BackgroundClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width * 0.08, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
