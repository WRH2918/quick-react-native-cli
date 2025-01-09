---
to: <%= h.inflection.dasherize(name)%>/lingui.config.js
---
/** @type {import('@lingui/conf').LinguiConfig}
 *  npx lingui extract
 *  npx lingui extract --clean
 */
module.exports = {
  locales: ['en', 'zh'],
  sourceLocale: 'zh',
  catalogs: [
    {
      path: 'src/assets/i18n/{locale}/messages',
      include: ['src'],
    },
  ],
  format: 'po',
};
