import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl, categoryName;
  final Widget nav;

  const CategoryCard({Key key, this.imageUrl, this.categoryName, this.nav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => nav));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).secondaryHeaderColor.withAlpha(500),
                blurRadius: 5,
              )
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(categoryName,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
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
