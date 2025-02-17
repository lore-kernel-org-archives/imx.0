Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660401A841E
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782743; cv=none; b=AYuUT69Jn+e71zuXc7uUjtT/mFx6Dlw61OitXfqQZ6E8dMycvig5ifijS4KWbC9EHxklv9EuyC6ZnkywAV8RAD71thAQgdic8oxxfUgEzYQeJgU5OGFiLSp9qV8/G4lwxsapJMOeeGnPJEwc+olczA7ZaNv3LT8W40hxwX0norY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782743; c=relaxed/simple;
	bh=a6c0Uq7JBdxZXw7kUxhrWKbabcgA5MuMPGG3EqfXL64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWaXJWgeE3LsIwEs+KjKhJsaAnqNq+5Q+3NyEzTE2a+2OtUi90DKdpXC/NT8Mgdm2licB4rpAS5DK1T9j6A86J6Ll0zOREQISxe5TkgdPkme0J1vNIuq/CNK8+pqAOkElLdLqvi0DZfag809a98Z5Kp3yxmujYTSOhDlSPLDYjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dJdyLOLA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dJdyLOLA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so5455985a91.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782742; x=1740387542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=;
        b=dJdyLOLAp9eDIrJFvSGEdvsp2027+LxE0smqugXABEReSCGrnHhafoofcIyzmcPQx0
         kybWhLuhRT4eUkR+dUwoQrXmFGtQ/lRkVLcbDOJeeA2FSl4l75e60G2fyJfkrCtVPH+H
         W68GWkVhHQimU6Fg8LlDgMBFCbhqQtwlqNODIqhHn2GnKWxRDpssyQeSxCvuP/PhmB2o
         grb2YjM+lO9SZCC/wy3lovkmaHkcwn/CB1MP44KU8fU9AJhLZ1Lp5RY+pprvI/FLFPo2
         p7aELMOpo1Ykose1dDNNjRfUT6oZbryiW7myz2cCgXXjM/eDYvYzVOEj8FXmP+9FlBrY
         HFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782742; x=1740387542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=;
        b=kOruRAnTdusimf4dJFzCDDteNz2AcsAkvnubOkQi6gB9iIoaMbjkju/ke3kQrvHlb/
         vRVQRUmVHxHoJcGBQtK+uLsbReJqcyoXqHJH8iFtxD1UOO6cDUQ8quxUDf+OasEgODTg
         BIn3qq6ZLmJCGiwJ7A16D6vFheJlt+XijbZQGqC6tLUwKFaYB7mkLoE65BTTHIPTSlu2
         00Nq9rQAwPjAM82KKCfy3flLDLsV9kulrqf21N4T6MDtw1LDI7AGR2YHwRCX3Tsp5QD9
         06ssCenW5KWLwc9Cl7mAgZZ+N01TxUNRznDjIJqmDP5wSkrYOIBfaAXaZogBZ8akTeYD
         Z4bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCsV0L1NVgbbQXEdGCY367ueqS8Tj1uuyauFbSyyBDL17PZBolMqaqY98x21P9NwVbbN4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0dvDIp7yJqBem8K0M2BeorTNtRVIL9FsPWiuOW7O8yFg1/JOr
	6Hkn+pR9F5gooMbNqn9QlNEO2jxhwVBQVobXe1XLTpd+gGvHdAMeVLugxu78bOw=
X-Gm-Gg: ASbGncvoe/U+XcN8T3+3vWPMUeL8htnQdn410EJIyunDO4GV0FL0FwOVXjSOpmZGafC
	pWvZK+kfAUByc5k/6ksgZK62MjG/oRm85xtFhzp7gJ5ET09ci/lbZ3ZR37H/gdcv6QiBohjtixC
	XPCTRLf6zs/k5LCUnYXZvXcPvfGO0/NYQks9Jfq455kTEM8BW96BJkOXU5NzjfSwbZF+4JzqRLN
	52mHpuCV/AWos3xumknnQIngf2/k3wOpCRoENlNVGn3CuT73AEmTpUNAp2MIMsmCYRGIaJWEKhc
	dpfbZhVpBUqW2HR+B4gG8Y2eJgXZxdqjx9gK1nCtK1/byR08DKPkB/c=
X-Google-Smtp-Source: AGHT+IHbBvzPw0Wn7/Eyf5Y7dSkIAJVrU71JRxh4insgq9Beex3YYjwNlgnCYaOLqfIHDCH+B/xxjA==
X-Received: by 2002:a05:6a00:4fd2:b0:730:949d:2d52 with SMTP id d2e1a72fcca58-73262158ademr14543775b3a.3.1739782741534;
        Mon, 17 Feb 2025 00:59:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:59:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v6 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Mon, 17 Feb 2025 14:26:55 +0530
Message-ID: <20250217085657.789309-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
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
index 553650932c75..d9ae87808651 100644
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

