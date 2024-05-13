// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleImage(
            imageRadius: 28,
            imageProvider: widget.imageProvider,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.authorName,
                style: FooderlichTheme.lightTextTheme.displayMedium,
              ),
              Text(
                widget.title,
                style: FooderlichTheme.lightTextTheme.displaySmall,
              ),
            ],
          ),
          IconButton(
            iconSize: 30,
            color: Colors.red[400],
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          ),
        ],
      ),
    );
  }
}
