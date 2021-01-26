abstract class IRepository {
  Future findAll();
  Future findByPage(int page);
}
