abstract class SearchState {}

class InitialState extends SearchState {}

class Loadinge extends SearchState {}

class LoadedWords extends SearchState {
  final List<String> words;

  LoadedWords({required this.words});
}
