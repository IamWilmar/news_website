import 'package:flutter/material.dart';
import 'package:news_page/src/helpers/responsive_helpers.dart';
import 'package:news_page/src/models/article_model.dart';
import 'package:news_page/src/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result> _articles = [];
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  _fetchArticles() async {
    List<Result> articles =
        await NewsService().fetchArticlesBySection('technology');
    setState(() {
      _articles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 80.0,
          ),
          Center(
            child: Text(
              'New York Times Technology',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15.0),
          _articles.length > 0
              ? BuildArticlesGrid(
                  size: size,
                  articles: _articles,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}

class BuildArticlesGrid extends StatelessWidget {
  final size;
  final List<Result> articles;
  const BuildArticlesGrid({this.size, this.articles});
  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [];
    articles.forEach((article) {
      tiles.add(BuildArticleTile(article: article, size: size));
    });
    return Padding(
      padding: responsivePadding(size),
      child: GridView.count(
        crossAxisCount: responsiveNumGridTiles(size),
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 30.0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }
}

class BuildArticleTile extends StatelessWidget {
  final Result article;
  final size;
  const BuildArticleTile({this.article, this.size});
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () async {
          if( await  canLaunch(article.url) ){
            launch(article.url);
          }else{
            print('error');
          }
        },
        child: Column(
          children: [
            Container(
              height: responsiveImageHeight(size),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: (article.multimedia.length > 0)
                      ? NetworkImage(article.multimedia[0].url)
                      : NetworkImage('https://www.corporazioneitalianacoltellinai.com/easyUp/NoFoto.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              height: responsiveTitleHeight(size),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
