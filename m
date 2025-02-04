Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C812063E9
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655754; cv=none; b=D7Vb20b9Y+ohD1MdT0l5UdqsYqeNze0Wss+f97P7C2wSGhqXjsfGzORbn5oup5dKxIUt0U0ZOn1Zi0FLlXsVw4uF/tR0t4xZRxROL0N7+ZGPBLV5+tXAD/s4qh6r264Wznbu+xpFK18/vHWzmahgzYkhc3ttsCdrVRJt0fwZmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655754; c=relaxed/simple;
	bh=moLyNyX8E1Yk5kbVo+RP2IIS9y4p4D50KKC39sIwWNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQsvDgY1uK4K7YvQ6VwTqRXHuDtvAzUISKm0IjeELrw/2oaDwDUwsBKB8VI1q1LlrM4sRQzwb+EAp/C/PToe4qlwfXUdpwwI5KJpQKLkUwrxPpUav/U1U4t/wojHsmznYrn4i/QISsMy9xFdIO4tvTayjZgMq8ASCW9tzcbuu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Xtc7yibl; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Xtc7yibl"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7bcf32a6582so466921285a.1
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655752; x=1739260552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=Xtc7yiblmNZVDM+xAH7ggbriL/qwhg1QOA2lCRzrdvRr/GCIChW1HOGG9VoMFAJmVw
         P+lyluMJiCGMWvkMlY/Ccwfvnx9WR27sp2rkkChRQ8/HBVf233POFOi59Ed2V/xxbEyD
         9pOAEIpXyAfaq2gDbe2TGQE5zSspnOauTkj2giA5Cta0G5tcDfZtWL2OtRhZyjUSEtb0
         6OZz1DYGrooM+pI4sEgOPS/hHMY7kPcTYJuSR7G5HfhmZPqtMEYtAc/QvzINQ06FEVC5
         rE9I1qhuxHVWsuVMm6IBTeDCzbfP7C+nh4k3QoRDk63BojLvfmEYrghrYVVWwdSXPCnS
         prZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655752; x=1739260552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=Y5x0CoNS9dWAv5LxAa5XcjRFk0qaB19zMZ0lNKbo5R89E1WS9BabyLITOBmLQIz/G3
         ruDqr5zT9E+YmiG73CarcZTK5a1DHxY2qKHTaYbWM3UQP4sO527bnycf27LeKIT/kzWb
         gPqi1fwdn7hjp2b/6odCX7fuT87SFSf0pZ4Zn8ZlDVJOjlPbubTPQ7+u+OYv8XrAt19k
         ppxjJG+klOPgB5PJlb1/zJTQsvjCx4AV+ZkfrqWKVAICPirIILMgkHK7XYoY/usIsoYm
         zdE45Lioknj+O3V5quPUlvW/Rad1wsqX8LKqvnkr5VpBbw+tSUc5MKrXnxGuxIzuo6Bv
         9RnA==
X-Forwarded-Encrypted: i=1; AJvYcCV7pOTxnLnyXGKXmh85kK21NijnACUGN99kL5IRYsw9moM+8FjTWxM/P0t3u+pmaWP6n9w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMnhn+h1wz5hhpGKfdLFybdBcZB2cK/vlp5NJbQGzDtPp2zPnl
	SvepUTdCDa9bZZFRrEPJpp/LwHjUbVkVOHtwrb85e7E+Vd/rmRL6wmqajea4S7M=
X-Gm-Gg: ASbGncv+eI0uexQp4AnmSjMEoCaTwKe/S/uPCEhAtHQ9uwS3DhhyAY3IjiEMlzSetsb
	6gR5r4yauB4Zoi+UnuG0Rvp8opCuRca0MpMxMllpGJ6Kp9DNq7O9S2VCxdg1PIfhAbrJqLa/g6i
	S5krTblqFn5rfTGlVXczQyCGMhhL9/Q83K/ktvQuEQTYgnPwqe48/Te3N2QL5QZFtEXSTQGkEmE
	WEZb8bGUiXEsVAituepQr4+9XGH1eexFt8YJ7+Ax3isQ6xvFHFfkho6svGy1Q5p0BWzhXglNnSy
	fTT4m5lx9w8tHVAnoqPSuuuOJJD58lLvEtP3YPxYbKGF0VmkzKEFNdA=
X-Google-Smtp-Source: AGHT+IE1kqeyReImTVJHGW5IDLgtzpBSrI2/ZE4aOj+o6f7vrc3hrNQAxAn/RUr7v38bA4d+4LAZBQ==
X-Received: by 2002:a05:620a:2992:b0:7b9:a387:3cd8 with SMTP id af79cd13be357-7bffcd956e1mr2941465585a.42.1738655751905;
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
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
Subject: [PATCH v3 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Tue,  4 Feb 2025 13:24:04 +0530
Message-ID: <20250204075405.824721-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
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
index 54773c27c411..e70f497a9326 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -443,7 +443,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -459,7 +459,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -472,7 +472,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -531,7 +531,7 @@ static int __init imsic_local_init(void)
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

