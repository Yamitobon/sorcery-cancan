class MateriasController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @regpag = (params[:numreg])? params[:numreg].to_i : 5
      if ((@regpag)==0) or ((@regpag) < 0) then
        @regpag = 1
      end
    @materias = Materia.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@regpag), :page => params[:page])
    #@materias = Materia.search(params[:search]).page(params[:page]).per_page(@regpag)
    respond_to do |format|
    format.html
    format.xml { render :xml => @Materia }
    end
  end

  def show
    @materia = Materia.find(params[:id])
  end
  
  def new
    @materia = Materia.new
  end
  
  def edit
    @materia = Materia.find(params[:id])
  end

  def create
    @materia = Materia.new(params[:materia])
    render :action => :new unless @materia.save
  end

  def update
    @materia = Materia.find(params[:id])
    render :action => :edit unless @materia.update_attributes(params[:materia])
  end

  def destroy
    @materia = Materia.find(params[:id])
    @materia.destroy
  end

  private
  def sort_column
    Materia.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
    
end

