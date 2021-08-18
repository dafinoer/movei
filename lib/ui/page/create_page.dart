import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movei/model/movie.dart';
import 'package:movei/observer/create_movie/create_movie.dart';
import 'package:movei/ui/widget/textfield_widget.dart';

class CreatePage extends StatefulWidget {
  static const route = AdaptiveRoute(page: CreatePage, path: '/create');

  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late final CreateMovie _createMovieStore;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _directorController;
  late final TextEditingController _summaryController;
  late final TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _createMovieStore = CreateMovie.create();
    _titleController = TextEditingController();
    _directorController = TextEditingController();
    _summaryController = TextEditingController();
    _tagController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
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
                        _createMovieStore.title(_titleController.text);
                        _createMovieStore.director(_directorController.text);
                        _createMovieStore.summary(_summaryController.text);
                        _createMovieStore.tag(Tag.horror);
                        _createMovieStore.setMovie();

                        final movie = _createMovieStore.movieValue;
                        if (movie != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Succes')),
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
