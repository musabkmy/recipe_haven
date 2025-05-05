import 'dart:async';

import 'package:injectable/injectable.dart';

@microPackageInit
initMicroPackage() {}

class AwesomePackageModule extends MicroPackageModule {
  @override
  FutureOr<void> init(GetItHelper gh) {
    // TODO: implement init
    throw UnimplementedError();
  }
}
