Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748DA45038
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 04:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074714; cv=none; b=Un+1F+YT05Xjgx6nEctfIT1W6F/NzqU+gS9MYT1R0aPAmwEUsMO2YB/KuTiBYVcci+aX0u4PtP02NT9L8tJUHvejYYksMTimlFBb/zFE6YmjlyTP+wrlKbdcgWDOK+5MJpEsh4hsTrXHc7LVF3SQHHLDO6xTrfy26Wa04GiPosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074714; c=relaxed/simple;
	bh=mFFEh8+hZeEVXl9Ut+Oj3ibjoUtqS7w8eehuqLHhRt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjbdTZnCTSCxKcEQVG5DCj+7yBIoDddVb1PU+QJIkYBKo7V8YsSv2dL6HiZjMSnrzodSVodO/9NZ60V+dTIdmHH9o5Ygdza7m4y5lcHbz07R5Mqzs95ehnzlMRQECtEp88wtjPRhEXv/i1va+e6V6CJdGDGHSZl4lBz9O1CKoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lDyVvSrQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lDyVvSrQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f50895565so28112785ad.2
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 20:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074712; x=1739679512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=lDyVvSrQoBYNVgnD5txM0DdRJSmtd6y6mzYpalnZDJb1mE7uvfk018Ljxl0bn1EFOA
         x3kjrLV21xtHAeZtKk/074bO2TB6ZsaS932XGAjYKodJaAHHLfZUYZoYLL/b1zQePfzz
         0qkA9L0dTtKNWdE6GPpiyr/YOMYfWz7g2U131/0Kl2/IVvlPz9knzl5V5RRqKWkl9PIj
         2J1RFLDqhkpkfZWcH5Y8dYUzeMdUSGScfPgb2SvRGVMJpXTz+3bPiLqOpgCusgRliIxa
         3glcRBpuTZFKl0jwa4dgCB4/u2Ia8Sgv2WelPZBtgKujzh6MaFXpauv7YVcJPzWeCU5a
         lAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074712; x=1739679512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=cv+dRIh9D9W2n6da8BDUs15DcTfqhkWhWiz4yjVbVV2wrkEXU7NZ6rc5ksliDRzQqK
         Ev7PiJOUVI2OjunLevtCiOPyPrrqa1wfjplHgh5WSF4Beeg1Ta+qKRdlbxZhdNksKGmk
         JJm+CFabdZpUDsyvwan/oU2JvpJ/TNM2Tl6Lr/FjR6woLM4GwNbEmZGSG3b/OKBjk4m1
         S5OH3+bn0iyI1C6qxmMGV+BNF8Zt3rf16JZfwQFrWmMJaRSW3b5U6Z0pdIIaVfK0bAAH
         I/eYNlvFVRPQ2BwPl3QBOlkopyDI96/H99RtP8fGNwok6M6WSmeMDrUtvYLJVMJKuqXz
         4IbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgG21ralFPXcP6D1AgS+BDMyxRreNoyTpcSqOiRe9FnccyLfk0+GH8GLi1Ic5pFXk2khk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5xlsv+t3pgHCstvI6Dtu2YdbXZUm+hjm3aZvboxjYpWBcaMQR
	xECdBkY53QrQpXeAPAT70d/A6TGy/IjkLuFVUff3R+1HqYNiQWTfrIzJIPpJDto=
X-Gm-Gg: ASbGncsHsjpE27fS+Lm8wYyZmNpSVwWqUi2xBTkpQ3oLHqvVmiKZJq3F0zuvoVlRhRU
	FExU8liO0+6PQcnhtppNRlFchTMoYP8wDfxw5JujMsdlSZnDoPOF2MS0n2gtwswJJhunyBOIXUk
	lNkbyQT0gjmcin5x1eF7FmAQzOk5kRVSTgSApYL/RT87sn0ss+vZY6n6VbOVXn15KENprR2ji2j
	/bUcyXSdO5VyBvKzwx5s03W3ZI0HkDumd8MzW/MM68mkBQgPhMG28WLps2scPtduUYGFf7iCXdA
	I0N+Avw3KLtiurdv5K3gflcYVcMTmXfenAIKFdY1ypkd9DowxFhTdw0=
X-Google-Smtp-Source: AGHT+IGE4yR6cgBkkvQcZ0IHX6BsNq+H8UInEThSWisvqbLPPoF9w9oT5fD4cZTzd5CMtWIib7XuTw==
X-Received: by 2002:a05:6300:6f82:b0:1ee:1910:803f with SMTP id adf61e73a8af0-1ee191082f5mr4625773637.42.1739074711624;
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
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
Subject: [PATCH v5 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Sun,  9 Feb 2025 09:46:53 +0530
Message-ID: <20250209041655.331470-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 9a5e7b4541f6..b9e3f9030bdf 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -129,6 +129,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
 	return IRQ_SET_MASK_OK_DONE;
 }
+
+static void imsic_irq_force_complete_move(struct irq_data *d)
+{
+	struct imsic_vector *mvec, *vec = irq_data_get_irq_chip_data(d);
+	unsigned int cpu = smp_processor_id();
+
+	if (WARN_ON(!vec))
+		return;
+
+	/* Do nothing if there is no in-flight move */
+	mvec = imsic_vector_get_move(vec);
+	if (!mvec)
+		return;
+
+	/* Do nothing if the old IMSIC vector does not belong to current CPU */
+	if (mvec->cpu != cpu)
+		return;
+
+	/*
+	 * The best we can do is force cleanup the old IMSIC vector.
+	 *
+	 * The challenges over here are same as x86 vector domain so
+	 * refer to the comments in irq_force_complete_move() function
+	 * implemented at arch/x86/kernel/apic/vector.c.
+	 */
+
+	/* Force cleanup in-flight move */
+	pr_info("IRQ fixup: irq %d move in progress, old vector cpu %d local_id %d\n",
+		d->irq, mvec->cpu, mvec->local_id);
+	imsic_vector_force_move_cleanup(vec);
+}
 #endif
 
 static struct irq_chip imsic_irq_base_chip = {
@@ -137,6 +168,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 96e994443fc7..5ec2b6bdffb2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -311,6 +311,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec)
+{
+	struct imsic_local_priv *lpriv;
+	struct imsic_vector *mvec;
+	unsigned long flags;
+
+	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
+	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
+	mvec = READ_ONCE(vec->move_prev);
+	WRITE_ONCE(vec->move_prev, NULL);
+	if (mvec)
+		imsic_vector_free(mvec);
+
+	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+}
+
 static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 				     struct imsic_vector *vec, bool is_old_vec,
 				     bool new_enable, struct imsic_vector *move_vec)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index f02842b84ed5..19dea0c77738 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -91,6 +91,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 	return READ_ONCE(vec->move_prev);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-- 
2.43.0

