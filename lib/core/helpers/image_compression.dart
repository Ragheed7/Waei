import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

Future<String> compressAndEncodeImage(File file) async {
  try {
    // Read image from file
    final bytes = await file.readAsBytes();
    img.Image? image = img.decodeImage(bytes);
    if (image == null) return '';

    // Resize the image to a width of 800px while maintaining aspect ratio
    img.Image resized = img.copyResize(image, width: 800);

    // Compress the image to 70% quality
    Uint8List compressed = Uint8List.fromList(img.encodeJpg(resized, quality: 70));

    // Encode the compressed image to Base64
    return base64Encode(compressed);
  } catch (e) {
    // Handle any errors during compression
    print('Error compressing image: $e');
    return '';
  }
}