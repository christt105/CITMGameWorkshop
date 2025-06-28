using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    public Ball ball;
    public Paddle playerPaddle;
    public Paddle computerPaddle;
    public Text player1ScoreText;
    public Text player2ScoreText;

    private int _player1Score;
    private int _player2Score;

    private void Start()
    {
        NewGame();
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R)) 
            NewGame();
    }

    public void NewGame()
    {
        _player1Score = _player2Score = 0;
        NewRound();
    }

    public void NewRound()
    {
        playerPaddle.ResetPosition();
        computerPaddle.ResetPosition();
        ball.ResetPosition();

        player1ScoreText.text = _player1Score.ToString();
        player2ScoreText.text = _player2Score.ToString();

        CancelInvoke();
        Invoke(nameof(StartRound), 1f);
    }

    private void StartRound()
    {
        ball.StartGame();
    }

    public void OnScored(Paddle.Player player)
    {
        if (player == Paddle.Player.Player1)
            _player1Score++;
        else
            _player2Score++;

        NewRound();
    }
}