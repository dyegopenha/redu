class SearchController < BaseController
  # Busca por Perfis + Ambientes
  def index
    respond_to do |format|
      format.html # search/index.html.erb
    end
  end

  # Busca por Perfis
  def profiles
    @profiles = results_for(search(User, params[:q]))
  end

  # Busca por Ambientes
  def environments
    @environments = results_for(search(Environment, params[:q]))
    @courses = results_for(search(Course, params[:q]))
    @spaces = results_for(search(Space, params[:q]))

    respond_to do |format|
      format.html # search/environments.html.erb
    end
  end

  private

  def search(model, query)
    Sunspot.search(model) { fulltext query }
  end

  def results_for(search)
    search.results
  end
end
