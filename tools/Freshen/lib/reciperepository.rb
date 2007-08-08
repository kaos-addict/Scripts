# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class RecipeRepository < Repository
	
	@recipes = Hash.new
	
	def new(dir='/Files/Compile/Recipes', url=nil)
		super
		@dir, @url = dir, url
	end
	
	def include?(prog, ver=nil)
		File.exist("#{@dir}/#{prog}")
	end
	
	def meet_dependency?(dep)
		if dep.is_a?(Version) # Assume >=
			
		else
			false
		end
	end
	
	def [](name)
		@recipes[name] if @recipes[name]
		vers = []
		Dir.foreach("#{dir}/#{name}") do |v|
			next if v == '.' or v == '..'
			vers.push Version.new(v)
		end
		@recipes[name] = vers.sort
	end
end