# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##Categories
@categories = [
  {:title => '​Oriental (belly dance)', :slug=> 'oriental', :description => "Cualquier estilo de danza del Medio Oriente ( American Cabaret, Libanés, Turco, Egipcio, etc )"},
  {:title => 'Props (Elementos)', :slug=> 'props', :description => "Uso de elementos enfocados en la destreza del manejo de los mismos ( zills, abanicos, alas de isis, velo, espada, baston, candelabro, bandeja, etc ). Estilo a utilizar es libre."},
  {:title => 'Fusión', :slug=> 'fusion', :description => "Rutina que fusiona otros estilos de danzas con la danza Oriental ( Tribal, Gipsy, Latino, Hip hop, Contemporáneo, etc)"},
  {:title => 'Grupal', :slug=> 'grupal', :description => "Una rutina de minimo de 4.5min, enfocándose en cualquier estilo, pero siempre destacando movimientos de belly dance dentro de la rutina. Mínimo 2 personas para participar en esta categoría."}
]
@categories.each do |category|
  @category = Category.create(category)
  if @category.save
    puts "Categoría #{category} creada con éxito"
  end
end

##PArticipants
@participants = [
  {:name=>"Guayo",:lastname=>"Mena",:lastname2=>"Jenkins",:tel=>"504-(414)581-9264",:bio=>"justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus"},
  {:name=>"Deborah",:lastname=>"Olson",:lastname2=>"Gonzalez",:tel=>"1-(541)777-4684",:bio=>"habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget"},
  {:name=>"Jonathan",:lastname=>"Ramirez",:lastname2=>"Coleman",:tel=>"242-(360)783-6672",:bio=>"luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at"},
  {:name=>"Robert",:lastname=>"Mitchell",:lastname2=>"Dixon",:tel=>"353-(329)710-6621",:bio=>"pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus"},
  {:name=>"Richard",:lastname=>"Fields",:lastname2=>"Harper",:tel=>"86-(608)316-9423",:bio=>"vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices"},
  {:name=>"Benjamin",:lastname=>"Gibson",:lastname2=>"Price",:tel=>"66-(973)401-6962",:bio=>"nulla integer pede justo lacinia eget tincidunt eget tempus vel"},
  {:name=>"Peter",:lastname=>"Parker",:lastname2=>"Turner",:tel=>"55-(966)687-8585",:bio=>"cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit"},
  {:name=>"Sarah",:lastname=>"Mcdonald",:lastname2=>"Fields",:tel=>"48-(230)610-5477",:bio=>"vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel"},
  {:name=>"Andrew",:lastname=>"Price",:lastname2=>"Greene",:tel=>"370-(539)923-7583",:bio=>"ligula nec sem duis aliquam convallis nunc proin at turpis a"},
  {:name=>"Juan",:lastname=>"Wilson",:lastname2=>"West",:tel=>"62-(371)906-4215",:bio=>"posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut"},
  {:name=>"Carolyn",:lastname=>"Matthews",:lastname2=>"Schmidt",:tel=>"86-(249)551-7991",:bio=>"porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit"},
  {:name=>"Lillian",:lastname=>"Thompson",:lastname2=>"Knight",:tel=>"66-(636)401-2579",:bio=>"donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam"},
  {:name=>"Eric",:lastname=>"Garza",:lastname2=>"Simmons",:tel=>"62-(659)854-4896",:bio=>"vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque"},
  {:name=>"Ernest",:lastname=>"Boyd",:lastname2=>"Thomas",:tel=>"1-(330)966-9055",:bio=>"nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat"},
  {:name=>"Norma",:lastname=>"Coleman",:lastname2=>"Sims",:tel=>"86-(605)650-7513",:bio=>"montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id"},
  {:name=>"Sharon",:lastname=>"Carter",:lastname2=>"Lopez",:tel=>"86-(237)744-3873",:bio=>"eleifend quam a odio in hac habitasse platea dictumst maecenas"},
  {:name=>"Cheryl",:lastname=>"Olson",:lastname2=>"Ellis",:tel=>"52-(873)441-0713",:bio=>"ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus"},
  {:name=>"Michelle",:lastname=>"Morris",:lastname2=>"Evans",:tel=>"62-(758)191-1806",:bio=>"penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum"},
  {:name=>"Eugene",:lastname=>"Anderson",:lastname2=>"George",:tel=>"7-(704)343-9995",:bio=>"neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et"},
  {:name=>"Lois",:lastname=>"Hughes",:lastname2=>"Diaz",:tel=>"54-(895)549-5781",:bio=>"augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id"}
]
@participants.each do |participant|

  @user = User.create! email:               "#{participant[:name].downcase}@a.com",
                    password:              '12345678',
                    password_confirmation: '12345678',
                    user_type: "participant"
  @user.save!

  @participant = Participant.create(participant)
  @limit = rand(1..2)
  @category = Category.limit(@limit).order("RANDOM()")
  @participant.categories = @category
  @participant.user_id = @user.id
  if @participant.save
    puts "Participante #{@participant.name} #{@participant.lastname} #{@participant.lastname2} creado con éxito"
  else
    puts 'Error al guardar participantes'
  end
end

# votes
400.times{
  @random_participant = Participant.order("RANDOM()").first
  @random_category = @random_participant.categories.order("RANDOM()").first.id
  @vote = Vote.new
  @vote.participant_id = @random_participant.id
  @vote.category_id = @random_category
  if @vote.save
    puts "Vote for #{@random_participant.nombre_completo} added"
  end
}

# juries
@jury = [
  {:name => "jurado1", :email => "jurado1@a.com", :bio => "bla bla bla"},
  {:name => "jurado2", :email => "jurado2@a.com", :bio => "bla bla bla"},
  {:name => "jurado3", :email => "jurado3@a.com", :bio => "bla bla bla"}
]
@jury.each do |jury|
  User.destroy_all(email: jury[:email])
  @user = User.create! email:               "#{jury[:email]}",
                    password:              '12345678',
                    password_confirmation: '12345678',
                    user_type: 'jury'
  if @user.save!
    puts "Usuario creado - id: #{@user.id} - #{@user.email}"
  end
  @jury = Jury.new
  @jury.name = jury[:name]
  @jury.bio = jury[:bio]
  @jury.user_id = @user.id
  if @jury.save
    puts "Jurado creado. Nombre: #{@jury.name}, Usuario: #{@jury.user.id}"
  end
end

# admins
User.create(:email => "admin1@a.com", :password => "12345678", :password_confirmation => "12345678", :user_type => "admin")
User.create(:email => "admin2@a.com", :password => "12345678", :password_confirmation => "12345678", :user_type => "admin")
