import 'package:dart_hub/data/user.dart';
import 'package:dart_hub/manager/user_paginator.dart';
import 'package:dart_hub/ui/paginated_list_screen.dart';
import 'package:dart_hub/ui/user_tile.dart';
import 'package:flutter/material.dart';

class SubscribersScreen extends StatelessWidget {

  final SubscribersPaginatorFactory _paginatorFactory;
  final String _username;
  final String _repo;

  SubscribersScreen(this._paginatorFactory, this._username, this._repo);

  @override
  Widget build(BuildContext context) {
    return new PaginatedListScreen<User>(
      title: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(_username),
            new Text('${_repo} • Subscribers', style: new TextStyle(fontSize: 12.0))
          ]
      ),
      paginatorFactory: _paginatorFactory,
      itemBuilder: _buildUserTile,
    );
  }

  Widget _buildUserTile(BuildContext context, User user) {
    return new UserTile(user);
  }
}