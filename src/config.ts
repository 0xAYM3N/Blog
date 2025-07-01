import type { ThemeObjectOrShikiThemeName } from 'astro-expressive-code'

type Config = {
  author: string
  title: string
  lang: string
  themes: {
    dark: ThemeObjectOrShikiThemeName
    light: ThemeObjectOrShikiThemeName
  }
}

export default {
  author: 'Aymen',
  title: 'Journal',
  lang: 'ar',
  themes: {
    dark: 'github-dark',
    light: 'github-light',
  },
} satisfies Config
