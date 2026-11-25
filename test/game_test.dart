import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hayvanat_bahcesi/oyun_hayvanat_bahcesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hayvanatBahcesiConfig.title.length, 33);
    expect(hayvanatBahcesiConfig.tagline.length, 33);
    for (final s in hayvanatBahcesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hayvanatBahcesiConfig.gameId, hayvanatBahcesiId);
    expect(hayvanatBahcesiRules.gameId, hayvanatBahcesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hayvanatBahcesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hayvanatBahcesiId, optionalMechanics: hayvanatBahcesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hayvanatBahcesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
