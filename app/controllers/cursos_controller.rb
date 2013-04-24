class CursosController < ApplicationController
 helper_method :sort_column, :sort_direction
 before_filter :find_cursos, :except => [ :index, :create, :new]

  def index
    @regpag = (params[:numreg])? params[:numreg].to_i : 5
      if ((@regpag)==0) or ((@regpag) < 0) then
        @regpag = 1
      end

    #@cursos = Curso.search(params[:search]).page(params[:page]).per_page(@regpag)
    @cursos = Curso.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@regpag), :page => params[:page])
    respond_to do |format|
    format.html # index.html.erb
    format.xml { render :xml => @cursos }
    end
  end

  def show
    #@curso = Curso.find(params[:id])

  end

  def new
    @curso = Curso.new
  end

  def edit
    #@curso = Curso.find(params[:id])
  end

  def create
    @curso = Curso.new(params[:curso])
    render :action => :new unless @curso.save
    
  end

  def update
    #@curso = Curso.find(params[:id])
    render :action => :edit unless @curso.update_attributes(params[:curso])
    
  end

  def destroy
    #@curso = Curso.find(params[:id])
    @curso.destroy
  end

  def find_curso
    @curso = Curso.find(params[:id]) if params[:id]
  end

  private
  def sort_column
    Curso.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
