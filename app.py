from flask import Flask, jsonify, request
from flaskext.mysql import MySQL
import os

app = Flask(__name__)
mysql = MySQL()


###mysql://:@/?reconnect=true
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'megamisama'
app.config['MYSQL_DATABASE_DB'] = 'banco2'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
#if os.environ.has_key('DATABASE_URL'):



#app.config['MYSQL_DATABASE_URI'] = os.environ['DATABASE_URL']

mysql.init_app(app)

@app.route('/depo', methods=['GET'])
def depositos():
    remitente=request.args.get('remitente')
    receptor=request.args.get('receptor')
    monto=request.args.get('monto')
    nombreT=request.args.get('nombreT')
    tipo= request.args.get('tipo')
    print(remitente)
    conn =mysql.connect()
    cur = conn.cursor()

    cur.callproc('transaccion_deposito', (remitente,receptor,monto,nombreT,tipo))
    cur.fetchall()

    conn.commit()

    return jsonify({'resultado' :'exito' })

@app.route('/', methods=['GET'])
def users():
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
