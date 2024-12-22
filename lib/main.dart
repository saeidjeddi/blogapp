import 'package:app/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFountfamily = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: defaultFountfamily,
            color: secondTextColor,
          ),
          headlineMedium: TextStyle(
            fontFamily: defaultFountfamily,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: defaultFountfamily,
            color: secondTextColor,
            fontSize: 12,
          )
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi  Saeed !',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Image.asset(
                        'assets/img/icons/notification.png',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                  child: Text(
                    'Explor today`s',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  
                  child: ListView.builder(
                      itemCount: stories.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                      
                      itemBuilder: (context, index) {
                        final story = stories[index];
                        return Container(
                          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 68,
                                    height: 68,
                                    
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      
                                      
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        
                                        colors: 
                                        [Color(0xff376AED), 
                                        Color(0xff49B0E2),
                                         Color(0xff9CECFB)]),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18)
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset('assets/img/stories/${story.imageFileName}'),
                                        ),
                                      
                                    ),

                                  
                                  ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                    'assets/img/icons/${story.iconFileName}',
                                    width: 32,
                                    height: 32,
                                    ),
                                ),
                                ],
                              ),
                              
                              SizedBox(height: 8,),
                              Text(story.name),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
