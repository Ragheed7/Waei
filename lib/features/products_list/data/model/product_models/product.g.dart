// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: (json['productId'] as num).toInt(),
      category: json['category'] == null
          ? null
          : CategoryData.fromJson(json['category'] as Map<String, dynamic>),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      material: json['material'] == null
          ? null
          : ProductMaterial.fromJson(json['material'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : Style.fromJson(json['style'] as Map<String, dynamic>),
      color: (json['color'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      productStatus: (json['productStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'category': instance.category?.toJson(),
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'material': instance.material?.toJson(),
      'style': instance.style?.toJson(),
      'color': instance.color,
      'height': instance.height,
      'width': instance.width,
      'weight': instance.weight,
      'price': instance.price,
      'brand': instance.brand?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'productStatus': instance.productStatus,
    };
