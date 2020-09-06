const fs = require('fs')

fs.writeFileSync('./README.md',
  fs
    .readFileSync('./.kutectl.bash')
    .toString()
    .split('\n')
    .filter(string => string.startsWith('# @'))
    .map(string => string.substr(3).split(' '))
    .map(([type, ...text]) => ({
      type,
      text: text.join(' '),
    }))
    .map(entry => {
      if (entry.type === 'title') {
        return `# ${entry.text}`
      } else if (entry.type === 'subtitle') {
        return `\n## ${entry.text}`
      } else if (entry.type === 'name') {
        return `\n### ${entry.text}`
      } else if (entry.type === 'arg') {
        return `* ${entry.text}`
      } else if (entry.type === 'note') {
        return `> ${entry.text}`
      }
      return entry.text
    })
    .join('\n'),
)
