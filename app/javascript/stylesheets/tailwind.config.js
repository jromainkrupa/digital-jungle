module.exports = {
  purge: {
    enabled: ["production", "staging"].includes(process.env.NODE_ENV),
    content: [
      "./**/*.html.erb",
      "./app/helpers/**/*.rb",
      "./app/javascript/**/*.js",
    ],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    boxShadow: {
      sm: "0 1px 2px 0 rgba(0, 0, 0, 0.05)",
      DEFAULT: "10px 10px 50px rgba(3, 10, 3, 0.1)",
      md: "0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)",
      lg: "0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)",
      xl: "0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)",
      "2xl": "0 25px 50px -12px rgba(0, 0, 0, 0.25)",
      "3xl": "0 35px 60px -15px rgba(0, 0, 0, 0.3)",
      inner: "inset 0 2px 4px 0 rgba(0, 0, 0, 0.06)",
      none: "none",
    },
    extend: {
      fontFamily: {
        sans: ["Poppins", "Arial", "sans-serif"],
      },
      colors: {
        primary: {
          50: "#F6F7FF",
          100: "#EDF0FE",
          200: "#D2D9FD",
          300: "#B6C1FB",
          400: "#8093F9",
          500: "#4965F6",
          600: "#425BDD",
          700: "#2C3D94",
          800: "#212D6F",
          900: "#161E4A",
        },
        secondary: {
          50: "#F5FDF9",
          100: "#ECFAF4",
          200: "#CFF3E3",
          300: "#B2ECD2",
          400: "#78DDB0",
          500: "#3ECF8E",
          600: "#38BA80",
          700: "#257C55",
          800: "#1C5D40",
          900: "#133E2B",
        },
        tertiary: {
          50: "#F7F7F8",
          100: "#EEEEF1",
          200: "#D5D5DB",
          300: "#BCBCC5",
          400: "#898A9A",
          500: "#57586E",
          600: "#4E4F63",
          700: "#343542",
          800: "#272832",
          900: "#1A1A21",
        },
        danger: {
          50: "#FEF8F8",
          100: "#FEF2F2",
          200: "#FCDEDE",
          300: "#FACACA",
          400: "#F7A3A3",
          500: "#F37B7B",
          600: "#DB6F6F",
          700: "#924A4A",
          800: "#6D3737",
          900: "#492525",
        },
        "code-400": "#fefcf9",
        "code-600": "#3c455b",
        aquamarine: {
          50: "#f3fffc",
          100: "#e7fffa",
          200: "#c3fff2",
          300: "#9fffea",
          400: "#58ffdb",
          500: "#10ffcb",
          600: "#0ee6b7",
          700: "#0cbf98",
          800: "#0a997a",
          900: "#087d63",
        },
        gold: {
          DEFAULT: "#DCBA7D",
        },
        rock: {
          DEFAULT: "#E5E4CD",
        },
        smoke: {
          DEFAULT: "#ADB77C",
        },
        hippie: {
          DEFAULT: "#6A8A50",
        },
        clover: {
          50: "#f5f6f4",
          100: "#ebeee9",
          200: "#cdd4c8",
          300: "#afbaa7",
          400: "#738765",
          500: "#375323",
          600: "#324b20",
          700: "#293e1a",
          800: "#213215",
          900: "#1b2911",
        },
        marshland: {
          50: "#f2f3f2",
          100: "#e6e7e6",
          200: "#c0c2c0",
          300: "#9a9d9a",
          400: "#4f544f",
          500: "#030A03",
          600: "#030903",
          700: "#020802",
          800: "#020602",
          900: "#010501",
        },
        terracotta: {
          DEFAULT: "#A9271D",
        },
        roman: {
          50: "#fef6f6",
          100: "#fcedee",
          200: "#f9d3d3",
          300: "#f5b9b9",
          400: "#ed8485",
          500: "#e54f50",
          600: "#ce4748",
          700: "#ac3b3c",
          800: "#892f30",
          900: "#702727",
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
