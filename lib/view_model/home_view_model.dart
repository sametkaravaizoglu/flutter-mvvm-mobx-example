import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../model/post_model.dart';
import '../network/service.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  PostModel? post;

  int postId = 1;

  @action
  getPost() {
    try {
      Service.get('posts/$postId').then(
        (response) {
          post = postModelFromJson(response);
          postId++;
        },
      );
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }
}
