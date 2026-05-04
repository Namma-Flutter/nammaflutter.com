import 'package:jaspr/dom.dart';

const primaryColor = Color('#01589B');
const primaryColorDark = Color('#013E6E');
const accentColor = Color('#13B9FD');
const surfaceColor = Colors.white;
const surfaceMuted = Color('#F4F7FA');
const textColor = Color('#0E1A24');
const mutedTextColor = Color('#5A6B7A');
const borderColor = Color('#E2E8F0');

@css
List<StyleRule> get globalStyles => [
  css.import('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap'),
  css('*, *::before, *::after').styles(
    boxSizing: .borderBox,
  ),
  css('html').styles(
    raw: {'scroll-behavior': 'smooth'},
  ),
  css('html, body').styles(
    width: 100.percent,
    minHeight: 100.vh,
    padding: .zero,
    margin: .zero,
    color: textColor,
    fontFamily: const .list([FontFamily('Inter'), FontFamilies.sansSerif]),
    fontSize: 16.px,
    lineHeight: 1.6.em,
    backgroundColor: surfaceColor,
  ),
  css('h1, h2, h3, h4').styles(
    margin: .zero,
    color: textColor,
    fontWeight: .w700,
    lineHeight: 1.2.em,
  ),
  css('p').styles(
    margin: .zero,
    color: mutedTextColor,
    lineHeight: 1.7.em,
  ),
  css('a').styles(
    color: .currentColor,
    textDecoration: TextDecoration(line: .none),
  ),
  css('img').styles(
    display: .block,
    maxWidth: 100.percent,
  ),
  css('ul, ol').styles(
    padding: .zero,
    margin: .zero,
    raw: {'list-style': 'none'},
  ),
  css('.container').styles(
    maxWidth: 1120.px,
    padding: .symmetric(horizontal: 24.px),
    margin: .symmetric(horizontal: .auto),
  ),
  css.media(MediaQuery.screen(maxWidth: 768.px), [
    css('.container').styles(padding: .symmetric(horizontal: 16.px)),
  ]),
];
