import 'package:cuidapet_leia/app/core/database/migrations/migration.dart';
import 'package:cuidapet_leia/app/core/database/migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migration> getUpdateMigrations(int version) {
    /*
    if version....
   
    if(version =2){
return [v1,v2]
    } */
    return [];
  }
}
