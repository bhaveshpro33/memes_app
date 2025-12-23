import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes_app/models/meme_model.dart';
import 'package:http/http.dart' as http;

class MemeService {
  static Future<List<Memes>?>  fetchmemes(BuildContext context) async {
    final Uri url = Uri.parse("https://meme-api.com/gimme/50");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final memes = (data['memes'] as List)
            .map((meme) => Memes.fromJson(meme))
            .toList();
        return memes;
      }
      else{
        throw Exception("failed to load message");
      }
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error to load meme :$e"))

      );
      return null;
    }
  }
}
