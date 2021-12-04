import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triveous_assignment/help/news.dart';
import 'package:triveous_assignment/model/article_model.dart';
import 'package:triveous_assignment/model/blog_card.dart';

class ScienceNewsPage extends StatefulWidget {
  const ScienceNewsPage({Key key}) : super(key: key);

  @override
  _ScienceNewsPageState createState() => _ScienceNewsPageState();
}

class _ScienceNewsPageState extends State<ScienceNewsPage> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNewsForApp();
  }

  getNewsForApp() async {
    ScienceNews healthNewsClass = new ScienceNews();
    await healthNewsClass.getNews();
    articles = healthNewsClass.scienceNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        title: Text('Science',
            style: GoogleFonts.nunito(
              color: Colors.greenAccent,
            )),
        centerTitle: true,
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
