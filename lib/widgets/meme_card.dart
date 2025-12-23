import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:url_launcher/url_launcher.dart';

class MemeCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String postLink;
  final int ups;
  final Function(Color) onColorExtracted;

  const MemeCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.postLink,
    required this.ups,
    required this.onColorExtracted,
  });

  @override
  State<MemeCard> createState() => _MemeCardState();
}

class _MemeCardState extends State<MemeCard> {
  Color backgroundColor = Colors.white;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    extractColor();
  }

  String getFullRedditUrl(String url) {
    if (url.contains("redd.it")) {
      return "https://www.reddit.com" + Uri.parse(url).path;
    }
    return url;
  }

  Future<void> extractColor() async {
    final palletteGenerator = await PaletteGeneratorMaster.fromImageProvider(
      CachedNetworkImageProvider(widget.imageUrl),
    );
    setState(() {
      backgroundColor = palletteGenerator.darkMutedColor?.color ?? Colors.white;
    });
    widget.onColorExtracted(backgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor.withOpacity(0.8),
              backgroundColor.withOpacity(0.4),
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 8),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Icon(Icons.thumb_up, size: 22, color: Colors.green),
                      Text(
                        "Ups : ${widget.ups}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: backgroundColor != Colors.green
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        final Uri uri = Uri.parse(widget.postLink);



                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppWebView,
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Unable to open Reddit post")),
                        );
                      }
                    },
                    child: Text(
                      "View Post",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
