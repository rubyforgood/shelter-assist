const colors = require('tailwindcss/colors')

module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'landing': '#13C2C2',
      }
    }
  }
}
