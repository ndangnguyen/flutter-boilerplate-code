class NewsResponse {
  NewsResponse({
    this.category,
    this.totalPost,
    this.baseThumb,
    this.subCategories,
  });

  NewsResponse.fromJson(dynamic json) {
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    totalPost = json['totalPost'];
    baseThumb = json['base_thumb'];
    subCategories = json['subCategories'] != null ? SubCategories.fromJson(json['subCategories']) : null;
  }

  Category? category;
  int? totalPost;
  String? baseThumb;
  SubCategories? subCategories;
}

class SubCategories {
  SubCategories({
    this.meoCaCuoc,
    this.soiCauMienNam,
    this.soiCauMienTrung,
    this.soiCauMienBac,
    this.giaiMaGiacMo,
    this.soiKeoBongDaC1,
    this.soiKeoBongDaY,
    this.soiKeoBongDaDuc,
    this.soiKeoBongDaLaLiga,
    this.tipsBongDa,
    this.soiKeoBongDaAnh,
    this.soiKeoBongDa,
    this.nhanDinhBongDa,
  });

  SubCategories.fromJson(dynamic json) {
    meoCaCuoc = json['meo-ca-cuoc'] != null ? SubModel.fromJson(json['meo-ca-cuoc']) : null;
    soiCauMienNam = json['soi-cau-mien-nam'] != null ? SubModel.fromJson(json['soi-cau-mien-nam']) : null;
    soiCauMienTrung = json['soi-cau-mien-trung'] != null ? SubModel.fromJson(json['soi-cau-mien-trung']) : null;
    soiCauMienBac = json['soi-cau-mien-bac'] != null ? SubModel.fromJson(json['soi-cau-mien-bac']) : null;
    giaiMaGiacMo = json['giai-ma-giac-mo'] != null ? SubModel.fromJson(json['giai-ma-giac-mo']) : null;
    soiKeoBongDaC1 = json['soi-keo-bong-da-c1'] != null ? SubModel.fromJson(json['soi-keo-bong-da-c1']) : null;
    soiKeoBongDaY = json['soi-keo-bong-da-y'] != null ? SubModel.fromJson(json['soi-keo-bong-da-y']) : null;
    soiKeoBongDaDuc = json['soi-keo-bong-da-duc'] != null ? SubModel.fromJson(json['soi-keo-bong-da-duc']) : null;
    soiKeoBongDaLaLiga = json['soi-keo-bong-da-la-liga'] != null ? SubModel.fromJson(json['soi-keo-bong-da-la-liga']) : null;
    tipsBongDa = json['tips-bong-da'] != null ? SubModel.fromJson(json['tips-bong-da']) : null;
    soiKeoBongDaAnh = json['soi-keo-bong-da-anh'] != null ? SubModel.fromJson(json['soi-keo-bong-da-anh']) : null;
    soiKeoBongDa = json['soi-keo-bong-da'] != null ? SubModel.fromJson(json['soi-keo-bong-da']) : null;
    nhanDinhBongDa = json['nhan-dinh-bong-da'] != null ? SubModel.fromJson(json['nhan-dinh-bong-da']) : null;
  }

  SubModel? meoCaCuoc;
  SubModel? soiCauMienNam;
  SubModel? soiCauMienTrung;
  SubModel? soiCauMienBac;
  SubModel? giaiMaGiacMo;
  SubModel? soiKeoBongDaC1;
  SubModel? soiKeoBongDaY;
  SubModel? soiKeoBongDaDuc;
  SubModel? soiKeoBongDaLaLiga;
  SubModel? tipsBongDa;
  SubModel? soiKeoBongDaAnh;
  SubModel? soiKeoBongDa;
  SubModel? nhanDinhBongDa;
}

class SubModel {
  SubModel({
    this.id,
    this.alias,
    this.name,
    this.posts,
  });

  SubModel.fromJson(dynamic json) {
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Post.fromJson(v));
      });
    }
  }

  int? id;
  String? alias;
  String? name;
  List<Post>? posts;
}

class Post {
  Post({
    this.alias,
    this.title,
    this.thumbnail,
    this.description,
  });

  Post.fromJson(dynamic json) {
    alias = json['alias'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
  }

  String? alias;
  String? title;
  String? thumbnail;
  String? description;
}

class Category {
  Category({
    this.alias,
    this.name,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.content,
    this.lang,
    this.parentId,
    this.status,
    this.id,
    this.createdTime,
    this.lastUpdatedTime,
  });

  Category.fromJson(dynamic json) {
    alias = json['alias'];
    name = json['name'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    content = json['content'];
    lang = json['lang'];
    parentId = json['parent_id'];
    status = json['status'];
    id = json['id'];
    createdTime = json['created_time'];
    lastUpdatedTime = json['last_updated_time'];
  }

  String? alias;
  String? name;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? content;
  String? lang;
  int? parentId;
  String? status;
  int? id;
  String? createdTime;
  String? lastUpdatedTime;
}

class SubNewsContent {
  Category? category;
  int? totalPost;
  String? baseThumb;
  List<Post>? posts;

  SubNewsContent.fromJson(dynamic json) {
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    totalPost = json['totalPost'];
    baseThumb = json['base_thumb'];
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Post.fromJson(v));
      });
    }
  }
}
