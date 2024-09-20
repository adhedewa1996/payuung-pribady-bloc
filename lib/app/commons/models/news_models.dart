import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.name,
    this.channelid,
    this.limit,
    this.start,
    this.count,
    this.updatedDate,
    this.processTime,
    this.connection,
    this.info,
    this.data,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json['status'],
        name: json['name'],
        channelid: json['channelid'],
        limit: json['limit'],
        start: json['start'],
        count: json['count'],
        updatedDate: json['updated_date'] == null
            ? null
            : DateTime.parse(json['updated_date']),
        processTime: json['process_time'],
        connection: json['connection'],
        info: json['info'],
        data: json['data'] == null
            ? []
            : List<NewsModelDatum>.from(
                json['data']!.map((x) => NewsModelDatum.fromJson(x))),
      );

  int? status;
  String? name;
  String? channelid;
  int? limit;
  int? start;
  int? count;
  DateTime? updatedDate;
  String? processTime;
  String? connection;
  String? info;
  List<NewsModelDatum>? data;

  NewsModel copyWith({
    int? status,
    String? name,
    String? channelid,
    int? limit,
    int? start,
    int? count,
    DateTime? updatedDate,
    String? processTime,
    String? connection,
    String? info,
    List<NewsModelDatum>? data,
  }) =>
      NewsModel(
        status: status ?? this.status,
        name: name ?? this.name,
        channelid: channelid ?? this.channelid,
        limit: limit ?? this.limit,
        start: start ?? this.start,
        count: count ?? this.count,
        updatedDate: updatedDate ?? this.updatedDate,
        processTime: processTime ?? this.processTime,
        connection: connection ?? this.connection,
        info: info ?? this.info,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'channelid': channelid,
        'limit': limit,
        'start': start,
        'count': count,
        'updated_date': updatedDate?.toIso8601String(),
        'process_time': processTime,
        'connection': connection,
        'info': info,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NewsModelDatum {
  NewsModelDatum({
    this.total,
    this.data,
  });

  factory NewsModelDatum.fromJson(Map<String, dynamic> json) => NewsModelDatum(
        total: json['total'],
        data: json['data'] == null
            ? []
            : List<DatumDatum>.from(
                json['data']!.map((x) => DatumDatum.fromJson(x))),
      );
  int? total;
  List<DatumDatum>? data;

  NewsModelDatum copyWith({
    int? total,
    List<DatumDatum>? data,
  }) =>
      NewsModelDatum(
        total: total ?? this.total,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumDatum {
  DatumDatum({
    this.channelId,
    this.contentId,
    this.brightcoveId,
    this.channelName,
    this.timeAgo,
    this.published,
    this.publishedOri,
    this.lastPublished,
    this.title,
    this.thumbnail,
    this.thumbnailLandscape,
    this.imageContent,
    this.images,
    this.video,
    this.url,
    this.summary,
    this.type,
    this.key,
    this.ipAddress,
    this.subTitleId,
    this.subContent,
  });

  factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
        channelId: json['channel_id'],
        contentId: json['content_id'],
        brightcoveId: json['brightcove_id'],
        channelName: json['channel_name'],
        timeAgo: json['time_ago'],
        published: json['published'],
        publishedOri: json['published_ori'] == null
            ? null
            : DateTime.parse(json['published_ori']),
        lastPublished: json['last_published'],
        title: json['title'],
        thumbnail: json['thumbnail'],
        thumbnailLandscape: json['thumbnail_landscape'],
        imageContent: json['image_content'],
        images: json['images'] == null
            ? []
            : List<dynamic>.from(json['images']!.map((x) => x)),
        video: json['video'],
        url: json['url'],
        summary: json['summary'],
        type: json['type'],
        key: json['key'],
        ipAddress: json['ip_address'],
        subTitleId: json['sub_title_id'],
        subContent: json['sub_content'] == null
            ? []
            : List<dynamic>.from(json['sub_content']!.map((x) => x)),
      );
  String? channelId;
  String? contentId;
  dynamic brightcoveId;
  String? channelName;
  String? timeAgo;
  String? published;
  DateTime? publishedOri;
  String? lastPublished;
  String? title;
  String? thumbnail;
  String? thumbnailLandscape;
  String? imageContent;
  List<dynamic>? images;
  String? video;
  String? url;
  String? summary;
  String? type;
  int? key;
  String? ipAddress;
  String? subTitleId;
  List<dynamic>? subContent;

  DatumDatum copyWith({
    String? channelId,
    String? contentId,
    dynamic brightcoveId,
    String? channelName,
    String? timeAgo,
    String? published,
    DateTime? publishedOri,
    String? lastPublished,
    String? title,
    String? thumbnail,
    String? thumbnailLandscape,
    String? imageContent,
    List<dynamic>? images,
    String? video,
    String? url,
    String? summary,
    String? type,
    int? key,
    String? ipAddress,
    String? subTitleId,
    List<dynamic>? subContent,
  }) =>
      DatumDatum(
        channelId: channelId ?? this.channelId,
        contentId: contentId ?? this.contentId,
        brightcoveId: brightcoveId ?? this.brightcoveId,
        channelName: channelName ?? this.channelName,
        timeAgo: timeAgo ?? this.timeAgo,
        published: published ?? this.published,
        publishedOri: publishedOri ?? this.publishedOri,
        lastPublished: lastPublished ?? this.lastPublished,
        title: title ?? this.title,
        thumbnail: thumbnail ?? this.thumbnail,
        thumbnailLandscape: thumbnailLandscape ?? this.thumbnailLandscape,
        imageContent: imageContent ?? this.imageContent,
        images: images ?? this.images,
        video: video ?? this.video,
        url: url ?? this.url,
        summary: summary ?? this.summary,
        type: type ?? this.type,
        key: key ?? this.key,
        ipAddress: ipAddress ?? this.ipAddress,
        subTitleId: subTitleId ?? this.subTitleId,
        subContent: subContent ?? this.subContent,
      );

  Map<String, dynamic> toJson() => {
        'channel_id': channelId,
        'content_id': contentId,
        'brightcove_id': brightcoveId,
        'channel_name': channelName,
        'time_ago': timeAgo,
        'published': published,
        'published_ori': publishedOri?.toIso8601String(),
        'last_published': lastPublished,
        'title': title,
        'thumbnail': thumbnail,
        'thumbnail_landscape': thumbnailLandscape,
        'image_content': imageContent,
        'images':
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        'video': video,
        'url': url,
        'summary': summary,
        'type': type,
        'key': key,
        'ip_address': ipAddress,
        'sub_title_id': subTitleId,
        'sub_content': subContent == null
            ? []
            : List<dynamic>.from(subContent!.map((x) => x)),
      };
}
