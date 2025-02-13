import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repositories/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/failures/failures.dart';
import '../entities/CategoryOrBrandResponseEntity.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> execute() {
    return homeRepository.getAllBrands();
  }
}
