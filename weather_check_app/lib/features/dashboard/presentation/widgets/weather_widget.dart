import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_checking/constants/app_colors.dart';
import 'package:weather_checking/constants/sizes.dart';
import 'package:weather_checking/features/dashboard/domain/weather.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.weather,
  });
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
      child: Column(
        children: [
          EasyRichText(
            'The weather now in ${weather.cityName} is:',
            defaultStyle: const TextStyle(
                fontSize: Sizes.p32,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            patternList: [
              EasyRichTextPattern(
                targetString: weather.cityName,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
          EasyRichText(
            '${weather.temperature.toStringAsFixed(0)} degrees Celsius',
            defaultStyle: const TextStyle(
                fontSize: Sizes.p36,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            patternList: [
              EasyRichTextPattern(
                targetString: weather.temperature.toStringAsFixed(0),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          EasyRichText(
            'With a low of ${weather.low.toStringAsFixed(0)} degrees Celsius',
            defaultStyle: const TextStyle(
                fontSize: Sizes.p32,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            patternList: [
              EasyRichTextPattern(
                targetString: weather.low.toStringAsFixed(0),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          EasyRichText(
            'And a high of ${weather.high.toStringAsFixed(0)} degrees Celsius',
            defaultStyle: const TextStyle(
                fontSize: Sizes.p32,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            patternList: [
              EasyRichTextPattern(
                targetString: weather.high.toStringAsFixed(0),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          EasyRichText(
            'The humidity is at ${weather.humidity}%',
            defaultStyle: const TextStyle(
                fontSize: Sizes.p32,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            patternList: [
              EasyRichTextPattern(
                targetString: '${weather.humidity}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          EasyRichText(
            'and the wind speed is ${weather.windSpeed} m/s at ${weather.windDegrees} degrees',
            defaultStyle: const TextStyle(
                fontSize: Sizes.p32,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            patternList: [
              EasyRichTextPattern(
                targetString: '${weather.windSpeed}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const EasyRichTextPattern(
                targetString: 'm/s',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Sizes.p24,
                ),
              ),
              EasyRichTextPattern(
                targetString: '${weather.windDegrees}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const EasyRichTextPattern(
                targetString: 'degrees',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Sizes.p24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
