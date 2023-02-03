
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

//text controllers
 final username = TextEditingController();
final password = TextEditingController();



@override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
        child: SingleChildScrollView (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(
              Icons.lock,
              size: 100,
              ) ,
              SizedBox(height: 50),
           //hello again 
          Text(
            'Hello Again !!',
          style: GoogleFonts.bebasNeue(
            fontSize: 52,
          ),
          ),
          SizedBox(height: 50),
          Text(
            'Welcome Back',
          style: TextStyle(
           fontSize: 24,
          ),
          ),
          SizedBox(height: 20),
           //email textfield
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:25.0),
             child: TextField(
               controller: username,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                   ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'username',
                    fillColor: Colors.grey[200],
                  
              )
              ),
            ),
             
           SizedBox(height: 10),
           //password textfield
          Padding(
             padding: const EdgeInsets.symmetric(horizontal:25.0),
             child: TextField(
               controller: password,
               obscureText: true,
             decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                   ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Password',
                    fillColor: Colors.grey[200],
                    
              ),
             ),
            ),
             
             SizedBox(height: 10),
           //signin button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextButton(    
                onPressed: ()  async{ 
          
                  final body = jsonEncode({'username': username.text,'password' : password.text});
                  final url =  Uri.parse('https://demohelpdesk.comunikcrm.info:4443/HelpDesk/index.php/api/login');
                  final response = await http.post(
                    url,
                    headers: {'Content-Type': 'application/json'},
                    body: body
                  );
                  final data = jsonDecode(response.body);
                  print(data);
                  },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)
                    ),
                    
                  child: Center(
                     
               
                    child: Text(
                      'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
           //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
             Text(
              'Register now',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
            )
            ],
            ),
          ],
          ),
        ),
      ),
      )
      );
    
  }
}