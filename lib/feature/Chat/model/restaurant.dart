import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  List<RestaurantElement> restaurant;

  Restaurant({
    required this.restaurant,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurant: List<RestaurantElement>.from(
            json["restaurant"].map((x) => RestaurantElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurant": List<dynamic>.from(restaurant.map((x) => x.toJson())),
      };
}

class RestaurantElement {
  String bot;
  String human;

  RestaurantElement({
    required this.bot,
    required this.human,
  });

  factory RestaurantElement.fromJson(Map<String, dynamic> json) =>
      RestaurantElement(
        bot: json["bot"],
        human: json["human"],
      );

  Map<String, dynamic> toJson() => {
        "bot": bot,
        "human": human,
      };
}
