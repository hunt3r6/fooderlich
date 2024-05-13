import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _controller;

  void _scrollListner() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      log('i am at the bottom!');
    }

    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      log('i am at the top!');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListner);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                recipes: recipes,
              ),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
