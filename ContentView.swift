import SwiftUI

struct ContentView: View {
    @State private var currentQuestionIndex = 0
    @State private var isAnswered = false
    @State private var isAnswerCorrect = false
    @State private var isAnswerIncorrect = false
    @State private var correctAnswer = 0
    @State private var questionCount = 0
    @State private var maxQuestion = 3
    @State private var quizCompleted = false
    
    var score = Score(totalQuestions: 3, questionCount: 0, correctAnswers: 0, incorrectAnswers: 0)
    
  
    //var score = score1
    let QuizQuestions = [
        Question(stem: "2 + 8 = ?",
                 distractor1: "3",
                 distractor2: "10",
                 distractor3:"5",
                 distractor4:"6"),
        Question(stem: "2 + 3 = ?",
                 distractor1: "4",
                 distractor2: "5",
                 distractor3:"6",
                 distractor4:"7"),
        Question(stem: "3 + 3 = ?",
                 distractor1: "5",
                 distractor2: "6",
                 distractor3:"7",
                 distractor4:"8"),
    ]
    var body: some View {
        
        ZStack {
            //start VStack
            VStack {
                Text(QuizQuestions[currentQuestionIndex].stem)
                    .padding(.horizontal,75)
                    .padding(.vertical,60)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: Font.Weight.bold))
                HStack{
                    VStack{
                        Button {
                            print("Button1 tapped!!")
                            isAnswered = true
                            //selectedOption = 1
                            isAnswerIncorrect = true
                        } label: {
                            Text(QuizQuestions[currentQuestionIndex].distractor1)
                                .frame(height: 70)
                                .frame(width: 150)
                                .background(Color.cyan)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.system(size: 30, weight: Font.Weight.bold))
                        }
                        //.buttonStyle(.plain)
                        .padding(.vertical, 30)
                        Button {
                            print("Button2 tapped!!")
                            isAnswered = true
                            //selectedOption = 2
                            isAnswerCorrect = true
                        } label: {
                            Text(QuizQuestions[currentQuestionIndex].distractor2)
                                .frame(height: 70)
                                .frame(width: 150)
                                .background(Color.cyan)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.system(size: 30, weight: Font.Weight.bold))
                        }
                    }
                    .padding(10)
                    VStack{
                        Button {
                            print("Button3 tapped!!")
                            isAnswered = true
                            isAnswerIncorrect = true
                            //score.incorrectAnswers += 1
                            //selectedOption = 3
                        } label: {
                            Text(QuizQuestions[currentQuestionIndex].distractor3)
                                .frame(height: 70)
                                .frame(width: 150)
                                .background(Color.cyan)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.system(size: 30, weight: Font.Weight.bold))
                        }
                        .padding(.vertical, 30)
                        Button {
                            print("Button4 tapped!!")
                            isAnswered = true
                            isAnswerIncorrect = true
                            //selectedOption = 4
                        } label: {
                            Text(QuizQuestions[currentQuestionIndex].distractor4)
                                .frame(height: 70)
                                .frame(width: 150)
                                .background(Color.cyan)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.system(size: 30, weight: Font.Weight.bold))
                        }
                    }
                    .padding(10)
                }
                .padding(20)
                
            }
            .padding(30)
        }
        .alert("Correct!!!", isPresented: $isAnswerCorrect){
            Button("OK"){
                isAnswerCorrect = false
                correctAnswer += 1
                questionCount = +1
                currentQuestionIndex = (currentQuestionIndex+1) % QuizQuestions.count
                if questionCount == maxQuestion {
                    quizCompleted = true
                }
            }
        }
        .alert("Incorrect", isPresented: $isAnswerIncorrect){
            Button("OK"){
                isAnswerCorrect = false
                questionCount += 1
                if questionCount == maxQuestion {
                    quizCompleted = true
                }
                currentQuestionIndex = (currentQuestionIndex+1) % QuizQuestions.count
            }
            .sheet(isPresented: $quizCompleted){
                ScoreView(correctAnswers: correctAnswer)
            }
        }
    }
        
}

