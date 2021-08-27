import 'package:filkhaber/modules/business/business_screen.dart';
import 'package:filkhaber/modules/entertainment/entertainment_screen.dart';
import 'package:filkhaber/modules/health/health.dart';

import 'package:filkhaber/modules/science/scienceScreen.dart';
import 'package:filkhaber/modules/sports/sportsScreen.dart';
import 'package:flutter/material.dart';

class NewsScreen  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
       appBar: AppBar(
         title:
         TabBar(
           labelColor: Colors.pink,
           unselectedLabelColor: Colors.grey,
           labelStyle: TextStyle(
             fontSize: 13,
             fontWeight: FontWeight.w900
           ),
           tabs: [
             Tab(child: Text('الأعمال')),
             Tab( child: Text('الرياضة',)),
             Tab( child: Text('الصحة')),
             Tab( child: Text('العلوم')),
             Tab( child: Text('الترفيه')),




           ],

         ),
       ),
        body:  TabBarView(
          children: [

           BusinessScreen(),
            SportsScreen(),
            HealthScreen(),
            ScienceScreen(),
            EntertainmentScreen()

          ],
        ),


      ),
    );
  }
}
