// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'package:flutter/material.dart';

//const Color _mariner = const Color(0xFF3B5F8F);
//const Color _mediumPurple = const Color(0xFF8266D4);

const Color _red900 = const Color(0xFFB71C1C);
const Color _amber300 = const Color(0xFFFFD54F);


class VideoItem {
  const VideoItem({
    this.title,
    this.description,
    this.videoURL,
    this.thumbnailURL,
  });
  final String title;
  final String description;
  final String videoURL;
  final String thumbnailURL;

  bool get isValid => title != null && videoURL != null && thumbnailURL != null;
}

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.leftColor,
    this.rightColor,
    this.videos,
  });

  final String title;
  final String backgroundAsset;
  final Color leftColor;
  final Color rightColor;
  final List<VideoItem> videos;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

// hard coding sample videos. Later this should be pulled from DB

const VideoItem _nome8Stream = const VideoItem(
  title: 'Nome 8',
  description: 'Houston, TX',
  videoURL:
      'https://player.vimeo.com/external/277440301.sd.mp4?s=eaaa86918f6b6a094624b0205904a835f0ae5a2d&profile_id=165', //video source
  thumbnailURL: 'https://i.ytimg.com/vi/URhtMk8qI5U/maxresdefault.jpg',
);

const VideoItem _initiationStream = const VideoItem(
  title: 'Initiation',
  description: 'Initiation VOD: Los Angeles',
  videoURL:
      'https://player.vimeo.com/external/278989034.sd.mp4?s=68ce35639b8c363a7a39d8b7042cf8ddd1471105&profile_id=165', //video source
  thumbnailURL: 'https://versetracker.com/sites/default/files/media-images/2018/06/url-announces-full-initiation-volume-1-card-feature.jpg',
);

const VideoItem _nome8trailer = const VideoItem(
  title: 'Nome 8 Trailer',
  description: 'URL presents Nome 8',
  videoURL:
      'https://player.vimeo.com/external/275730642.hd.mp4?s=665aa63212550c0bf60178d3a946901ca5d43f51&profile_id=175', //video source
  thumbnailURL: 'https://i.ytimg.com/vi/URhtMk8qI5U/maxresdefault.jpg',
);

const VideoItem _sm6trailer = const VideoItem(
  title: 'Summer Madness 6',
  description: 'SM6 Trailer',
  videoURL:
      'https://player.vimeo.com/external/277444779.hd.mp4?s=cc5fa906c3a9a8ad37012a5a851f60c6f803380b&profile_id=175', //video source
  thumbnailURL: 'https://i.ytimg.com/vi/JYwHN12dFkw/maxresdefault.jpg',
);

const VideoItem _tsusurffreestyle = const VideoItem(
  title: 'Tsu Surf Freestyle',
  description: 'Bars on I-95',
  videoURL:
      'https://player.vimeo.com/external/279460318.hd.mp4?s=64f4d2720537816fbb9fc4a3cf577144faf678f2&profile_id=174', //video source
  thumbnailURL: 'https://i.ytimg.com/vi/qPPHzir5m48/maxresdefault.jpg',
);

const VideoItem _reeddollazmvideo = const VideoItem(
  title: 'REED DOLLAZ',
  description: 'NO SMOKE (FULL MUSIC VIDEO) ',
  videoURL:
      'https://player.vimeo.com/external/279460278.hd.mp4?s=f6b91c9ddb813b654b7b526aed95545d9db78816&profile_id=174', //video source
  thumbnailURL: 'https://i.ytimg.com/vi/BFVBjjRnwWU/maxresdefault.jpg',
);

const VideoItem _hitmanholla = const VideoItem(
  title: 'HITMAN HOLLA',
  description: 'Mark (Prod. by Chase Moore) [Official Video]',
  videoURL:
      'https://player.vimeo.com/external/279460232.hd.mp4?s=aeb418accea13f829f843d40373fa161e0eff610&profile_id=174', //video source
  thumbnailURL:
      'https://vignette.wikia.nocookie.net/battlerap/images/f/fc/Hitman.jpeg/revision/latest?cb=20130214233447',
);

const VideoItem _goodz = const VideoItem(
  title: 'GOODZ',
  description: 'GOODZ IN THE HOUSE (MUSIC VIDEO)',
  videoURL:
      'https://player.vimeo.com/external/279460138.hd.mp4?s=9a0b9a44eaa3a058bde464f8982628b5978c31f6&profile_id=174', //video source
  thumbnailURL: 'https://i.ytimg.com/vi/GFCmgNEgaqg/maxresdefault.jpg',
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'HOME',
    leftColor: _amber300,
    rightColor: _red900,
    backgroundAsset:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',
    videos: const <VideoItem>[
      _initiationStream,
      _nome8Stream,
      _sm6trailer,
      _nome8trailer,
      _hitmanholla,
      _goodz,
      _reeddollazmvideo,
      _tsusurffreestyle,
    ],
  ),
  const Section(
    title: 'BATTLES',
    leftColor: _red900,
    rightColor: _amber300,
    backgroundAsset:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/hollowvsroctrans.png',
    videos: const <VideoItem>[
      _initiationStream,
      _nome8Stream,
    ],
  ),
  const Section(
    title: 'MUSIC',
    leftColor: _amber300,
    rightColor: _red900,
    backgroundAsset:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/tsusurttransparent.png',
    videos: const <VideoItem>[
      _tsusurffreestyle,
      _reeddollazmvideo,
      _goodz,
      _hitmanholla,
    ],
  ),
  const Section(
    title: 'POLLS',
    leftColor: _red900,
    rightColor: _amber300,
    backgroundAsset:
        'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urltvpolltransparent.png',
    videos: const <VideoItem>[
      _sm6trailer,
      _hitmanholla,
      _goodz,
      _reeddollazmvideo,
      _tsusurffreestyle,
    ],
  ),
];
