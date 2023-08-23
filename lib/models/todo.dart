// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String title;
  final String description;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
