

import 'package:flutter_dotenv/flutter_dotenv.dart';

class environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ??"No hat api key" ;
}