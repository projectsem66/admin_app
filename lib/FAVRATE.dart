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
