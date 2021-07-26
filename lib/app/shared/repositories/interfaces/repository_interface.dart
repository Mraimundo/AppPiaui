abstract class IRepository {
  Future findAll();
  Future findByPage(int page);
}

abstract class IntenalRepository {
  Future findByTitle(int title);
}
