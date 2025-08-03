import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/label_iq/expand_tile_model.dart';

class SlideUpController extends GetxController {
  /// Controllers
  ExpansionTileController expTileController = ExpansionTileController();

  /// Variables
  var tabIndex = 0.obs;
  var isTileExpanded = false.obs;

  /// Lists
  var ingredientList = <ExpandTileModel>[
    ExpandTileModel(isExpand: false.obs),
    ExpandTileModel(isExpand: false.obs),
    ExpandTileModel(isExpand: false.obs),
    ExpandTileModel(isExpand: false.obs),
    ExpandTileModel(isExpand: false.obs),
  ];
}
