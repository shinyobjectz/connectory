-- Instagram — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/instagram.com/1.0.0/swagger.json
-- APIs.guru's mirror, matched on instagram.com. A mirror lags the vendor.
-- 24 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "instagram",
  name = "Instagram",
  base = "https://graph.instagram.com",
  docs = "https://nango.dev/docs/api-integrations/instagram",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "INSTAGRAM_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["instagram.delete_media_media_id_comments_comment_id"] = { method = "DELETE", url = "https://graph.instagram.com/v1/media/{media-id}/comments/{comment-id}", path = {"media-id", "comment-id"} },
    ["instagram.delete_media_media_id_likes"] = { method = "DELETE", url = "https://graph.instagram.com/v1/media/{media-id}/likes", path = {"media-id"} },
    ["instagram.get_locations_location_id"] = { method = "GET", url = "https://graph.instagram.com/v1/locations/{location-id}", path = {"location-id"} },
    ["instagram.get_locations_location_id_media_recent"] = { method = "GET", url = "https://graph.instagram.com/v1/locations/{location-id}/media/recent", path = {"location-id"}, query = {"min_timestamp", "max_timestamp", "min_id", "max_id"} },
    ["instagram.get_locations_search"] = { method = "GET", url = "https://graph.instagram.com/v1/locations/search", query = {"distance", "facebook_places_id", "foursquare_id", "lat", "lng", "foursquare_v2_id"} },
    ["instagram.get_media_media_id"] = { method = "GET", url = "https://graph.instagram.com/v1/media/{media-id}", path = {"media-id"} },
    ["instagram.get_media_media_id_comments"] = { method = "GET", url = "https://graph.instagram.com/v1/media/{media-id}/comments", path = {"media-id"} },
    ["instagram.get_media_media_id_likes"] = { method = "GET", url = "https://graph.instagram.com/v1/media/{media-id}/likes", path = {"media-id"} },
    ["instagram.get_media_search"] = { method = "GET", url = "https://graph.instagram.com/v1/media/search", query = {"lat", "lng", "min_timestamp", "max_timestamp", "distance"} },
    ["instagram.get_media_shortcode_shortcode"] = { method = "GET", url = "https://graph.instagram.com/v1/media/shortcode/{shortcode}", path = {"shortcode"} },
    ["instagram.get_tags_search"] = { method = "GET", url = "https://graph.instagram.com/v1/tags/search", query = {"q"} },
    ["instagram.get_tags_tag_name"] = { method = "GET", url = "https://graph.instagram.com/v1/tags/{tag-name}", path = {"tag-name"} },
    ["instagram.get_tags_tag_name_media_recent"] = { method = "GET", url = "https://graph.instagram.com/v1/tags/{tag-name}/media/recent", path = {"tag-name"}, query = {"count", "min_tag_id", "max_tag_id"} },
    ["instagram.get_users_search"] = { method = "GET", url = "https://graph.instagram.com/v1/users/search", query = {"q", "count"} },
    ["instagram.get_users_self_media_liked"] = { method = "GET", url = "https://graph.instagram.com/v1/users/self/media/liked", query = {"count", "max_like_id"} },
    ["instagram.get_users_self_requested_by"] = { method = "GET", url = "https://graph.instagram.com/v1/users/self/requested-by" },
    ["instagram.get_users_user_id"] = { method = "GET", url = "https://graph.instagram.com/v1/users/{user-id}", path = {"user-id"} },
    ["instagram.get_users_user_id_followed_by"] = { method = "GET", url = "https://graph.instagram.com/v1/users/{user-id}/followed-by", path = {"user-id"} },
    ["instagram.get_users_user_id_follows"] = { method = "GET", url = "https://graph.instagram.com/v1/users/{user-id}/follows", path = {"user-id"} },
    ["instagram.get_users_user_id_media_recent"] = { method = "GET", url = "https://graph.instagram.com/v1/users/{user-id}/media/recent", path = {"user-id"}, query = {"count", "max_timestamp", "min_timestamp", "min_id", "max_id"} },
    ["instagram.get_users_user_id_relationship"] = { method = "GET", url = "https://graph.instagram.com/v1/users/{user-id}/relationship", path = {"user-id"} },
    ["instagram.post_media_media_id_comments"] = { method = "POST", url = "https://graph.instagram.com/v1/media/{media-id}/comments", path = {"media-id"}, query = {"text"} },
    ["instagram.post_media_media_id_likes"] = { method = "POST", url = "https://graph.instagram.com/v1/media/{media-id}/likes", path = {"media-id"} },
    ["instagram.post_users_user_id_relationship"] = { method = "POST", url = "https://graph.instagram.com/v1/users/{user-id}/relationship", path = {"user-id"}, query = {"action"} },
  },
}
