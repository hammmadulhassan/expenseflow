part of 'category.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Category extends $Category
    with RealmEntity, RealmObjectBase, RealmObject {
  late final String catUserId; // Adding catUserId field to the class definition

  Category(
      String name,
      int colorValue,
      String catUserId, // Adding catUserId parameter to the constructor
      ) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'colorValue', colorValue);
    this.catUserId = catUserId; // Setting catUserId
  }

  Category._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  @override
  int get colorValue => RealmObjectBase.get<int>(this, 'colorValue') as int;
  @override
  set colorValue(int value) => throw RealmUnsupportedSetError();

   // Getter for catUserId
  //set catUserId(String value) => throw RealmUnsupportedSetError(); // Setter for catUserId

  @override
  Stream<RealmObjectChanges<Category>> get changes =>
      RealmObjectBase.getChanges<Category>(this);

  @override
  Category freeze() => RealmObjectBase.freezeObject<Category>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Category._);
    return const SchemaObject(ObjectType.realmObject, Category, 'Category', [
      SchemaProperty('name', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('colorValue', RealmPropertyType.int),
    ]);
  }
}
