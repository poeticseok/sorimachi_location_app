import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginpageState();
  }
}

class _LoginpageState extends State<LoginPage> {
  FocusNode emailNode;
  FocusNode passwordNode;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();

    emailTextController.dispose();
    passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(
                'https://coloredbrain.com/wp-content/uploads/2016/07/login-background.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop)),
        ),
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 180,
                  width: 250,
                  child: Image.asset('images/logo_sorimachi.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 10),
                  child: TextFormField(
                    controller: emailTextController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    autofocus: false,
                    focusNode: emailNode,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hasFloatingPlaceholder: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        prefixIcon: new Icon(
                            Icons.email,
                            color: Colors.white
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Email Address'),
                    onChanged: (String value) {
                      setState(() {});
                    },
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, emailNode, passwordNode);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordTextController,
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: false,
                  focusNode: passwordNode,
                  obscureText: true,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      prefixIcon: new Icon(
                          Icons.lock,
                          color: Colors.white
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Password'),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                GestureDetector(
                  onTap: () {
                    print("ID / Password 찾기");
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 15, right: 5),
                    child: Text(
                      'ID / Password 찾기\t',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.only(left: 50, right: 50),
                  // color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                  child: Text('Login'),
                  onPressed: () {
                    loginCheck(emailTextController.text, passwordTextController.text);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void loginCheck(String id, String pw) {
    if (id == "test" && pw == "1234") {
      Navigator.pushNamed(context, '/home');
      print("로그인 성공!");
    } else {
      print("로그인 실패!");
    }
  }
}
