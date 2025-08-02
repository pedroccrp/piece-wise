class SchemaBuilder {
  static String generateCreateTableQuery(
    String tableName,
    Map<String, String> fields,
  ) {
    final columns = fields.entries.map((e) => '${e.key} ${e.value}').join(', ');
    return 'CREATE TABLE $tableName ($columns);';
  }
}
