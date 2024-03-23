
import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/bigtext.dart';
import 'package:admin_app/round.dart';
import 'package:admin_app/smalltext.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool spwd = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(email: emailController.text,
        password: passwordController.text).then((value){
      Utils().tostmessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) =>home_page()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      Utils().tostmessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //  backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:100,
                            ),


                            SizedBox(height: 20,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.0),
                              child: BigText(text: "Login",size: 35,color: AppColors.Colorq,),
                            ),
                            SizedBox(
                              height:40,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.Colorq.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: TextFormField(
                                      controller: emailController,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.Colorq,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration:  InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        labelText: "Email Address",
                                        labelStyle: TextStyle(
                                            color: AppColors.Colorq
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: AppColors.Colorq),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppColors.red),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.transparent),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppColors.red),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                      ),
                                      validator: (value){
                                        bool emailValid =
                                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value!);
                                        if(value.isEmpty){
                                          return 'Enter Email';
                                        }
                                        else if(!emailValid){
                                          return 'Enter Valid Email';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20,),

                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.Colorq.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: TextFormField(

                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.Colorq,
                                      ),
                                      controller: passwordController,
                                      keyboardType: TextInputType.text,
                                      obscureText: spwd,
                                      // obscureText: true,
                                      decoration:  InputDecoration(

                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                            color: AppColors.Colorq
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: AppColors.Colorq),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.red),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.transparent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.red),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              spwd = !spwd;
                                            }
                                            );
                                          },
                                          child: Icon(spwd ?  Icons.visibility_off : Icons.visibility,color: AppColors.Colorq,),
                                        ),
                                      ),
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'Enter Password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 50,),
                                  RoundButton(title: 'Sign In',
                                    loding: loading,
                                    onTap: () {
                                      if(_formKey.currentState!.validate()){
                                        login();
                                      }
                                    },),
                                  const SizedBox(height: 10,),
                                  // Align(alignment: Alignment.bottomRight,
                                  //   child: TextButton(onPressed: () {
                                  //     Navigator.push(context,MaterialPageRoute(builder: (context) => ForgotPassword(),));
                                  //   }, child: BigText(text: "Forgot Password",color: Color(value),
                                  //       fontWeight: FontWeight.w400),),
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     BigText(text: "Do not have an account?",color: AppColors.black,
                                  //         fontWeight: FontWeight.w400),
                                  //     TextButton(onPressed: () {
                                  //       Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen(),));
                                  //     }, child:BigText(text: "Sign Up",color: AppColors.themColor,
                                  //         fontWeight: FontWeight.w400),)
                                  //   ],
                                  // ),



                                ],
                              ),
                            ),
                          ]
                      ))   )
          )
      ),
    );
  }
}
