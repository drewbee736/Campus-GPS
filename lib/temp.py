with open("buildings.txt", "r") as f:
	lines = f.readlines()
f.close()

target = open("buildings_.txt", 'w')

count = 1001
for line in lines:
	m = str(count) + ',' + line
	target.write(m)
	count += 1

target.close()
