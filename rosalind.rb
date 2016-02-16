#!/usr/bin/env ruby
Dir['./modules/*.rb'].each {|file| require file }
Dir['./problems/*/*.rb'].each {|file| require file }

klass = case ARGV[0]
when 'dna' then 'DnaContent'
when 'rna' then 'RnaTranscriber'
when 'revc' then 'ReverseComplement'
when 'iprb' then 'MateProbability'
when 'fib' then 'NumSequence'
when 'gc' then 'DnaContent'
when 'prot' then 'ProteinString'
when 'subs' then 'DnaMotif'
when 'hamm' then 'SeqComparator'
when 'prtm' then 'ProtStringMass'
when 'grph' then 'AdjacencyList'
when 'cons' then 'DnaConsensus'
when 'perm' then 'PermutationFinder'
when 'revp' then 'ReversePalindrome'
when 'sign' then 'SignedPermutation'
when 'iev' then 'ExpOffspring'
when 'prob' then 'DnaProb'
when 'lcsm' then 'SharedMotif'
when 'splc' then 'RnaSplice'
when 'fibd' then 'FibMortSequence'
when 'lexf' then 'LexicographicEnum'
when 'lia' then 'IndependentAllel'
when 'lexv' then 'VarLexEnum'
when 'kmer' then 'KmerComposition'
when 'tran' then 'TransitionRatio'
# when 'tree' then 'GraphTree'
# when 'orf' then 'ReadFrame'
else nil
end

if klass
  Object.const_get(klass).new(ARGV[0]).export_to_file(ARGV[0], ARGV[1])
  p "Success!"
else
  p 'Cancel! NO VALID ARGUMENTS.'
end
