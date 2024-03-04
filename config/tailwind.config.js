const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      textColor: {
        primary: '#1E3A8A',
        light: '#E0E7FF',
        dark: '#1B2C51',
        grey: "6B7280",
        darkgrey:"111827"
      },
      backgroundColor: {
        primary: '#1E3A8A',
        light: '#E0E7FF',
        dark: '#1B2C51',
        grey: "6B7280",
        darkgrey:"111827"
      },
      borderColor: {
        primary: '#1E3A8A',
        light: '#E0E7FF',
        dark: '#1B2C51',
        grey: "6B7280",
        darkgrey:"111827"
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
