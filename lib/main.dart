import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.black87,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.black87,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              left: 8,
                              bottom: 8,
                              right: 20,
                            ),
                            child: Icon(
                              Icons.send,
                              color: Colors.black87,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                StoryWidget("assets/images/avatar1.png",
                                    "beyzanur_pursa"),
                                StoryWidget("assets/images/avatar2.png",
                                    "ahmet_akyildiz"),
                                StoryWidget(
                                    "assets/images/avatar3.png", "yunus.dara"),
                                StoryWidget("assets/images/avatar4.jpg",
                                    "selim|emre|kus"),
                                StoryWidget(
                                    "assets/images/avatar5.jpg", "sinemisik"),
                                StoryWidget(
                                    "assets/images/avatar6.jpg", "esra_bal"),
                              ],
                            )),
                        PostItem("assets/images/avatar1.png", "beyzanur_pursa",
                            "assets/images/post1.jpg", "İstanbul"),
                        PostItem("assets/images/avatar2.png", "ahmet_akyildiz",
                            "assets/images/post2.jpg", ""),
                        PostItem("assets/images/avatar3.png", "yunus_dara",
                            "assets/images/post3.jpg", "Italy"),
                        PostItem("assets/images/avatar4.jpg", "selim|emre|kus",
                            "assets/images/post4.jpg", "Norveç"),
                        PostItem("assets/images/avatar5.jpg", "sinemisik",
                            "assets/images/post5.jpg", "Rize"),
                        PostItem("assets/images/avatar6.jpg", "esra_bal",
                            "assets/images/post6.jpg", "New York"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.home, size: 28, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child:
                          Icon(Icons.search, size: 28, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.smart_display,
                          size: 28, color: Colors.black87),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.favorite,
                            size: 28, color: Colors.black87)),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.person,
                            size: 28, color: Colors.black87)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container PostItem(
          String avatar, String name, String photo, String location) =>
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(avatar),
                              radius: 20,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  location,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
              Image.asset(photo),
              PostIcons(),
              Comment("ahmet_akyildiz",
                  "Çok güzel bir fotoğraf olmuşş. Ellerine sağlık :)"),
              Comment("sinemisik", "Mükemmel <3"),
              Comment("esra_bal", "Süpersin canımm :*")
            ],
          ),
        ),
      );
}

Padding PostIcons() {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black87,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.mode_comment_outlined,
              color: Colors.black87,
            ),
          ],
        ),
        Icon(
          Icons.bookmark_outline,
          color: Colors.black87,
        ),
      ],
    ),
  );
}

Padding Comment(String name, String comment) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            maxLines: 3,
            text: TextSpan(children: [
              TextSpan(
                text: name,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              TextSpan(text: " "),
              TextSpan(
                text: comment,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              )
            ]),
          ),
        ),
      ],
    ),
  );
}

Widget StoryWidget(String avatar, String name) {
  return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromRGBO(214, 71, 103, 1),
                const Color.fromRGBO(241, 166, 117, 1),
              ]),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 32,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ));
}
