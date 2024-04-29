import 'package:json_annotation/json_annotation.dart';
import 'package:poc_sc_assistant/gen/assets.gen.dart';

enum Scene {
  @JsonValue('STANDBY')
  standby,
  @JsonValue('ACTIVE')
  active,
  @JsonValue('TURN_OFF_ALL')
  turnOffAll,
  @JsonValue('UNKNOWN')
  unknown;

  String get name {
    switch (this) {
      case Scene.standby:
        return 'Standby';
      case Scene.active:
        return 'Active';
      case Scene.turnOffAll:
        return 'Turn Off All';
      default:
        return 'Unknown *';
    }
  }

  AssetGenImage get icon {
    switch (this) {
      case Scene.standby:
        return Assets.icons.standby;
      case Scene.active:
        return Assets.icons.active;
      case Scene.turnOffAll:
        return Assets.icons.turnOffAll;
      default:
        // TODO(Nolthicha): change icon when unknow icon ready.
        return Assets.icons.standby;
    }
  }
}
