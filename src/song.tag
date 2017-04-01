<song>
  <img src={opts.cover} onclick={toggle} class={is-playing: isPlaying}>
  <h4><a href={opts.link}>{opts.title}</a></h4>
  <p>{opts.artist}</p>
  <audio ref="preview">
    <source src={preview} type="audio/mpeg">
  </audio>

  <script>
    this.isPlaying = false

    /** カバー画像のクリックで再生・停止 */
    this.toggle = e => {
      const isPlaying = !this.isPlaying
      if (isPlaying) this.refs.preview.play()
      else this.refs.preview.pause()
      this.update({isPlaying})
    }

    this.on('mount', () => {
      /** 音楽終了時、isPlayingをfalseに戻す */
      this.refs.preview.onended = () => {
        this.update({isPlaying: false})
      }
    })
  </script>

  <style>
    :scope {
      display: block;
      margin-bottom: 1em;
      overflow: hidden;
      text-align: center;
      font-size: 90%;
    }
    h4 {
      margin: 0;
    }
    h4 > a {
      color: purple;
      text-decoration: none;
      display: block;
      text-overflow: ellipsis;
      white-space: nowrap;
      overflow: hidden;
    }
    p {
      margin: 0;
      color: gray;
      text-overflow: ellipsis;
      white-space: nowrap;
      overflow: hidden;
    }
    img {
      border: 5px solid white;
    }
    img.is-playing {
      border: 5px solid purple;
    }
  </style>
</song>
