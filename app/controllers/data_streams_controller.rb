class DataStreamsController < ApplicationController
  before_action :set_data_stream, only: [:show, :edit, :update, :destroy]

  # GET /data_streams
  # GET /data_streams.json
  def index
    @data_streams = DataStream.all
  end

  # GET /data_streams/1
  # GET /data_streams/1.json
  def show
  end

  # GET /data_streams/new
  def new
    @data_stream = DataStream.new
  end

  # GET /data_streams/1/edit
  def edit
  end

  # POST /data_streams
  # POST /data_streams.json
  def create
    @data_stream = DataStream.new(data_stream_params)

    respond_to do |format|
      if @data_stream.save
        format.html { redirect_to @data_stream, notice: 'Data stream was successfully created.' }
        format.json { render :show, status: :created, location: @data_stream }
      else
        format.html { render :new }
        format.json { render json: @data_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_streams/1
  # PATCH/PUT /data_streams/1.json
  def update
    respond_to do |format|
      if @data_stream.update(data_stream_params)
        format.html { redirect_to @data_stream, notice: 'Data stream was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_stream }
      else
        format.html { render :edit }
        format.json { render json: @data_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_streams/1
  # DELETE /data_streams/1.json
  def destroy
    @data_stream.destroy
    respond_to do |format|
      format.html { redirect_to data_streams_url, notice: 'Data stream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_stream
      @data_stream = DataStream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_stream_params
      params.require(:data_stream).permit(:name, :csdl, :active)
    end
  
    require 'datasift'
  
    def initialize
      @username = 'DATASIFT_USERNAME'
      @api_key = 'DATASIFT_API_KEY'
      @config = {:username => @username, :api_key => @api_key, :enable_ssl => true}
      @params = {:output_type =>   's3',
                                    'output_params.bucket' => 'YOUR_BUCKET_NAME',
                                    'output_params.directory' => 'ruby',
                                    'output_params.acl' => 'private',
                                    'output_params.auth.access_key' => 'ADD_YOUR_ACCESS_KEY',
                                    'output_params.auth.secret_key' => 'ADD_YOUR_SECRET_KEY',
                                    'output_params.delivery_frequency' => 0,
                                    'output_params.max_size' => 104857600,
                                    'output_params.file_prefix' => 'DataSift',
              }
      @pull_params = {:output_type =>   'pull',
                                        'output_params.max_size' => 52428800
                     }
      @datasift = DataSift::Client.new(@config)
  end
  
  attr_reader :datasift

  def create_push(hash, is_historics_id = false)
    create_params = @params.merge ({#hash or historics_id can be used but not both
      :name => 'My awesome push subscription',
      :initial_status => 'active', # or 'paused' or 'waiting_for_start'
      })
    if is_historics_id
      create_params.merge!({:historics_id => hash})
    else
      create_params.merge!({:hash => hash,
        #start and end are not valid for historics
        :start => Time.now.to_i,
        :end => Time.now.to_i + 320
        })
    end
  end 
end
