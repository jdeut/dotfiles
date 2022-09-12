use File::Copy qw(copy);
use File::Basename;
use feature qw( state );

sub hline {
    print "=============================================================\n";
}
sub infomsg {
    $begin = shift;
    $end   = shift;

    if($begin == 1) { hline(); }
    print ' >>> ', @_;
    if($end == 1) { hline(); }
}
sub init_hooks {
    my $st_desk_noti = `gsettings get "org.gnome.desktop.notifications" "show-banners"`;
    $st_desk_noti =~ s/[ \n]//g;

    # $failure_cmd = "internal hook_post_compilation 0 $st_desk_noti";
    # $success_cmd = "internal hook_post_compilation 1 $st_desk_noti";

    # system('gsettings set org.gnome.desktop.notifications show-banners true');
}
sub hook_post_compilation {
    my $fs = shift @_;
    my $notify = shift @_;

    my $msg;

    if($fs == 1) {
        #success
        infomsg 1,0,"compilation success\n";
        $msg = "successfull";
    } else {
        #failure
        infomsg 1,0,"compilation failure\n";
        $msg = "failed";
    }

    # `notify-send --hint=int:transient:1 -u normal -i info "latexmk" "compilation $msg";

    # system "sleep 0.4";

    # system("gsettings set org.gnome.desktop.notifications show-banners $notify");
}
sub mylatex() {
    state $init = 1;

    infomsg 1,0,"Pdest: ", $$Pdest, "\n";
    infomsg 0,0,"init: ", $init, "\n";

    if ( -e $$Pdest && $init == 1) {
        ($base, $dir, $ext) = fileparse($$Pdest, qr/\.[^.]*/);

        infomsg 0,0,"dir: $dir\n";
        infomsg 0,0,"base: $base\n";
        infomsg 0,0,"ext: $ext\n";

        copy $$Pdest, $dir . "/" . $base . "_last" . $ext;
    }

    $init = $init + 1;

    hline;

    return system @_;
}

init_hooks();

infomsg 1,0,$ENV{PWD},"\n";
infomsg 0,1,"Argv: ", @ARGV,"\n";

$ENV{'max_print_line'} = '250';
#$ENV{'error_line'} = '254';
#$ENV{'half_error_line'} = '238';
#
#$pdflatex = "lualatex --interaction=nonstopmode -file-line-error --shell-escape -enable-write18 --synctex=1 %O %S";

$silent          = 0;
$do_cd           = 1;
$recorder        = 1;
$pdf_mode        = 4;
$postscript_mode = 0;
$dvi_mode        = 0;
$out_dir         = "compiled";
$lualatex        = "internal mylatex ".
                   "texfot lualatex-dev --interaction=nonstopmode -file-line-error " .
                   "--synctex=1 --shell-escape -enable-write18 %O %S";
$dvipdf          = "dvipdfmx %O -o %D %S";
my $gitroot      = `git rev-parse --show-toplevel`;

# trim
$gitroot =~ s/^\s+|\s+$//g;

infomsg 1,0,'GITROOT ', $gitroot, "\n";

my $locallatexmkrc = "$gitroot/latexmkrc";

if (-e $locallatexmkrc) {
    infomsg 0,0,"local latexmkrc exists in GITROOT\n";
    infomsg 0,0,"$locallatexmkrc\n";

    my $ret = do $locallatexmkrc;

    infomsg 0,0,"ret: $!\n";
} else {
    infomsg 0,0,"latexmkrc does NOT exist in GITROOT\n"
}

hline();

#$dependents_list = 1;

#$makeindex = 'xindex -c DIN2 --noheadings %B.idx';
#$makeindex = 'xindex -c HAdW-eKO --noheadings %B.idx';

#add_input_ext('lualatex','ind');

#add_cus_dep('idx', 'ind', 0, 'custom_make_index');

