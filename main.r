# Hierarchical inference using all objects
library('rjags')

# A function to manipulate JAGS output into a list
source('make_list.r')

# Set the random seed
set.seed(123)

# Load the data
source('data.r')

# Create the model
m = jags.model(file="model.jags", data=data)

# Burn-in
update(m, 10000)

# MCMC sampling
draw = jags.samples(m, 500000, thin=50, variable.names = c("median_a_bulge",
"median_a_disk", "sig_loga_bulge", "sig_loga_disk", "a_bulge", "a_disk",
"mu_bulge", "mu_disk","sig_bulge", "sig_disk", "f_bulge", "f_disk", "x_bulge", "x_disk",
"x_total", "F", "logit_0", "logit_m", "logit_log_scatter"))

# Convert results to a list
results = make_list(draw)

# Save chains in text files
write.table(results$median_a_bulge, "Output/median_a_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$median_a_disk, "Output/median_a_disk.txt", row.names=FALSE, col.names=FALSE)
write.table(results$sig_loga_bulge, "Output/sig_loga_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$sig_loga_disk, "Output/sig_loga_disk.txt", row.names=FALSE, col.names=FALSE)
write.table(results$a_bulge, "Output/a_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$a_disk, "Output/a_disk.txt", row.names=FALSE, col.names=FALSE)
write.table(results$f_bulge, "Output/f_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$f_disk, "Output/f_disk.txt", row.names=FALSE, col.names=FALSE)
write.table(results$F, "Output/F.txt", row.names=FALSE, col.names=FALSE)
write.table(results$logit_0, "Output/logit_0.txt", row.names=FALSE, col.names=FALSE)
write.table(results$logit_m, "Output/logit_m.txt", row.names=FALSE, col.names=FALSE)
write.table(results$logit_log_scatter, "Output/logit_log_scatter.txt", row.names=FALSE, col.names=FALSE)
write.table(results$mu_bulge, "Output/mu_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$mu_disk, "Output/mu_disk.txt", row.names=FALSE, col.names=FALSE)
write.table(results$sig_bulge, "Output/sig_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$sig_disk, "Output/sig_disk.txt", row.names=FALSE, col.names=FALSE)
write.table(results$x_bulge, "Output/curly_M_bulge.txt", row.names=FALSE, col.names=FALSE)
write.table(results$x_disk, "Output/curly_M_disk.txt", row.names=FALSE, col.names=FALSE)
