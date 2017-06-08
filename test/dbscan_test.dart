// Copyright (c) 2017, erikrahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:dbscan/dbscan.dart';
import 'package:test/test.dart';

void main() {
  group('Success Cases', () {
    List<Point<double>> cluster = [
      new Point<double>(0.0, 0.0),
      new Point<double>(0.0, 0.5),
      new Point<double>(0.5, 0.0),
    ];

    List<Point<double>> noise = [
      new Point<double>(1.0, 1.0),
    ];

    List<Point<double>> dataset;

    DBSCAN<Point<double>> pointClusterer;

    setUp(() {
      dataset = [];
      dataset.addAll(cluster);
      dataset.addAll(noise);
      print(dataset);
      pointClusterer = new DBSCAN(dataset, .55, 2, (Point<double> pointA, Point<double> pointB) {
        return sqrt(pow(pointA.x - pointB.x, 2) + pow(pointA.y - pointB.y, 2));
      });
    });

    test('Clusters contain the cluster', () {
      print(pointClusterer.clusters);
      expect(pointClusterer.clusters, allOf([
        isList,
        equals([cluster]),
      ]));
    });

    test('Noise contains the noise', () {
      print(pointClusterer.noise);
      expect(pointClusterer.noise, allOf([
        isList,
        equals(noise),
      ]));
    });
  });
}
