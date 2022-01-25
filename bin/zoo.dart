import 'animals/animal.dart';
import 'animals/animal_state.dart';
import 'animals/animal_type.dart';

class Zoo {
  Zoo._privateConstructor() {
    _animals.addAll(_addAnimals(4, AnimalType.DUCK));
    _animals.addAll(_addAnimals(7, AnimalType.HUMMINGBIRD));
    _animals.addAll(_addAnimals(1, AnimalType.PEACOCK));
    _animals.addAll(_addAnimals(3, AnimalType.BEAR));
    _animals.addAll(_addAnimals(5, AnimalType.WOLF));
    _animals.addAll(_addAnimals(2, AnimalType.BEAVER));
  }

  static final Zoo _instance = Zoo._privateConstructor();

  final List<Animal> _animals = [];

  int get quantityAnimals => _animals.length;

  void startLife() {
    for (var animal in _animals) {
      animal.startLife();
    }
  }

  factory Zoo() {
    return _instance;
  }

  List<Animal> _addAnimals(int quantity, AnimalType animalType) {
    Animal _addOneAnimal(int id, AnimalType animalType) {
      switch (animalType) {
        case AnimalType.DUCK:
          return Duck(id);
        case AnimalType.HUMMINGBIRD:
          return Hummingbird(id);
        case AnimalType.PEACOCK:
          return Peacock(id);
        case AnimalType.BEAR:
          return Bear(id);
        case AnimalType.WOLF:
          return Wolf(id);
        case AnimalType.BEAVER:
          return Beaver(id);
      }
    }

    final List<Animal> _sameTypeAnimals = [];
    for (int id = 1; id <= quantity; id++) {
      var newAnimal = _addOneAnimal(id, animalType);
      newAnimal.setOnStateChangeListener((animal) => _showAnimalState(animal));
      _sameTypeAnimals.add(newAnimal);
    }

    return _sameTypeAnimals;
  }

  void _showAnimalState(Animal animal) {
    print("${animal.animalName} ${animal.state.value}");
  }

  void showAllAnimals() {
    AnimalType? previousAnimal;
    var sameTypeAnimal = StringBuffer();

    for (var animal in _animals) {
      if (previousAnimal != animal.animalType) {
        print(sameTypeAnimal);
        sameTypeAnimal.clear();
      }
      sameTypeAnimal.write("| ${animal.animalName} ${animal.state.value} ");
      previousAnimal = animal.animalType;
    }
  }
}
