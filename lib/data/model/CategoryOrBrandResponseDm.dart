import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDm({
    super.results,
    super.metadata,
    super.data,
    this.statusMsg,
    this.message,
  });

  CategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDm.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class CategoryOrBrandDm extends CategoryOrBrandEntity {
  CategoryOrBrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryOrBrandDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
