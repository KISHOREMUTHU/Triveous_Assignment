import 'package:triveous_assignment/model/category_model.dart';
import 'package:triveous_assignment/screens/business_news.dart';
import 'package:triveous_assignment/screens/entertainment_news.dart';
import 'package:triveous_assignment/screens/health_news.dart';
import 'package:triveous_assignment/screens/science_news.dart';
import 'package:triveous_assignment/screens/sports_news.dart';
import 'package:triveous_assignment/screens/technology_news.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'assets/business.jpg';
  categoryModel.nav = BusinessNewsPage();
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl = 'assets/entertainment.jpg';
  categoryModel.nav = EntertainmentNewsPage();
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl = 'assets/health.jpg';
  categoryModel.nav = HealthNewsPage();
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl = 'assets/science.jpg';
  categoryModel.nav = ScienceNewsPage();
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl = 'assets/sports.jpg';
  categoryModel.nav = SportsNewsPage();
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl = 'assets/technology.jpg';
  categoryModel.nav = TechnologyNewsPage();
  category.add(categoryModel);

  return category;
}
