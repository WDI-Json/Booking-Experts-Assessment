/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*.{erb,haml,html,slim}'
    ],
    theme: {
        container: {
            center: true,
            padding: '1rem'
        },
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
        preflight: false
    },
};

