package blackjack;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class Blackjack_AI {
    private List<String> deck;
    private List<List<String>> playerHands;
    private List<String> dealerHand;

    public Blackjack_AI() {
        deck = createDeck();
        playerHands = new ArrayList<>();
        dealerHand = new ArrayList<>();
    }

    // 카드 덱 생성
    private List<String> createDeck() {
        String[] suits = {"Hearts", "Diamonds", "Clubs", "Spades"};
        String[] values = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"};
        List<String> deck = new ArrayList<>();

        for (String suit : suits) {
            for (String value : values) {
                deck.add(value + " of " + suit);
            }
        }
        Collections.shuffle(deck);
        return deck;
    }

    // 카드 점수 계산
    private int calculateScore(List<String> hand) {
        int score = 0;
        int aces = 0;

        for (String card : hand) {
            String value = card.split(" ")[0];
            if (value.equals("Jack") || value.equals("Queen") || value.equals("King")) {
                score += 10;
            } else if (value.equals("Ace")) {
                aces++;
                score += 11;  // Ace는 기본적으로 11로 계산
            } else {
                score += Integer.parseInt(value);
            }
        }

        // Ace가 1로 계산될 경우 조정
        while (score > 21 && aces > 0) {
            score -= 10;
            aces--;
        }

        return score;
    }

    // 게임 실행
    public void play() {
        // 초기 카드 배분
        List<String> initialHand = new ArrayList<>();
        initialHand.add(deck.remove(deck.size() - 1));
        initialHand.add(deck.remove(deck.size() - 1));
        playerHands.add(initialHand);
        
        dealerHand.add(deck.remove(deck.size() - 1));
        dealerHand.add(deck.remove(deck.size() - 1));

        Scanner scanner = new Scanner(System.in);
        System.out.println("플레이어의 카드: " + initialHand);
        System.out.println("딜러의 카드: " + dealerHand.get(0) + ", ?");

        // 플레이어 턴
        for (int i = 0; i < playerHands.size(); i++) {
            List<String> currentHand = playerHands.get(i);
            while (true) {
                int playerScore = calculateScore(currentHand);
                if (playerScore > 21) {
                    System.out.println("플레이어의 점수: " + playerScore);
                    System.out.println("플레이어의 패배!");
                    return;
                }
                System.out.print("카드를 더 받으시겠습니까? (hit/stand/split): ");
                String action = scanner.nextLine().trim().toLowerCase();
                if (action.equals("hit")) {
                    currentHand.add(deck.remove(deck.size() - 1));
                    System.out.println("플레이어의 카드: " + currentHand);
                } else if (action.equals("stand")) {
                    break;
                } else if (action.equals("split") && currentHand.size() == 2 && currentHand.get(0).split(" ")[0].equals(currentHand.get(1).split(" ")[0])) {
                    List<String> newHand = new ArrayList<>();
                    newHand.add(currentHand.remove(1)); // 두 번째 카드를 새로운 핸드로 이동
                    newHand.add(deck.remove(deck.size() - 1)); // 새 핸드에 카드 추가
                    playerHands.add(newHand); // 새 핸드 추가
                    System.out.println("새로운 핸드가 생성되었습니다: " + newHand);
                    break; // 다음 핸드로 넘어감
                } else {
                    System.out.println("잘못된 입력입니다.");
                }
            }
        }

        // 딜러 턴
        while (calculateScore(dealerHand) < 17) {
            dealerHand.add(deck.remove(deck.size() - 1));
        }

        // 점수 계산 및 승자 결정
        for (List<String> hand : playerHands) {
            int dealerScore = calculateScore(dealerHand);
            int playerScore = calculateScore(hand);

            System.out.println("딜러의 카드: " + dealerHand);
            System.out.println("플레이어의 점수: " + playerScore);
            System.out.println("딜러의 점수: " + dealerScore);

            if (dealerScore > 21 || playerScore > dealerScore) {
                System.out.println("플레이어의 승리!");
            } else if (playerScore < dealerScore) {
                System.out.println("딜러의 승리!");
            } else {
                System.out.println("무승부!");
            }
        }

        scanner.close();
    }

    public static void main(String[] args) {
        Blackjack_AI game = new Blackjack_AI();
        game.play();
    }
}
