import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triveous_assignment/help/news.dart';
import 'package:triveous_assignment/model/article_model.dart';
import 'package:triveous_assignment/model/blog_card.dart';

class BusinessNewsPage extends StatefulWidget {
  const BusinessNewsPage({Key key}) : super(key: key);

  @override
  _BusinessNewsPageState createState() => _BusinessNewsPageState();
}

class _BusinessNewsPageState extends State<BusinessNewsPage> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNewsForApp2();
  }

  getNewsForApp2() async {
    BusinessNews businessNewsClass = new BusinessNews();
    await businessNewsClass.getNews1();
    articles = businessNewsClass.businessNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int size = articles.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        title: Text('Business',
            style: GoogleFonts.nunito(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
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
                          itemCount:
                              articles.length != null ? articles.length : 0,
                          itemBuilder: (context, index) {
                            if (size == null) return Container();
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
