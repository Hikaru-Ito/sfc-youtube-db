# Import Modules
express = require 'express'
bodyParser = require 'body-parser'
mysql = require 'mysql'
ECT = require 'ect'
ectRenderer = ECT({ watch: true, root: __dirname + '/views', ext : '.ect' })

app = express()

app.set('port', (process.env.PORT || 5000))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))
app.engine('ect', ectRenderer.render);
app.set('view engine', 'ect');

# Connect MySQL
db_connection = mysql.createPool
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'sfc_youtube_db',
  password: process.env.DB_PASS || 'sfc_youtube_db',
  database: process.env.DB_NAME || 'sfc_youtube_db'

app.get '/', (req,res) ->
  res.render 'index'

# Request Recent Posts
app.get '/english', (req,res) ->

  res_data = {}
  res_data['lang_short'] = 'en'
  res_data['LANG'] = 'Please select metadata'

  # Query
  db_connection.query "
    SELECT metas.name
    FROM metas
    "
    , (err, rows) ->

      # Error Check
      if err
        console.log err

      res_data['metas'] = rows

      # Return data
      res.render 'metas', res_data



app.get '/japanese', (req,res) ->

  res_data = {}
  res_data['lang_short'] = 'jp'
  res_data['LANG'] = 'メタデータを選択してください'

  # Query
  db_connection.query "
    SELECT je_translate.japanese
    FROM je_translate
    "
    , (err, rows) ->
      console.log rows

      # Error Check
      if err
        console.log err

      metas = []
      for row in rows
        metas.push {name: row.japanese}

      res_data['metas'] = metas

      # Return data
      res.render 'metas', res_data


app.get '/korean', (req,res) ->

  res_data = {}
  res_data['lang_short'] = 'kor'
  res_data['LANG'] = '메타 데이터를 선택하세요'

  # Query
  db_connection.query "
    SELECT ke_translate.korean
    FROM ke_translate
    "
    , (err, rows) ->
      console.log rows

      # Error Check
      if err
        console.log err

      metas = []
      for row in rows
        metas.push {name: row.korean}

      res_data['metas'] = metas

      # Return data
      res.render 'metas', res_data


# Search Videos English Meta
app.get '/search/en/:meta', (req,res) ->

  res_data = {}
  res_data['lang_short'] = 'en'
  res_data['req_word'] = req.params.meta
  res_data['TITLE'] = "The videos list on \"#{req.params.meta}\""

  # Query
  db_connection.query "
    SELECT videos.url
    FROM videos, metas, video_meta
    WHERE videos.video_id = video_meta.video_id
    AND video_meta.meta_id = metas.meta_id
    AND metas.name = '#{req.params.meta}'
    "
    , (err, rows) ->
      console.log rows

      # Error Check
      if err
        console.log err

      youtube_ids = []
      for row in rows
        youtube_id = row.url.match(/\?v=([^&]+)/)
        youtube_ids.push {youtube_id: youtube_id[1]}

      res_data['videos'] = youtube_ids

      # Return data
      res.render 'videos', res_data

# Search Videos japanese Meta
app.get '/search/jp/:meta', (req,res) ->

  res_data = {}
  res_data['lang_short'] = 'jp'
  res_data['req_word'] = req.params.meta
  res_data['TITLE'] = "「#{req.params.meta}」に関する動画リスト"

  # Query
  db_connection.query "
    SELECT videos.url
    FROM videos, metas, video_meta, je_translate
    WHERE videos.video_id = video_meta.video_id
    AND video_meta.meta_id = metas.meta_id
    AND metas.name = je_translate.english
    AND je_translate.japanese = '#{req.params.meta}'
    "
    , (err, rows) ->
      console.log rows

      # Error Check
      if err
        console.log err

      youtube_ids = []
      for row in rows
        youtube_id = row.url.match(/\?v=([^&]+)/)
        youtube_ids.push {youtube_id: youtube_id[1]}

      res_data['videos'] = youtube_ids

      # Return data
      res.render 'videos', res_data

# Search Videos korean Meta
app.get '/search/kor/:meta', (req,res) ->

  res_data = {}
  res_data['lang_short'] = 'kor'
  res_data['req_word'] = req.params.meta
  res_data['TITLE'] = "「#{req.params.meta}」의 동영상 목록"

  # Query
  db_connection.query "
    SELECT videos.url
    FROM videos, metas, video_meta, ke_translate
    WHERE videos.video_id = video_meta.video_id
    AND video_meta.meta_id = metas.meta_id
    AND metas.name = ke_translate.english
    AND ke_translate.korean = '#{req.params.meta}'
    "
    , (err, rows) ->
      console.log rows

      # Error Check
      if err
        console.log err

      youtube_ids = []
      for row in rows
        youtube_id = row.url.match(/\?v=([^&]+)/)
        youtube_ids.push {youtube_id: youtube_id[1]}

      res_data['videos'] = youtube_ids

      # Return data
      res.render 'videos', res_data

# Listen
app.listen app.get('port'), ->
  console.log "Node app is running at localhost:#{app.get('port')}"
