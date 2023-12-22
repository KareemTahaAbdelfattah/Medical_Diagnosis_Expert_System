:- dynamic g6pd_deficiency/1, no_g6pd_deficiency/1.

% FACTS about family and genetic disease
parent(grandparent, parent).
parent(parent, child).

% Rules for genetic disease (Favism)
has_favism(X) :- parent(Y, X), has_favism(Y).
has_favism(person) :- g6pd_deficiency(person).

% Recursive rule to ask about Favism in a family member
check_favism(X) :-
    write('Does the '), write(X), write(' have Favism? (yes/no): '),
    read(Response),
    (Response == yes ; Response == y),
    assert(g6pd_deficiency(X)),
    !.
check_favism(X) :-
    assert(no_g6pd_deficiency(X)).

% Main entry point
go :-   run_symptom_diagnosis.
	
        
        
    

% Run symptom-based diagnosis
run_symptom_diagnosis :-
    hypothesis(Disease),
    write('I believe that the patient has '),
    write(Disease),
    nl,
    write('TAKE CARE '),
    nl,
    undo.

% Run genetic disease (Favism) check
run_genetic_diagnosis :-
    ask_favism(parent),
    ask_favism(grandparent),
    (g6pd_deficiency(parent) ; g6pd_deficiency(grandparent)),
    write_result.

% Ask about Favism for a family member
ask_favism(X) :-
    write('Does the '), write(X), write(' have Favism? (yes/no): '),
    read(Response),
    (Response == yes ; Response == y),
    assert(g6pd_deficiency(X)),
    !.
ask_favism(X) :-
    assert(no_g6pd_deficiency(X)).

% Write the result based on the family's Favism status
write_result :-
    (g6pd_deficiency(parent) ; g6pd_deficiency(grandparent)),
    write('You probably have Favism.'),
    nl,
    undo.

write_result :-
    write('You can\'t have Favism.'),
    nl,
    undo.

% Undo all assertions
undo :- retract(g6pd_deficiency(_)), retract(no_g6pd_deficiency(_)), fail.


/*Hypothesis that should be tested*/
hypothesis(cold)     :- cold, !.
hypothesis(flu)      :- flu, !.
hypothesis(typhoid)  :- typhoid, !.
hypothesis(measles)  :- measles, !.
hypothesis(malaria)  :- malaria, !.
hypothesis(migraine) :- migraine, !.
hypothesis(hyperthyroidism) :- hyperthyroidism, !.
hypothesis(mumps) :-   mumps, !.
hypothesis(rheumatoid_arthritis) :- rheumatoid_arthritis, !.
hypothesis(chicken_pox) :- chicken_pox, !.
hypothesis(asthma) :-   asthma, !.
hypothesis(favism) :- run_genetic_diagnosis, !.
hypothesis(unknown). /* no diagnosis*/

cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol/tab'),
nl,
write('2: panadol/tab'),
nl,
write('3: Nasal spray'),
nl,
write('Please wear warm cloths Because'),
nl.
flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_ache),
write('Advices and Sugestions:'),
nl,
write('1: Tamiflu/tab'),
nl,
write('2: panadol/tab'),
nl,
write('3: Zanamivir/tab'),
nl,
write('Please take a warm bath and do salt gargling Because'),
nl.
typhoid :-
verify(headache),
verify(abdominal_pain),
verify(poor_appetite),
verify(fever),
write('Advices and Sugestions:'),
nl,
write('1: Chloramphenicol/tab'),
nl,
write('2: Amoxicillin/tab'),
nl,
write('3: Ciprofloxacin/tab'),
nl,
write('4: Azithromycin/tab'),
nl,
write('Please do complete bed rest and take soft Diet Because'),
nl.
measles :-
verify(fever),
verify(runny_nose),
verify(rash),
verify(conjunctivitis),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol/tab'),
nl,
write('2: Aleve/tab'),
nl,
write('3: Advil/tab'),
nl,
write('4: Vitamin A'),
nl,
write('Please Get rest and use more liquid  Because'),
nl.
malaria :-
verify(fever),
verify(sweating),
verify(headache),
verify(nausea),
verify(vomiting),
verify(diarrhea),
write('Advices and Sugestions:'),
nl,
write('1: Aralen/tab'),
nl,
write('2: Qualaquin/tab'),
nl,
write('3: Plaquenil/tab'),
nl,
write('4: Mefloquine'),
nl,
write('Please do not sleep in open air and cover your full skin Because'),
nl.
rheumatoid_arthritis:-
verify(joint_stiffness),
verify(swelling),
verify(warmth_in_joints),
write('Advices and Sugestions:'),
nl,
write('1:  adalimumab/tab'),
nl,
write('2:   etanercept/tab'),
nl,
write('3:   infliximab)'),
nl,
write('Consult with a physical therapist to develop a tailored exercise program'),
nl.  
asthma :-
verify(chest_tightness),
verify(difficulty_breathing),
verify(wheezing),
write('Advices and Sugestions:'),
nl,
write('1: albuterol/tab'),
nl,
write('2:  levalbuterol/tab'),
nl,
write('3:  salmeterol'),
nl,
write('Manage stress through relaxation techniques and stress-reduction strategies'),
nl.  
chicken_pox :-
verify(fever),
verify(chills),
verify(body_ache),
verify(rash),
write('Advices and Suggestions:'),
nl,
write('1: Zovirax/tab'),
nl,
write('2: Valtrex/tab'),
nl,
write('3: Benadryl'),
nl,
write('Wear loose-fitting clothing to prevent irritation'),
nl.  
mumps :-
verify(fever),
verify(swollen_glands),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol/tab'),
nl,
write('2: Motrin/tab'),
nl,
write('3: Advil '),
nl,
write(' Avoid strenuous activities.'),
nl.
hyperthyroidism :-
verify(weight_loss),
verify(fatigue),
verify(increased_appetite),
write('Advices and Sugestions:'),
nl,
write('1: Methimazole /tab'),
nl,
write('2: Propylthiouraci/tab'),
nl,
write('3: atenolol '),
nl,
write('Avoid Stimulants'),
nl.
migraine :-
verify(severe_headache),
verify(sensitivity_to_light),
verify(nausea),
write('Advices and Sugestions:'),
nl,
write('1: propranolol/tab'),
nl,
write('2: amitriptyline/tab'),
nl,
write('3: valproic acid'),
nl,
write('Stay Hydrated'),
nl.
favism :-
run_genetic_diagnosis.

/* how to ask questions */
ask(Question) :-
write('Does the patient have following symptom '),
write(Question),
write(' (y.) or (n.) ? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
 (yes(S)
  ->
   true ;
 (no(S)
  ->
   fail ;
 ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
