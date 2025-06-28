using UnityEngine;

public class Paddle : MonoBehaviour
{
    public enum Player
    {
        Player1,
        Player2
    }

    public float speed = 8f;
    public Player player;

    private void FixedUpdate()
    {
        if (player == Player.Player1)
        {
            if (Input.GetKey(KeyCode.W))
                transform.Translate(Vector2.up * (speed * Time.deltaTime));
            else if (Input.GetKey(KeyCode.S))
                transform.Translate(Vector2.down * (speed * Time.deltaTime));
        }
        else
        {
            if (Input.GetKey(KeyCode.UpArrow))
                transform.Translate(Vector2.up * (speed * Time.deltaTime));
            else if (Input.GetKey(KeyCode.DownArrow))
                transform.Translate(Vector2.down * (speed * Time.deltaTime));
        }
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.CompareTag("Ball"))
        {
            Rigidbody2D ballRb = collision.rigidbody;
            ballRb.velocity *= 1.05f;
        }
    }


    public void ResetPosition()
    {
        transform.position = new Vector2(transform.position.x, 0f);
    }
}