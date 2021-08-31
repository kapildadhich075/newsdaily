import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsdaily/Components/BlogTile.dart';
import 'package:newsdaily/Components/Button.dart';
import 'package:newsdaily/Components/CategoryTile.dart';
import 'package:newsdaily/Components/data.dart';
import 'package:newsdaily/Components/news.dart';
import 'package:newsdaily/Modals/ArticleModel.dart';
import 'package:newsdaily/Modals/Category_modal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsdaily/Screens/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  static String page = 'NewsScreen_page';
  NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<CategoryNews> categories = <CategoryNews>[];
  List<ArticleModel> newsarticle = <ArticleModel>[];
  bool _loading = true;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
    getCurrentUser();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    newsarticle = news.news;
    setState(() {
      _loading = false;
    });
  }

  Future getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _LogOut(BuildContext context) async {
    await _auth.signOut().then((_) {
      Navigator.pushNamed(context, LoginScreen.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.top),
                    child: Container(
                      color: Color(0xff757575),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'PROFILE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffFFD204),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '${loggedInUser!.email}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Button(
                                buttonName: 'Log-Out',
                                onPressed: () async {
                                  SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  preferences.remove('email');
                                  _LogOut(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.idBadge,
              color: Colors.black,
            ),
          ),
        ],
        title: Row(
          children: [
            Text(
              "News",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 30.0,
              ),
            ),
            Text(
              "Daily",
              style: TextStyle(
                color: Color(0xffFFD204),
                fontWeight: FontWeight.w600,
                fontSize: 30.0,
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //Categories
                    Container(
                      height: 80.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    //NewsBlogs
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: newsarticle.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: newsarticle[index].urlToImage,
                              title: newsarticle[index].title,
                              desc: newsarticle[index].description,
                              url: newsarticle[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
