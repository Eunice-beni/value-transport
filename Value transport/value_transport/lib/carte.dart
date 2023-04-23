/**
 *  Positioned(
            top: 0,
            width: width,
            height: 130,
            child: Container(
              color: Colors.amber,
              child: ListView(
                children: [
                  FormHelper.dropDownWidget(
                    context,
                    "Point de départ",
                    this.depart,
                    this.itineraire,
                    (onChanged) {
                      this.itineraire = onChanged;
                      print("Salut");
                    },
                    (onValidate) {
                      if (onValidate == null) {
                        return "Veuillez choisir un point de départ";
                      }
                      {
                        print(onValidate);
                        return null;
                      }
                    },
                    paddingTop: 10,
                    optionValue: "id",
                    optionLabel: "label",
                    borderColor: Colors.amber,
                    borderRadius: 10,
                    borderFocusColor: Colors.amber,
                  ),
                  FormHelper.dropDownWidget(
                    context,
                    "Destination",
                    this.destination,
                    this.itineraire,
                    (onChanged) {
                      this.itineraire = onChanged;
                    },
                    (onValidate) {
                      if (onValidate == null) {
                        return "Veuillez choisir un point de départ";
                        print(this.itineraire);
                      }
                      {
                        print(onValidate);
                        return null;
                      }
                    },
                    paddingTop: 10,
                    optionValue: "id",
                    optionLabel: "label",
                    borderColor: Colors.amber,
                    borderRadius: 10,
                    borderFocusColor: Colors.amber,
                  )
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
                color: Colors.amber,
                width: width,
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    child: const Text(
                      "Afficher les moyens disponibles",
                      style:
                          TextStyle(color: Color.fromARGB(255, 151, 149, 243)),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white,
                        // ignore: prefer_const_constructors
                        side: BorderSide(color: Color(0xff403E9F))),
                    onPressed: () {},
                  ),
                ))),
 */