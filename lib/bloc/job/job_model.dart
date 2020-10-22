import 'dart:convert';

class JobModel {
    JobModel({
        this.id,
        this.type,
        this.url,
        this.createdAt,
        this.company,
        this.companyUrl,
        this.location,
        this.title,
        this.description,
        this.howToApply,
        this.companyLogo,
    });

    final String id;
    final String type;
    final String url;
    final String createdAt;
    final String company;
    final String companyUrl;
    final String location;
    final String title;
    final String description;
    final String howToApply;
    final String companyLogo;

    JobModel copyWith({
        String id,
        String type,
        String url,
        String createdAt,
        String company,
        String companyUrl,
        String location,
        String title,
        String description,
        String howToApply,
        String companyLogo,
    }) => 
        JobModel(
            id: id ?? this.id,
            type: type ?? this.type,
            url: url ?? this.url,
            createdAt: createdAt ?? this.createdAt,
            company: company ?? this.company,
            companyUrl: companyUrl ?? this.companyUrl,
            location: location ?? this.location,
            title: title ?? this.title,
            description: description ?? this.description,
            howToApply: howToApply ?? this.howToApply,
            companyLogo: companyLogo ?? this.companyLogo,
        );

    factory JobModel.fromRawJson(String str) => JobModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        company: json["company"] == null ? null : json["company"],
        companyUrl: json["company_url"] == null ? null : json["company_url"],
        location: json["location"] == null ? null : json["location"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        howToApply: json["how_to_apply"] == null ? null : json["how_to_apply"],
        companyLogo: json["company_logo"] == null ? null : json["company_logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "url": url == null ? null : url,
        "created_at": createdAt == null ? null : createdAt,
        "company": company == null ? null : company,
        "company_url": companyUrl == null ? null : companyUrl,
        "location": location == null ? null : location,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "how_to_apply": howToApply == null ? null : howToApply,
        "company_logo": companyLogo == null ? null : companyLogo,
    };
}
