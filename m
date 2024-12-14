Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AB1AC8A6
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197236; cv=none; b=Wm0hrF3e9BlxTPtwYv30VOOaCtOv92zBIizA4JElNwCbdD7DReWvSf1J/fa3KpgJOMEMxBdE/q/nAmRfLkVgev04mhGSrEfajGlninwHStN0I6B17CMoFh6qgROCRXNWmw5n8rtC6olfUdWJcBD8fImQKRsDJ3r9hW08AEpv5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197236; c=relaxed/simple;
	bh=rcWXudtubpY/LSH8y20isvvWa3ivWgmUdiDIzyRLaJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOnOVqIFvaokQCF7U+ubnQWmlfY4XakPftU+4cZxszQi75XbP02bWruJByuqHal3hpXCbiX31fadm+pepm9s8DRT9nfScuhOUaEuAZfUHEU2kpWUiZSNGvJoHxVypvfiQioZ17ubfpmhdH3PSdHdxAmaHtoOpephM0lfbx6hoPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=E8NmLHYb; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="E8NmLHYb"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso1910843a91.3
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197234; x=1734802034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=;
        b=E8NmLHYbAhRGB8cmXE3Kg6Fmln3D2GgzHWloeiVV7dCUN3M16Y6SXfnSr1a298Iqr6
         sM7dAd6EZeSrdyZAcYP9zeRYI87/9yUIHtb+pnlzchDTT9C6AQ1HkLwQwBdp3v8L+RO+
         ZlnCtC/j0gZyb4l0Q6FJp5FRXL/ZHzbY42rMmm1CniSjBvXfUVhK6z+DL54vaziFUZO3
         i8cVYnl0y2PjyE6jiwcqa5z4ZEKC5oCDkIpPCMZg0B7zrOUshrHvLfrzJK0PXNbaGXPu
         ADR72FOHh5uXwbntmmBIUL3Ip+Ny5Sxkg8ULPNa4kJh3UqCdLGVXc262yIkfYEXq7bu1
         B6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197234; x=1734802034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=;
        b=NLzbprrvgMJ8FD3n45Yr7tmqt074rKGvUDXDsQPu0TelBEu9OTkzmmQuxz73qjuPmP
         xdEkkJario/6qrE0PqX/6FKT/Q9n0mNsuSdRYXI1MB8K2e9IuMYza9MRlZ/UZdYk/Doy
         xJux8+VNrDFCEBhN6qsENVto19SddHwHBid3duQD7Of9fk8nsynwyS8bhT6JJJCZFG0t
         2fZEuLJPARo3mvt9ww6UHBlpvcG2SNojkLfxLMZBLPJMNEhAIDBXp102H2jKNPtZa2+h
         /aRToveUKejWGoR6JCqSelBuA/1sHo7ATBzIw3zHz7TIoE0Y2ff9j/ojd5NqBblTrh8o
         Op6g==
X-Forwarded-Encrypted: i=1; AJvYcCXi7XWQEoHgYERwx9vMlPXGmFCWu5ytrTAxXDsGvctrObvo2pAjgMXUcCyAyyti35W7u/s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfUwGXirNcodMOfMBrmZ1Vhmi2pgDmsvvtLsKXzFyW66loXqcg
	RaDn/raColJp4YNp6H8hLwCdG+07yL13SHutkExJHPT+ImyTSPP/j7gRj53RfgA=
X-Gm-Gg: ASbGncs+LQT/k7eQAu1O7VDktRpqMlQuNQCDMFcy9SczM7mlbpt6WON3zpVCAxlCWdj
	0aacF9WtYTPnKXsc49t1IydtyuWBmmBVjkpjIzJCa2nEUHJqQuEoiiGplPmr33hyZCKG10KQxxX
	Sih5rvZJAoP9U6oqLDprvIuNhHFzblUNn0B7YH/9SdqPOLnikxQB/7TWyHFi5C6NP1wVJ3PF3sW
	uyrNCl2APzITRw0OWaihSWvQQYuJtSOnlhvmzTsYXJ1IzC8NWwgB3qYjsLKEKUrYSQVeVrcTyEp
	BCQJd934rmFxAZo=
X-Google-Smtp-Source: AGHT+IEViE/EyOEoU9avO8xOUuGHIK7Nu4di+ccQuUelW0qrSBcAUC23H6R13dSAPO44yc0spDyzYw==
X-Received: by 2002:a17:90a:ec84:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f290dbce03mr10584296a91.33.1734197234199;
        Sat, 14 Dec 2024 09:27:14 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:27:13 -0800 (PST)
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
Subject: [PATCH v2 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Sat, 14 Dec 2024 22:55:48 +0530
Message-ID: <20241214172549.8842-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
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
index 73a93ce8668f..0c94ce8ce580 100644
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
index fae47b8ccf73..e6c81718ba78 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -112,7 +112,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index c915a5cf4187..aca769d915bf 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -434,7 +434,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -450,7 +450,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -463,7 +463,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -522,7 +522,7 @@ static int __init imsic_local_init(void)
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

