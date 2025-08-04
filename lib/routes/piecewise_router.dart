import 'package:flutter/material.dart';
import 'package:piece_wise/models/piece.dart';
import 'package:piece_wise/pages/piece_feed.dart';
import 'package:piece_wise/pages/piece_form.dart';
import 'package:piece_wise/pages/piecewise_page_wrapper.dart';
import 'package:piece_wise/routes/piecewise_routes.dart';

class PiecewiseRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page = switch (settings.name) {
      PiecewiseRoutes.pieceFeed => const PieceFeed(),
      PiecewiseRoutes.pieceForm => PieceForm(
        piece: settings.arguments as Piece?,
      ),
      _ => const Center(child: Text('404')),
    };

    return MaterialPageRoute(builder: (_) => PiecewisePageWrapper(body: page));
  }
}
