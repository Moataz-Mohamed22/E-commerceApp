class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({
    this.results,
    this.metadata,
    this.data,});

  int? results;
  MetadataEntity? metadata;
  List<CategoryOrBrandEntity>? data;
}

class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,});

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,});

  int? currentPage;
  int? numberOfPages;
  int? limit;

}