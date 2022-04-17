class Api::V1::TasksController < Api::V1::BaseController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Rails.cache.fetch('tasks', expires_in: 30.seconds) do
      puts 'slow calculation'
      result = []
      Task.all.each_with_index do |t,i|
        t.body = t.body.upcase
        if i % 1000 == 0
          sleep 0.1
          result.push(t)
        end
      end
      result
    end
    render json: @tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    puts @task.cache_key_with_version
    @task_as_json = Rails.cache.fetch(@task.cache_key_with_version) do
      sleep 5
      @task.attributes.merge(last_time_cache_busted: Time.zone.now).to_json
    end
    render json: @task_as_json
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:body, :due_date)
    end
end
