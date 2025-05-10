import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blueAccent.shade400,
              Colors.lightBlue.shade800,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    duration: Duration(milliseconds: 1500),
                    child: Container(
                      alignment: Alignment.centerLeft, // Ensure the image aligns to the left
                      child: Image.asset(
                        'assets/shikharshoe.png',
                        height: 200,
                        width: 500,
                        fit: BoxFit.contain, // Keep the fit to ensure proper scaling
                        alignment: Alignment.centerLeft, // Align the image content to the left
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1500),
                    child: Center(
                      child: Text(
                        "-------- Made In Nepal --------",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),                  
                ],
              ),
            ),
            
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight : Radius.circular(100),
                   // topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      FadeInLeft(
                        duration: Duration(milliseconds: 2000),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      FadeInUp(
                        duration: Duration(milliseconds: 2200),
                        child: TextButton(
                          onPressed: (){                           
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      FadeInUp(
                        duration: Duration(milliseconds: 2400),
                        child: MaterialButton(
                          onPressed: () {},
                          height: 50,
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          color: Colors.orange[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // decoration: BoxDecoration(
                          // ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      FadeInUp(
                        duration: Duration(milliseconds: 2500),
                        child: Text(
                          "----- Or continue with ------",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeInUp(
                            duration: Duration(milliseconds: 2600),
                            child:InkWell(
                             onTap: () {                              
                             },     
                            child: Image.asset(
                              'assets/fb.png',
                              height: 50,
                              width: 50,
                            ),
                           ),
                          ),

                          SizedBox(width: 30),
                          FadeInUp(
                            duration: Duration(milliseconds: 2600),
                            child: InkWell(
                              onTap: () {                                
                              },
                              child: Image.asset(
                                'assets/x.png',
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),

                          SizedBox(width: 30),
                          FadeInUp(
                            duration: Duration(milliseconds: 2600),
                            child: InkWell(
                              onTap: (){                               
                              },
                              child: Image.asset(
                                'assets/google.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                          SizedBox(width: 30),
                          FadeInUp(
                            duration: Duration(milliseconds: 2600),
                            child: InkWell(
                              onTap: (){                            
                              },
                              child: Image.asset(
                                'assets/insta.png',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      FadeInUp(
                        duration: Duration(milliseconds: 3000),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Not a Member?', style: TextStyle(fontSize: 16),),
                            TextButton(
                              onPressed: (){},
                              child: Text('Sign Up Now', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.orange.shade900),)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ), 
      ),
    );
  }
}
