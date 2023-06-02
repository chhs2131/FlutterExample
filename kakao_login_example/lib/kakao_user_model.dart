class KakaoUserModel {
  final String uuid, profileImageUrl, gender, accessToken;

  KakaoUserModel.fromJson(this.accessToken, Map<String, dynamic> json)
      : uuid = json['id'].toString(),
        profileImageUrl = json['kakao_account']['profile']['profile_image_url'],
        gender = json['kakao_account']['gender'];
}
