# Counts and expectation come from a class example.

bins = collect( range( 0, 1e6, length = 5 ) )
counts = [7,5,4,4]
expected=[5,5,5,5]

chi_stat = sum( (counts - expected).^2 ./ expected )

using Distributions
import HypothesisTests

# P-value calculation
chi_rv = Chisq( length( counts ) - 1 )
pval1 = 1 - cdf( chi_rv, chi_stat )

# Now to verify statistic and pvalue calculation with external library
test_one = HypothesisTests.ChisqTest( counts )
