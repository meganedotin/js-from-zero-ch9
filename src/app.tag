<app>
  <h1>Weather Jukebox</h1>

  <section>
    <song each={results} cover={cover} link={link} title={title} artist={artist} preview={preview}/>
  </section>

  <script>
    import weatherCheck from './weather-check.js'
    import lookup from './itunes-lookup.js'

    /** 設定 */
    const appid = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    const city = 'Tokyo'

    /** ここに検索結果を保持 */
    this.results = []

    /** タグのマウント時に実行 */
    this.on('mount', () => {
      weatherCheck(appid, city)
        .then(query => lookup(query))
        .then(results => this.update({results}))
    })
  </script>

  <style>
    :scope {
      display: block;
      padding: 2em;
    }
    h1 {
      border-bottom: 1px solid purple;
      color: purple;
      font-size: 130%;
      font-weight: normal;
      padding-bottom: .3em;
      margin: 0 0 .5em;
    }
    p {
      color: gray;
    }
    input[type=search] {
      border: 1px solid purple;
      border-radius: .5em;
      display: block;
      padding: .5em .7em;
      width: 100%;
      margin: 1em 0;
    }
    input[type=search]:focus {
      outline: none;
    }
    section {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }
    section > * {
      flex-basis: 7em;
      flex-grow: 1;
      margin: .5em;
    }
  </style>
</app>
