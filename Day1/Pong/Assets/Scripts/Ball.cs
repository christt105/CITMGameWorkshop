using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]
public class Ball : MonoBehaviour
{
    public float baseSpeed = 5f;
    public float maxSpeed = Mathf.Infinity;
    private Rigidbody2D rb;
    public float CurrentSpeed { get; set; }

    private void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    private void FixedUpdate()
    {
        // Clamp the velocity of the ball to the max speed
        var direction = rb.velocity.normalized;
        CurrentSpeed = Mathf.Min(CurrentSpeed, maxSpeed);
        rb.velocity = direction * CurrentSpeed;
    }

    public void ResetPosition()
    {
        rb.velocity = Vector2.zero;
        rb.position = Vector2.zero;
    }

    public void StartGame()
    {
        // Random horizontal
        var x = Random.Range(0, 2) == 0 ? -1f : 1f;

        // Random vertical
        var y = Random.Range(0, 2) == 0
            ? Random.Range(-1f, -0.5f)
            : Random.Range(0.5f, 1f);

        var direction = new Vector2(x, y).normalized;
        rb.AddForce(direction * baseSpeed, ForceMode2D.Impulse);
        CurrentSpeed = baseSpeed;
    }
}