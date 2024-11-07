import 'package:examen/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

@InjectableInit()

Future<void> configureDependencias() async => await locator.init();
