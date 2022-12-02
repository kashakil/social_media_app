import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';
import 'package:social_media_app/widgets/following_users.dart';
import 'package:social_media_app/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'FRENZY',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 10.0),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0,
          ),
          tabs: [
            Tab(text: 'Latest'),
            Tab(text: 'Trending'),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: Text(
                  'Following',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Container(
                height: 80.0,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    User user = users[index];
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 60.0,
                          width: 60.0,
                          image: AssetImage(user.profileImageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}















// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late PageController _pageController;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'FRENZY',
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 10.0,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         // brightness: Brightness.light,
//         systemOverlayStyle: SystemUiOverlayStyle.light,
//         iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
//         bottom: TabBar(
//           controller: _tabController,
//           indicatorWeight: 3.0,
//           labelColor: Theme.of(context).primaryColor,
//           labelStyle: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w600,
//           ),
//           unselectedLabelStyle: TextStyle(fontSize: 18.0),
//           tabs: [
//             Tab(text: 'Trending'),
//             Tab(text: 'Latest'),
//           ],
//         ),
//       ),
//       drawer: CustomDrawer(),
//       body: ListView(
//         children: [
//           FollowingUsers(),
//           PostsCarousel(
//             pageController: _pageController,
//             title: 'Posts',
//             posts: posts,
//           ),
//         ],
//       ),
//     );
//   }
// }
