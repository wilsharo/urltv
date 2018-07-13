// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const Color _mariner = const Color(0xFF3B5F8F);
const Color _mediumPurple = const Color(0xFF8266D4);
const Color _tomato = const Color(0xFFF95B57);
const Color _mySin = const Color(0xFFF3A646);

const Color _red900 = const Color(0xFFB71C1C);
const Color _black = const Color(0xFF000000);
const Color _white70 = const Color(0xB3FFFFFF);
const Color _amber300 = const Color(0xFFFFD54F);

//const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
const String _kGalleryAssetsPackage = 'images';


class SectionDetail {
  const SectionDetail({
    this.title,
    this.subtitle,
    this.imageAsset,
    this.imageAssetPackage,
    this.imageURL,
  });
  final String title;
  final String subtitle;
  final String imageAsset;
  final String imageAssetPackage;
  final String imageURL;
}

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.backgroundAssetPackage,
    this.leftColor,
    this.rightColor,
    this.details,
    this.imageURL,
  });

  final String title;
  final String backgroundAsset;
  final String backgroundAssetPackage;
  final Color leftColor;
  final Color rightColor;
  final List<SectionDetail> details;
  final String imageURL;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

// TODO(hansmuller): replace the SectionDetail images and text. Get rid of
// the const vars like _eyeglassesDetail and insert a variety of titles and
// image SectionDetails in the allSections list.

const SectionDetail _eyeglassesDetail = const SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Flutter product sunnies animation',
  subtitle: '3K views - 5 days',
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png', //image source
);

const SectionDetail _eyeglassesImageDetail = const SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
);

const SectionDetail _seatingDetail = const SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'products table animation',
  subtitle: '3K views - 5 days',
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
);

const SectionDetail _seatingImageDetail = const SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png', //image source
);

const SectionDetail _decorationDetail = const SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Product earrings animation',
  subtitle: '3K views - 5 days',
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
);

const SectionDetail _decorationImageDetail = const SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
);

const SectionDetail _protectionDetail = const SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Flutter product hat interactive animation',
  subtitle: '3K views - 5 days',
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
);

const SectionDetail _protectionImageDetail = const SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'HOME',
    leftColor: _amber300,
    rightColor: _red900,
    backgroundAsset: '2.0x/urllogo.jpeg',
    backgroundAssetPackage: 'assets',
    details: const <SectionDetail>[
      _eyeglassesDetail,
      _eyeglassesImageDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
    ],
    imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urllogotransparent.png',//image source
  ),
  const Section(
    title: 'BATTLES',
    leftColor: _red900,
    rightColor: _amber300,
    backgroundAsset: '2.0x/hollowvsroc.jpeg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: const <SectionDetail>[
      _seatingDetail,
      _seatingImageDetail,
      _seatingDetail,
      _seatingDetail,
      _seatingDetail,
      _seatingDetail,
    ],
    imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/hollowvsroctrans.png', //image source
  ),
  const Section(
    title: 'MUSIC',
    leftColor: _amber300,
    rightColor: _red900,
    backgroundAsset: '2.0x/tsusurf.jpg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: const <SectionDetail>[
      _decorationDetail,
      _decorationImageDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
    ],
    imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/tsusurttransparent.png', //image source
  ),
  const Section(
    title: 'POLLS',
    leftColor: _red900,
    rightColor: _amber300,
    backgroundAsset: '2.0x/urltvpoll.jpeg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: const <SectionDetail>[
      _eyeglassesDetail,
      _eyeglassesImageDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _protectionDetail,
      _protectionImageDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
    ],
    imageURL: 'https://raw.githubusercontent.com/wilsharo/Fluttery-Filmy/master/urltvpolltransparent.png', //image source
  ),
];
