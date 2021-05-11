abstract class ICudRepository<T> {
  Future<void> create(T obj);
  Future<void> update(T obj, {T? initObj});
  Future<void> delete(T obj);
}