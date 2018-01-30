User.destroy_all
Booking.destroy_all
Room.destroy_all
Motel.destroy_all


# Create 3 users
user2 = User.create(email: "user@two.dev", password: "123456")
user1 = User.create(email: "user@one.dev", password: "123456")
User.create(email: "user@none.dev", password: "123456")


def motels_url 
	"https://luvotels-hiring-api.herokuapp.com/motels.json"
end

def rooms_url(motel_id)
	"https://luvotels-hiring-api.herokuapp.com/motels/#{motel_id}/rooms.json"
end

def bookings_url(motel_id)
	"https://luvotels-hiring-api.herokuapp.com/motels/#{motel_id}/bookings.json"
end

# Load datas from API
JSON.parse(RestClient.get(motels_url)).each_with_index do |motel, index|
	# User1 gets one motel, User2 gets the others
	index == 1 ? (owner = user1) : (owner = user2)
	Motel.create(
		id: motel["id"],
		name: motel["name"],
		logo: motel["logo"],
		user_id: owner.id
	)

	JSON.parse(RestClient.get(rooms_url(motel["id"]))).each do |room| 
		Room.create(
			id: room["id"],
			motel_id: room["motel_id"],
			name: room["name"],
			picture: room["picture"]
		)
	end

	JSON.parse(RestClient.get(bookings_url(motel["id"]))).each do |booking|
		Booking.create(
			room_id: booking["room_id"],
			motel_id: booking["motel_id"],
			amount_centavos: booking["amount_centavos"],
			fee_percentage: booking["fee_percentage"],
			booking_period: booking["booking_period"],
			created_at: booking["created_at"],
			paid_at: booking["paid_at"],
			booking_code: booking["booking_code"],
		)
	end
end



