import pytest

from .app import app, secret_token


@pytest.fixture
def client():
    with app.test_client() as client:
        yield client


def test_root_endpoint(client):
    response = client.get("/", headers={
        "Authorization": f"Bearer {secret_token}",
    })

    assert response.status_code == 200
    assert response.json == {"message": "Your Flask API server is flying!"}
