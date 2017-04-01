import fetchJsonp from'fetch-jsonp'

const apiBase = 'https://itunes.apple.com/search'

let lastQuery = ''
let lastResults = []

export default function lookup (q) {
  const query = q.trim()
  const encoded = window.encodeURI(query)
  const url = `${apiBase}?country=JP&media=music&term=${encoded}`

  /** 直前と同じくエリーの場合はキャッシュしている結果を返す */
  if (query === lastQuery) return Promise.resolve(lastResults)

  lastQuery = query

  /**
   * iTunes API からデータを取得
   * CORS非対応のため、fetchの代わりにfetchJsonpを使う
   */
  return fetchJsonp(url)
    .then(response => response.json())
    .then(data => {
      const results = data.results
        .sort((a, b) => b.trackId - a.trackId) // 新しい順にソート
        .map(song => ({
          title: song.trackName,
          artist: song.artistName,
          cover: song.artworkUrl100,
          preview: song.previewUrl,
          link: song.trackViewUrl
        }))
      lastResults = results
      return results
    })
}
