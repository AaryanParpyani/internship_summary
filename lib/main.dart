import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    List<News> newsList = [
      News(
        imgurl: 'https://plus.unsplash.com/premium_photo-1661775045365-7240b4aaf48e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
        newsHead: 'Swedish Economy Contracts in April, Defying Expectations',
        newsDes: 'The Swedish economy contracted by 0.1 percent in April compared to the previous month, contrary to analysts forecast of 0.3 percent growth. On a yearly basis, the economy shrank by 0.1 percent. Household consumption saw a 1.2 percent increase in April, driven by the transport and retail trade sectors. However, retail, particularly food and beverages, experienced a 6.1 percent decline. Order intake in the industry also decreased slightly compared to the previous year.',
        newsUrl: 'https://www.dn.se/sverige/',
      ),
      News(
        imgurl: 'https://static.inshorts.com/inshorts/images/v1/variants/jpg/m/2023/06_jun/6_tue/img_1686037693068_838.jpg',
        newsHead: 'Engineer suspended, company gets notice over Bihar bridge collapse',
        newsDes: "Nitish Kumar-led Bihar government served notice to construction company SP Singla Construction Pvt Ltd, while an Executive Engineer of the Road Construction Department has been suspended after an under-construction bridge collapsed in Bihar's Bhagalpur on Sunday. Earlier, Bihar CM had said that he will take strict action against the construction company as the bridge keeps falling again and again.",
        newsUrl: 'https://www.siasat.com/bihar-govt-notice-to-construction-company-over-bridge-collapse-engineer-suspended-2607744/?utm_campaign=fullarticle&utm_medium=referral&utm_source=inshorts ',
      ),
      News(
        imgurl: 'https://static.inshorts.com/inshorts/images/v1/variants/jpg/m/2023/06_jun/6_tue/img_1686038867901_509.jpg',
        newsHead: "Posters threatening Muslim traders seen in U'khand city, probe on",
        newsDes: "A probe is underway after posters threatening Muslim traders were put up in Uttarakhand's Uttarkashi, police said. This comes amid tensions over the alleged abduction attempt of a minor girl by two men. Love jihadists are informed that they should vacate...shops prior to...mahapanchayat on June 15. If they don't, then it (consequences) will depend on time, the posters read.",
        newsUrl: 'https://www.hindustantimes.com/india-news/posters-asking-muslim-traders-to-leave-surface-in-uttarakhand-101685991761377-amp.html?utm_campaign=fullarticle&utm_medium=referral&utm_source=inshorts ',
      ),
      News(
        imgurl: 'https://static.inshorts.com/inshorts/images/v1/variants/jpg/m/2023/06_jun/6_tue/img_1686037856110_652.jpg',
        newsHead: 'Water will reach critical levels in 5 hours: Ukraine after dam blown up by Russia',
        newsDes: "After Ukraine alleged that Russia blew up the Kakhovka dam in Kherson, regional governor Oleksandr Prokudin said that the water will reach critical levels in the next five hours. The dam supplies water to Ukraine's Crimean peninsula, which was annexed by Russia in 2014, and to the Zaporizhzhia nuclear plant, which is also under Russian control.",
        newsUrl: 'https://www.hindustantimes.com/world-news/russia-ukraine-war-news-major-dam-on-dnipro-river-blown-up-kakhovska-hydro-power-plant-flood-threat-101686030178240-amp.html?utm_campaign=fullarticle&utm_medium=referral&utm_source=inshorts ',
      ),
      News(
        imgurl: 'https://static.inshorts.com/inshorts/images/v1/variants/jpg/m/2023/06_jun/6_tue/img_1686034703360_785.jpg',
        newsHead: 'Toy train derails in Maharashtra, all passengers safe',
        newsDes: "A toy train heading from Maharashtra's Matheran hill station to Neral got derailed near Jumma Patti station on Saturday evening, but no passenger suffered injury in the incident, railway officials said on Tuesday. The incident happened when one of the wheels of train's engine derailed, officials added. The toy train, which is over 100 years old, had 90-95 passengers onboard.",
        newsUrl: 'https://www.latestly.com/agency-news/india-news-maha-matheran-toy-train-derails-passengers-safe-5180971.html/amp?utm_campaign=fullarticle&utm_medium=referral&utm_source=inshorts ',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summary",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.77,
        child: AppinioSwiper(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          cardsCount: newsList.length,
          onSwiping: (AppinioSwiperDirection direction) {
            print(direction.toString());
          },
          cardsBuilder: (BuildContext context, int index) {
            return NewsContainer(
              imgurl: newsList[index].imgurl,
              newsHead: newsList[index].newsHead,
              newsDes: newsList[index].newsDes,
              newsUrl: newsList[index].newsUrl,
            );
          },
        ),
      ),
    );
  }
}

class News {
  final String imgurl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;

  News({
    required this.imgurl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
  });
}

class NewsContainer extends StatelessWidget {
  final String imgurl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;

  NewsContainer({
    required this.imgurl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              imgurl,
              height: 265,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsHead,
                  style: TextStyle(
                    fontSize: 22.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Going To $newsUrl");
                      // TODO: Implement redirection to the news URL
                    },
                    child: Text("Read More"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






//below is the code to revert back to previous version
// import 'package:flutter/material.dart';
// import 'package:appinio_swiper/appinio_swiper.dart';
// import 'package:flutter/cupertino.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Summary",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.77,
//             child: AppinioSwiper(
//               cardsCount: 100,
//               padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//               controller: AppinioSwiperController(),
//               onSwiping: (AppinioSwiperDirection direction) {
//                 print(direction.toString());
//               },
//               cardsBuilder: (BuildContext context, int index) {
//                 double opacity = 1.0;
//                 if(index == 1){
//                   opacity = 0.8;
//                 } else if (index == 2){
//                   opacity = 0.6;
//                 }
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Container(
//                   alignment: Alignment.center,
//                   child: Text(index.toString()),
//                   color: CupertinoColors.white,
//                   ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








//the code below is the simple first autogenerated code
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text("Summary", style: TextStyle(color: Colors.black), ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//         ),
//       ),
//     );
//   }
// }