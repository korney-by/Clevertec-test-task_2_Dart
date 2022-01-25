enum AnimalState {
  SLEEP,
  EAT,
  POOP,
  WALK,
  FLY,
  SWIM,
  CLIMB_TREES,
  LAY_EGGS,
  FED_MILK,
  SHOW_TAIL,
  WAIT_RED_HAT,
  BUILD_DAM
}

extension AnimalStateExtension on AnimalState {
  String get value {
    switch (this) {
      case AnimalState.SLEEP:
        return "спит";
      case AnimalState.EAT:
        return "ест";
      case AnimalState.POOP:
        return "какает";
      case AnimalState.WALK:
        return "идет";
      case AnimalState.FLY:
        return "летит";
      case AnimalState.SWIM:
        return "плывет";
      case AnimalState.CLIMB_TREES:
        return "лезет на дерево";
      case AnimalState.LAY_EGGS:
        return "откладывает яйца";
      case AnimalState.FED_MILK:
        return "кормит молоком детенышей";
      case AnimalState.SHOW_TAIL:
        return "показывает хвост";
      case AnimalState.WAIT_RED_HAT:
        return "ждет Красную шапочку";
      case AnimalState.BUILD_DAM:
        return "строит плотину";
    }
  }
}

