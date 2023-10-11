import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageMultipleSource extends StatefulWidget {
  final String imageUrl;
  final Size? size;
  const ImageMultipleSource({super.key, required this.imageUrl, this.size});

  @override
  State<ImageMultipleSource> createState() => _ImageMultipleSourceState();
}

class _ImageMultipleSourceState extends State<ImageMultipleSource> {
  var hasLocalAsset = false;

  @override
  void initState() {
    super.initState();
    checkResource();
  }

  void checkResource() async {
    try {
      await rootBundle.load(widget.imageUrl);
      hasLocalAsset = true;
    } catch (e) {
      print("checkResource = $e"); // Catches all types of `Exception` and `Error`.
      hasLocalAsset = false;
    }

    setState(() {
      hasLocalAsset = hasLocalAsset;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ImageMultipleSource ${widget.imageUrl}");

    if (widget.imageUrl.contains("http")) {
      if (widget.size != null) {
        return Image.network(
          widget.imageUrl,
          width: widget.size?.width ?? 0,
          height: widget.size?.height ?? 0,
          fit: BoxFit.fill,
        );
      } else {
        return Image.network(widget.imageUrl);
      }
    }

    if (hasLocalAsset) {
      if (widget.size != null) {
        return Image.asset(
          widget.imageUrl,
          width: widget.size?.width ?? 0,
          height: widget.size?.height ?? 0,
          fit: BoxFit.fill,
        );
      } else {
        return Image.asset(widget.imageUrl);
      }
    }
    if (widget.size != null) {
      return Image.asset(
        "images/placeholder.jpeg",
        width: widget.size?.width ?? 0,
        height: widget.size?.height ?? 0,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset("images/placeholder.jpeg");
    }
  }
}
