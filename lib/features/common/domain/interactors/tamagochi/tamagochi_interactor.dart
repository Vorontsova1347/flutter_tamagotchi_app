import 'package:tamagochi_app/api/repositories/tamagochi/tamagochi_repository.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/mappers/tamagochi_mapper.dart';

/// Interactor for [TamagochiRepository]
class TamagochiInteractor {
  final TamagochiRepository tamagochiRepository;
  final AccessData accessData;

  TamagochiInteractor({
    required this.tamagochiRepository,
    required this.accessData,
  });

  Future<Tamagochi> food() async {
    _assertHasAcessData();

    return toTamagochi(await tamagochiRepository.tamagochiFood(
      accessToken: accessData.accessToken!,
    ));
  }

  Future<Tamagochi> health() async {
    _assertHasAcessData();

    return toTamagochi(await tamagochiRepository.tamagochiHealth(
      accessToken: accessData.accessToken!,
    ));
  }

  Future<Tamagochi> game() async {
    _assertHasAcessData();

    return toTamagochi(await tamagochiRepository.tamagochiGame(
      accessToken: accessData.accessToken!,
    ));
  }

  Future<Tamagochi> sleep() async {
    _assertHasAcessData();

    return toTamagochi(await tamagochiRepository.tamagochiSleep(
      accessToken: accessData.accessToken!,
    ));
  }

  void _assertHasAcessData() {
    if (!accessData.isInitialized()) {
      throw Exception('AccessData is not initalizezd');
    }
  }
}
