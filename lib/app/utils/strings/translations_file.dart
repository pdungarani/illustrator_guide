// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationsFile extends Translations {
  static const listOfLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('ge'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'appName': 'Illustrator Guide',
          "login": "Login",
          "login_des": "Please sign in to continue.",
          "register": "Register",
          "register_des": "Please register to login.",
          "email": "Email",
          "enter_email": "Enter email",
          "enter_valid_email": "Enter valid email",
          "name": "Name",
          "enter_name": "Enter name",
          "password": "Password",
          "enter_password": "Enter password",
          "confirm_password": "Confirm Password",
          "enter_confirm_password": "Enter confirm password",
          "confirm_password_error":
              "Confirm password and password must be same",
          "forgot_password": "Forgot Password?",
          "dont_have_account": "Dont't have an account? ",
          "already_have_account": "Already have account? ",
          "move_tool": "Move Tool",
          "selection_tool": "Selection Tool",
          "pen_tool": "Pen Tool",
          "join_tool": "Join Tool",
          "align": "Align",
          "pathfinder": "Pathfinder",
          "type_tool": "Type Tool",
          "clipping_mask": "Clipping Mask",
          "shape_builder_tool": "Shape Builder Tool",
          "illustrator_guid": "Illustrator Guide",
          "home": "Home",
          "language": "Language",
          "logout": "Logout",
          "align_que1": "Introduction to Align Tool in Illustrator",
          "align_ans1":
              "The Align Tool in Adobe Illustrator is an essential feature used to align and distribute objects with precision. It helps designers arrange elements in relation to each other or the artboard, ensuring consistency, balance, and professional results in their designs.",
          "align_que2": "How to Use Align Tool in  Illustrator?",
          "align_ans2":
              "In Illustrator, access the align panel by clicking Window > Align (Shift + F7). In Design, access the align panel by clicking Window > Object & Layout > Align (Shift + F7). Tip: Drag the align panel to your windows panel to give you easy access to the alignment panel.",
          "align_step1": "1.Select the objects to align or distribute.",
          "align_step2":
              "2.Using the Selection tool, Shift-click on the artboard you want to use to activate it.",
          "align_step3":
              "3.In the Align or Control panel, select Align To Artboard, then click the button for the type of alignment or distribution you want.",
          "move_que1": "Introduction to Move Tool in Illustrator",
          "move_ans1":
              "The Move tool in Adobe Illustrator is a fundamental feature that allows users to position and arrange selected content or layers within their artwork. This tool is essential for customizing designs, ensuring that elements are placed precisely where you want them.",
          "move_que2": "How to Use Move Tool in Illustrator?",
          "move_step1":
              "1.Use the Selection tool (shortcut: V) to click on the object you want to move.",
          "move_step2":
              "2.Click and drag the selected object to reposition it on the canvas. Hold the Shift key while dragging to constrain movement to 45-degree angles.",
          "move_step3":
              "3.Use the arrow keys to move the object by 1 pixel at a time for precise adjustments.",
          "join_que1": "Introduction to Move Tool in Illustrator",
          "join_ans1":
              "The Join tool in Adobe Illustrator is a powerful feature used to connect two or more open paths or anchor points, creating a continuous line or shape. This tool is essential for refining your designs, especially when working with complex vector graphics.",
          "join_que2": "How to Use Move Tool in Illustrator?",
          "join_step1":
              "1.Use the Direct Selection tool (shortcut: A) to select the two open endpoints or segments you want to join.",
          "join_step2":
              "2.Go to Object > Path > Join or use the keyboard shortcut Command/Ctrl + J to connect the selected paths at their intersection point.",
          "join_step3":
              "3.The Join tool will automatically trim any overlapping segments, creating a seamless connection between the paths.",
          "join_step4":
              "4.You can select multiple endpoints to join them all at once, making it easier to create complex shapes or paths.",
          "selection_que1":
              "Introduction to Direct Selection Tool in Illustrator",
          "selection_ans1":
              "The Direct Selection Tool (shortcut: A) is a fundamental feature in Adobe Illustrator that allows users to select and manipulate individual anchor points and segments of a path or shape. This tool is essential for achieving precision in editing, enabling you to make specific adjustments to your designs.",
          "selection_que2": "How to Use Direct Selection Tool in Illustrator?",
          "selection_step1":
              "1.Activate the Direct Selection Tool by clicking on it in the toolbar or using the keyboard shortcut A.",
          "selection_step2":
              "2.Click directly on an anchor point to select it. You can also click and drag to create a selection box around multiple points.",
          "selection_step3":
              "3.Once selected, click and drag the anchor point(s) to reposition them. This allows for precise adjustments to the shape of your path.",
          "selection_step4":
              "4.You can also select and move entire segments of a path by clicking on the segment itself. This is useful for reshaping your design.",
          "selection_step5":
              "5.Hold down the Shift key while clicking to add or remove points from your selection, allowing for flexible editing of multiple points at once.",
          "pen_que1": "Introduction to Pen Tool in Illustrator",
          "pen_ans1":
              "The Pen Tool is one of the most essential and powerful tools in Adobe Illustrator, widely used for creating precise paths and shapes. It allows users to draw both straight lines and complex curves by placing anchor points and manipulating their handles.",
          "pen_que2": "How to Use Pen Tool in Illustrator?",
          "pen_step1":
              "1.Choose the Pen Tool from the toolbar or press the keyboard shortcut P.",
          "pen_step2":
              "2.Click on the artboard to place your first anchor point. Continue clicking to create straight lines between points.",
          "pen_step3":
              "3.To create curves, click and drag to create direction handles at the anchor points. The length and angle of these handles determine the curvature of the line.",
          "pen_step4":
              "4.To close a shape, click back on the first anchor point you created. This will connect the last point to the first, forming a complete shape.",
          "pen_step5":
              "5.Use the Direct Selection Tool (shortcut: A) to select and adjust anchor points or handles after creating your path for further refinement.",
          "clipping_que1": "Introduction to Clipping Mask Tool in Illustrator",
          "clipping_ans1":
              "A Clipping Mask in Adobe Illustrator is a powerful tool that allows you to control the visibility of artwork by using a shape (the mask) to define which parts of the underlying objects are visible. This technique is particularly useful for creating complex designs, patterns, and effects without permanently altering the original artwork.",
          "clipping_que2": "How to Use Clipping Mask Tool in Illustrator?",
          "clipping_step1":
              "Draw the shape that you want to use as the clipping mask. This shape will define the visible area of the underlying artwork.",
          "clipping_step2":
              "Select the object(s) you want to clip. This can be an image, text, or any vector shape.",
          "clipping_step3":
              "With both the mask shape and the artwork selected, go to the menu and choose Object > Clipping Mask > Make. Alternatively, you can use the shortcut Command + 7 on Mac or Ctrl + 7 on Windows to quickly create the mask.",
          "clipping_step4":
              "If you need to adjust the mask or the clipped artwork, you can select the clipping path in the Layers panel or use the Direct Selection Tool to move or edit the mask shape.",
          "pathfinder_que1": "Introduction to Path Finder Tool in Illustrator",
          "pathfinder_ans1":
              "The Pathfinder Tool in Adobe Illustrator is a powerful feature that allows you to manipulate and combine vector shapes in various ways. It provides a set of commands that enable you to create complex designs by merging, subtracting, and intersecting shapes, making it an essential tool for graphic designers.",
          "pathfinder_que2": "How to Use Path Finder Tool in Illustrator?",
          "pathfinder_step1":
              "Open the Pathfinder Panel: Go to the Window menu and select Pathfinder to open the Pathfinder panel.",
          "pathfinder_step2":
              "Select Shapes: Choose the vector shapes you want to manipulate by clicking on them while holding the Shift key to select multiple objects.",
          "pathfinder_step3": "Unite: Combines selected shapes into one.",
          "pathfinder_step4":
              "Minus Front: Subtracts the top shape from the bottom shape.",
          "pathfinder_step5":
              "Intersect: Keeps only the overlapping area of the selected shapes.",
          "pathfinder_step6":
              "Exclude: Removes the overlapping area, creating a new shape from the non-overlapping parts.",
          "pathfinder_step7":
              "Expand the Result: If you want to keep the new shape as a single object, you can go to Object > Expand to finalize the changes.",
          "shape_que1": "Introduction to Shape Builder Tool in Illustrator",
          "shape_ans1":
              "The Shape Builder Tool in Adobe Illustrator is a versatile feature that allows you to create complex shapes by combining, editing, and filling simpler shapes directly on your artboard. This tool streamlines the process of shape manipulation, offering a more intuitive and efficient way to design compared to traditional methods like the Pathfinder.",
          "shape_que2": "How to Use Shape Builder Tool in Illustrator?",
          "shape_step1":
              "Select Shapes: First, create and select the overlapping shapes you want to work with.",
          "shape_step2":
              "Activate the Tool: Click on the Shape Builder Tool in the toolbar or press Shift + M to activate it.",
          "shape_step3":
              "Combine Shapes: Click and drag across the areas you want to merge. A plus sign will appear, indicating that those regions will be combined into a new shape.",
          "shape_step4":
              "Erase Portions: To remove parts of the shapes, hold the Alt (or Option on Mac) key while clicking on the areas you want to erase.",
          "shape_step5":
              "Fill Shapes: You can also click on individual regions to fill them with color, allowing for quick customization of your design.",
          "type_que1": "Introduction to Shape Builder Tool in Illustrator",
          "type_ans1":
              "The Type Tool in Adobe Illustrator is a fundamental feature that allows users to add and manipulate text within their designs. It is essential for creating typographical elements, whether for logos, advertisements, or any graphic design project.",
          "type_que2": "How to Use Shape Builder Tool in Illustrator?",
          "type_step1":
              "Select the Type Tool: Click on the Type Tool in the toolbar or press T on your keyboard.",
          "type_step2":
              "Add Point Type: Click anywhere on the artboard to create point type. This allows you to start typing immediately, and the text will not wrap to the next line unless you create a new point.",
          "type_step3":
              "Create Area Type: To create text that wraps within a shape, select the Area Type Tool (found under the Type Tool) and click and drag to define a text area.",
          "type_step4":
              "Type on a Path: For text that follows a path, select the Type on a Path Tool and click on the path where you want the text to begin.",
          "type_step5":
              "Format Text: Use the Character and Paragraph panels to adjust font, size, spacing, and alignment as needed.",
          'policy': 'Privacy Policy',
          'no_internet': 'No Internet Connection found.',
          'check_internet': 'Check your connection or try again.',
          '': '',
        },
        'gu': {
          "appName": "ઈલસ્ટ્રેટર માર્ગદર્શિકા",
          "login": "લૉગિન",
          "login_des": "ચાલુ રાખવા માટે કૃપા કરીને સાઇન ઇન કરો.",
          "register": "રજીસ્ટર",
          "register_des": "લૉગિન કરવા માટે કૃપા કરીને રજીસ્ટર કરો.",
          "email": "ઇમેઇલ",
          "enter_email": "ઇમેઇલ દાખલ કરો",
          "enter_valid_email": "માન્ય ઇમેઇલ દાખલ કરો",
          "name": "નામ",
          "enter_name": "નામ દાખલ કરો",
          "password": "પાસવર્ડ",
          "enter_password": "પાસવર્ડ દાખલ કરો",
          "confirm_password": "પાસવર્ડની પુષ્ટિ કરો",
          "enter_confirm_password": "પાસવર્ડની પુષ્ટિ દાખલ કરો",
          "confirm_password_error":
              "પાસવર્ડ અને પુષ્ટિ પાસવર્ડ એકસરખા હોવા જોઈએ",
          "forgot_password": "પાસવર્ડ ભૂલી ગયા?",
          "dont_have_account": "ખાતું નથી?",
          "already_have_account": "પહેલેથી જ એકાઉન્ટ છે?",
          "move_tool": "મૂવ ટૂલ",
          "selection_tool": "સિલેક્શન ટૂલ",
          "pen_tool": "પેન ટૂલ",
          "join_tool": "જોઈન ટૂલ",
          "align": "અલાઇન",
          "pathfinder": "પાથફાઇન્ડર",
          "type_tool": "ટાઇપ ટૂલ",
          "clipping_mask": "ક્લિપિંગ માસ્ક",
          "shape_builder_tool": "શેપ બિલ્ડર ટૂલ",
          "illustrator_guid": "ઈલસ્ટ્રેટર માર્ગદર્શિકા",
          "home": "હોમ",
          "language": "ભાષા",
          "logout": "લૉગઆઉટ",
          "align_que1": "Illustrator માં Align Tool નું પરિચય",
          "align_ans1":
              "Adobe Illustrator માં Align Tool એ એક મહત્વપૂર્ણ ફીચર છે જે ઑબ્જેક્ટ્સને ચોકસાઈથી સરખાવા અને વિતરણ કરવામાં મદદ કરે છે. તે ડિઝાઇનર્સને તેમના તત્વોને એકબીજાને અથવા આર્ટબોર્ડને સંદર્ભ તરીકે સજાવટ કરવામાં સહાય કરે છે, જેના પરિણામે ડિઝાઇનમાં સરૂરીયાત, સંતુલન અને વ્યાવસાયિક પરિણામો મળે છે.",
          "align_que2": "Illustrator માં Align Tool કેવી રીતે વાપરવું?",
          "align_ans2":
              "Illustrator માં Align પેનલને ઍક્સેસ કરવા માટે, Window > Align (Shift + F7) પર ક્લિક કરો. Design માં, Align પેનલને ઍક્સેસ કરવા માટે, Window > Object & Layout > Align (Shift + F7) પર ક્લિક કરો. ટિપ: Align પેનલને તમારી વિન્ડોઝ પેનલ પર ખેંચી જાવ જેથી આલાઇનેમેન્ટ પેનલ માટે સરળ ઍક્સેસ મળી શકે.",
          "align_step1":
              "1. ઑબ્જેક્ટ્સને પસંદ કરો જેને Align અથવા વિતરણ કરવું છે.",
          "align_step2":
              "2. Selection Tool નો ઉપયોગ કરીને, Shift-click કરો તે આર્ટબોર્ડ પર જેના પર તમે કામ કરવા માંગો છો.",
          "align_step3":
              "3. Align અથવા Control પેનલમાં Align To Artboard પસંદ કરો, પછી તે ALIGN અથવા વિતરણ પ્રકાર માટે બટન પર ક્લિક કરો.",
          "move_que1": "Illustrator માં Move Tool નું પરિચય",
          "move_ans1":
              "Adobe Illustrator માં Move Tool એ એક મૌલિક ફીચર છે જે વપરાશકર્તાઓને તેમની કલાકૃતિમાં પસંદ કરેલી સામગ્રી અથવા લેયરોને સ્થાન આપવા અને વ્યવસ્થિત કરવા માટે અનુમતિ આપે છે. આ ટૂલ ડિઝાઇનને અનુકૂળ બનાવવા માટે આવશ્યક છે, જે સુનિશ્ચિત કરે છે કે તત્વો તમારી ઇચ્છિત જગ્યા પર ચોકસાઈથી મૂકો.",
          "move_que2": "Illustrator માં Move Tool કેવી રીતે વાપરવું?",
          "move_step1":
              "1. Selection Tool (શૉર્ટકટ: V) નો ઉપયોગ કરીને તે ઑબ્જેક્ટ પર ક્લિક કરો જેને તમે ખસેડવા માંગો છો.",
          "move_step2":
              "2. પસંદ કરેલા ઑબ્જેક્ટ પર ક્લિક કરો અને તેને કેનવાસ પર પુનઃસ્થાપિત કરવા માટે ખેંચો. ડ્રેગ કરતી વખતે Shift કી દબાવા રાખો જેથી ગતિ 45-ડિગ્રી એંગલ્સ પર મર્યાદિત રહે.",
          "move_step3":
              "3. ચોકસાઈથી ફેરફાર કરવા માટે એરો કીનો ઉપયોગ કરીને ઑબ્જેક્ટને એક સમયે 1 પિક્સલ ખસેડો.",
          "join_que1": "Illustrator માં Join Tool નું પરિચય",
          "join_ans1":
              "Adobe Illustrator માં Join Tool એ એક શક્તિશાળી ફીચર છે જે બે અથવા વધુ ખૂલેલા પાથો અથવા એન્કર પોઈન્ટ્સને જોડવા માટે વપરાય છે, જે એક સતત રેખા અથવા આકાર બનાવે છે. આ ટૂલ ડિઝાઇન્સને પરિશ્રમિત કરવા માટે આવશ્યક છે, ખાસ કરીને જ્યારે જટિલ વેક્ટર ગ્રાફિક્સ પર કામ કરવામાં આવે છે.",
          "join_que2": "Illustrator માં Move Tool કેવી રીતે વાપરવું?",
          "join_step1":
              "1. Direct Selection Tool (શૉર્ટકટ: A) નો ઉપયોગ કરીને તે બે ખૂલો એન્ડપોઈન્ટ્સ અથવા સેગમેન્ટ પસંદ કરો જેને તમે જોડવા માંગો છો.",
          "join_step2":
              "2. Object > Path > Join પર જાઓ અથવા Command/Ctrl + J શૉર્ટકટનો ઉપયોગ કરીને પસંદ કરેલા પાથોને તેમના ક્રોસિંગ પોઈન્ટ પર જોડો.",
          "join_step3":
              "3. Join Tool આપોઆપ ઓવરલેપ થતો સેગમેન્ટ કટ કરશે, જે પાથો વચ્ચે સરળ જોડાણ બનાવશે.",
          "join_step4":
              "4. તમે અનેક એન્ડપોઈન્ટ્સને પસંદ કરી તેમને એકસાથે જોડવા માટે સેકન્ડોનો ઉપયોગ કરી શકો છો, જે જટિલ આકારો અથવા પાથો બનાવવા માટે સરળ બનાવે છે.",
          "selection_que1": "Illustrator માં Direct Selection Tool નું પરિચય",
          "selection_ans1":
              "Direct Selection Tool (શૉર્ટકટ: A) Adobe Illustrator માં એક મૂળભૂત ફીચર છે જે વપરાશકર્તાઓને પાથ અથવા આકારના એન્કર પોઈન્ટ અને સેગમેન્ટોને પસંદ અને મેનેજ કરવાની સુવિધા આપે છે. આ ટૂલ સંપાદનમાં ચોકસાઇ પ્રાપ્ત કરવા માટે જરૂરી છે, જે તમારા ડિઝાઇનમાં ચોક્કસ રીતે ફેરફાર કરવાની મંજુરી આપે છે.",
          "selection_que2":
              "Illustrator માં Direct Selection Tool કેવી રીતે વાપરવું?",
          "selection_step1":
              "1. Direct Selection Tool ને ટૂલબાર પર ક્લિક કરીને અથવા કીબોર્ડ શૉર્ટકટ A નો ઉપયોગ કરીને સક્રિય કરો.",
          "selection_step2":
              "2. એન્કર પોઈન્ટ પર સીધા ક્લિક કરો અને તેને પસંદ કરો. તમે એકથી વધુ પોઈન્ટોને પસંદ કરવા માટે ક્લિક અને ડ્રેગ પણ કરી શકો છો.",
          "selection_step3":
              "3. એકવાર પસંદ થયા પછી, એન્કર પોઈન્ટ(ઓ)ને ખેંચી તેનાથી પથનો પરિપ્રેક્ષ્ય બદલો. આ તમારા પાથના આકારમાં ચોકસાઇથી ફેરફાર કરવા માટેની મંજૂરી આપે છે.",
          "selection_step4":
              "4. તમે પાથના પૂર્ણ સેગમેન્ટને પસંદ કરીને તે સ્થાનાંતરિત કરી શકો છો, જે પાથના સેગમેન્ટ પર ક્લિક કરીને સરળતાથી થઈ શકે છે.",
          "selection_step5":
              "5. Shift કી દબાવી રાખીને ક્લિક કરો, જે તમને તમારી પસંદગીમાંથી પોઈન્ટ ઉમેરવા અથવા દૂર કરવા માટે સકુન્ય આપે છે, જેથી તમે એકવારમાં ઘણા પોઈન્ટ્સનો અનુકૂળ સંપાદન કરી શકો.",
          "pen_que1": "Illustrator માં Pen Tool નું પરિચય",
          "pen_ans1":
              "Pen Tool એ Adobe Illustrator માંથી એક મહત્વપૂર્ણ અને શક્તિશાળી ટૂલ છે, જે ચોકસાઇથી પાથ અને આકાર બનાવવા માટે વ્યાપકપણે ઉપયોગમાં લેવાય છે. આ ટૂલ વપરાશકર્તાઓને એન્કર પોઈન્ટ્સ મૂકી અને તેમના હેન્ડલ્સને નિયંત્રિત કરીને સીધી લાઇન્સ અને જટિલ વક્ર રેખાઓ દોરવા માટેની પરવાનગી આપે છે.",
          "pen_que2": "Illustrator માં Pen Tool કેવી રીતે વાપરવું?",
          "pen_step1":
              "1. Pen Tool ને ટૂલબારમાંથી પસંદ કરો અથવા કીબોર્ડ શૉર્ટકટ P દબાવો.",
          "pen_step2":
              "2. તમારા પ્રથમ એન્કર પોઈન્ટને મૂકવા માટે આર્ટબોર્ડ પર ક્લિક કરો. પોઈન્ટ્સ વચ્ચે સીધી રેખાઓ બનાવવા માટે ક્લિક કરવાનું ચાલુ રાખો.",
          "pen_step3":
              "3. વક્ર બનાવવા માટે, એન્કર પોઈન્ટ્સ પર દિશા હેન્ડલ્સ બનાવવા માટે ક્લિક કરો અને ખેંચો. આ હેન્ડલ્સની લંબાઈ અને કોણ લાઇনের વક્રતા નક્કી કરે છે.",
          "pen_step4":
              "4. આકાર બંધ કરવા માટે, તમારા પહેલા બનાવેલા એન્કર પોઈન્ટ પર પાછા ક્લિક કરો. આ અંતિમ પોઈન્ટને પહેલાની સાથે જોડશે, અને એક સંપૂર્ણ આકાર બનાવશે.",
          "pen_step5":
              "5. પાથ બનાવ્યા પછી વધુ સુધારા માટે, Direct Selection Tool (શૉર્ટકટ: A) નો ઉપયોગ કરીને એન્કર પોઈન્ટ્સ અથવા હેન્ડલ્સને પસંદ અને સમાયોજિત કરો.",
          "clipping_que1": "Illustrator માં Clipping Mask Tool નું પરિચય",
          "clipping_ans1":
              "Adobe Illustrator માં Clipping Mask એ એક શક્તિશાળી ટૂલ છે જે તમને એક આકાર (mask) નો ઉપયોગ કરીનેArtworkની_visibilityને નિયંત્રિત કરવાની પરવાનગી આપે છે, જેમાં તે અવલોકિત પોઈન્ટો બતાવે છે. આ તકનીક જટિલ ડિઝાઇન, પેટર્ન અને અસરો બનાવવામાં ખાસ ઉપયોગી છે, જ્યારે મૂળ artworkને સ્થિર રીતે બદલીને વગર.",
          "clipping_que2":
              "Illustrator માં Clipping Mask Tool કેવી રીતે વાપરવું?",
          "clipping_step1":
              "તે આકારને ડ્રોઓ કરો જેને તમે clipping mask તરીકે ઉપયોગ કરવા માંગો છો. આ આકાર underlying artworkના દૃશ્યમાન વિસ્તારમાં નિર્ધારણ કરશે.",
          "clipping_step2":
              "તે વસ્તુ (ઓ) પસંદ કરો જેને તમે ક્લિપ કરવું છે. આ છબી, લખાણ, અથવા કોઈ પણ વેક્ટર આકાર હોઈ શકે છે.",
          "clipping_step3":
              "Mask આકાર અને artwork બંને પસંદ કરીને, મેનુ પર જાઓ અને Object > Clipping Mask > Make પસંદ કરો. વૈકલ્પિક રીતે, તમે Mac પર Command + 7 અથવા Windows પર Ctrl + 7 શૉર્ટકટનો ઉપયોગ કરી શકો છો.",
          "clipping_step4":
              "જો તમે mask અથવા clipped artworkને સુધારવા માંગો છો, તો તમે Layers પેનલમાં clipping path પસંદ કરી શકો છો અથવા Direct Selection Toolનો ઉપયોગ કરી mask આકારને ખસેડી અથવા ફેરફાર કરી શકો છો.",
          "pathfinder_que1": "Illustrator માં પાથ ફાઈન્ડર ટૂલનો પરિચય",
          "pathfinder_ans1":
              "એડોબ Illustrator માં પાથ ફાઈન્ડર ટૂલ એ એક શક્તિશાળી ફીચર છે જે આપને વિવિધ રીતે વેક્ટર આકારોને મેનિપ્યુલેટ અને સંકલિત કરવાની મંજૂરી આપે છે. આ ટૂલ આપને આકારોને મર્જ, સાબટ્રેક્ટ અને ઇન્ટરસેક્ટ કરીને જટિલ ડિઝાઇન બનાવવા માટે સેટ ઓફ કમાન્ડ્સ પ્રદાન કરે છે, જે ગ્રાફિક ડિઝાઇનર્સ માટે એક આવશ્યક ટૂલ છે.",
          "pathfinder_que2":
              "Illustrator માં પાથ ફાઈન્ડર ટૂલનો ઉપયોગ કેવી રીતે કરવો?",
          "pathfinder_step1":
              "પાથફાઈન્ડર પેનલ ખોલો: વિન્ડો મેનૂ પર જાઓ અને પાથફાઈન્ડર પસંદ કરો જેથી પાથફાઈન્ડર પેનલ ખૂલે.",
          "pathfinder_step2":
              "આકારોને પસંદ કરો: એ vector આકારોને પસંદ કરો જેને તમે મેનિપ્યુલેટ કરવા માંગો છો, Shift કી દબાવીને બહુવિધ વસ્તુઓ પસંદ કરો.",
          "pathfinder_step3": "યુનાઇટ: પસંદ કરેલ આકારોને એકસાથે સંકલિત કરે છે.",
          "pathfinder_step4":
              "માઇનસ ફ્રન્ટ: ઉપરના આકારને નીચેના આકારમાંથી માઇનસ કરે છે.",
          "pathfinder_step5":
              "ઇન્ટરસેક્ટ: પસંદ કરેલા આકારોના ઓવરલેપિંગ વિસ્તારમાં જ રાખે છે.",
          "pathfinder_step6":
              "એક્સક્લૂડ: ઓવરલેપિંગ વિસ્તારને દૂર કરે છે, જેનાથી નોન-ઓવરલેપિંગ ભાગોમાંથી એક નવું આકાર બનાવે છે.",
          "pathfinder_step7":
              "પરિણામને એક્સપેન્ડ કરો: જો તમે નવા આકારને એક જ વસ્તુ તરીકે રાખવા માંગતા હો, તો તમે ઓબ્જેક્ટ > એક્સપેન્ડ પર જઈને ફેરફારો النهائي કરી શકો છો.",
          "shape_que1": "Illustrator માં શેપ બિલ્ડર ટૂલનો પરિચય",
          "shape_ans1":
              "એડોબ Illustrator માં શેપ બિલ્ડર ટૂલ એ એક વૈવિધ્યપૂર્ણ ફીચર છે જે આપને સરળ આકારોને સંકલિત, સંપાદિત અને ફીલ કરવાની મંજૂરી આપે છે સીધા આપના આર્ટબોર્ડ પર. આ ટૂલ આકાર મેનિપ્યુલેશનની પ્રક્રિયાને સરળ બનાવે છે, જે પારંપરિક પદ્ધતિઓ જેમ કે પાથફાઈન્ડર કરતા વધુ સુમેળ અને અસરકારક રીતે ડિઝાઇન કરવા માટે એક વધુ આરામદાયક રીત આપે છે.",
          "shape_que2":
              "Illustrator માં શેપ બિલ્ડર ટૂલનો ઉપયોગ કેવી રીતે કરવો?",
          "shape_step1":
              "આકારો પસંદ કરો: પહેલા, તેને સાક્ષાત્કાર કરવા માટે એ શેપ્સ બનાવો અને પસંદ કરો જે_overlap થાય છે.",
          "shape_step2":
              "ટૂલ સક્રિય કરો: શેપ બિલ્ડર ટૂલ પર ક્લિક કરો અથવા Shift + M દબાવીને તેને સક્રિય કરો.",
          "shape_step3":
              "આકારોને સંકલિત કરો: જે વિસ્તારો તમે મર્જ કરવા માંગો છો તે પર ક્લિક કરો અને ખેંચો. પ્લસ ચિહ્ન દેખાવું શરૂ થાય છે, જે દર્શાવે છે કે આ ક્ષેત્રો નવા આકારમાં સંકલિત થશે.",
          "shape_step4":
              "વિશિષ્ટ ભાગોને કાઢો: આકારોના ભાગોને દૂર કરવા માટે, Alt (કિંવા Mac પર Option) કી દબાવતી વખતે તે વિસ્તારો પર ક્લિક કરો જે તમે દૂર કરવા માંગો છો.",
          "shape_step5":
              "આકારો ભરો: તમે ઇચ્છતા તો દરેક વિસ્તારમાં કલરથી ભરી શકો છો, જે તમારા ડિઝાઇનને ઝડપી કસ્ટમાઇઝ કરવા માટે સરળ બનાવે છે.",
          "type_que1": "Illustrator માં Shape Builder Tool નું પરિચય",
          "type_ans1":
              "Adobe Illustrator માં Type Tool એ એક મૂળભૂત ફીચર છે જે વપરાશકર્તાઓને તેમના ડિઝાઇન્સમાં ટેક્સ્ટ ઉમેરવા અને તેને સંચાલિત કરવા માટે સક્ષમ બનાવે છે. આ ટૂલ ટાઇપોગ્રાફિકલ તત્વો બનાવવા માટે આવશ્યક છે, ભલે તે લોગો, જાહેરાતો અથવા કોઈપણ ગ્રાફિક ડિઝાઇન પ્રોજેક્ટ માટે હોય.",
          "type_que2":
              "Illustrator માં Shape Builder Tool નો ઉપયોગ કેવી રીતે કરશો?",
          "type_step1":
              "Type Tool પસંદ કરો: ટૂલબારમાં Type Tool પર ક્લિક કરો અથવા તમારી કીબોર્ડ પર T દબાવો.",
          "type_step2":
              "Point Type ઉમેરો: આર્ટબોર્ડ પર ક્યાંક પણ ક્લિક કરો જેથી Point Type બને. આ તમને તરત જ લખવાનું શરૂ કરવા આપે છે, અને ટેક્સ્ટ નવી પંક્તિમાં ન જાશે જયાં સુધી તમે નવો પોઈન્ટ ન બનાવો.",
          "type_step3":
              "Area Type બનાવો: તે આકારની અંદર ટેક્સ્ટ બનાવવા માટે, Area Type Tool (જે Type Tool ની અંદર હોય છે) પસંદ કરો અને ટેક્સ્ટ ક્ષેત્રને વ્યાખ્યાયિત કરવા માટે ક્લિક અને ડ્રેગ કરો.",
          "type_step4":
              "Path પર ટાઇપ કરો: જો તમે ઇચ્છો છો કે ટેક્સ્ટ પાથ પર જવું, તો Type on a Path Tool પસંદ કરો અને પાથ પર ક્લિક કરો જ્યાં તમે ટેક્સ્ટ શરૂ કરવા માંગતા હોવ.",
          "type_step5":
              "ટેક્સ્ટને ફોર્મેટ કરો: Character અને Paragraph પેનલનો ઉપયોગ કરો જેથી જરૂરી મુજબ ફૉન્ટ, કદ, સ્પેસિંગ, અને અલાઇનમેન્ટને એડજસ્ટ કરી શકાય.",
          'policy': 'ગોપનીયતા નીતિ',
          'no_internet': 'કોઈ ઈન્ટરનેટ કનેક્શન મળ્યું નથી.',
          'check_internet': 'તમારું કનેક્શન તપાસો અથવા ફરી પ્રયાસ કરો.',
        },
        'hi': {
          "appName": "इलस्ट्रेटर गाइड",
          "login": "लॉगिन",
          "login_des": "जारी रखने के लिए कृपया साइन इन करें।",
          "register": "रजिस्टर",
          "register_des": "लॉगिन करने के लिए कृपया रजिस्टर करें।",
          "email": "ईमेल",
          "enter_email": "ईमेल दर्ज करें",
          "enter_valid_email": "मान्य ईमेल दर्ज करें",
          "name": "नाम",
          "enter_name": "नाम दर्ज करें",
          "password": "पासवर्ड",
          "enter_password": "पासवर्ड दर्ज करें",
          "confirm_password": "पासवर्ड की पुष्टि करें",
          "enter_confirm_password": "पासवर्ड की पुष्टि दर्ज करें",
          "confirm_password_error": "पासवर्ड और पुष्टि पासवर्ड समान होना चाहिए",
          "forgot_password": "पासवर्ड भूल गए?",
          "dont_have_account": "खाता नहीं है?",
          "already_have_account": "पहले से ही खाता है?",
          "move_tool": "मूव टूल",
          "selection_tool": "सेलेक्शन टूल",
          "pen_tool": "पेन टूल",
          "join_tool": "जॉइन टूल",
          "align": "अलाइन",
          "pathfinder": "पाथफाइंडर",
          "type_tool": "टाइप टूल",
          "clipping_mask": "क्लिपिंग मास्क",
          "shape_builder_tool": "शेप बिल्डर टूल",
          "illustrator_guid": "इलस्ट्रेटर गाइड",
          "home": "होम",
          "language": "भाषा",
          "logout": "लॉगआउट",
          "align_que1": "Illustrator में Align Tool का परिचय",
          "align_ans1":
              "Adobe Illustrator में Align Tool एक महत्वपूर्ण फीचर है जिसका उपयोग वस्तुओं को सटीकता से संरेखित और वितरित करने के लिए किया जाता है। यह डिज़ाइनरों को उनके तत्वों को एक दूसरे या आर्टबोर्ड के संदर्भ में व्यवस्थित करने में मदद करता है, जिससे उनके डिज़ाइनों में सुसंगतता, संतुलन और पेशेवर परिणाम सुनिश्चित होते हैं।",
          "align_que2": "Illustrator में Align Tool का उपयोग कैसे करें?",
          "align_ans2":
              "Illustrator में Align पैनल तक पहुँचने के लिए, Window > Align (Shift + F7) पर क्लिक करें। Design में, Align पैनल तक पहुँचने के लिए, Window > Object & Layout > Align (Shift + F7) पर क्लिक करें। टिप: Align पैनल को अपने विंडो पैनल पर खींचें ताकि आपको सीधे Align पैनल तक पहुँच मिल सके।",
          "align_step1":
              "1. उन वस्तुओं को चुनें जिन्हें संरेखित या वितरित करना है।",
          "align_step2":
              "2. Selection Tool का उपयोग करके, Shift-click करें उस आर्टबोर्ड पर जिसे आप सक्रिय करना चाहते हैं।",
          "align_step3":
              "3. Align या Control पैनल में Align To Artboard चुनें, फिर उस प्रकार के संरेखण या वितरण के लिए बटन पर क्लिक करें।",
          "move_que1": "Illustrator में Move Tool का परिचय",
          "move_ans1":
              "Adobe Illustrator में Move Tool एक मौलिक फीचर है जो उपयोगकर्ताओं को उनकी कलाकृति के भीतर चयनित सामग्री या परतों को स्थिति और व्यवस्थित करने की अनुमति देता है। यह उपकरण डिज़ाइनों को अनुकूलित करने के लिए आवश्यक है, जिससे यह सुनिश्चित होता है कि तत्व ठीक उसी स्थान पर रखें जहाँ आप उन्हें चाहते हैं।",
          "move_que2": "Illustrator में Move Tool का उपयोग कैसे करें?",
          "move_step1":
              "1. Selection Tool (शॉर्टकट: V) का उपयोग करके उस वस्तु पर क्लिक करें जिसे आप स्थानांतरित करना चाहते हैं।",
          "move_step2":
              "2. चयनित वस्तु पर क्लिक करें और उसे कैनवास पर पुनः स्थिति में लाने के लिए खींचें। ड्रैग करते समय Shift कुंजी दबाए रखें ताकि गति 45-डिग्री कोणों तक सीमित रहे।",
          "move_step3":
              "3. सटीक समायोजन के लिए वस्तु को एक बार में 1 पिक्सल हिलाने के लिए एरो कुंजियों का उपयोग करें।",
          "join_que1": "Illustrator में Join Tool का परिचय",
          "join_ans1":
              "Adobe Illustrator में Join Tool एक शक्तिशाली फीचर है जिसका उपयोग दो या दो से अधिक खुले पथों या एंकर बिंदुओं को जोड़ने के लिए किया जाता है, जिससे एक निरंतर रेखा या आकार बनता है। यह टूल आपके डिज़ाइनों को परिष्कृत करने के लिए आवश्यक है, खासकर जब आप जटिल वेक्टर ग्राफिक्स पर काम कर रहे होते हैं।",
          "join_que2": "Illustrator में Move Tool का उपयोग कैसे करें?",
          "join_step1":
              "1. Direct Selection Tool (शॉर्टकट: A) का उपयोग करके उन दो खुले एंडपॉइंट्स या खंडों का चयन करें जिन्हें आप जोड़ना चाहते हैं।",
          "join_step2":
              "2. Object > Path > Join पर जाएं या Command/Ctrl + J शॉर्टकट का उपयोग करके चयनित पथों को उनके इंटरसेक्शन प्वाइंट पर जोड़ें।",
          "join_step3":
              "3. Join Tool स्वचालित रूप से किसी भी ओवरलैपिंग खंड को ट्रिम करेगा, जिससे पथों के बीच एक सहज कनेक्शन बनेगा।",
          "join_step4":
              "4. आप कई एंडपॉइंट्स का चयन कर सकते हैं और उन्हें एक साथ जोड़ सकते हैं, जिससे जटिल आकारों या पथों को बनाना आसान हो जाता है।",
          "selection_que1": "Illustrator में Direct Selection Tool का परिचय",
          "selection_ans1":
              "Direct Selection Tool (शॉर्टकट: A) Adobe Illustrator में एक मौलिक फीचर है जो उपयोगकर्ताओं को पथ या आकार के व्यक्तिगत एंकर बिंदुओं और खंडों का चयन और हेरफेर करने की अनुमति देता है। यह टूल संपादन में सटीकता प्राप्त करने के लिए आवश्यक है, जिससे आप अपने डिज़ाइनों में विशिष्ट समायोजन कर सकते हैं।",
          "selection_que2":
              "Illustrator में Direct Selection Tool का उपयोग कैसे करें?",
          "selection_step1":
              "1. Direct Selection Tool को टूलबार में क्लिक करके या कीबोर्ड शॉर्टकट A का उपयोग करके सक्रिय करें।",
          "selection_step2":
              "2. एंकर बिंदु पर सीधे क्लिक करके उसे चयनित करें। आप एक से अधिक बिंदुओं को चयनित करने के लिए क्लिक और खींच भी सकते हैं।",
          "selection_step3":
              "3. एक बार चयनित होने पर, एंकर बिंदु(ों) को खींचकर उन्हें पुनः स्थित करें। यह आपके पथ के आकार में सटीक समायोजन की अनुमति देता है।",
          "selection_step4":
              "4. आप पथ के पूरे खंड को भी चयनित और स्थानांतरित कर सकते हैं, इसके खंड पर क्लिक करके। यह आपके डिज़ाइन को फिर से आकार देने के लिए उपयोगी है।",
          "selection_step5":
              "5. Shift कुंजी दबाए रखते हुए क्लिक करें ताकि आप अपने चयन से बिंदुओं को जोड़ या हटा सकें, जिससे एक बार में कई बिंदुओं का लचीला संपादन किया जा सके।",
          "pen_que1": "Illustrator में Pen Tool का परिचय",
          "pen_ans1":
              "Pen Tool Adobe Illustrator का एक अत्यंत महत्वपूर्ण और शक्तिशाली उपकरण है, जिसका व्यापक रूप से सटीक पथ और रूप बनाने के लिए उपयोग किया जाता है। यह उपकरण उपयोगकर्ताओं को एंकर प्वाइंट्स रखकर और उनके हैंडल को नियंत्रित करके सीधे रेखाएं और जटिल वक्र रेखाएं बनाने की अनुमति देता है।",
          "pen_que2": "Illustrator में Pen Tool का उपयोग कैसे करें?",
          "pen_step1":
              "1. Pen Tool को टूलबार से चुनें या कीबोर्ड शॉर्टकट P दबाएं।",
          "pen_step2":
              "2. अपना पहला एंकर प्वाइंट बनाने के लिए आर्टबोर्ड पर क्लिक करें। प्वाइंट्स के बीच सीधे रेखाएं बनाने के लिए क्लिक करते रहें।",
          "pen_step3":
              "3. वक्र बनाने के लिए, एंकर प्वाइंट्स पर दिशा हैंडल बनाने के लिए क्लिक करें और खींचें। इन हैंडल्स की लंबाई और कोण रेखा की वक्रता निर्धारित करते हैं।",
          "pen_step4":
              "4. आकार को बंद करने के लिए, पहले बनाए गए एंकर प्वाइंट पर वापस क्लिक करें। इससे अंतिम प्वाइंट को पहले प्वाइंट से जोड़ दिया जाएगा, जिससे एक पूरा आकार बन जाएगा।",
          "pen_step5":
              "5. पथ बनाने के बाद, और सुधार के लिए, Direct Selection Tool (शॉर्टकट: A) का उपयोग करके एंकर प्वाइंट्स या हैंडल्स को चुनें और समायोजित करें।",
          "clipping_que1": "Illustrator में Clipping Mask Tool का परिचय",
          "clipping_ans1":
              "Adobe Illustrator में Clipping Mask एक शक्तिशाली उपकरण है जो आपको एक आकार (मास्क) का उपयोग करके कला के काम की दृश्यता को नियंत्रित करने की अनुमति देता है, जिससे यह निर्धारित होता है कि अंतर्निहित वस्तुओं के कौन से भाग दिखाई देंगे। यह तकनीक विशेष रूप से जटिल डिज़ाइन, पैटर्न और प्रभाव बनाने के लिए उपयोगी है, बिना मूल कला के काम को स्थायी रूप से बदले।",
          "clipping_que2":
              "Illustrator में Clipping Mask Tool का उपयोग कैसे करें?",
          "clipping_step1":
              "वह आकार बनाएं जिसे आप क्लिपिंग मास्क के रूप में उपयोग करना चाहते हैं। यह आकार अंतर्निहित कला के काम के दृश्यमान क्षेत्र को परिभाषित करेगा।",
          "clipping_step2":
              "वह वस्तु(ओं) का चयन करें जिसे आप क्लिप करना चाहते हैं। यह एक छवि, टेक्स्ट, या कोई भी वेक्टर आकार हो सकता है।",
          "clipping_step3":
              "मास्क आकार और कला दोनों का चयन करके, मेनू में जाएं और Object > Clipping Mask > Make चुनें। वैकल्पिक रूप से, आप Mac पर Command + 7 या Windows पर Ctrl + 7 शॉर्टकट का उपयोग करके मास्क जल्दी बना सकते हैं।",
          "clipping_step4":
              "यदि आपको मास्क या क्लिप की गई कला को समायोजित करने की आवश्यकता है, तो आप Layers पैनल में Clipping Path का चयन कर सकते हैं या Direct Selection Tool का उपयोग करके मास्क आकार को हिलाकर या संपादित कर सकते हैं।",
          "pathfinder_que1": "Illustrator में Path Finder Tool का परिचय",
          "pathfinder_ans1":
              "Adobe Illustrator में Path Finder Tool एक शक्तिशाली फीचर है जो आपको विभिन्न तरीकों से वेक्टर आकारों को संशोधित और संयोजित करने की अनुमति देता है। यह आपको आकारों को जोड़ने, घटाने और इंटरसेक्ट करने के लिए एक सेट कमांड्स प्रदान करता है, जिससे यह ग्राफिक डिज़ाइनरों के लिए एक आवश्यक टूल बन जाता है।",
          "pathfinder_que2":
              "Illustrator में Path Finder Tool का उपयोग कैसे करें?",
          "pathfinder_step1":
              "Pathfinder पैनल खोलें: विंडो मेनू पर जाएं और Pathfinder पैनल खोलने के लिए Pathfinder चुनें।",
          "pathfinder_step2":
              "आकारों का चयन करें: उन वेक्टर आकारों को चुनें जिन्हें आप संशोधित करना चाहते हैं, Shift कुंजी दबाए रखते हुए कई ऑब्जेक्ट्स का चयन करें।",
          "pathfinder_step3": "Unite: चयनित आकारों को एक में जोड़ता है।",
          "pathfinder_step4":
              "Minus Front: ऊपर वाले आकार को नीचे वाले आकार से घटित करता है।",
          "pathfinder_step5":
              "Intersect: चयनित आकारों के केवल ओवरलैपिंग क्षेत्र को रखता है।",
          "pathfinder_step6":
              "Exclude: ओवरलैपिंग क्षेत्र को हटा देता है, जिससे गैर-ओवरलैपिंग भागों से एक नया आकार बनता है।",
          "pathfinder_step7":
              "परिणाम का विस्तार करें: यदि आप नए आकार को एक ही वस्तु के रूप में रखना चाहते हैं, तो आप Object > Expand पर जाकर परिवर्तन को अंतिम रूप दे सकते हैं।",
          "shape_que1": "Illustrator में Shape Builder Tool का परिचय",
          "shape_ans1":
              "Adobe Illustrator में Shape Builder Tool एक बहुपरकारी फीचर है जो आपको सरल आकारों को संयोजित, संपादित और सीधे अपने आर्टबोर्ड पर भरने की अनुमति देता है। यह टूल आकारों को संशोधित करने की प्रक्रिया को सरल बनाता है, जो पारंपरिक विधियों जैसे Pathfinder की तुलना में एक अधिक सहज और कुशल तरीका प्रदान करता है।",
          "shape_que2":
              "Illustrator में Shape Builder Tool का उपयोग कैसे करें?",
          "shape_step1":
              "आकारों का चयन करें: पहले, उन ओवरलैपिंग आकारों को बनाएं और चुनें जिनके साथ आप काम करना चाहते हैं।",
          "shape_step2":
              "टूल सक्रिय करें: Shape Builder Tool पर क्लिक करें या Shift + M दबाकर इसे सक्रिय करें।",
          "shape_step3":
              "आकारों को जोड़ें: उन क्षेत्रों पर क्लिक करें और खींचें जिन्हें आप जोड़ना चाहते हैं। एक प्लस चिह्न दिखाई देगा, जो यह दर्शाता है कि वे क्षेत्र एक नए आकार में संयोजित हो जाएंगे।",
          "shape_step4":
              "हिस्सों को हटाएं: आकारों के हिस्सों को हटाने के लिए, Alt (या Mac पर Option) कुंजी दबाए रखते हुए उन क्षेत्रों पर क्लिक करें जिन्हें आप हटाना चाहते हैं।",
          "shape_step5":
              "आकारों को भरें: आप व्यक्तिगत क्षेत्रों पर क्लिक करके उन्हें रंग से भर सकते हैं, जिससे आपके डिज़ाइन को जल्दी से कस्टमाइज़ किया जा सकता है।",
          "type_que1": "Illustrator में Shape Builder Tool का परिचय",
          "type_ans1":
              "Adobe Illustrator में Type Tool एक मौलिक फीचर है जो उपयोगकर्ताओं को अपने डिज़ाइनों में टेक्स्ट जोड़ने और संपादित करने की अनुमति देता है। यह टूल टाइपोग्राफिकल तत्वों को बनाने के लिए आवश्यक है, चाहे वह लोगो, विज्ञापन या कोई भी ग्राफिक डिज़ाइन प्रोजेक्ट हो।",
          "type_que2": "Illustrator में Shape Builder Tool का उपयोग कैसे करें?",
          "type_step1":
              "Type Tool चुनें: टूलबार में Type Tool पर क्लिक करें या अपनी कीबोर्ड पर T दबाएं।",
          "type_step2":
              "Point Type जोड़ें: आर्टबोर्ड पर कहीं भी क्लिक करें ताकि Point Type बन सके। इससे आप तुरंत टाइप करना शुरू कर सकते हैं, और टेक्स्ट अगली पंक्ति में नहीं जाएगा जब तक आप एक नया प्वाइंट नहीं बनाएंगे।",
          "type_step3":
              "Area Type बनाएं: उस आकार के भीतर टेक्स्ट बनाने के लिए, Area Type Tool (जो Type Tool के अंतर्गत होता है) का चयन करें और टेक्स्ट क्षेत्र को परिभाषित करने के लिए क्लिक और खींचें।",
          "type_step4":
              "Path पर टाइप करें: यदि आप चाहते हैं कि टेक्स्ट किसी पथ के साथ चले, तो Type on a Path Tool का चयन करें और उस पथ पर क्लिक करें जहां आप टेक्स्ट शुरू करना चाहते हैं।",
          "type_step5":
              "टेक्स्ट को स्वरूपित करें: Character और Paragraph पैनल का उपयोग करें ताकि आवश्यकतानुसार फ़ॉन्ट, आकार, रिक्ति, और संरेखण को समायोजित किया जा सके।",
          'policy': 'गोपनीयता नीति',
          'no_internet': 'कोई इंटरनेट कनेक्शन नहीं मिला.',
          'check_internet': 'अपना कनेक्शन जाँचें या पुनः प्रयास करें।',
        },
        'ge': {
          "appName": "Illustrator Guide",
          "login": "Anmelden",
          "login_des": "Bitte melden Sie sich an, um fortzufahren.",
          "register": "Registrieren",
          "register_des": "Bitte registrieren Sie sich, um sich anzumelden.",
          "email": "E-Mail",
          "enter_email": "E-Mail eingeben",
          "enter_valid_email": "Gültige E-Mail eingeben",
          "name": "Name",
          "enter_name": "Name eingeben",
          "password": "Passwort",
          "enter_password": "Passwort eingeben",
          "confirm_password": "Passwort bestätigen",
          "enter_confirm_password": "Bestätigungspasswort eingeben",
          "confirm_password_error":
              "Passwort und Bestätigungspasswort müssen gleich sein",
          "forgot_password": "Passwort vergessen?",
          "dont_have_account": "Haben Sie noch kein Konto? ",
          "already_have_account": "Haben Sie bereits ein Konto? ",
          "move_tool": "Verschieben-Werkzeug",
          "selection_tool": "Auswahl-Werkzeug",
          "pen_tool": "Stift-Werkzeug",
          "join_tool": "Verbinden-Werkzeug",
          "align": "Ausrichten",
          "pathfinder": "Pfadfinder",
          "type_tool": "Text-Werkzeug",
          "clipping_mask": "Clipping-Maske",
          "shape_builder_tool": "Form-Ersteller-Werkzeug",
          "illustrator_guid": "Illustrator Guide",
          "home": "Startseite",
          "language": "Sprache",
          "logout": "Abmelden",
          "align_que1": "Einführung in das Align Tool in Illustrator",
          "align_ans1":
              "Das Align Tool in Adobe Illustrator ist ein essentielles Werkzeug, das verwendet wird, um Objekte präzise auszurichten und zu verteilen. Es hilft Designern dabei, Elemente in Bezug aufeinander oder das Arbeitsblatt zu arrangieren, was Konsistenz, Balance und professionelle Ergebnisse in ihren Designs sicherstellt.",
          "align_que2": "Wie verwendet man das Align Tool in Illustrator?",
          "align_ans2":
              "In Illustrator können Sie das Align-Panel über Fenster > Ausrichten (Shift + F7) aufrufen. In Design können Sie das Align-Panel über Fenster > Objekt & Layout > Ausrichten (Shift + F7) aufrufen. Tipp: Ziehen Sie das Align-Panel in Ihr Fenster-Panel, um schnellen Zugriff auf das Ausrichtungs-Panel zu haben.",
          "align_step1":
              "1. Wählen Sie die Objekte aus, die Sie ausrichten oder verteilen möchten.",
          "align_step2":
              "2. Verwenden Sie das Auswahl-Werkzeug und Shift-Klicken Sie auf das Arbeitsblatt, das Sie aktivieren möchten.",
          "align_step3":
              "3. Wählen Sie im Align- oder Steuerpanel 'Align To Artboard' und klicken Sie dann auf die Schaltfläche für die gewünschte Art der Ausrichtung oder Verteilung.",
          "move_que1": "Einführung in das Move Tool in Illustrator",
          "move_ans1":
              "Das Move Tool in Adobe Illustrator ist eine grundlegende Funktion, mit der Benutzer ausgewählte Inhalte oder Ebenen innerhalb ihrer Kunstwerke positionieren und anordnen können. Dieses Werkzeug ist entscheidend für die Anpassung von Designs und stellt sicher, dass Elemente genau dort platziert werden, wo Sie sie haben möchten.",
          "move_que2": "Wie verwendet man das Move Tool in Illustrator?",
          "move_step1":
              "1. Verwenden Sie das Auswahl-Werkzeug (Tastenkürzel: V), um auf das Objekt zu klicken, das Sie verschieben möchten.",
          "move_step2":
              "2. Klicken und ziehen Sie das ausgewählte Objekt, um es auf der Leinwand neu zu positionieren. Halten Sie die Shift-Taste während des Ziehens gedrückt, um die Bewegung auf 45-Grad-Winkel zu beschränken.",
          "move_step3":
              "3. Verwenden Sie die Pfeiltasten, um das Objekt für präzise Anpassungen um 1 Pixel pro Schritt zu verschieben.",
          "join_que1": "Einführung in das Join Tool in Illustrator",
          "join_ans1":
              "Das Join Tool in Adobe Illustrator ist ein leistungsstarkes Werkzeug, das verwendet wird, um zwei oder mehr offene Pfade oder Ankerpunkte zu verbinden und eine durchgehende Linie oder Form zu erstellen. Dieses Werkzeug ist entscheidend, um Designs zu verfeinern, insbesondere bei der Arbeit mit komplexen Vektorgrafiken.",
          "join_que2": "Wie verwendet man das Move Tool in Illustrator?",
          "join_step1":
              "1. Verwenden Sie das Direct Selection Tool (Tastenkürzel: A), um die beiden offenen Endpunkte oder Segmente auszuwählen, die Sie verbinden möchten.",
          "join_step2":
              "2. Gehen Sie zu Objekt > Pfad > Verbinden oder verwenden Sie die Tastenkombination Command/Ctrl + J, um die ausgewählten Pfade an ihrem Schnittpunkt zu verbinden.",
          "join_step3":
              "3. Das Join Tool schneidet automatisch überlappende Segmente ab und erstellt eine nahtlose Verbindung zwischen den Pfaden.",
          "join_step4":
              "4. Sie können mehrere Endpunkte auswählen und sie gleichzeitig verbinden, was das Erstellen komplexer Formen oder Pfade erleichtert.",
          "selection_que1":
              "Einführung in das Direct Selection Tool in Illustrator",
          "selection_ans1":
              "Das Direct Selection Tool (Tastenkürzel: A) ist ein grundlegendes Werkzeug in Adobe Illustrator, mit dem Benutzer einzelne Ankerpunkte und Segmente eines Pfades oder einer Form auswählen und bearbeiten können. Dieses Werkzeug ist entscheidend, um Präzision beim Bearbeiten zu erreichen und ermöglicht spezifische Anpassungen an Ihren Designs.",
          "selection_que2":
              "Wie verwendet man das Direct Selection Tool in Illustrator?",
          "selection_step1":
              "1. Aktivieren Sie das Direct Selection Tool, indem Sie darauf klicken oder die Tastenkombination A verwenden.",
          "selection_step2":
              "2. Klicken Sie direkt auf einen Ankerpunkt, um ihn auszuwählen. Sie können auch klicken und ziehen, um ein Auswahlrechteck um mehrere Punkte zu erstellen.",
          "selection_step3":
              "3. Sobald die Punkte ausgewählt sind, können Sie die Ankerpunkte ziehen, um sie neu zu positionieren. Dies ermöglicht präzise Anpassungen an der Form Ihres Pfades.",
          "selection_step4":
              "4. Sie können auch ganze Segmente eines Pfades auswählen und verschieben, indem Sie auf das Segment selbst klicken. Dies ist nützlich, um Ihr Design umzuformen.",
          "selection_step5":
              "5. Halten Sie die Shift-Taste gedrückt, während Sie klicken, um Punkte zu Ihrer Auswahl hinzuzufügen oder zu entfernen, was eine flexible Bearbeitung mehrerer Punkte gleichzeitig ermöglicht.",
          "pen_que1": "Einführung in das Pen Tool in Illustrator",
          "pen_ans1":
              "Das Pen Tool ist eines der wichtigsten und leistungsfähigsten Werkzeuge in Adobe Illustrator, das weit verbreitet ist, um präzise Pfade und Formen zu erstellen. Es ermöglicht den Benutzern, sowohl gerade Linien als auch komplexe Kurven zu zeichnen, indem Ankerpunkte gesetzt und deren Griffe manipuliert werden.",
          "pen_que2": "Wie verwendet man das Pen Tool in Illustrator?",
          "pen_step1":
              "1. Wählen Sie das Pen Tool aus der Werkzeugleiste oder drücken Sie die Tastenkombination P.",
          "pen_step2":
              "2. Klicken Sie auf das Arbeitsblatt, um Ihren ersten Ankerpunkt zu setzen. Klicken Sie weiter, um gerade Linien zwischen den Punkten zu erstellen.",
          "pen_step3":
              "3. Um Kurven zu erstellen, klicken und ziehen Sie, um Richtungshandles an den Ankerpunkten zu erstellen. Die Länge und der Winkel dieser Handgriffe bestimmen die Krümmung der Linie.",
          "pen_step4":
              "4. Um eine Form zu schließen, klicken Sie auf den ersten Ankerpunkt, den Sie erstellt haben. Dies wird den letzten Punkt mit dem ersten verbinden und eine vollständige Form bilden.",
          "pen_step5":
              "5. Verwenden Sie das Direct Selection Tool (Tastenkürzel: A), um nach dem Erstellen Ihres Pfades Ankerpunkte oder Griffe auszuwählen und anzupassen.",
          "clipping_que1":
              "Einführung in das Clipping Mask Tool in Illustrator",
          "clipping_ans1":
              "Eine Clipping-Maske in Adobe Illustrator ist ein leistungsstarkes Werkzeug, mit dem Sie die Sichtbarkeit von Kunstwerken steuern können, indem Sie eine Form (die Maske) verwenden, um festzulegen, welche Teile der darunter liegenden Objekte sichtbar sind. Diese Technik ist besonders nützlich, um komplexe Designs, Muster und Effekte zu erstellen, ohne das ursprüngliche Kunstwerk dauerhaft zu verändern.",
          "clipping_que2":
              "Wie verwendet man das Clipping Mask Tool in Illustrator?",
          "clipping_step1":
              "Zeichnen Sie die Form, die Sie als Clipping-Maske verwenden möchten. Diese Form definiert den sichtbaren Bereich des darunter liegenden Kunstwerks.",
          "clipping_step2":
              "Wählen Sie das Objekt(e) aus, das/die Sie clippen möchten. Dies kann ein Bild, Text oder eine beliebige Vektorform sein.",
          "clipping_step3":
              "Wählen Sie sowohl die Maskenform als auch das Kunstwerk aus, gehen Sie zum Menü und wählen Sie Objekt > Clipping-Maske > Erstellen. Alternativ können Sie die Tastenkombination Command + 7 auf Mac oder Ctrl + 7 auf Windows verwenden, um die Maske schnell zu erstellen.",
          "clipping_step4":
              "Wenn Sie die Maske oder das zugeschnittene Kunstwerk anpassen müssen, können Sie den Clipping-Pfad im Ebenen-Bedienfeld auswählen oder das Direct Selection Tool verwenden, um die Maskenform zu verschieben oder zu bearbeiten.",
          "pathfinder_que1": "Einführung in das Pathfinder-Tool in Illustrator",
          "pathfinder_ans1":
              "Das Pathfinder-Tool in Adobe Illustrator ist ein leistungsstarkes Feature, mit dem Sie Vektorformen auf verschiedene Weise bearbeiten und kombinieren können. Es bietet eine Reihe von Befehlen, mit denen Sie komplexe Designs erstellen können, indem Sie Formen vereinen, subtrahieren und schneiden. Es ist ein unverzichtbares Werkzeug für Grafikdesigner.",
          "pathfinder_que2":
              "Wie verwendet man das Pathfinder-Tool in Illustrator?",
          "pathfinder_step1":
              "Öffnen Sie das Pathfinder-Panel: Gehen Sie zum Fenster-Menü und wählen Sie Pathfinder aus, um das Pathfinder-Panel zu öffnen.",
          "pathfinder_step2":
              "Wählen Sie Formen aus: Wählen Sie die Vektorformen aus, die Sie bearbeiten möchten, indem Sie sie anklicken, während Sie die Umschalttaste gedrückt halten, um mehrere Objekte auszuwählen.",
          "pathfinder_step3":
              "Vereinen: Kombiniert die ausgewählten Formen zu einer.",
          "pathfinder_step4":
              "Minus Front: Subtrahiert die obere Form von der unteren Form.",
          "pathfinder_step5":
              "Schneiden: Behält nur den überlappenden Bereich der ausgewählten Formen bei.",
          "pathfinder_step6":
              "Ausschließen: Entfernt den überlappenden Bereich und erstellt eine neue Form aus den nicht überlappenden Teilen.",
          "pathfinder_step7":
              "Erweitern Sie das Ergebnis: Wenn Sie die neue Form als ein einziges Objekt behalten möchten, können Sie zu Objekt > Erweitern gehen, um die Änderungen abzuschließen.",
          "shape_que1": "Einführung in das Shape Builder-Tool in Illustrator",
          "shape_ans1":
              "Das Shape Builder-Tool in Adobe Illustrator ist ein vielseitiges Feature, mit dem Sie komplexe Formen erstellen können, indem Sie einfachere Formen direkt auf Ihrem Arbeitsbereich kombinieren, bearbeiten und ausfüllen. Dieses Tool vereinfacht den Prozess der Formbearbeitung und bietet einen intuitiveren und effizienteren Weg, Designs zu erstellen als traditionelle Methoden wie das Pathfinder-Tool.",
          "shape_que2":
              "Wie verwendet man das Shape Builder-Tool in Illustrator?",
          "shape_step1":
              "Wählen Sie Formen aus: Erstellen und wählen Sie zuerst die überlappenden Formen aus, mit denen Sie arbeiten möchten.",
          "shape_step2":
              "Aktivieren Sie das Tool: Klicken Sie auf das Shape Builder-Tool in der Werkzeugleiste oder drücken Sie Shift + M, um es zu aktivieren.",
          "shape_step3":
              "Formen kombinieren: Klicken und ziehen Sie über die Bereiche, die Sie zusammenführen möchten. Ein Pluszeichen erscheint, das anzeigt, dass diese Bereiche zu einer neuen Form kombiniert werden.",
          "shape_step4":
              "Teile löschen: Halten Sie die Alt-Taste (oder Option auf Mac) gedrückt und klicken Sie auf die Bereiche, die Sie löschen möchten.",
          "shape_step5":
              "Formen füllen: Sie können auch auf einzelne Bereiche klicken, um sie mit Farbe zu füllen, was eine schnelle Anpassung Ihres Designs ermöglicht.",
          "type_que1": "Einführung in das Shape Builder Tool in Illustrator",
          "type_ans1":
              "Das Type Tool in Adobe Illustrator ist ein grundlegendes Feature, das es den Nutzern ermöglicht, Text in ihren Designs hinzuzufügen und zu bearbeiten. Es ist unerlässlich für die Erstellung typografischer Elemente, sei es für Logos, Werbung oder jedes grafische Designprojekt.",
          "type_que2":
              "Wie verwendet man das Shape Builder Tool in Illustrator?",
          "type_step1":
              "Wählen Sie das Type Tool: Klicken Sie auf das Type Tool in der Werkzeugleiste oder drücken Sie T auf Ihrer Tastatur.",
          "type_step2":
              "Point Type hinzufügen: Klicken Sie irgendwo auf die Arbeitsfläche, um Point Type zu erstellen. Dadurch können Sie sofort mit dem Tippen beginnen, und der Text wird nicht in die nächste Zeile umbrochen, es sei denn, Sie erstellen einen neuen Punkt.",
          "type_step3":
              "Area Type erstellen: Um Text zu erstellen, der in einer Form umbricht, wählen Sie das Area Type Tool (unter dem Type Tool zu finden) und klicken und ziehen Sie, um einen Textbereich zu definieren.",
          "type_step4":
              "Text auf einem Pfad erstellen: Für Text, der einem Pfad folgt, wählen Sie das Type on a Path Tool und klicken Sie auf den Pfad, an dem Sie den Text beginnen möchten.",
          "type_step5":
              "Text formatieren: Verwenden Sie die Panels Character und Paragraph, um Schriftart, Größe, Abstand und Ausrichtung nach Bedarf anzupassen.",
          'policy': 'Datenschutzrichtlinie',
          'no_internet': 'Keine Internetverbindung gefunden.',
          'check_internet':
              'Überprüfen Sie Ihre Verbindung oder versuchen Sie es erneut.',
        },
      };
}
