/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/views/**/*.{html,haml,erb}"],
  theme: {
    extend: {
      colors: {
        primary:
          "color-mix(in oklab, var(--brand) calc(100% * <alpha-value>), transparent)",
        "on-primary":
          "color-mix(in oklab, var(--on-brand) calc(100% * <alpha-value>), transparent)",
      },
    },
  },
  corePlugins: {
    preflight: false,
    container: false,
  },
};
