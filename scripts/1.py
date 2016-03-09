import socket, threading

def echo (conn):
        while True:
                data = conn.recv(1024)
                if not data or data == "close":
                        conn.close()
                        break
                conn.send(data)

s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
s.bind(('0.0.0.0', 2222))
s.listen (10)

while True:
        conn,addr = s.accept()
        #echo(conn)
        threading.Thread(target=echo, args=(conn,)).start()

