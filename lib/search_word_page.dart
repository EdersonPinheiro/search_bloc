import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bloc/search_bloc.dart';
import 'package:search_bloc/search_event.dart';
import 'package:search_bloc/search_state.dart';

class SearchWordPage extends StatelessWidget {
  const SearchWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seach Using Bloc'),
        centerTitle: true,
      ),
      body: Column(
        children: [_searchField(context), _words(context)],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search...',
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        onChanged: (value) {
          context.read<SearchBloc>().add(SearchWord(word: value));
        },
      ),
    );
  }

  Widget _words(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is LoadedWords) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Text(
                state.words[index],
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: 0.2,
              color: Colors.grey,
            ),
            itemCount: state.words.length,
          );
        }
        return Container();
      },
    );
  }
}
