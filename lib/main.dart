import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movei/component/route.gr.dart';
import 'package:movei/observer/movie_list/movie_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _movieRouter = MovieRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: _movieRouter.delegate(),
      routeInformationParser: _movieRouter.defaultRouteParser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const route =
      AdaptiveRoute(page: MyHomePage, path: '/', initial: true);
  MyHomePage({Key? key}) : super(key: key);

  final String title = 'Home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final MovieList movieListStore;

  @override
  void initState() {
    super.initState();
    movieListStore = MovieList.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: movieListStore.movies.length,
          itemBuilder: (context, index) {
            final summary = movieListStore.movies[index].summary;
            return ListTile(
              title: Text(movieListStore.movies[index].title),
              subtitle: summary != null
                  ? Text(
                      summary,
                      maxLines: 3,
                    )
                  : const SizedBox.shrink(),
              onTap: () {
                AutoRouter.of(context).push(DetailPageRoute(keyId: movieListStore.movies[index].id));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(CreatePageRoute());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    movieListStore.close();
    super.dispose();
  }
}
