namespace :dev do
  desc "Settings of Dev Environment"
  task setup: :environment do
  	if Rails.env.development?
  		puts %x(rails db:drop db:create db:migrate db:seed)
  		%x(rails dev.add_type)
  		%x(rails dev.add_coins)
  	end
  end

  desc "Cadastra as Moedas"
  task add_coins: :environment do  
	puts Coin.create!([
		{
			description: 'Bitcoin',
			acronym: 'BTC',
			url_image: 'https://en.bitcoin.it/w/images/en/2/29/BC_Logo_.png',		
			mining_type: MiningType.all.sample
		},
		{
			description: 'Ethereum',
			acronym: 'ETH',
			url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/256px-Ethereum_logo_2014.svg.png',		
			mining_type: MiningType.all.sample
		},
		{
			description: 'Dash',
			acronym: 'DASH',
			url_image: 'https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png',
			mining_type: MiningType.all.sample
		}
	])
  end

  desc "Cadastra os Tipos de Mineração"
  task add_type: :environment do  
	puts MiningType.create!([
		{
			description: 'Proof of Work',
			acronym: 'PoW'		
		},
		{
			description: 'Proof of Stake',
			acronym: 'PoS'		
		}
	])
  end
end
