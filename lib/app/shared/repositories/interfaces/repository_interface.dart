abstract class IRepository {
  Future findAll();
  Future findByPage(int page);
}

abstract class IMateriaRepository {
  Future findAllMateria();
}
