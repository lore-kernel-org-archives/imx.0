Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3854A1A5B8E
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782735; cv=none; b=fT95vDU2b3KxLMuSIhY7IjbN8oc4qCSAKNyVHI1mKiqoVrkkWZMZ8+54Un2MSrr79X0FqF5J1s74R9wE3dMEeV/KgdRamVRYJwM6i2Z3XLyR+vwyvt9dIUnU2CGMhvjojqNQti2aEVnn2YlLypTaPA74XPNXNz6gqtRfSpe576U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782735; c=relaxed/simple;
	bh=mFFEh8+hZeEVXl9Ut+Oj3ibjoUtqS7w8eehuqLHhRt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gz3u7SgC9P2RW5Npwxyb6ec4vP4CI1qI4mDG+hppJiAvbSxIJaWibAQYtQmjAMUExXDVPeBNG2JWS2GPIWDAjHZD3mebLoVkiygFBYI++jc7krVAg1kdmZgmyUDNgWhZslxPgHs4KEkL32I4H6FL1eoY/CejP3uFw4aVyWfLe9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MV+sOrzM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MV+sOrzM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220e83d65e5so59704075ad.1
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782733; x=1740387533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=MV+sOrzM9FsgbTtU7N7Dq81sbV9yIq/a1r0tVsy3Qn9HAtTkjJNhKRlOn/iCoyprui
         4Q2b/o9Fbvax4Yxsg0CPFyqF7FYYDKDSMxOW3SoMcafJLTyF24nY8y/AooW+mMhBw6rF
         F1K+chQRlkr8x8M0wfHgE7yfxy4omoUnO0MHoYFz66R1VM3vOwS9FBDA8NBJMNGwLCxX
         qhsBqiEc4g2Qci5nhLYf0G9VpBgmVtI+vurdRNet41rNcw51VJoyYr0jknQFLi+aV8A+
         uQHi1Xoc5XNPQq+a1oN8zIUZNl9xxmupqRZFkNvgU/JCbA6uGBtemoKnhdl8HXy0wW5W
         DRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782733; x=1740387533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=irdlQ8NRt8+SlFnLap59D/Vs/WGvIeZnMX9yR0i2lAhGWyNaBGnL0a/C2b+LYU8pyQ
         G+04VN04aX3aT2brBFetlppoCnxJkRQdt3IYSeezwyUVRX0q45dMqUaO18YumwpEnXGq
         FTdm/YdEoQj8rETpkN4UZHYOSSMNNWKE6u04ANmzKcpyPQ434r//L3tAOX77WJhQsoD/
         +yRl5jm6nMYTxhbRc32DWncyKN+pXVBvA9iVOva897jk+B0mK1Nix/HdPXqScGmuGOdF
         QREOSc3K+NF6Bl0Ji47JamWGPWE56P1L1hd5aeICs8snqMJmivtAR84NCf970rjH68Wg
         7hCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHQf1tgy3AQtX4NkjOxAUxbRelM7LZy9fjmP3JJxjaUEJx6yxRBk1GMWSn52xlUJ4mpys=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg2j4y6FH6mr71T4v4CSTvqU/LTrJWtoVI3RxWIUlka0OsTrSS
	WPDsqaS3PT2wPE8wKuz3oQdcbfEAXF3GZPteHGwIrpypmrny3P22PR96Ob0cFfQ=
X-Gm-Gg: ASbGncvGW62MUy6HIbvAnLu/1UylpOGVMGn0UAyTj24DeT8yemUPLbwYc32jlYclAbe
	HbT+HnF46vH1yw7KlscJcUCoQI4V5kPTXPkMh6eBS65znh/2Mv+dOolPNAdpvqlDlAgwkgkb8ge
	EJ95+hugFum2YS819DhzqywOotaH2KoJFvZPN53Jl7kUNjv+7WqIzB/TyAnccLGk8FGxDCPfAo6
	P2eHUVMY1VM0BVfx+gl8qYI2jCqffh7FB03ZFjSLctPRHUY/W0DahbgRch22BTpVtW5T2lqOcWB
	Jvr0qFYdQ9ev42bHoS5X2JThZI2KNE3pu87Fa3oZJKSOuIcFd8DBge0=
X-Google-Smtp-Source: AGHT+IFBSmav50eb95KMP+Wa+2zHfS16N6A6ml9KRa5tGTRfbaBtV9X2/4WT6iaEXHAuO8XqxuEKDQ==
X-Received: by 2002:a05:6a21:6d95:b0:1ee:5e7e:bcc2 with SMTP id adf61e73a8af0-1ee8cb176f4mr14239238637.23.1739782733442;
        Mon, 17 Feb 2025 00:58:53 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:52 -0800 (PST)
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
Subject: [PATCH v6 08/10] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Mon, 17 Feb 2025 14:26:54 +0530
Message-ID: <20250217085657.789309-9-apatel@ventanamicro.com>
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

