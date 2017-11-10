# How-To-Design-Programs-Scheme
Systematically learning how to design programs through a design recipe

HOW TO DESIGN FUNCTIONS (HTDF)

The HtDF recipe consists of the following steps:

1. Signature, purpose and stub.
2. Define examples, wrap each in check-expect.
3. Template and inventory.
4. Code the function body.
5. Test and debug until correct

HOW TO DESIGN DATA (HTDD)

Data definitions are a driving element in the design recipes.
A data definition establishes the represent/interpret relationship between information and data:
Information in the program's domain is represented by data in the program.
Data in the program can be interpreted as information in the program's domain.

The first step of the recipe is to identify the inherent structure of the information.
Once that is done, a data definition consists of four or five elements:

1. A possible structure definition (not until compound data)
2. A type comment that defines a new type name and describes how to form data of that type.
3. An interpretation that describes the correspondence between information and data.
4. One or more examples of the data.
5. A template for a 1 argument function operating on data of this type.

HOW T0 DESIGN WORLDS (HTDW)

The How to Design Worlds process provides guidance for designing interactive world programs using big-bang. While some elements of the process are tailored to big-bang, the process can also be adapted to the design of other interactive programs. The wish-list technique can be used in any multi-function program.

World program design is divided into two phases, each of which has sub-parts:

### 1. Domain analysis (use a piece of paper!)

1. Sketch program scenarios
2. Identify constant information
3. Identify changing information
4. Identify big-bang options

### 2.  Build the actual program

1. Constants 
2. Data definitions using HtDD 
3. Functions using HtDF
4. main first 
5. wish list entriesfor big-bang handlers
6. Work through wish list until done
