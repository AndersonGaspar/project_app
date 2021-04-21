from flask import Flask
from flask_httpauth import HTTPTokenAuth

app = Flask(__name__)
auth = HTTPTokenAuth()

# TODO: use environment variables to prevent this secret to leak.
#secret_token = "ThisShouldBeSecret"

secret_token = config('secret_token')

@auth.verify_token
def verify_token(token):
    return token == secret_token


@app.route("/", methods=["GET"])
@auth.login_required
def home():
    return {
        "message": "Your Flask API server is flying!"
    }

if __name__ == "__main__":
    app.run("0.0.0.0", port=8000)
