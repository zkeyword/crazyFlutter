import 'package:flutter/material.dart';
import 'package:crazy/widget/skeleton/skeleton.dart';
import 'package:crazy/widget/skeleton/article.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SkeletonList(
      builder: (context, index) => ArticleSkeletonItem(),
    );
  }
}
