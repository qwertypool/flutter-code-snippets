//Firstly add the dependency survey_kit: ^0.0.11 (latest one)
// Run flutter pub get
// Then find the code below(modify as per requirements.)

import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class Surveys_custom extends StatefulWidget {
  Surveys_custom({Key key}) : super(key: key);

  @override
  _Surveys_customState createState() => _Surveys_customState();
}

class _Surveys_customState extends State<Surveys_custom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: double.infinity,
            width: 600,
            child: SurveyKit(
              onResult: (SurveyResult result) {
                print(result.finishReason);
              },
              task: getSampleTask(),
              themeData: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.cyan,
                ).copyWith(
                  onPrimary: Colors.white,
                ),
                primaryColor: Colors.purpleAccent,
                backgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  iconTheme: IconThemeData(
                    color: Colors.purpleAccent,
                  ),
                  textTheme: TextTheme(
                    button: TextStyle(
                      color: Colors.cyan,
                    ),
                  ),
                ),
                iconTheme: const IconThemeData(
                  color: Colors.purpleAccent,
                ),
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(150.0, 60.0),
                    ),
                    side: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> state) {
                        if (state.contains(MaterialState.disabled)) {
                          return BorderSide(
                            color: Colors.grey,
                          );
                        }
                        return BorderSide(
                          color: Colors.purpleAccent,
                        );
                      },
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    textStyle: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> state) {
                        if (state.contains(MaterialState.disabled)) {
                          return Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.grey,
                              );
                        }
                        return Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.purpleAccent,
                            );
                      },
                    ),
                  ),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.cyan,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Task getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the\nDeal Brand\nGoogle Survey',
          text: 'Get ready for a bunch of super interesting questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age',
          
          ),
        ),
        QuestionStep(
          title: 'Shpping?',
          text: 'Do you prefer online shopping?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        // QuestionStep(
        //   title: 'Tell us about you',
        //   text:
        //       'Tell us about yourself and why you want to improve your health.',
        //   answerFormat: TextAnswerFormat(
        //     maxLines: 5,
        //   ),
        // ),
        QuestionStep(
          title: 'Rate the app',
          answerFormat: ScaleAnswerFormat(
            step: 3,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: 'Favourite Sport',
          text: 'Which of the following sports do you watch ?',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Football', value: 'Football'),
              TextChoice(text: 'Basket ball', value: 'Basket ball'),
              TextChoice(text: 'Gymnastics', value: 'Gymnastics'),
              TextChoice(text: 'Swimming', value: 'Swimming'),
              TextChoice(text: 'Auto Racing', value: 'autoracing'),
              TextChoice(text: 'Baseball', value: 'Baseball'),
            ],
          ),
        ),
        QuestionStep(
          title: 'Done?',
          text: 'We are done, do you mind to tell us more about yourself...?',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Yes', value: 'Yes'),
              TextChoice(text: 'No', value: 'No'),
            ],
          ),
        ),
        QuestionStep(
          title: 'When are your office hours?',
          answerFormat: TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 12,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'When was your last holiday?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
          ),
        ),
        CompletionStep(
          id: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey, we will contact you soon!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[6].id,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].id;
            case "No":
              return task.steps[7].id;
            default:
              return null;
          }
        },
      ),
    );
    return task;
  }
}
