abstract class NewsRepo{
  Future getNewsHeadline();
  Future getSearchedNews(String query);
}