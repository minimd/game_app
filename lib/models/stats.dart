//a mixin is a class that takes the items in it into another class directly
//so instead of typing Character.Stats.health.. we type Character.health
mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  //getters

  int get points => _points;

//this is how to make a Map that contains a string: int.
  Map<String, int> get statsMap => {
        'health': _health,
        'attack': _attack,
        'defense': _defense,
        'skill': _skill,
      };

  List<Map<String, String>> get statsAsFormattedList => [
        {
          'title': 'health',
          'value': _health.toString(),
        },
        {
          'title': 'attack',
          'value': _attack.toString(),
        },
        {
          'title': 'defense',
          'value': _defense.toString(),
        },
        {
          'title': 'skill',
          'value': _skill.toString(),
        }
      ];

// methods
  void increaseStat(String stat) {
    if (_points > 0) {
      if (stat == 'health') {
        _health++;
      }
      if (stat == 'attack') {
        _attack++;
      }
      if (stat == 'defense') {
        _defense++;
      }
      if (stat == 'skill') {
        _skill++;
      }
    }
  }

  void decreaStat(String stat) {
    if (stat == 'health' && _health > 5) {
      _health--;
      _points++;
    }
    if (stat == 'attack' && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == 'defense' && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == 'skill' && _skill > 5) {
      _skill--;
      _points++;
    }
  }
}
