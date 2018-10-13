from flask import Flask, jsonify, request
from flaskext.mysql import MySQL


app = Flask(__name__)
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'digimon'
app.config['MYSQL_DATABASE_DB'] = 'banco2'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)

@app.route('/', methods=['GET'])
def get():
    Cremitente=request.args.get('remitente')
    print(Cremitente)
    sql_select='''select u.nombre, u.apellido, b.nombrebanco from banco2.cuenta c
    inner join usuario u on u.idusuario=c.idusuario
    inner join banco b on b.idbancos=c.idbancos
     where idcuenta= %s'''
    conn =mysql.connect()
    cur = conn.cursor()
    cur.execute(sql_select,(Cremitente,))
    print(cur.fetchall())
    conn.commit()

    return jsonify({'resultado' :'exito' })

if __name__ == '__main__':
    app.run()
