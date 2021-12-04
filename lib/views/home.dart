import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:triveous_assignment/configs/app_themes/themes.dart';
import 'package:triveous_assignment/help/data.dart';
import 'package:triveous_assignment/help/news.dart';
import 'package:triveous_assignment/model/article_model.dart';
import 'package:triveous_assignment/model/blog_card.dart';
import 'package:triveous_assignment/model/category_card.dart';
import 'package:triveous_assignment/model/category_model.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNewsForApp();
  }

  getNewsForApp() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  bool light;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    themeProvider.isDarkMode ? light = false : light = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News ',
                style: GoogleFonts.nunito(
                  color: Theme.of(context).secondaryHeaderColor,
                )),
            Text('Daily',
                style: GoogleFonts.nunito(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: light,
            activeColor: Colors.greenAccent,
            inactiveTrackColor: Colors.greenAccent.shade400,
            onChanged: (value) {
              setState(() {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(light);
                light = !light;
              });
            },
          ),
        ],
      ),
      body: _loading
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.greenAccent,
              )),
            )
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                categoryName: categories[index].categoryName,
                                imageUrl: categories[index].imageUrl,
                                nav: categories[index].nav,
                              );
                            }),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogCard(
                                title: articles[index].title,
                                description: articles[index].description,
                                imageUrl: articles[index].urlToImage,
                                url: articles[index].url);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
