// Copyright (c) 2017, erikrahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:dbscan/dbscan.dart';

main() {
  List<Point<double>> _dataset = [
    new Point(1.0, 3.0),
    new Point(0.0, 0.0),
    new Point(2.0, 0.0),
    new Point(1.0, 1.0),
    new Point(3.0, 1.0),
    new Point(2.0, 3.0),
    new Point(1.0, 1.0),
    new Point(1.0, 2.0),
    new Point(0.0, 2.0),
    new Point(2.0, 3.0),
    new Point(3.0, 0.0),
    new Point(0.0, 1.0),
    new Point(1.0, 2.123),
  ];

  double distanceSigma = 1.25;
  int minimumNumberOfPointsInCluster = 4;

  var pointClusterer = new DBSCAN(_dataset, distanceSigma, 4, (Point<double> pointA, Point<double> pointB) {
    return sqrt(pow(pointA.x - pointB.x, 2) + pow(pointA.y - pointB.y, 2));
  });

  print('Clusters: ${pointClusterer.clusters}');
  print('Noise: ${pointClusterer.noise}');
}
