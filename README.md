# DBSCAN
### Density Based Spatial Clustering for Applications with Noise

A spatial clustering library for dart for use any time you need to organize sets of data into groups of nearby clusters .

## Installation

In your `pubspec.yaml` add the `dbscan` dependency and run `pub get`

    dependencies:
      dbscan: any

## Usage

A simple usage example:

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

