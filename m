Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB51A8407
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782752; cv=none; b=I2tsSeiYF5hcwtVjOIXVUEbYrx75i/V5FlLqIgBVSaniMm+B/+bE71s4BC7nFdIgR/Zw423lEvjbpmT60F02LfMdJiW5GeLtm+KAvz0sOGRUSsTrmCF6YScT0a2LWhYycspLB+rSVx4rxRH0PGFIiVRHk0K8vle7sav7bFoP/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782752; c=relaxed/simple;
	bh=tNahCfxLRgNIbiBla43nJrTI1GFGdO1edGYaRhyK8s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7YId8LG+F/YtNo51cs88f1qVnVes52zO5XZ5FVbNLuzZL7t3BheFRy6pKgYwMXubhwTi32tcAQcD9/9962/RzXxodTonmkZ3kMycaIXEuiCFGXjKRJRQwc6shJTjCRG9Fiv4UB+Nb9xxkfJMKi3/GoXvt/og2QUTXBHtVc2c3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jPyctUy3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jPyctUy3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220d28c215eso57299465ad.1
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782750; x=1740387550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=jPyctUy3qFB3bPp4g4DGm8H2plCIXvxDxXmbuM6CbSEORAB1NOblmfIe2hnq7v908p
         yNqgzOJ3hmh75/7AjQWZK3SuSreojUiR5tBw+YTKD1AyTteyDb3jQwxHRG9kO3o+FzOp
         1ayGBykg9gocy1LwvpEKfnxOGu0dQL6D/yEcg438l+DB5bMNsmNnQutq3VOZIdc1l8j9
         oc9qZvtQdKn54E8hOOe+8UAUmBrIWdczT4j3VngY3hcbI9CugAC7xBEh+rePKfYmGpLC
         93TkGn6G3aeTY/S+a+RHoIKD3M4t4Xt8ivJ8Zrjn3an0JM4dnKFX7tPBcmD0jYJuDmDt
         MLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782750; x=1740387550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=lG8hvs3dFNHirJLr6QQDjgP8rJzqQSBrqkxgRguauCsCBZ2vGsBNVkJzm6uV7BNaPY
         ZViG62E0vQ3o8WAwC9pUKxHI105Ue2/QFiibKRAFrsOgrgbnsoDNMrEWhZJsW1kJT4oT
         TKPtNqwN/KmF5VqRLs/xrmS5WTU8I2N+mkNSwG3GohPKP4wJ3TTuPsPTqFqfLZ5fXOGW
         UY1ABK23Qf5Ph3mjFVNxC36ZVoGjQUN6VovLUPrju7uR2fkafF2JZODpw6FxH0MImYPO
         FmZLWluhKR1N40GJAZjGSx2a6gxDJdQszD1K16rCmMVsmdRuMCSlyPhYlxfWdIw+PBKu
         /lrw==
X-Forwarded-Encrypted: i=1; AJvYcCVAhSny8OUZEqp89zsSO3oV6i7uReFkZEA7Sx7PLxelR71P/EAajeWJvFuPkUvAt7hob3c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl+m5MmaLm9Q23Ew02wzleN+qlrgYfzOvHcQt03RNdFqPkSz1h
	5RZKVarahpp6se831utNfpIWCJbBmF6b6QK2f/pfSC5g9A//JffKp5eeQRbqL64=
X-Gm-Gg: ASbGncuUtwSwOkNL320Dx6pziurBPlTj1lM9XumCB4qexm6brQNvbpn91mSRibl+AHq
	LbSJKKxkzQzwF28d2Wtz9lSbxELWYwmD/z0Dod7/CTXS9K4bQm9RVjYTCZtZDycC8vEJd5jg7vX
	ea2I9i40Go0lbb6tk+E2LjQJ2h77qmv+8leuSKB5dxwO0ETQfltEUPwVZYwEWwjSsgFrDdYuDMV
	FFwvPpdd9DN20TACF3fcRdBK7cxE3ip9Rg9q/cHo2YYgnpjN9Xsg+RNjv/bS/qpPoYHVZpQ4jRP
	Hl1prkvIIFqQN5oGRp6Jve+gZepOOICjn/VkL61ElgpYWMcL27PKyAY=
X-Google-Smtp-Source: AGHT+IH6Tjxl2D2mFXDe6LhFiNV1G6vUFczqpaUqf8nSRh0V0anC6B6P0c3HIggrJMZH7GpsMRQCQA==
X-Received: by 2002:a05:6a00:1392:b0:730:74f8:25b6 with SMTP id d2e1a72fcca58-7326179e8a0mr14044686b3a.6.1739782749571;
        Mon, 17 Feb 2025 00:59:09 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:59:08 -0800 (PST)
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
Subject: [PATCH v6 10/10] irqchip/riscv-imsic: Special handling for non-atomic device MSI update
Date: Mon, 17 Feb 2025 14:26:56 +0530
Message-ID: <20250217085657.789309-11-apatel@ventanamicro.com>
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

Device having non-atomic MSI update might see an intermediate
state when changing target IMSIC vector from one CPU to another.

To avoid losing interrupt to such intermediate state, do the
following (just like x86 APIC):
 1) First write a temporary IMSIC vector to the device which
    has MSI address same as the old IMSIC vector but with MSI
    data matches the new IMSIC vector.
 2) Next write the new IMSIC vector to the device.

Based on the above, the __imsic_local_sync() must check pending
status of both old MSI data and new MSI data on the old CPU. In
addition, the movement of IMSIC vector for non-atomic device MSI
update must be done in interrupt context using IRQCHIP_MOVE_DEFERRED.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 73 +++++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-state.c    | 31 +++++++--
 2 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 6bf5d63f614e..828102c46f51 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -64,6 +64,11 @@ static int imsic_irq_retrigger(struct irq_data *d)
 	return 0;
 }
 
+static void imsic_irq_ack(struct irq_data *d)
+{
+	irq_move_irq(d);
+}
+
 static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
 {
 	phys_addr_t msi_addr;
@@ -97,6 +102,21 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
+	struct imsic_vector tmp_vec;
+
+	/*
+	 * Requirements for the downstream irqdomains (or devices):
+	 *
+	 * 1) Downstream irqdomains (or devices) with atomic MSI update can
+	 *    happily do imsic_irq_set_affinity() in the process-context on
+	 *    any CPU so the irqchip of such irqdomains must not set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 *
+	 * 2) Downstream irqdomains (or devices) with non-atomic MSI update
+	 *    must do imsic_irq_set_affinity() in the interrupt-context upon
+	 *    next interrupt so the irqchip of such irqdomains must set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 */
 
 	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
@@ -115,6 +135,33 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to such intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check pending
+	 * status of both old MSI data and new MSI data on the old CPU.
+	 */
+
+	if (!irq_can_move_in_process_context(d) &&
+	    new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
@@ -171,6 +218,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
+	.irq_ack		= imsic_irq_ack,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -190,7 +238,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -ENOSPC;
 
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
+			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
 	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
@@ -229,15 +277,36 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 #endif
 };
 
+static bool imsic_init_dev_msi_info(struct device *dev,
+				    struct irq_domain *domain,
+				    struct irq_domain *real_parent,
+				    struct msi_domain_info *info)
+{
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
+
+	switch (info->bus_token) {
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->flags |= IRQCHIP_MOVE_DEFERRED;
+		break;
+	default:
+		break;
+	}
+
+	return true;
+}
+
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
 				  MSI_FLAG_USE_DEF_CHIP_OPS |
 				  MSI_FLAG_PCI_MSI_MASK_PARENT,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+	.init_dev_msi_info	= imsic_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index d0148e48ab05..3a2a381e4fa1 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	bool ret = true;
 	int i;
 
@@ -169,13 +169,36 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 		 */
 		mvec = READ_ONCE(vec->move_next);
 		if (mvec) {
-			if (__imsic_id_read_clear_pending(i)) {
+			/*
+			 * Device having non-atomic MSI update might see an
+			 * intermediate state so check both old ID and new ID
+			 * for pending interrupts.
+			 *
+			 * For details, refer imsic_irq_set_affinity().
+			 */
+
+			tvec = vec->local_id == mvec->local_id ?
+			       NULL : &lpriv->vectors[mvec->local_id];
+			if (tvec &&
+			    !irq_can_move_in_process_context(irq_get_irq_data(vec->irq)) &&
+			    __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
 			WRITE_ONCE(vec->move_next, NULL);
-			imsic_vector_free(&lpriv->vectors[i]);
+			imsic_vector_free(vec);
 		}
 
 skip:
-- 
2.43.0

