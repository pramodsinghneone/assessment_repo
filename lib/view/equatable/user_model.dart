import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  const UserDetail({required this.username, required this.id});

  final String username;
  final int id;

  @override
  List<Object?> get props => [username, id];
}
