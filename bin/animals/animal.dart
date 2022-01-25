import 'dart:math';
import 'animal_action_interface.dart';
import 'animal_state.dart';
import 'animal_type.dart';

abstract class Animal implements Eat, Poop, Sleep {
  late final AnimalType animalType;
  late final String animalName;

  final List<Function> actions = [];
  Function(Animal)? onChangeState;

  AnimalState _stateMutable = AnimalState.SLEEP;

  AnimalState get _state => _stateMutable;

  set _state(AnimalState value) {
    _stateMutable = value;
    onChangeState?.call(this);
  }

  AnimalState get state => _stateMutable;

  Animal() {
    actions.addAll([sleep, eat, poop]);
  }

  void setOnStateChangeListener(Function(Animal) listener) {
    onChangeState = listener;
  }

  String _generateAnimalName(int id) {
    return animalType.value + "-$id";
  }

  void startLife() async {
    // 10 evens in the life of each animal
    // last event - animal goes to sleep
    final eventsCount = 10;
    final random = Random();
    for (int i = 0; i < eventsCount; i++) {
      var actionIndex = random.nextInt(actions.length);
      await Future.delayed(Duration(milliseconds: random.nextInt(1500) + 500));
      (i != eventsCount - 1) ? actions[actionIndex].call() : sleep();
    }
  }

  @override
  void eat() {
    _state = AnimalState.EAT;
  }

  @override
  void sleep() {
    _state = AnimalState.SLEEP;
  }

  @override
  void poop() {
    _state = AnimalState.POOP;
  }
}

abstract class Bird extends Animal implements LayEggs {
  Bird() {
    actions.add(layEggs);
  }

  @override
  void layEggs() {
    _state = AnimalState.LAY_EGGS;
  }
}

abstract class Mammals extends Animal implements Walk, FedMilk {
  Mammals() {
    actions.addAll([fedMilk, walk]);
  }

  @override
  void fedMilk() {
    _state = AnimalState.FED_MILK;
  }

  @override
  void walk() {
    _state = AnimalState.WALK;
  }
}

class Duck extends Bird implements Walk, Fly, Swim {
  final int _id;

  Duck(this._id) {
    animalType = AnimalType.DUCK;
    animalName = _generateAnimalName(_id);
    actions.addAll([walk, fly, swim]);
  }

  @override
  void walk() {
    _state = AnimalState.WALK;
  }

  @override
  void fly() {
    _state = AnimalState.FLY;
  }

  @override
  void swim() {
    _state = AnimalState.SWIM;
  }
}

class Peacock extends Bird implements Walk, Fly, ShowTail {
  final int _id;

  Peacock(this._id):super() {
    animalType = AnimalType.PEACOCK;
    animalName = _generateAnimalName(_id);
    actions.addAll([fly, showTail]);
  }

  @override
  void walk() {
    _state = AnimalState.WALK;
  }

  @override
  void fly() {
    _state = AnimalState.FLY;
  }

  @override
  void showTail() {
    _state = AnimalState.SHOW_TAIL;
  }
}

class Hummingbird extends Bird implements Fly {
  final int _id;

  Hummingbird(this._id) {
    animalType = AnimalType.HUMMINGBIRD;
    animalName = _generateAnimalName(_id);
    actions.add(fly);
  }

  @override
  void fly() {
    _state = AnimalState.FLY;
  }
}

class Bear extends Mammals implements ClimbTrees {
  final int _id;

  Bear(this._id) {
    animalType = AnimalType.BEAR;
    animalName = _generateAnimalName(_id);
    actions.add(climbTrees);
  }

  @override
  void climbTrees() {
    _state = AnimalState.CLIMB_TREES;
  }
}

class Wolf extends Mammals implements WaitRedHat {
  final int _id;

  Wolf(this._id) {
    animalType = AnimalType.WOLF;
    animalName = _generateAnimalName(_id);
    actions.add(waitRedHat);
  }

  @override
  void waitRedHat() {
    _state = AnimalState.WAIT_RED_HAT;
  }
}

class Beaver extends Mammals implements Swim, BuildDam {
  final int _id;

  Beaver(this._id) {
    animalType = AnimalType.BEAVER;
    animalName = _generateAnimalName(_id);
    actions.addAll([swim, buildDam]);
  }

  @override
  void swim() {
    _state = AnimalState.SWIM;
  }

  @override
  void buildDam() {
    _state = AnimalState.BUILD_DAM;
  }
}
