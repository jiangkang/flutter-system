// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
//
// class GifImage extends StatefulWidget {
//   const GifImage({Key? key}) : super(key: key);
//
//   @override
//   _GifImageState createState() => _GifImageState();
// }
//
// class _GifImageState extends State<GifImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class GifImageProvider extends ImageProvider<GifImageProvider> {
//   @override
//   ImageStreamCompleter load(GifImageProvider key, DecoderCallback decode) {
//     final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();
//     return MultiFrameImageStreamCompleter(
//       codec: _loadAsync(key as NetworkImage, chunkEvents, decode),
//       chunkEvents: chunkEvents.stream,
//       scale: 1.0,
//     );
//   }
//
//   @override
//   Future<GifImageProvider> obtainKey(ImageConfiguration configuration) {
//     return SynchronousFuture(this);
//   }
//
//   Future<ui.Codec> _loadAsync(
//       NetworkImage key,
//       StreamController<ImageChunkEvent> chunkEvents,
//       DecoderCallback decode,
//       ) async {
//     try {
//       assert(key == this);
//
//       final Uri resolved = Uri.base.resolve(key.url);
//
//       final HttpClientRequest request = await _httpClient.getUrl(resolved);
//
//       headers?.forEach((String name, String value) {
//         request.headers.add(name, value);
//       });
//       final HttpClientResponse response = await request.close();
//       if (response.statusCode != HttpStatus.ok) {
//         // The network may be only temporarily unavailable, or the file will be
//         // added on the server later. Avoid having future calls to resolve
//         // fail to check the network again.
//         await response.drain<List<int>>(<int>[]);
//         throw image_provider.NetworkImageLoadException(statusCode: response.statusCode, uri: resolved);
//       }
//
//       final Uint8List bytes = await consolidateHttpClientResponseBytes(
//         response,
//         onBytesReceived: (int cumulative, int? total) {
//           chunkEvents.add(ImageChunkEvent(
//             cumulativeBytesLoaded: cumulative,
//             expectedTotalBytes: total,
//           ));
//         },
//       );
//       if (bytes.lengthInBytes == 0)
//         throw Exception('NetworkImage is an empty file: $resolved');
//
//       return decode(bytes);
//     } catch (e) {
//       // Depending on where the exception was thrown, the image cache may not
//       // have had a chance to track the key in the cache at all.
//       // Schedule a microtask to give the cache a chance to add the key.
//       scheduleMicrotask(() {
//         PaintingBinding.instance!.imageCache!.evict(key);
//       });
//       rethrow;
//     } finally {
//       chunkEvents.close();
//     }
//   }
//
// }
