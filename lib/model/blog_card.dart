import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triveous_assignment/views/article_view.dart';

class BlogCard extends StatelessWidget {
  final String imageUrl, title, description, url;

  const BlogCard(
      {Key key, this.imageUrl, this.title, this.description, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _validURL = imageUrl != null ? Uri.parse(imageUrl).isAbsolute : false;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      articleUrl: url,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).secondaryHeaderColor.withAlpha(400),
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            children: [
              imageUrl != null && _validURL
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(imageUrl: imageUrl)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Image.asset('assets/news.jpg')),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: GoogleFonts.nunito(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description != null ? description : title,
                  style: GoogleFonts.nunito(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
