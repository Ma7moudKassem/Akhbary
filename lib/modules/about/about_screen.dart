import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     CircleAvatar(
                       radius: 45,
                       backgroundImage: AssetImage('assets/me.jpg'),
                     ),
                     SizedBox(height: 20,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text('Mahmoud Kassem',
                           style: Theme.of(context).textTheme.headline2,
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,),
                         SizedBox(height: 5,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.call,
                               color: Colors.grey,),
                             SizedBox(width: 10,),
                             Text('01224176036',
                               style: TextStyle(
                                 color: Colors.grey,
                                 fontWeight: FontWeight.bold,
                               ),),
                           ],
                         ),
                       ],
                     ),
                   ],
                 ),
                  SizedBox(height: 20,),
                  Column(

                    children: [
                      Text('I\'m Mobile App Developer',

                      style: Theme.of(context).textTheme.headline2,),
                      SizedBox(height: 10,),
                      Text('I Studying Computer Science And Software Engineering at Faculty of Computers and Information , Tanta University.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),),
                    ],

                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          launch('https://www.facebook.com/mahmoud.kassem.988711/');
                        },
                        child: Image(image: AssetImage('assets/face.png',
                        ),
                        width: 40,
                        height: 40,),
                      ),
                      SizedBox(width: 30,),
                      InkWell(
                        onTap: (){
                          launch('https://github.com/modykassem');
                        },
                        child: Image(image: AssetImage('assets/git.png'),
                          width: 40,
                          height: 40,),
                      ),
                      SizedBox(width: 30,),
                      InkWell(
                        onTap: (){
                          launch('https://www.linkedin.com/in/mahmoud-hussien-a23152195/');
                        },
                        child: Image(image: AssetImage('assets/link.png'),
                          width: 40,
                          height: 40,),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
