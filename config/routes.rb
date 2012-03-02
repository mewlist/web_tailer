WebTailer::Engine.routes.draw do
  root :to => 'tailer#index'
  get  'log.json' => 'tailer#index', :format => :json
end
