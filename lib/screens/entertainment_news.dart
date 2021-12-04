import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triveous_assignment/help/news.dart';
import 'package:triveous_assignment/model/article_model.dart';
import 'package:triveous_assignment/model/blog_card.dart';

class EntertainmentNewsPage extends StatefulWidget {
  const EntertainmentNewsPage({Key key}) : super(key: key);

  @override
  _EntertainmentNewsPageState createState() => _EntertainmentNewsPageState();
}

class _EntertainmentNewsPageState extends State<EntertainmentNewsPage> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNewsForApp();
  }

  getNewsForApp() async {
    EntertainmentNews EntertainmentNewsClass = new EntertainmentNews();
    await EntertainmentNewsClass.getNews();
    articles = EntertainmentNewsClass.entertainmentNews;
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
        title: Text('Entertainment',
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
