class BooksController < ApplicationController
  def show
    id = params[:id]
    @book = BOOKS_LIST.find do |book|
      book[:id] == id.to_i
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
BOOKS_LIST = [
  {id: 1, title: "1984", author: "George Orwell", dsc: "That's what painting is all about. It should make you feel good when you paint. Let's build some happy little clouds up here. We'll do another happy little painting. See how easy it is to create a little tree right in your world. A happy cloud. Let's have a happy little tree in here."},
  {id: 2, title: "Pride and Prejudice", author: "Jane Austin", dsc: "If it's not what you want - stop and change it. Don't just keep going and expect it will get better. We don't really know where this goes - and I'm not sure we really care." },
  {id: 3, title: "Some book", author: "An Author", dsc: "Scourge of the seven seas cutlass mizzenmast reef sails chantey belaying pin poop deck Plate Fleet Blimey loaded to the gunwalls. Heave down killick Buccaneer furl ho six pounders clipper hogshead skysail boom. Parley scurvy Blimey Letter of Marque lanyard chase matey Arr pink Nelsons folly."},
  {id: 4, title: "Another Book", author: "Another Author", dsc: "Social impact; co-creation social innovation, best practices; benefit corporation expose the truth thought partnership communities accessibility relief innovation framework progress inspire. Impact social entrepreneur mobilize a ideate social enterprise, communities, compassion silo changemaker. Peaceful compelling, social enterprise, boots on the ground green space, emerging social entrepreneurship empower shared vocabulary efficient thought partnership greenwashing blended value grit. Global improve the world then living a fully ethical life inspirational. Initiative systems thinking, deep dive empower communities compelling empathetic storytelling. Changemaker, impact investing do-gooder program area catalyze effective relief, problem-solvers empower communities innovation resist."}
]

  def index
    @books = BOOKS_LIST
  end
end
