import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:example/decoration/chest.dart';
import 'package:example/enemy/goblin.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/position.dart';

class DungeonMap {
  static const int tileSize = 32;

  static MapWorld map() {
    List<Tile> tileList = List();
    List.generate(35, (indexRow) {
      List.generate(70, (indexColumm) {
        if (indexRow == 3 && indexColumm > 2 && indexColumm < 30) {
          tileList.add(Tile(
            'tile/wall_bottom.png',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
            collision: true,
          ));
          return;
        }
        if (indexRow == 4 && indexColumm > 2 && indexColumm < 30) {
          tileList.add(Tile(
            'tile/wall.png',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
            collision: true,
          ));
          return;
        }

        if (indexRow == 9 && indexColumm > 2 && indexColumm < 30) {
          tileList.add(Tile(
            'tile/wall_top.png',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
            collision: true,
          ));
          return;
        }

        if (indexRow > 4 &&
            indexRow < 9 &&
            indexColumm > 2 &&
            indexColumm < 30) {
          tileList.add(Tile(
            randomFloor(),
            Position(indexColumm.toDouble(), indexRow.toDouble()),
          ));
          return;
        }

        if (indexRow > 3 && indexRow < 9 && indexColumm == 2) {
          tileList.add(Tile(
            'tile/wall_left.png',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
            collision: true,
          ));
        }
        if (indexRow == 9 && indexColumm == 2) {
          tileList.add(Tile(
            'tile/wall_bottom_left.png',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
            collision: true,
          ));
        }

        if (indexRow > 3 && indexRow < 9 && indexColumm == 30) {
          tileList.add(Tile(
            'tile/wall_right.png',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
            collision: true,
          ));
        }

        if (indexRow == 9 && indexColumm == 31) {
          tileList.add(Tile(
            '',
            Position(indexColumm.toDouble(), indexRow.toDouble()),
          ));
          return;
        }
      });
    });

    return MapWorld(tileList);
  }

  static List<GameDecoration> decorations() {
    return [
      GameDecoration.sprite(
        Sprite('itens/barrel.png'),
        initPosition: getRelativeTilePosition(10, 6),
        width: 32,
        height: 32,
        collision: Collision(
          width: 18,
          height: 32,
        ),
      ),
      Chest(getRelativeTilePosition(18, 7)),
      GameDecoration.sprite(
        Sprite('itens/table.png'),
        initPosition: getRelativeTilePosition(15, 7),
        width: 32,
        height: 32,
        collision: Collision(height: 32, width: 32),
      ),
      GameDecoration.sprite(
        Sprite('itens/table.png'),
        initPosition: getRelativeTilePosition(27, 6),
        width: 32,
        height: 32,
        collision: Collision(height: 32, width: 32),
      ),
      GameDecoration.animation(
        FlameAnimation.Animation.sequenced(
          "itens/torch_spritesheet.png",
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        initPosition: getRelativeTilePosition(4, 4),
        width: 32,
        height: 32,
      ),
      GameDecoration.animation(
        FlameAnimation.Animation.sequenced(
          "itens/torch_spritesheet.png",
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        initPosition: getRelativeTilePosition(8, 4),
        width: 32,
        height: 32,
      ),
      GameDecoration.animation(
        FlameAnimation.Animation.sequenced(
          "itens/torch_spritesheet.png",
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        initPosition: getRelativeTilePosition(12, 4),
        width: 32,
        height: 32,
      ),
      GameDecoration.animation(
        FlameAnimation.Animation.sequenced(
          "itens/torch_spritesheet.png",
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        initPosition: getRelativeTilePosition(16, 4),
        width: 32,
        height: 32,
      ),
      GameDecoration.sprite(
        Sprite('itens/flag_red.png'),
        initPosition: getRelativeTilePosition(6, 4),
        width: 32,
        height: 32,
      ),
      GameDecoration.sprite(
        Sprite('itens/prisoner.png'),
        initPosition: getRelativeTilePosition(10, 4),
        width: 32,
        height: 32,
      ),
      GameDecoration.sprite(
        Sprite('itens/flag_red.png'),
        initPosition: getRelativeTilePosition(14, 4),
        width: 32,
        height: 32,
      )
    ];
  }

  static List<Enemy> enemies() {
    return [
      Goblin(initPosition: getRelativeTilePosition(14, 6)),
      Goblin(initPosition: getRelativeTilePosition(25, 6)),
    ];
  }

  static String randomFloor() {
    int p = Random().nextInt(6);
    String sprite = "";
    switch (p) {
      case 0:
        sprite = 'tile/floor_1.png';
        break;
      case 1:
        sprite = 'tile/floor_1.png';
        break;
      case 2:
        sprite = 'tile/floor_2.png';
        break;
      case 3:
        sprite = 'tile/floor_2.png';
        break;
      case 4:
        sprite = 'tile/floor_3.png';
        break;
      case 5:
        sprite = 'tile/floor_4.png';
        break;
    }
    return sprite;
  }

  static Position getRelativeTilePosition(int x, int y) {
    return Position(
      (x * tileSize).toDouble(),
      (y * tileSize).toDouble(),
    );
  }
}
