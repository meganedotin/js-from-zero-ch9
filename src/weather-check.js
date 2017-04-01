const apiBase = 'http://api.openweathermap.org/data/2.5/weather'

export default function weatherCheck (appid, city) {
  const url = `${apiBase}?q=${city}&APPID=${appid}&units=metric`

  return window.fetch(url)
    .then(response => response.json())
    .then(data => {
      let query = data.weather[0].description
      if (28 <= data.main.temp) query += ' hot'
      if (data.main.temp <= 10) query += ' cold'
      console.log(`Weather keyword: ${query}`)
      return query
    })
}
