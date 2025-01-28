import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';
import 'package:illustrator_guide/domain/models/item_model.dart';

class ShortcutsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ShortcutsController(this.shortcutsPresenter);

  final ShortcutsPresenter shortcutsPresenter;

  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(length: 8, vsync: this);
    tabController!.addListener(update);
    super.onInit();
  }

  //Tool
  List<ModelBasicTools> toolList = [
    ModelBasicTools(
      name: "move_tool".tr,
      shortcut: 'V',
    ),
    ModelBasicTools(
      name: "direct_selection_tool".tr,
      shortcut: 'A',
    ),
    ModelBasicTools(
      name: "magic_wand_tool".tr,
      shortcut: 'Y',
    ),
    ModelBasicTools(
      name: "lasso_tool".tr,
      shortcut: 'Q',
    ),
    ModelBasicTools(
      name: "pen_tool".tr,
      shortcut: 'P',
      steps: [
        Steps(
          step: 'add_anchor_point_tool'.tr,
          shortCut: '+',
        ),
        Steps(
          step: 'delete_anchor_point_tool'.tr,
          shortCut: '-',
        ),
        Steps(
          step: 'anchor_point_tool'.tr,
          shortCut: 'Shift+C',
        ),
      ],
    ),
    ModelBasicTools(
      name: "curvature_tool".tr,
      shortcut: 'Shift + ~',
    ),
    ModelBasicTools(
      name: "type_tool".tr,
      shortcut: 'T',
      steps: [
        Steps(
          step: 'touch_type_tool'.tr,
          shortCut: 'Shift+T',
        ),
      ],
    ),
    ModelBasicTools(
      name: "line_segment".tr,
      shortcut: "\\",
    ),
    ModelBasicTools(
      name: "rectangle".tr,
      shortcut: 'M',
      steps: [
        Steps(
          step: 'ellipse'.tr,
          shortCut: 'L',
        ),
      ],
    ),
    ModelBasicTools(
      name: "paintbrush".tr,
      shortcut: 'B',
      steps: [
        Steps(
          step: 'blo_brush'.tr,
          shortCut: 'Shift+B',
        ),
      ],
    ),
    ModelBasicTools(
      name: "shaper_tool".tr,
      shortcut: 'Shift+N',
      steps: [
        Steps(
          step: 'pencil_tool'.tr,
          shortCut: 'N',
        ),
      ],
    ),
    ModelBasicTools(
      name: "eraser_tool".tr,
      shortcut: 'Shift+E',
      steps: [
        Steps(
          step: 'scissors_tool'.tr,
          shortCut: 'C',
        ),
      ],
    ),
    ModelBasicTools(
      name: "rotate_tool".tr,
      shortcut: 'R',
      steps: [
        Steps(
          step: 'raflect_tool'.tr,
          shortCut: 'O',
        ),
      ],
    ),
    ModelBasicTools(
      name: "scale_tool".tr,
      shortcut: 'S',
    ),
    ModelBasicTools(
      name: "width_tool".tr,
      shortcut: 'Shift+W',
      steps: [
        Steps(
          step: 'wrap_tool'.tr,
          shortCut: 'Shift+R',
        ),
      ],
    ),
    ModelBasicTools(
      name: "free_transform_tool".tr,
      shortcut: 'E',
    ),
    ModelBasicTools(
      name: "shape_builder_tool".tr,
      shortcut: 'Shift+M',
      steps: [
        Steps(
          step: 'live_paint_bucket'.tr,
          shortCut: 'K',
        ),
        Steps(
          step: 'live_paint_selection_tool'.tr,
          shortCut: 'Shift+L',
        ),
      ],
    ),
    ModelBasicTools(
      name: "perspective_grid_tool".tr,
      shortcut: 'Shift+p',
      steps: [
        Steps(
          step: 'perspective_selection_tool'.tr,
          shortCut: 'Shift+V',
        ),
      ],
    ),
    ModelBasicTools(
      name: "mesh_tool".tr,
      shortcut: 'M',
    ),
    ModelBasicTools(
      name: "gradient_tool".tr,
      shortcut: 'G',
    ),
    ModelBasicTools(
      name: "eyedropper_tool".tr,
      shortcut: 'I',
    ),
    ModelBasicTools(
      name: "blend_tool".tr,
      shortcut: 'W',
    ),
    ModelBasicTools(
      name: "symbol_sprayer".tr,
      shortcut: 'Shift+S',
    ),
    ModelBasicTools(
      name: "column_graph_tool".tr,
      shortcut: 'J',
    ),
    ModelBasicTools(
      name: "artboard_tool".tr,
      shortcut: 'Shift+O',
    ),
    ModelBasicTools(
      name: "slice_tool".tr,
      shortcut: 'Shift+K',
    ),
    ModelBasicTools(
      name: "hand_tool".tr,
      shortcut: 'H',
    ),
    ModelBasicTools(
      name: "zoom_tool".tr,
      shortcut: 'Z',
    ),
  ];

  //File
  List<ModelBasicTools> fileList = [
    ModelBasicTools(
      name: "new".tr,
      shortcut: 'Ctrl+N',
    ),
    ModelBasicTools(
      name: "new_from_template".tr,
      shortcut: 'Shift+Ctrl+N',
    ),
    ModelBasicTools(
      name: "open".tr,
      shortcut: 'Ctrl+O',
    ),
    ModelBasicTools(
      name: "open_recent_file".tr,
      shortcut: 'Alt+Shift+Ctrl+O',
    ),
    ModelBasicTools(
      name: "browse_in_bridge".tr,
      shortcut: 'Alt+Ctrl+O',
    ),
    ModelBasicTools(
      name: "close".tr,
      shortcut: 'Ctrl+W',
    ),
    ModelBasicTools(
      name: "save".tr,
      shortcut: 'Ctrl+S',
    ),
    ModelBasicTools(
      name: "save_as".tr,
      shortcut: 'Shift+Ctrl+S',
    ),
    ModelBasicTools(
      name: "save_a_copy".tr,
      shortcut: 'Alt+Ctrl+S',
    ),
    ModelBasicTools(
      name: "revert".tr,
      shortcut: 'F12',
    ),
    ModelBasicTools(
      name: "replace".tr,
      shortcut: 'Shift+Ctrl+P',
    ),
    ModelBasicTools(
      name: "export_for_screen".tr,
      shortcut: 'Alt+Ctrl+E',
    ),
    ModelBasicTools(
      name: "save_for_web_legacy".tr,
      shortcut: 'Alt+Shift+Ctrl+S',
    ),
    ModelBasicTools(
      name: "package".tr,
      shortcut: 'Alt+Shift+Ctrl+P',
    ),
    ModelBasicTools(
      name: "other_script".tr,
      shortcut: 'Ctrl+F12',
    ),
    ModelBasicTools(
      name: "document_setup".tr,
      shortcut: 'Alt+Ctrl+P',
    ),
    ModelBasicTools(
      name: "file_info".tr,
      shortcut: 'Alt+Shift+Ctrl+I',
    ),
    ModelBasicTools(
      name: "print".tr,
      shortcut: 'Ctrl+P',
    ),
    ModelBasicTools(
      name: "exit".tr,
      shortcut: 'Q',
    ),
  ];
  //Edit
  List<ModelBasicTools> editsList = [
    ModelBasicTools(
      name: "undo_typing".tr,
      shortcut: 'Ctrl+Z',
    ),
    ModelBasicTools(
      name: "redo".tr,
      shortcut: 'Shift+Ctrl+Z',
    ),
    ModelBasicTools(
      name: "cut".tr,
      shortcut: 'Ctrl+X',
    ),
    ModelBasicTools(
      name: "copy".tr,
      shortcut: 'Ctrl+C',
    ),
    ModelBasicTools(
      name: "paste".tr,
      shortcut: 'Ctrl+V',
    ),
    ModelBasicTools(
      name: "paste_in_front".tr,
      shortcut: 'Ctrl+F',
    ),
    ModelBasicTools(
      name: "paste_in_back".tr,
      shortcut: 'Ctrl+B',
    ),
    ModelBasicTools(
      name: "paste_in_place".tr,
      shortcut: 'Shift+Ctrl+V',
    ),
    ModelBasicTools(
      name: "paste_on_all_artboard".tr,
      shortcut: 'Alt+Shift+Ctrl+V',
    ),
    ModelBasicTools(
      name: "check_spelling".tr,
      shortcut: 'Ctrl+I',
    ),
    ModelBasicTools(
      name: "color_setting".tr,
      shortcut: 'Shift+Ctrl+K',
    ),
    ModelBasicTools(
      name: "keyboard_shortcuts".tr,
      shortcut: 'Alt+Shift+Ctrl+K',
    ),
    ModelBasicTools(
      name: "general".tr,
      shortcut: 'Ctrl+K',
    ),
  ];
  //Object
  List<ModelBasicTools> objectList = [
    ModelBasicTools(
      name: "transform_again".tr,
      shortcut: 'Ctrl+D',
    ),
    ModelBasicTools(
      name: "move".tr,
      shortcut: 'Shift+Ctrl+M',
    ),
    ModelBasicTools(
      name: "transform_each".tr,
      shortcut: 'Alt+Shift+Ctrl+D',
    ),
    ModelBasicTools(
      name: "bring_to_front".tr,
      shortcut: 'Shift+Ctrl+]',
    ),
    ModelBasicTools(
      name: "bring_forward".tr,
      shortcut: 'Ctrl+]',
    ),
    ModelBasicTools(
      name: "send_backward".tr,
      shortcut: 'Ctrl+[',
    ),
    ModelBasicTools(
      name: "send_to_back".tr,
      shortcut: 'Shift+Ctrl+[',
    ),
    ModelBasicTools(
      name: "selection_lock".tr,
      shortcut: 'Ctrl+2',
    ),
    ModelBasicTools(
      name: "selection_hide".tr,
      shortcut: 'Ctrl+3',
    ),
    ModelBasicTools(
      name: "join".tr,
      shortcut: 'Ctrl+J',
    ),
    ModelBasicTools(
      name: "average".tr,
      shortcut: 'Alt+Ctrl+J',
    ),
    ModelBasicTools(
      name: "edit_pattern".tr,
      shortcut: 'Shift+Ctrl+F8',
    ),
    ModelBasicTools(
      name: "make_blend".tr,
      shortcut: 'Alt+Ctrl+B',
    ),
    ModelBasicTools(
      name: "release_blend".tr,
      shortcut: 'Alt+Shift+Ctrl+B',
    ),
    ModelBasicTools(
      name: "make_with_wrap".tr,
      shortcut: 'Alt+Shift+Ctrl+W',
    ),
    ModelBasicTools(
      name: "make_with_mesh".tr,
      shortcut: 'Alt+Ctrl+M',
    ),
    ModelBasicTools(
      name: "make_with_top_object".tr,
      shortcut: 'Alt+Ctrl+C',
    ),
    ModelBasicTools(
      name: "make_live_paint".tr,
      shortcut: 'Alt+Ctrl+X',
    ),
    ModelBasicTools(
      name: "make_clipping_mask".tr,
      shortcut: 'Ctrl+7',
    ),
    ModelBasicTools(
      name: "release_clipping_mask".tr,
      shortcut: 'Alt+Ctrl+7',
    ),
    ModelBasicTools(
      name: "make_compound_path".tr,
      shortcut: 'Ctrl+8',
    ),
    ModelBasicTools(
      name: "release_compound_path".tr,
      shortcut: 'Alt+Shift+Ctrl+8',
    ),
  ];
  //Type
  List<ModelBasicTools> typeList = [
    ModelBasicTools(
      name: "create_outline".tr,
      shortcut: 'Shift+Ctrl+O',
    ),
  ];
  //Select
  List<ModelBasicTools> selectList = [
    ModelBasicTools(
      name: "all".tr,
      shortcut: 'Ctrl+A',
    ),
    ModelBasicTools(
      name: "all_on_active_artboard".tr,
      shortcut: 'Alt+Ctrl+A',
    ),
    ModelBasicTools(
      name: "deselect".tr,
      shortcut: 'Shift+Ctrl+A',
    ),
    ModelBasicTools(
      name: "reselect".tr,
      shortcut: 'Ctrl+6',
    ),
    ModelBasicTools(
      name: "next_object_above".tr,
      shortcut: 'Alt+Ctrl+]',
    ),
    ModelBasicTools(
      name: "next_object_below".tr,
      shortcut: 'Alt+Ctrl+[',
    ),
  ];
  //Effect
  List<ModelBasicTools> effectList = [
    ModelBasicTools(
      name: "apply_last_effect".tr,
      shortcut: 'Shift+Ctrl+E',
    ),
    ModelBasicTools(
      name: "last_effect".tr,
      shortcut: 'Alt+Shift+Ctrl+E',
    ),
  ];
  //View
  List<ModelBasicTools> viewList = [
    ModelBasicTools(
      name: "outline".tr,
      shortcut: 'Ctrl+Y',
    ),
    ModelBasicTools(
      name: "preview_on_cpu".tr,
      shortcut: 'Ctrl+E',
    ),
    ModelBasicTools(
      name: "overprint_preview".tr,
      shortcut: 'Alt+Shift+Ctrl+Y',
    ),
    ModelBasicTools(
      name: "pixel_preview".tr,
      shortcut: 'Alt+Ctrl+Y',
    ),
    ModelBasicTools(
      name: "zoom_in".tr,
      shortcut: 'Ctrl++',
    ),
    ModelBasicTools(
      name: "zoom_out".tr,
      shortcut: 'Ctrl+-',
    ),
    ModelBasicTools(
      name: "fit_artboard_in_window".tr,
      shortcut: 'Ctrl+0',
    ),
    ModelBasicTools(
      name: "fit_all_in_window".tr,
      shortcut: 'Shift+Ctrl+0',
    ),
    ModelBasicTools(
      name: "actual_size".tr,
      shortcut: 'Ctrl+1',
    ),
    ModelBasicTools(
      name: "hide_edges".tr,
      shortcut: 'Ctrl+H',
    ),
    ModelBasicTools(
      name: "hide_artboards".tr,
      shortcut: 'Shift+Ctrl+H',
    ),
    ModelBasicTools(
      name: "hide_template".tr,
      shortcut: 'Shift+Ctrl+W',
    ),
    ModelBasicTools(
      name: "hide_bounding_box".tr,
      shortcut: 'Shift+Ctrl+B',
    ),
    ModelBasicTools(
      name: "show_transparency_grid".tr,
      shortcut: 'Shift+Ctrl+D',
    ),
    ModelBasicTools(
      name: "show_rulers".tr,
      shortcut: 'Ctrl+R',
    ),
    ModelBasicTools(
      name: "change_to_artboard_rulers".tr,
      shortcut: 'Alt+Ctrl+R',
    ),
    ModelBasicTools(
      name: "hide_gradient_annotator".tr,
      shortcut: 'Alt+Ctrl+G',
    ),
    ModelBasicTools(
      name: "hide_text_threads".tr,
      shortcut: 'Shift+Ctrl+Y',
    ),
    ModelBasicTools(
      name: "smart_guides".tr,
      shortcut: 'Ctrl+U',
    ),
    ModelBasicTools(
      name: "smart_guides_perspective_grids".tr,
      shortcut: 'Shift+Ctrl+I',
    ),
    ModelBasicTools(
      name: "hide_grids".tr,
      shortcut: 'Ctrl+;',
    ),
    ModelBasicTools(
      name: "lock_grids".tr,
      shortcut: 'Alt+Ctrl+;',
    ),
    ModelBasicTools(
      name: "make_grids".tr,
      shortcut: 'Ctrl+5',
    ),
    ModelBasicTools(
      name: "release_grids".tr,
      shortcut: 'Alt+Ctrl+5',
    ),
    ModelBasicTools(
      name: "show_grids".tr,
      shortcut: 'Ctrl+"',
    ),
    ModelBasicTools(
      name: "snap_to_grids".tr,
      shortcut: 'Shift+Ctrl+"',
    ),
    ModelBasicTools(
      name: "snap_to_print".tr,
      shortcut: 'Alt+Ctrl+"',
    ),
  ];
}
