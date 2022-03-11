import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
import 'package:tamagochi_app/api/data/tamagochi_load/tamagochi_load.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/mappers/tamagochi_mapper.dart';
import 'package:tamagochi_app/features/common/domain/repository/tamagochi/tamagochi_repository.dart';
import 'package:tuple/tuple.dart';

/// Interactor for [TamagochiRepository]
class TamagochiInteractor {
  final TamagochiRepository _tamagochiRepository;

  TamagochiInteractor(this._tamagochiRepository);

  /// Increate food parameter current tamagochi, returns updated [Tamagochi],
  /// converted from [TamagochiDto]
  Future<Tamagochi> foodTamagochi() async {
    return toTamagochi(await _tamagochiRepository.foodTamagochi());
  }

  /// Increate health parameter current tamagochi, returns updated [Tamagochi],
  /// converted from [TamagochiDto]
  Future<Tamagochi> healthTamagochi() async {
    return toTamagochi(await _tamagochiRepository.healthTamagochi());
  }

  /// Increate game parameter current tamagochi, returns updated [Tamagochi],
  /// converted from [TamagochiDto]
  Future<Tamagochi> gameTamagochi() async {
    return toTamagochi(await _tamagochiRepository.gameTamagochi());
  }

  /// Increate sleep parameter current tamagochi, returns updated [Tamagochi],
  /// converted from [TamagochiDto]
  Future<Tamagochi> sleepTamagochi() async {
    return toTamagochi(await _tamagochiRepository.sleepTamagochi());
  }

  /// Update current tamagochi with [TamagochiLoad], returns updated [Tamagochi],
  /// converted from [TamagochiDto]
  Future<Tamagochi> updateTamagochi({
    required double sleep,
    required double health,
    required double game,
    required double food,
  }) async {
    return toTamagochi(
      await _tamagochiRepository.updateTamagochi(
        TamagochiLoad(
          food: food,
          game: game,
          health: health,
          sleep: sleep,
        ),
      ),
    );
  }

  // ignore: long-parameter-list
  Future<Tuple2<bool, Tamagochi?>> updateTamagochiById({
    required double sleep,
    required double health,
    required double game,
    required double food,
    required int id,
  }) async {
    final response = await _tamagochiRepository.updateTamagochiById(
      TamagochiLoad(
        food: food,
        game: game,
        health: health,
        sleep: sleep,
      ),
      id,
    );

    return response == null
        ? Tuple2(
            false,
            toTamagochi(
              TamagochiDto(),
            ),
          )
        : Tuple2(
            true,
            toTamagochi(response),
          );
  }
}
