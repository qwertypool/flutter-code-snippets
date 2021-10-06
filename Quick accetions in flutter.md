<p>&nbsp;<img height="592" src="https://www.filledstacks.com/assets/static/034-quickaction.02cdda8.f5b3f51b7f2c31d4276516c6d368f474.jpg" style="background-color: #e6e6e6; margin: auto; transition: background-color 300ms ease 0s; user-select: none;" width="662" /></p><p><br /></p><p><span style="font-size: large;">Add</span>&nbsp;<span style="font-size: large;"><b>quick_actions: ^0.3.0+2 </b>package in your .yaml file</span></p><p><span style="font-size: large;">import the quick_actions package and create a new instance of the QuickActions in the Manager's state class.</span></p><p><span style="font-size: large;"><br /></span></p>

<pre name="code">  
import 'package:quick_actions/quick_actions.dart';

class _QuickActionsManagerState extends State<QuickActionsManager> {
  final QuickActions quickActions = QuickActions();

}
</pre>  
<p><span style="font-size: large;">Setup Quick Actions.</span></p><p><span style="font-size: large;"><br /></span></p>
<pre name="code">  
void _setupQuickActions() {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
          type: 'action_main',
          localizedTitle: 'Main view',
          icon: icons.menu),
      ShortcutItem(
          type: 'action_help',
          localizedTitle: 'Help',
          icon: icons.help)
    ]);
  }
</pre>  

<p><span style="font-size: large;">Handle Selected Action.</span></p><p><span style="font-size: large;"><br /></span></p>
<pre name="code">  
void _handleQuickActions() {
  quickActions.initialize((shortcutType) {
    if (shortcutType == 'action_main') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else if(shortcutType == 'action_help') {
      print('Show the help dialog!');
    }
  });
}
</pre>  

<p><span style="font-size: large;">Use it.</span></p><p><span style="font-size: large;"><br /></span></p>

<pre name="code">  
@override
void initState() {
  super.initState();
  _setupQuickActions();
  _handleQuickActions();
}
</pre>  
