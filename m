Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB39A192B90
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771273; cv=none; b=gqFZX9gBVAdA91F+FuZ/Bl4cB0aeWIVI1HJiAkyd1De+H9pOF1ChsC06sF7P//t9+5eWEibNh3HNcuyosQelGAQ1PguWdbpDRve9MtpiPc+xGVMcUx6ixbubkm6htLgHm8Yf9naWYyxVejXuoQvALsIRSIsImgOfIDmIuE+ispI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771273; c=relaxed/simple;
	bh=lcMa5p2pZjzeghLKvVY9ny71KeZ3wMkdol/DU/InCzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoxRLMefZKBIqRN4yK/6zeVXM6XHMkzWgSq1nVtBa3vX8rYm5l500gH0oGI/L1GopE4ma/8MkB2ArKqw+etnbZHZAaGaPhQa2H4hVYAcKrBga3Oxxurl+Yoi0euX+DN8IErK5BozBEXT5rOUhdPxoWhUecUV2KsWf3b9t6gyEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=W2dDyJj1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="W2dDyJj1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9da2a7004so2062157a91.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771269; x=1739376069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=W2dDyJj1iSSXiAKpyoDUiP9e6KUmvaFbUH4SZwAuiK2BOM82vBL4hrIUJEMng/yzE/
         hr+n5RMcKPZVyjU0l860/GoY21mOkU1HtN3f3OEN+TGvNmxV1pS6Uu/GD+RJluBkh8P5
         peSQxDj0ugHXJmiquhWsDaz8lvi8KzuewFLUNnHYwUGbpfNF7/Y3xk2bF3f2ookXzmu4
         uWg+8XK0mxGPdQvM6njpUjuOGNrz0OjLO2Qq5xsd36tqHs5edymaOWd0A09smXLvntQQ
         N5AHH+flpM/FBDGK+iU1CcDttmc/YYOHTuYpX/kHjW6b6NzdFmvQdDmKvB7E3xh9zQ0b
         CtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771269; x=1739376069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=aK+1upwkfVdAHSAMW2HyXP/ySwqionSUp4wYAad0+Y0cVGkX54Pz8Dy7ZAhfpjbXTK
         5x5vCtSz/2l8F0fWcF9BmLLqkmfjeuLJbq3BicJSx4QY3xg2UGvChslHA56taSRO5IqI
         6OmdNnG+nGiG7eLl1gAfP5YrEaGxXeNgyRJQ2k03EFEkqJQITszjyTRMAvtKULjOCU4F
         AGdP8hxdLrt1X6FMKhxC4kDELv0OBKP4AXn/TI1kFnX6lxa5iOFOeYRPvvJcDpmdxkJ5
         Fs6LYBgj9Lh4iC68uc9qVoFa7CKa4MXUNKnJt3uPcXlAI80jqT/GB5v41/r0gMEAtW3s
         feIA==
X-Forwarded-Encrypted: i=1; AJvYcCUGEX3W0HYRVWEXQjktj5VvKZImOO/F1HMsFrN+iu3ChRm7e8/jNlT+42IoPjG2DiZkONQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOsBEFHGrqIblVAL4YMQv5TYfK5OAL5OwJenwKXpAUKbwuLEo8
	udfcC/rHfvROvI8Clty4VewpPnMQlter/dUciCKu90gNBjAe1wXrN1qC4fCq+W8=
X-Gm-Gg: ASbGncuhmblWzqjcZ0VNOLLZXdtgap2syNXWdW1Bl9l3+9FIQTCchNyNdN82R168UH3
	K15mZAqLFCCyH1KMkQbMdsvidTnggX6f1MIB4NedHOq2j2SHT208IS38V3BHWU3nSnBeDyDaNNA
	p33T1cJ/YhQR3o+YAtPyu6x9PYxfgEXBML2i0q/GPDd0a2fO+lc8GYLIQ6IL4kytfpO52BJtwOJ
	BkHlnf8iB5pfx7ilDLuzDuRIIgytsgkAr27RHxJw+9UQ9IZnYCXpHfYuIBVahlUfZy9omHQJO6Y
	XcFKxWabDtEu2JLPFz54I+SRKES2IsuLdxPVACGrXoyJJ4eqW2qBeH8=
X-Google-Smtp-Source: AGHT+IFnLvRLZKvgJpx8dmK1OqS269EnZ/fW86sG/bu7Q2nxZbfcOX7ctDxWBsYaZVjqDvgkXox9sw==
X-Received: by 2002:a17:90b:4a8a:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-2f9e08003demr5011059a91.27.1738771268829;
        Wed, 05 Feb 2025 08:01:08 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:01:08 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Wed,  5 Feb 2025 21:29:46 +0530
Message-ID: <20250205155948.81385-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the imsic_handle_irq() uses generic_handle_domain_irq() to
handle the irq which internally has an extra step of resolving hwirq
using domain. This extra step can be avoided by replacing hwirq with
irq in the IMSIC vector and directly calling generic_handle_irq().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    | 6 ++----
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c    | 8 ++++----
 drivers/irqchip/irq-riscv-imsic-state.h    | 4 ++--
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index b5def6268936..d2e8ed70d396 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -73,7 +73,7 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
 static void imsic_handle_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int err, cpu = smp_processor_id();
+	int cpu = smp_processor_id();
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
@@ -103,9 +103,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
-		if (unlikely(err))
-			pr_warn_ratelimited("hwirq 0x%x mapping not found\n", vec->hwirq);
+		generic_handle_irq(vec->irq);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b9e3f9030bdf..6bf5d63f614e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -111,7 +111,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 5ec2b6bdffb2..d0148e48ab05 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -422,7 +422,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -438,7 +438,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -451,7 +451,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -510,7 +510,7 @@ static int __init imsic_local_init(void)
 			vec = &lpriv->vectors[i];
 			vec->cpu = cpu;
 			vec->local_id = i;
-			vec->hwirq = UINT_MAX;
+			vec->irq = 0;
 		}
 	}
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 19dea0c77738..3202ffa4e849 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -20,7 +20,7 @@ struct imsic_vector {
 	unsigned int				cpu;
 	unsigned int				local_id;
 	/* Details saved by driver in the vector */
-	unsigned int				hwirq;
+	unsigned int				irq;
 	/* Details accessed using local lock held */
 	bool					enable;
 	struct imsic_vector			*move_next;
@@ -96,7 +96,7 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask);
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
 void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int ind);
-- 
2.43.0

