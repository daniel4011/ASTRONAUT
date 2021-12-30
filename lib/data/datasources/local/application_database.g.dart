// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorApplicationDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ApplicationDatabaseBuilder databaseBuilder(String name) =>
      _$ApplicationDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ApplicationDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ApplicationDatabaseBuilder(null);
}

class _$ApplicationDatabaseBuilder {
  _$ApplicationDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ApplicationDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ApplicationDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ApplicationDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ApplicationDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ApplicationDatabase extends ApplicationDatabase {
  _$ApplicationDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PicturesDao? _picturesDaoInstance;

  RandomPicturesDao? _randomPicturesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Picture` (`url` TEXT NOT NULL, `date` TEXT, `explanation` TEXT, `hdurl` TEXT, `mediaType` TEXT, `title` TEXT, `copyright` TEXT, `encodedBase64ImageFile` TEXT NOT NULL, `encodedBase64ImageHdFile` TEXT NOT NULL, PRIMARY KEY (`url`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RandomPicture` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `url` TEXT NOT NULL, `date` TEXT, `explanation` TEXT, `hdurl` TEXT, `mediaType` TEXT, `title` TEXT, `copyright` TEXT, `encodedBase64ImageFile` TEXT NOT NULL, `encodedBase64ImageHdFile` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PicturesDao get picturesDao {
    return _picturesDaoInstance ??= _$PicturesDao(database, changeListener);
  }

  @override
  RandomPicturesDao get randomPicturesDao {
    return _randomPicturesDaoInstance ??=
        _$RandomPicturesDao(database, changeListener);
  }
}

class _$PicturesDao extends PicturesDao {
  _$PicturesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _pictureInsertionAdapter = InsertionAdapter(
            database,
            'Picture',
            (Picture item) => <String, Object?>{
                  'url': item.url,
                  'date': item.date,
                  'explanation': item.explanation,
                  'hdurl': item.hdurl,
                  'mediaType': item.mediaType,
                  'title': item.title,
                  'copyright': item.copyright,
                  'encodedBase64ImageFile': item.encodedBase64ImageFile,
                  'encodedBase64ImageHdFile': item.encodedBase64ImageHdFile
                },
            changeListener),
        _pictureDeletionAdapter = DeletionAdapter(
            database,
            'Picture',
            ['url'],
            (Picture item) => <String, Object?>{
                  'url': item.url,
                  'date': item.date,
                  'explanation': item.explanation,
                  'hdurl': item.hdurl,
                  'mediaType': item.mediaType,
                  'title': item.title,
                  'copyright': item.copyright,
                  'encodedBase64ImageFile': item.encodedBase64ImageFile,
                  'encodedBase64ImageHdFile': item.encodedBase64ImageHdFile
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Picture> _pictureInsertionAdapter;

  final DeletionAdapter<Picture> _pictureDeletionAdapter;

  @override
  Future<List<Picture>> getPictures() async {
    return _queryAdapter.queryList('SELECT * FROM Picture',
        mapper: (Map<String, Object?> row) => Picture(
            url: row['url'] as String,
            date: row['date'] as String?,
            explanation: row['explanation'] as String?,
            hdurl: row['hdurl'] as String?,
            mediaType: row['mediaType'] as String?,
            title: row['title'] as String?,
            copyright: row['copyright'] as String?,
            encodedBase64ImageFile: row['encodedBase64ImageFile'] as String,
            encodedBase64ImageHdFile:
                row['encodedBase64ImageHdFile'] as String));
  }

  @override
  Stream<Picture?> findPictureByUrl(String url) {
    return _queryAdapter.queryStream('SELECT * FROM Picture WHERE url = ?1',
        mapper: (Map<String, Object?> row) => Picture(
            url: row['url'] as String,
            date: row['date'] as String?,
            explanation: row['explanation'] as String?,
            hdurl: row['hdurl'] as String?,
            mediaType: row['mediaType'] as String?,
            title: row['title'] as String?,
            copyright: row['copyright'] as String?,
            encodedBase64ImageFile: row['encodedBase64ImageFile'] as String,
            encodedBase64ImageHdFile:
                row['encodedBase64ImageHdFile'] as String),
        arguments: [url],
        queryableName: 'Picture',
        isView: false);
  }

  @override
  Future<void> clear() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Picture');
  }

  @override
  Future<void> insertPicture(Picture picture) async {
    await _pictureInsertionAdapter.insert(picture, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertPictures(List<Picture> picture) async {
    await _pictureInsertionAdapter.insertList(
        picture, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePicture(Picture picture) async {
    await _pictureDeletionAdapter.delete(picture);
  }
}

class _$RandomPicturesDao extends RandomPicturesDao {
  _$RandomPicturesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _randomPictureInsertionAdapter = InsertionAdapter(
            database,
            'RandomPicture',
            (RandomPicture item) => <String, Object?>{
                  'id': item.id,
                  'url': item.url,
                  'date': item.date,
                  'explanation': item.explanation,
                  'hdurl': item.hdurl,
                  'mediaType': item.mediaType,
                  'title': item.title,
                  'copyright': item.copyright,
                  'encodedBase64ImageFile': item.encodedBase64ImageFile,
                  'encodedBase64ImageHdFile': item.encodedBase64ImageHdFile
                },
            changeListener),
        _randomPictureDeletionAdapter = DeletionAdapter(
            database,
            'RandomPicture',
            ['id'],
            (RandomPicture item) => <String, Object?>{
                  'id': item.id,
                  'url': item.url,
                  'date': item.date,
                  'explanation': item.explanation,
                  'hdurl': item.hdurl,
                  'mediaType': item.mediaType,
                  'title': item.title,
                  'copyright': item.copyright,
                  'encodedBase64ImageFile': item.encodedBase64ImageFile,
                  'encodedBase64ImageHdFile': item.encodedBase64ImageHdFile
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RandomPicture> _randomPictureInsertionAdapter;

  final DeletionAdapter<RandomPicture> _randomPictureDeletionAdapter;

  @override
  Future<List<RandomPicture>> getPictures() async {
    return _queryAdapter.queryList('SELECT * FROM RandomPictures',
        mapper: (Map<String, Object?> row) => RandomPicture(
            url: row['url'] as String,
            date: row['date'] as String?,
            explanation: row['explanation'] as String?,
            hdurl: row['hdurl'] as String?,
            mediaType: row['mediaType'] as String?,
            title: row['title'] as String?,
            copyright: row['copyright'] as String?,
            encodedBase64ImageFile: row['encodedBase64ImageFile'] as String,
            encodedBase64ImageHdFile:
                row['encodedBase64ImageHdFile'] as String));
  }

  @override
  Stream<RandomPicture?> findPictureByUrl(String url) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RandomPictures WHERE url = ?1',
        mapper: (Map<String, Object?> row) => RandomPicture(
            url: row['url'] as String,
            date: row['date'] as String?,
            explanation: row['explanation'] as String?,
            hdurl: row['hdurl'] as String?,
            mediaType: row['mediaType'] as String?,
            title: row['title'] as String?,
            copyright: row['copyright'] as String?,
            encodedBase64ImageFile: row['encodedBase64ImageFile'] as String,
            encodedBase64ImageHdFile:
                row['encodedBase64ImageHdFile'] as String),
        arguments: [url],
        queryableName: 'RandomPicture',
        isView: false);
  }

  @override
  Future<void> clear() async {
    await _queryAdapter.queryNoReturn('DELETE * FROM RandomPictures');
  }

  @override
  Future<void> insertPicture(RandomPicture picture) async {
    await _randomPictureInsertionAdapter.insert(
        picture, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertPictures(List<RandomPicture> picture) async {
    await _randomPictureInsertionAdapter.insertList(
        picture, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePicture(RandomPicture picture) async {
    await _randomPictureDeletionAdapter.delete(picture);
  }
}
