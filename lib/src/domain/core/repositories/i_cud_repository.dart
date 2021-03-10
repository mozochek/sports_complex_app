abstract class ICudRepository<T> {
  Future<void> create(T obj);
  Future<void> update(T obj);
  Future<void> delete(T obj);
}