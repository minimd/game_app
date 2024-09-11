import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'game_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE characters (
        id TEXT PRIMARY KEY,
        name TEXT,
        slogan TEXT,
        vocation TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE skills (
        id TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        vocation TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE stats (
        id TEXT PRIMARY KEY,
        health INTEGER,
        attack INTEGER,
        defense INTEGER,
        skill INTEGER,
        points INTEGER
      )
    ''');
  }
  // Insert a character
Future<int> insertCharacter(String id, String name, String slogan, String vocation) async {
  final db = await database;
  return await db.insert('characters', {
    'id': id,
    'name': name,
    'slogan': slogan,
    'vocation': vocation,
  });
}

// Insert a skill
Future<int> insertSkill(String id, String name, String image, String vocation) async {
  final db = await database;
  return await db.insert('skills', {
    'id': id,
    'name': name,
    'image': image,
    'vocation': vocation,
  });
}

// Insert stats for a character
Future<int> insertStats(String id, int health, int attack, int defense, int skill, int points) async {
  final db = await database;
  return await db.insert('stats', {
    'id': id,
    'health': health,
    'attack': attack,
    'defense': defense,
    'skill': skill,
    'points': points,
  });
}
// Get all characters
Future<List<Map<String, dynamic>>> getAllCharacters() async {
  final db = await database;
  return await db.query('characters');
}

// Get all skills
Future<List<Map<String, dynamic>>> getAllSkills() async {
  final db = await database;
  return await db.query('skills');
}

// Get stats for a character by ID
Future<Map<String, dynamic>?> getCharacterStats(String id) async {
  final db = await database;
  List<Map<String, dynamic>> result = await db.query('stats', where: 'id = ?', whereArgs: [id]);

  if (result.isNotEmpty) {
    return result.first;
  }
  return null;
}
// Update a character's information
Future<int> updateCharacter(String id, String name, String slogan, String vocation) async {
  final db = await database;
  return await db.update(
    'characters',
    {
      'name': name,
      'slogan': slogan,
      'vocation': vocation,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

// Update stats for a character by ID
Future<int> updateCharacterStats(String id, int health, int attack, int defense, int skill, int points) async {
  final db = await database;
  return await db.update(
    'stats',
    {
      'health': health,
      'attack': attack,
      'defense': defense,
      'skill': skill,
      'points': points,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

// Delete a character by ID
Future<int> deleteCharacter(String id) async {
  final db = await database;
  await db.delete('stats', where: 'id = ?', whereArgs: [id]); // Also delete associated stats
  return await db.delete('characters', where: 'id = ?', whereArgs: [id]);
}

// Delete a skill by ID
Future<int> deleteSkill(String id) async {
  final db = await database;
  return await db.delete('skills', where: 'id = ?', whereArgs: [id]);
}

}
