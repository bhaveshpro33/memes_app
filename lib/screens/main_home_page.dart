import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes_app/models/meme_model.dart';
import 'package:memes_app/services/meme_service.dart';
import 'package:memes_app/widgets/meme_card.dart';

class MemesHomePage extends StatefulWidget {
  const MemesHomePage({super.key});

  @override
  State<MemesHomePage> createState() => _MemesHomePageState();
}

class _MemesHomePageState extends State<MemesHomePage> {
  List<Memes> memes = [];
  bool isLoading = true;
  Color backgroundColor = Colors.deepPurple;
  void onColorExtracted(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchmemes();
  }
  Future<void> fetchmemes() async{
    final fetchMemes=await MemeService.fetchmemes(context);
    setState(() {
      memes+=fetchMemes!;
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor.withOpacity(0.6),
        title: Text(
          "Vibeit",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundColor.withOpacity(0.8),backgroundColor.withOpacity(0.4)],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : memes.isEmpty
            ? Center(child: Text("No memes Found"))
            : ListView.builder(
                itemCount: memes.length,
                itemBuilder: (context, index) {
                  final meme = memes[index];
                  if(index==memes.length-1){
                    fetchmemes();
                  }
                  return MemeCard(
                    title: meme.title,
                    imageUrl: meme.url,
                    postLink: meme.postLink,
                    ups: meme.ups,
                    onColorExtracted: onColorExtracted,
                  );
                },
              ),
      ),
    );
  }
}
