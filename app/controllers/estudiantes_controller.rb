class EstudiantesController < ApplicationController
 helper_method :sort_column, :sort_direction
 before_filter :find_curso_estudiantes

  def index
    @regpag = (params[:numreg])? params[:numreg].to_i : 5
        if ((@regpag)==0) or ((@regpag) < 0) then
          @regpag = 1
        end
    #@estudiantes = @curso.estudiantes.search(params[:search]).page(params[:page]).per_page(@regpag)
    @estudiantes = Estudiante.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@regpag)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @estudiantes }
    end
  end



  def show
    #@estudiante = Estudiante.find(params[:id])

  end

  def new
    @estudiante = Estudiante.new
  end

  def edit
    #@estudiante = Estudiante.find(params[:id])
  end

  def create
    @estudiante = @curso.estudiantes.build(params[:estudiante])
    render :action => :new unless @estudiante.save
  end

  def update
    #@estudiante = Estudiante.find(params[:id])
    render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end

  def destroy
    #@estudiante = Estudiante.find(params[:id])
    @estudiante.destroy
  end

  private
  def find_curso_estudiantes

    @curso = Curso.find( params[:curso_id]) 
    @estudiante = Estudiante.find(params[:id]) if params[:id]
  end

  private
  def sort_column
    Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
