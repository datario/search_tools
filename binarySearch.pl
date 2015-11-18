#! /usr/bin/perl

#####################################################################################################
#
#			Andy Richardson
#			Binary Search Implementation in Perl
#			https://github.com/datario
#
#####################################################################################################

use warnings;
use strict;
use integer;

#dictionary file, obviously presorted
my $dictionaryFile = 'dictionary.txt';
open (DICT,"<$dictionaryFile");
my @dictionaryArray = <DICT>;
close DICT;

#input file
my $wordFile = $ARGV[0];
open (WORD,"<$wordFile");
my @word = <WORD>;
close WORD;

#output result file
my $resultFile = "result"."-".$wordFile;
open (RESULT,">>$resultFile");

binaryString($word[0]);

close RESULT;

#binary search subroutine
sub binaryString {
	my $count = 0;

	#read in the search word from the input file
	my $word = $_[0];
	chomp($word);

	#set end point values based upon length of dictionary array
	my ($low,$high) = (0,scalar@dictionaryArray);
	my $dictionaryWord = "";

	#here is the binary search algorithm defined as a loop shifting the end point values
	#continue loop until the search word is found in the dictionary word list
	while ($word ne $dictionaryWord){
		$count++;

		#the binary search equation
		my $mod = ($low + $high) / 2;
		$dictionaryWord = $dictionaryArray[$mod];
		chomp($dictionaryWord);
		print RESULT "$mod) $dictionaryWord\n";

		#the modification of the end points to the search frame
		if ($dictionaryWord gt $word){
			#could also be $mod-1 
			$high = $mod;
		}
		if ($dictionaryWord lt $word){
			#could also be $mod+1
			$low = $mod;
		}
	}
	print RESULT "\n\n--it took $count tries to get to $dictionaryWord--\n\n";
}
