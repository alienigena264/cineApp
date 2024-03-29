import 'package:cinemapedia/domain/datasource/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDataSource {
  late Future<Isar> db;
  IsarDatasource() {
    db = openDb();
  }

  //Abrir la base de datos o crearla si no existe
  Future<Isar> openDb() async {
    final dir =
        await getApplicationDocumentsDirectory(); //obtiene el directorio de la app
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        inspector: true,
        directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }


  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavorite =
        await isar.movies. 
        filter()
        .idEqualTo(movieId)
        .findFirst();
    return isFavorite != null;
  }


  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoriteMovie =
        await isar.movies
        .filter()
        .idEqualTo(movie.id)
        .findFirst();
    if (favoriteMovie != null) {
      //borrar
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.idIsar!));
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }


  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies
    .where()
    .offset(offset)
    .limit(limit)
    .findAll();
  }


}
