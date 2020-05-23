// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    String status;
    String copyright;
    String section;
    DateTime lastUpdated;
    int numResults;
    List<Result> results;

    NewsModel({
        this.status,
        this.copyright,
        this.section,
        this.lastUpdated,
        this.numResults,
        this.results,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        copyright: json["copyright"],
        section: json["section"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        numResults: json["num_results"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "section": section,
        "last_updated": lastUpdated.toIso8601String(),
        "num_results": numResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String section;
    String subsection;
    String title;
    String resultAbstract;
    String url;
    String uri;
    String byline;
    ItemType itemType;
    DateTime updatedDate;
    DateTime createdDate;
    DateTime publishedDate;
    String materialTypeFacet;
    String kicker;
    List<String> desFacet;
    List<String> orgFacet;
    List<String> perFacet;
    List<String> geoFacet;
    List<Multimedia> multimedia;
    String shortUrl;

    Result({
        this.section,
        this.subsection,
        this.title,
        this.resultAbstract,
        this.url,
        this.uri,
        this.byline,
        this.itemType,
        this.updatedDate,
        this.createdDate,
        this.publishedDate,
        this.materialTypeFacet,
        this.kicker,
        this.desFacet,
        this.orgFacet,
        this.perFacet,
        this.geoFacet,
        this.multimedia,
        this.shortUrl,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        section: json["section"],
        subsection: json["subsection"],
        title: json["title"],
        resultAbstract: json["abstract"],
        url: json["url"],
        uri: json["uri"],
        byline: json["byline"],
        itemType: itemTypeValues.map[json["item_type"]],
        updatedDate: DateTime.parse(json["updated_date"]),
        createdDate: DateTime.parse(json["created_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        materialTypeFacet: json["material_type_facet"],
        kicker: json["kicker"],
        desFacet: List<String>.from(json["des_facet"].map((x) => x)),
        orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
        perFacet: List<String>.from(json["per_facet"].map((x) => x)),
        geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
        multimedia: List<Multimedia>.from(json["multimedia"].map((x) => Multimedia.fromJson(x))),
        shortUrl: json["short_url"],
    );

    Map<String, dynamic> toJson() => {
        "section": section,
        "subsection": subsection,
        "title": title,
        "abstract": resultAbstract,
        "url": url,
        "uri": uri,
        "byline": byline,
        "item_type": itemTypeValues.reverse[itemType],
        "updated_date": updatedDate.toIso8601String(),
        "created_date": createdDate.toIso8601String(),
        "published_date": publishedDate.toIso8601String(),
        "material_type_facet": materialTypeFacet,
        "kicker": kicker,
        "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
        "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
        "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
        "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "short_url": shortUrl,
    };
}

enum ItemType { ARTICLE }

final itemTypeValues = EnumValues({
    "Article": ItemType.ARTICLE
});

class Multimedia {
    String url;
    Format format;
    int height;
    int width;
    Type type;
    Subtype subtype;
    String caption;
    String copyright;

    Multimedia({
        this.url,
        this.format,
        this.height,
        this.width,
        this.type,
        this.subtype,
        this.caption,
        this.copyright,
    });

    factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
        format: formatValues.map[json["format"]],
        height: json["height"],
        width: json["width"],
        type: typeValues.map[json["type"]],
        subtype: subtypeValues.map[json["subtype"]],
        caption: json["caption"],
        copyright: json["copyright"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "format": formatValues.reverse[format],
        "height": height,
        "width": width,
        "type": typeValues.reverse[type],
        "subtype": subtypeValues.reverse[subtype],
        "caption": caption,
        "copyright": copyright,
    };
}

enum Format { SUPER_JUMBO, STANDARD_THUMBNAIL, THUMB_LARGE, MEDIUM_THREE_BY_TWO210, NORMAL }

final formatValues = EnumValues({
    "mediumThreeByTwo210": Format.MEDIUM_THREE_BY_TWO210,
    "Normal": Format.NORMAL,
    "Standard Thumbnail": Format.STANDARD_THUMBNAIL,
    "superJumbo": Format.SUPER_JUMBO,
    "thumbLarge": Format.THUMB_LARGE
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({
    "photo": Subtype.PHOTO
});

enum Type { IMAGE }

final typeValues = EnumValues({
    "image": Type.IMAGE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
