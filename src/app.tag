<app>
  <h1>Weather Jukebox</h1>

  <section>
    <song each={results} cover={cover} link={link} title={title} artist={artist} preview={preview}/>
  </section>

  <script>
    import lookup from './itunes-lookup.js'

    const apiBase = 'http://api.openweathermap.org/data/2.5/weather'
    const appid = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    const city = 'Tokyo'
    const url = `${apiBase}?q=${city}&APPID=${appid}&units=metric`

    /** ここに検索結果を保持 */
    this.results = []

    /** タグのマウント時に実行 */
    const self = this // asyncの中から参照するため
    this.on('mount', async function () {
      const response = await window.fetch(url)
      const data = await response.json()

      let query = data.weather[0].description
      if (28 <= data.main.temp) query += 'hot'
      if (data.main.temp <= 10) query += 'cold'

      const results = await lookup(query)

      this.update({results}))
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
