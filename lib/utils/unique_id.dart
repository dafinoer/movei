



import 'package:uuid/uuid.dart';

class UniqueId {
  final _uuid = Uuid();

  String generatedUniqueIdTimeBased(){
    final uuidV5 = _uuid.v1();
    return uuidV5;
  }
}