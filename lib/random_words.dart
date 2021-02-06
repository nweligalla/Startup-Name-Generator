import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final List<WordPair> _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          );
          final divided =
              ListTile.divideTiles(tiles: tiles, context: context).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Saved suggestions"),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggetions() {
    Widget _buildRow(WordPair pair) {
      final isSaved = _saved.contains(pair);
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (isSaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      );
    }

    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Startup Name Generator",
          style: TextStyle(color: Colors.black),
        ),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: Center(
        child: _buildSuggetions(),
      ),
    );
  }
}
