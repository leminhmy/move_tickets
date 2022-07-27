import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../widget/big_text.dart';
import '../home_screen.dart';
import 'list_movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('testRebuild');
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple.shade900,
                    Colors.purple.shade800,
                  ]
              )

          ),
        ),
        Positioned(
          left: -50,
          top: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.tealAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 100,
                      spreadRadius: 200,
                      color: Colors.tealAccent.withOpacity(0.3)
                  ),
                  BoxShadow(
                      blurRadius: 60,
                      spreadRadius: 90,
                      color: Colors.tealAccent.withOpacity(0.5)
                  )
                ]
            ),
          ),
        ),
        Positioned(
          right: -50,
          bottom: 300,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.tealAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 100,
                      spreadRadius: 250,
                      color: Colors.purpleAccent.withOpacity(0.2)
                  ),
                  BoxShadow(
                      blurRadius: 60,
                      spreadRadius: 90,
                      color: Colors.purpleAccent.withOpacity(0.5)
                  )
                ]
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(text: "Choose Movie",color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.height * 0.025),
                ],
              ),
              SizedBox(height: size.height * 0.04,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.01), decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(size.height * 0.02),
              ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search_outlined,color: Colors.white,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.white,fontSize: size.height * 0.02),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: size.height * 0.02,color: Colors.white),
                            hintText: 'Search',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),

                        ),
                      ],
                    ),),
                    Icon(Icons.mic,color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListMovie(titleList: "Now Playing",listMovie: listMovieDemo),
                      SizedBox(height: size.height * 0.02,),
                      ListMovie(titleList: "Coming Soon",listMovie: listMovieDemo),
                      SizedBox(height: size.height * 0.02,),
                      ListMovie(titleList: "Top movies",listMovie: listMovieDemo),
                      SizedBox(height: size.height * 0.02,),
                      ListMovie(titleList: "Drama movie",listMovie: listMovieDemo),
                      SizedBox(height: size.height * 0.02,),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ],
    );
  }
}
