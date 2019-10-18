// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // line height as a relative unit
    lineHeight: 1.08,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(244, 191, 117, 0.8)',

    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // color of the text
    foregroundColor: '#d0d0d0',

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: 'rgba(21, 21, 21, 0.85)',

    // terminal selection color
    selectionColor: 'rgba(244, 191, 117, 0.3)',

    // border color (window, tabs)
    borderColor: '#f4bf75',

    // custom CSS to embed in the main window
    css: `
      .term_wrapper {
        overflow: visible;
      }
    `,

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    // molokai
    // colors: {
    //   black: '#121212',
    //   red: '#fa2573',
    //   green: '#98e123',
    //   yellow: '#dfd460',
    //   blue: '#1080d0',
    //   magenta: '#8700ff',
    //   cyan: '#43a8d0',
    //   white: '#bbbbbb',
    //   lightBlack: '#555555',
    //   lightRed: '#f6669d',
    //   lightGreen: '#b1e05f',
    //   lightYellow: '#fff26d',
    //   lightBlue: '#00afff',
    //   lightMagenta: '#af87ff',
    //   lightCyan: '#51ceff',
    //   lightWhite: '#ffffff'
    // },
    // default
    colors: {
      black: '#151515',
      red: '#ac4142',
      green: '#90a959',
      yellow: '#f4bf75',
      blue: '#6a9fb5',
      magenta: '#aa759f',
      cyan: '#75b5aa',
      white: '#d0d0d0',
      lightBlack: '#505050',
      lightRed: '#ac4142',
      lightGreen: '#90a959',
      lightYellow: '#f4bf75',
      lightBlue: '#6a9fb5',
      lightMagenta: '#aa759f',
      lightCyan: '#75b5aa',
      lightWhite: '#f5f5f5'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: 'SOUND',

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyper-tab-icons-plus',
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
