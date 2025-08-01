import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:flutter/material.dart';

class HomeState {
  List<Local> local;
  HomeState(this.local);
}

class HomeViewModel extends Notifier