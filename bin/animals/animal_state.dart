enum AnimalState {
  sleep,
  eat,
  poop,
  walk,
  fly,
  swim,
  climbTrees,
  layEggs,
  fedMilk,
  showTail,
  waitRedHat,
  buildDam
}

extension AnimalStateExtension on AnimalState {
  String get value {
    switch (this) {
      case AnimalState.sleep:
        return "спит";
      case AnimalState.eat:
        return "ест";
      case AnimalState.poop:
        return "какает";
      case AnimalState.walk:
        return "идет";
      case AnimalState.fly:
        return "летит";
      case AnimalState.swim:
        return "плывет";
      case AnimalState.climbTrees:
        return "лезет на дерево";
      case AnimalState.layEggs:
        return "откладывает яйца";
      case AnimalState.fedMilk:
        return "кормит молоком детенышей";
      case AnimalState.showTail:
        return "показывает хвост";
      case AnimalState.waitRedHat:
        return "ждет Красную шапочку";
      case AnimalState.buildDam:
        return "строит плотину";
    }
  }
}

