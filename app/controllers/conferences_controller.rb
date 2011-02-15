class ConferencesController < InheritedResources::Base
  actions :index, :show
  layout 'maintenance'
end
