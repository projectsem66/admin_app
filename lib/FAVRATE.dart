// import 'package:admin_app/Pages/home_page.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Check if email and password are correct
//                 String email = emailController.text.trim();
//                 String password = passwordController.text.trim();
//
//                 if (email == 'admin123@gmail.com' && password == 'admin123') {
//                   // Navigate to home screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => home_page()),
//                   );
//                 } else {
//                   // Show error message
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text('Error'),
//                         content: Text('Invalid email or password'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:admin_app/Pages/home_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});
//   @override
//   _LoginFormState createState() => _LoginFormState();
// }
//
// class _LoginFormState extends State<LoginForm> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _signIn() async {
//     try {
//       String email = _usernameController.text;
//       String password = _passwordController.text;
//
//
//       QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//           .collection('admin')
//           .where('email', isEqualTo: email)
//           .where('password', isEqualTo: password)
//           .get();
//       if (querySnapshot.docs.isNotEmpty) {
//         String email = querySnapshot.docs.first.get('email');
//         String password = querySnapshot.docs.first.get('password');
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => home_page()),
//         );
//       } else {
//            showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('Invalid username or password.'),
//               actions: <Widget>[
//                 TextButton(
//                   child: Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } catch (e) {
//
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Login',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               labelText: 'Email',
//               prefixIcon: Icon(Icons.person),
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: _passwordController,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               prefixIcon: Icon(Icons.lock),
//             ),
//             obscureText: true,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _signIn,
//             child: Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }





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

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.0),
                              child: BigText(text: "Login",size: 35,color: Colors.black,),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("images/adminLogo.png"),
                                    fit: BoxFit.cover
                                ),

                              ),

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
                                        color: Colors.black,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration:  InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                            color: AppColors.Colorq
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.Colorq),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
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
                                        color: Colors.black,
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
                                          borderSide: BorderSide(color: AppColors.Colorq),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              spwd = !spwd;
                                            }
                                            );
                                          },
                                          child: Icon(spwd ?  Icons.visibility_off : Icons.visibility),
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
                                  RoundButton(title: 'Login',
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
