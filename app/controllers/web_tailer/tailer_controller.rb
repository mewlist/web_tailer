module WebTailer
  class TailerController < ApplicationController
    def index
      respond_to do |format|
        format.html
        format.json do
          path = Rails.root + params[:path]
          open(path) do |f|
            storage = session[:webtailer_seek_pos]
            storage ||= {}

            f.seek 0, IO::SEEK_END
            tail_pos = f.pos
            pos      = storage[path.to_s].to_i

            # 読み込みを一定量していなかったり、一度もしていない場合
            pos = tail_pos if tail_pos > pos + 64*1024*1024 || pos == 0

            f.seek pos

            render :json => { :log => f.read }

            storage[path.to_s] = f.pos
            session[:webtailer_seek_pos] = storage
          end
        end
      end
    end
  end
end
