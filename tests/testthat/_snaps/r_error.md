# r_error message body matches snapshot for English

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["messages", "max_tokens"]
        }
      },
      "value": [
        {
          "type": "list",
          "attributes": {},
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["role", "content"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["system"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["You are helping students in an R programming course for beginners and give feedback on what is wrong, how to correct the mistake and how to improve in the future. Your response contains three sentences, one for the error identification, one for the explanation why it is wrong and one for the suggestion how to correct it."]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["role", "content"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["user"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["You got the following information on the current state of my work in R: {\"script\":\"test.R\",\"objects\":[],\"datastructure\":{}} Analyze the information provided step by step and afterwards give feedback on how to correct the issue mentioned in the error message in maximum three sentences. Provide line numbers."]
                }
              ]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200]
        }
      ]
    }

# r_error message body matches snapshot for German

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["messages", "max_tokens"]
        }
      },
      "value": [
        {
          "type": "list",
          "attributes": {},
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["role", "content"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["system"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Du hilfst Studierenden in einem R Programmierkurs fuer Anfaenger und gibst Feedback was falsch ist, wie es verbessert werden kann und wie sich in der Zukunft verbessert werden kann. Die Antwort besteht aus drei Saetzen, einer fuer die Identifikation des Fehlers, einer fuer die Erklaerung wieso es falsch ist und einer fuer die Empfehlung fuer die Verbesserung."]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["role", "content"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["user"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Du hast die folgenden Informationen ueber mein R environment: {\"script\":\"test.R\",\"objects\":[],\"datastructure\":{}} Analysier the informationen eine nach der anderen und anschliessend gib mir Feedback wie ich den Fehler beheben kann, der in der Fehlermeldung auftaucht in maximal drei Saetzen."]
                }
              ]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200]
        }
      ]
    }

