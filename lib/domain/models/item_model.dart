import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';

class ModelBasicTools {
  String? name;
  String? shortcut;
  String? icon;
  String? video;
  String? image;
  String? widget;
  FlagsCode? flagProperty;
  Locale? locale;
  bool? Value;
  String? stepsTitle;
  List<Steps>? steps;
  List<ToolsQuestion>? toolsQuestion;
  List<TypeModel>? typeList;
  bool? isEnabled;
  bool? isAds;

  ModelBasicTools({
    this.name,
    this.shortcut,
    this.icon,
    this.video,
    this.image,
    this.widget,
    this.flagProperty,
    this.locale,
    this.Value,
    this.stepsTitle,
    this.typeList,
    this.steps,
    this.toolsQuestion,
    this.isEnabled = false,
    this.isAds = false,
  });

  ModelBasicTools.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    video = json['video'];
    shortcut = json['shortcut'];
    image = json['image'];
    widget = json['widget'];
    stepsTitle = json['stepsTitle'];
    typeList = json["typeList"];
    flagProperty = json['flagProperty'];
    Value = json['Value'];
    if (json['Steps'] != null) {
      steps = <Steps>[];
      json['Steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    if (json['ToolsQuestion'] != null) {
      toolsQuestion = <ToolsQuestion>[];
      json['ToolsQuestion'].forEach((v) {
        toolsQuestion!.add(ToolsQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['video'] = video;
    data['shortcut'] = shortcut;
    data['image'] = image;
    data['widget'] = widget;
    data['flagProperty'] = flagProperty;
    data['Value'] = Value;
    data["stepsTitle"] = stepsTitle;
    if (steps != null) {
      data['Steps'] = steps!.map((v) => v.toJson()).toList();
    }
    if (typeList != null) {
      data['typeList'] = typeList!.map((v) => v.toJson()).toList();
    }
    if (toolsQuestion != null) {
      data['ToolsQuestion'] = toolsQuestion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TypeModel {
  String? title;
  List<TypeQuestion>? shortCuts;

  TypeModel({this.title, this.shortCuts});

  TypeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortCuts = json['shortCuts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['shortCuts'] = shortCuts;
    return data;
  }
}

class Steps {
  String? step;
  String? shortCut;

  Steps({
    this.step,
    this.shortCut,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    shortCut = json['shortCut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['step'] = step;
    data['shortCut'] = shortCut;
    return data;
  }
}

class ToolsQuestion {
  String? question;
  String? answer;

  ToolsQuestion({this.question, this.answer});

  ToolsQuestion.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Question'] = question;
    data['Answer'] = answer;
    return data;
  }
}
