import 'package:newsdaily/Modals/Category_modal.dart';

List<CategoryNews> getCategories() {
  List<CategoryNews> category = <CategoryNews>[];
  CategoryNews categoryNews;

  //1
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "business";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  category.add(categoryNews);

  //2
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "entertainment";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryNews);

  //3
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "general";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoryNews);

  //4
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "health";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoryNews);

  //5
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "science";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categoryNews);

  //6
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "sports";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryNews);

  //7
  categoryNews = new CategoryNews();
  categoryNews.categoryName = "technology";
  categoryNews.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryNews);

  return category;
}
