// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class TravelDestination {
  const TravelDestination({
    this.assetName,
    this.assetPackage,
    this.imageURL,
    this.title,
    this.description,
  });

  final String assetName;
  final String assetPackage;
  final String imageURL;
  final String title;
  final List<String> description;

  bool get isValid =>
      imageURL != null && title != null; //&& description?.length == 3
}

final List<TravelDestination> destinations = <TravelDestination>[
  const TravelDestination(
    assetName: 'top_10_australian_beaches.jpg',
    assetPackage: 'pafafsa',
    imageURL:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/hollowvsroctrans.png',
    title: 'My Top 10 Australian beaches',
    description: const <String>[
      'Number 10',
      'Whitehaven Beach',
      'Whitsunday Island, Whitsunday Islands',
    ],
  ),
  const TravelDestination(
    assetName: 'kangaroo_valley_safari.jpg',
    assetPackage: 'faslfajfd',
    imageURL:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',
    title: 'My Kangaroo Valley Safari',
    description: const <String>[
      '2031 Moss Vale Road',
      'Kangaroo Valley 2577',
      'New South Wales',
    ],
  ),
  const TravelDestination(
    assetName: 'kangaroo_valley_safari.jpg',
    assetPackage: 'faslfajfd',
    imageURL:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',
    title: 'My Kangaroo Valley Safari',
    description: const <String>[
      '2031 Moss Vale Road',
      'Kangaroo Valley 2577',
      'New South Wales',
    ],
  ),
  const TravelDestination(
    assetName: 'klast item',
    assetPackage: 'does it show?',
    imageURL:
    'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',
    title: 'Please Show',
    description: const <String>[
      '2031 Moss Vale Road',
      'Kangaroo Valley 2577',
      'New South Wales',
    ],
  )
];

class TravelDestinationItem extends StatelessWidget {
  TravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null && destination.isValid),
        super(key: key);

  static const double height = 384.0; //orig 366.0
  final TravelDestination destination;
  final ShapeBorder shape;

  /*Widget _buildInlineVideo() {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: new Center(
        child: new AspectRatio(
          aspectRatio: 3 / 2,
          child: new Hero(
            tag: controller,
            child: new VideoPlayerLoading(controller),
          ),
        ),
      ),
    );
  }*/

  Widget _buildFullScreenVideo() {
    return new Center(
      child: new AspectRatio(
        aspectRatio: 3 / 2,
        child: new Chewie(
          new VideoPlayerController.network(
              'https://player.vimeo.com/external/278989034.m3u8?s=ad83d55a3b316cbfa81f45be8fc3c69023e1387b'),
          aspectRatio: 3 / 2,
          autoPlay: false,
          looping: false,

          materialProgressColors: new ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.red,
            backgroundColor: Colors.red,
            bufferedColor: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.black);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(2.0),
        height: height,
        child: new Card(
          shape: shape,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 250.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Chewie(
                        new VideoPlayerController.network(
                            'https://player.vimeo.com/external/278989034.m3u8?s=ad83d55a3b316cbfa81f45be8fc3c69023e1387b'),
                        aspectRatio: 3 / 2,
                        autoPlay: false,
                        looping: false,
                        materialProgressColors: new ChewieProgressColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amber,
                          backgroundColor: Colors.red,
                          bufferedColor: Colors.grey,
                        ),
                        placeholder: new Image.network(
                          'https://i.ytimg.com/vi/4tgZJDpo1L8/maxresdefault.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            destination.title,
                            style: descriptionStyle.copyWith(
                                color: Colors.black54),
                          ),
                        ),
                        new Text(destination.description[1]),
                        //new Text(destination.description[2]),
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('SHARE'),
                      textColor: Colors.red,
                      onPressed: () {/* do nothing */},
                    ),
                    new FlatButton(
                      child: const Text('COMMENT'),
                      textColor: Colors.red,
                      onPressed: () {/* do nothing */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardsDemo extends StatefulWidget {
  static const String routeName = '/material/cards';

  @override
  _CardsDemoState createState() => new _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {
  ShapeBorder _shape = RoundedRectangleBorder(
    borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(16.0),
      topRight: const Radius.circular(16.0),
      bottomLeft: const Radius.circular(2.0),
      bottomRight: const Radius.circular(2.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      super.dispose();
    }

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Travel stream'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.sentiment_very_satisfied),
              onPressed: () {
                setState(() {
                  _shape = _shape != null
                      ? null
                      : const RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(16.0),
                            topRight: const Radius.circular(16.0),
                            bottomLeft: const Radius.circular(2.0),
                            bottomRight: const Radius.circular(2.0),
                          ),
                        );
                });
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemExtent: TravelDestinationItem.height,
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            itemBuilder: (context, int){
              return new Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: new TravelDestinationItem(
                  destination: destinations[int],
                  shape: _shape,
                ),
              );
            }));
  }
}

