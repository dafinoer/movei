import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movei/model/movie.dart';
import 'package:movei/observer/edit_movie/edit_movie.dart';
import 'package:movei/ui/widget/textfield_widget.dart';

class DetailPage extends StatefulWidget {
  static const route = AdaptiveRoute(page: DetailPage, path: '/detail/:id');
  const DetailPage({Key? key, @pathParam required this.keyId}) : super(key: key);
  final String keyId;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final EditMovie _editMovieStore;
  late final TextEditingController _titleController;
  late final TextEditingController _directorController;
  late final TextEditingController _summaryController;
  late final TextEditingController _tagController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _editMovieStore = EditMovie.create();
    _editMovieStore.getMovieById(widget.keyId);

    _titleController = TextEditingController();
    _directorController = TextEditingController();
    _summaryController = TextEditingController();
    _tagController = TextEditingController();

    final movieValue = _editMovieStore.movieValue;

    if(movieValue != null){
      _titleController.text = movieValue.title;
      _directorController.text = movieValue.director;
      _summaryController.text = movieValue.summary ?? '';
      _tagController.text = movieValue.tag.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldWidget(
                  hintText: 'title',
                  controller: _titleController,
                  validator: (value) => _validationString(value)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldWidget(
                title: 'director',
                controller: _directorController,
                validator: (value) => _validationString(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldWidget(
                title: 'summary',
                controller: _summaryController,
                maxLine: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldWidget(
                controller: _tagController,
                enable: true,
                onTap: () {
                  debugPrint('lorem');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(
                builder: (context) {
                  return RaisedButton(
                    child: Text('submit'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _editMovieStore.title(_titleController.text);
                        _editMovieStore.director(_directorController.text);
                        _editMovieStore.summary(_summaryController.text);
                        _editMovieStore.tag(Tag.horror);
                        _editMovieStore.updateUser();

                        final movie = _editMovieStore.movieValue;
                        if (movie != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Update Succes')),
                          );
                        }
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validationString(String? value) {
    final _value = value;
    if (_value != null && _value.isEmpty) {
      return 'Must Fill';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _directorController.dispose();
    _summaryController.dispose();
    _tagController.dispose();
    super.dispose();
  }
}
