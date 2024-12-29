import 'package:flag/flag_enum.dart';
import 'package:flutter/cupertino.dart';

class BasicToolsModel {
  String? name;
  String? shortcut;
  String? icon;
  String? video;
  String? image;
  String? widget;
  FlagsCode? flagProperty;
  Locale? locale;
  bool? Value;
  List<Steps>? steps;
  List<ToolsQuestion>? toolsQuestion;
  bool? isEnabled;
  bool? isAds;

  BasicToolsModel({
    this.name,
    this.shortcut,
    this.icon,
    this.video,
    this.image,
    this.widget,
    this.flagProperty,
    this.locale,
    this.Value,
    this.steps,
    this.toolsQuestion,
    this.isEnabled = false,
    this.isAds = false,
  });

  BasicToolsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    video = json['video'];
    shortcut = json['shortcut'];
    image = json['image'];
    widget = json['widget'];
    flagProperty = json['flagProperty'];
    Value = json['Value'];
    if (json['Steps'] != null) {
      steps = <Steps>[];
      json['Steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
      });
    }
    if (json['ToolsQuestion'] != null) {
      toolsQuestion = <ToolsQuestion>[];
      json['ToolsQuestion'].forEach((v) {
        toolsQuestion!.add(new ToolsQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['video'] = this.video;
    data['shortcut'] = this.shortcut;
    data['image'] = this.image;
    data['widget'] = this.widget;
    data['flagProperty'] = this.flagProperty;
    data['Value'] = this.Value;
    if (this.steps != null) {
      data['Steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    if (this.toolsQuestion != null) {
      data['ToolsQuestion'] =
          this.toolsQuestion!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step'] = this.step;
    data['shortCut'] = this.shortCut;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Question'] = this.question;
    data['Answer'] = this.answer;
    return data;
  }
}
