use Spawn;

/* This test runs a script to generate a bash autocomplete script from
   the output of `chpl --help --devel`.  It diffs the generated script
   against the version in $CHPL_HOME/util/chpl-completion.bash.  If this
   test produces any output it probably means that an option has been
   added or removed from `chpl --help --devel`, so the autocomplete
   script should be regenerated.
 */

var home = CHPL_HOME;

extern proc getenv(name: c_string): c_string;
extern proc setenv(name: c_string, val: c_string, overwrite: c_int): c_int;

var path = getenv("PATH"):string;
setenv("PATH", (path + ":" + home + "/bin/" + CHPL_HOST_PLATFORM).c_str(), 1);

var genScript = home + "/util/devel/gen-chpl-bash-completion";
var completeScript = home + "/util/chpl-completion.bash";

var diff = spawn(["diff", "-", completeScript], stdin=PIPE);
var runScript = spawn([genScript], stdout=PIPE);

for line in runScript.stdout.lines() {
  diff.stdin.write(line);
}

runScript.wait();
diff.wait();

if diff.exit_status != 0 {
  writeln();
  writeln("diff failed. You may need to run ", genScript,
          " to regenerate ", completeScript);
}
