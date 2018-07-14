// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:urltv_master/sections.dart';

import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';

const double kSectionIndicatorWidth = 32.0;

// The card for a single section. Displays the section's gradient and background image.
class SectionCard extends StatelessWidget {
  const SectionCard({Key key, @required this.section})
      : assert(section != null),
        super(key: key);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return new Semantics(
      label: section.title,
      button: true,
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              section.leftColor,
              section.rightColor,
            ],
          ),
        ),
        child: new Image.network(
          section.backgroundAsset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// The title is rendered with two overlapping text widgets that are vertically
// offset a little. It's supposed to look sort-of 3D.
class SectionTitle extends StatelessWidget {
  static const TextStyle sectionTitleStyle = const TextStyle(
    fontFamily: 'Raleway',
    inherit: false,
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );

  static final TextStyle sectionTitleShadowStyle = sectionTitleStyle.copyWith(
    color: const Color(0x19000000),
  );

  const SectionTitle({
    Key key,
    @required this.section,
    @required this.scale,
    @required this.opacity,
  })  : assert(section != null),
        assert(scale != null),
        assert(opacity != null && opacity >= 0.0 && opacity <= 1.0),
        super(key: key);

  final Section section;
  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      child: new Opacity(
        opacity: opacity,
        child: new Transform(
          transform: new Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                top: 4.0,
                child: new Text(section.title, style: sectionTitleShadowStyle),
              ),
              new Text(section.title, style: sectionTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Small horizontal bar that indicates the selected section.
class SectionIndicator extends StatelessWidget {
  const SectionIndicator({Key key, this.opacity = 1.0}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      child: new Container(
        width: kSectionIndicatorWidth,
        height: 3.0,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}

//Create video card from VideoItem object
class VideoCard extends StatelessWidget {
  VideoCard({Key key, @required this.videoItem, this.shape})
      : assert(videoItem != null && videoItem.isValid),
        super(key: key);

  static const double height = 393.0; //orig 366.0
  final VideoItem videoItem;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        color: new Color.fromRGBO(189, 0, 0, 0.3),
        padding: const EdgeInsets.all(2.0),
        height: height,
        child: new Card(
          color: new Color.fromRGBO(0, 0, 0, 0.5),
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
                            videoItem.videoURL),
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
                          videoItem.thumbnailURL,
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
                            videoItem.title,
                            style:
                                titleStyle.copyWith(color: Colors.white),
                          ),
                        ),
                        new Text(
                          videoItem.description,
                          style: descriptionStyle.copyWith(color: Colors.white),
                        ),
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
                      textColor: Colors.amber,
                      onPressed: () {/* do nothing */},
                    ),
                    new FlatButton(
                      child: const Text('COMMENT'),
                      textColor: Colors.amber,
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

