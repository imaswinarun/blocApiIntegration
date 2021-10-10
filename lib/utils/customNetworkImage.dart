import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  const CustomNetworkImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: FadeInImage.assetNetwork(
        fit: BoxFit.fill,
        height: 140.0,
        width: 140.0,
        placeholder: 'assets/gif/loading.gif',
        image: url,
        imageErrorBuilder: (context, exception, stacktree) {
          return Icon(
            Icons.error,
            size: 140.0,
          );
        },
      ),
    );
  }
}
