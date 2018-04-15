# frozen_string_literal: true

require 'find'

require_relative 'include_to_component_resolver'
require_relative 'source_component'

# Parses all components of a project
class Project
  def initialize(path)
    @path = path
    @include_resolver = IncludeToComponentResolver.new(source_components)
  end

  def source_components
    @source_components ||= build_source_components
  end

  def source_component(name)
    return SourceComponent.new('NULL') unless source_components.key?(name)
    source_components[name]
  end

  def dependencies(component)
    # TODO: This is repeating the same work twice! component_for_include is called when calling external_includes
    external_includes(component).map { |include| @include_resolver.component_for_include(include) }.reject(&:empty?).uniq
  end

  def external_includes(component)
    @include_resolver.external_includes(component)
  end

  private

  def build_source_components
    # TODO: Dealing with source components with same dir name?
    dirs = fetch_all_dirs(@path)
    components = dirs.map do |dir|
      c = SourceComponent.new(dir)
      [c.path, c]
    end.to_h
    components.delete_if { |_, v| v.source_files.size.zero? }
    components
  end

  def fetch_all_dirs(source_dir)
    Find.find(source_dir).select { |e| File.directory?(e) }
  end
end
