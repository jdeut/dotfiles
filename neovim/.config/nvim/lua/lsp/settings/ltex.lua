return {
   ltex = {
      enabled = true,
      diagnosticSeverity = "information",
      language = 'de-DE',
      setenceCacheSize = 2000,
      checkFrequency = 'save',
      latex = {
         commands = {
            ['\\pgfplotsset{}'] = 'ignore',
            ['\\tikzset{}'] = 'ignore',
            ['\\ctikzset{}'] = 'ignore',
            ['\\pgfplotstableread[]{}'] = 'ignore',
            ['\\tcbuselibrary{}'] = 'ignore',
            ['\\usepgfplotslibrary{}'] = 'ignore',
            ['\\usepgfplotslibrary[]{}'] = 'ignore',
            ['\\RequirePackage[]{}'] = 'ignore',
            ['\\pgfdeclarelayer{}'] = 'ignore',
            ['\\pgfsetlayers{}'] = 'ignore',
            ['\\NewEnviron{}{}'] = 'ignore',
            ['\\setbeamertemplate{}{}'] = 'ignore',
            ['\\setbeamertemplate{}[]'] = 'ignore',
            ['\\setbeamercolor{}{}'] = 'ignore',
            ['\\setbeamerfont{}{}'] = 'ignore',
            ['\\tableofcontents[]'] = 'ignore',
            ['\\NiceMatrixOptions{}'] = 'ignore',
            ['\\ctikzsetstyle{}'] = 'ignore',
            ['\\setbohr{}'] = 'ignore',
            ['\\rowcolor{}'] = 'ignore',
            ['\\printnames{}'] = 'ignore',
            ['\\printfield{}'] = 'ignore',
            ['\\printtext{}'] = 'ignore',
            ['\\printlist{}'] = 'ignore',
            ['\\pgfplotstabletypeset[]'] = 'ignore',
            ['\\tcbitem[]'] = 'ignore',
            ['\\slashfrac{}'] = 'ignore',
            ['\\tcbset{}'] = 'ignore'
         },
         environments = {
            ['circuitikz'] = 'ignore',
            ['luacode'] = 'ignore',
            ['luacode*'] = 'ignore',
            ['filecontents*'] = 'ignore',
            ['filecontents'] = 'ignore'
         }
      },
      ['ltex-ls'] = {
         logLevel = 'warning'
      }
   }
}
