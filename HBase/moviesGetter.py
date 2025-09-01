from starbase import Connection

c = Connection("127.0.0.1", "8000")

ratings = c.table("ratings")

print("Getting ratings data based on userID")
print(f"Ratings data for userID 1: {ratings.fetch(1)}")
print(f"Ratings data for userID 22: {ratings.fetch(22)}")
