Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858BC2E628
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 04:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074731; cv=none; b=pX14kpgSjzPoK6Vs8NjKmIgS0qcl0w35hcKOeR5sdYugKTxIYHksOMTvN1W9j2nwPioUPHyxZbZFKp19q2IAeQhyWRynu0CYG+1YbxBfMx4FbblPT+WdD/M5oExRtVnzMr/NkTD4xEI38xsz+IU0Ld5rclzjDJblDMOFGcNnncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074731; c=relaxed/simple;
	bh=tNahCfxLRgNIbiBla43nJrTI1GFGdO1edGYaRhyK8s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvmN6e80n9ZzRmQ4Tr5XVb9sE1lUazlyg+adsQFGGQ0QFF9MfSyPtWdbMH7Q5b2qiqhBR0G5uASQmlPqRFmVgszXBtuaxAKFd5O7k3AVdFPRB7c1L4K6Up529E84GQN2VaTHYwH2OBy0dfzCOZILML5y6vp9hKw1oGZyqMGQvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iQk6hbKg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iQk6hbKg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa1fb3c445so3592547a91.2
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 20:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074729; x=1739679529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=iQk6hbKgJe7hKzqKlOkeaTARXEAIcI6bIp8rvU4GZaxRymft8kIMpHmTrTa7kvaTNx
         koUMQ8mCH+pbkqxGHDiLHfRM2KEAIP3pmw5+7Dtv0WMf8IM/4xoKrMf9ANe9F2fQELTr
         e57WDWcldrztUsUW4HfPKN6LgcM2EBaNUY+mouU33RCvIC9sJEJU3Y/uHGNGFbnc0bsl
         lUdavicb6dZ8PMWemRINpLBgUMlHyKVC3HSH1CIi6BimRxiyMZSUPbaoOzMRfRJHvqBH
         sBrH9B38SXCwRa80LWtf+tmCQnUTEiZS7Y0efxWjKmlfQNSGuV+gQ8Oj5Ib4RUwBSr04
         vjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074729; x=1739679529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=I5f9ZvNZ3prlOk6peLxw8774cHBOsvaKtYAllHElRylEDowMn6idXf11/FUDvob+0O
         rLv4wPz2h3NdT4rpeyzEdtd6i5Zmj6KfV4ImQt8PlDZ7Y9QNoI9v/8HFG+gCwHCDPOvM
         UnzpYcsyidkZxpKbfM5+AsAgnAkaLr1CAGuZjHoqQqQaeVFbEtZ1SxccDSnACksYVXvg
         2iybpktI2EsrWbEcxqgHIwq4I3yO6t8Iex2J8MkVm8x6Jy8r6KTrGL0/xqkBH7WY3PDU
         66v0rWzzsEcx1IB1q7jNp9QGEeaxMmInf3nHFl/lAb5C6/+NS6AdjPjtYVitggfVFZg2
         tI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXn7A+eMQI/vh6Y9QAoEloKjV3l6DPe7F4DT3HDqZ25Iq25HNHgteh562cpIIxTYiL0028=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY7byd03cm29ldi70hWH55lmZ/h6LvPqkcdVgwxO8rl05I28DI
	z1DVXcjmnk3P9etb7gkF/WkSsswF4oTBVjRufYZiMJPngJM2akFLGe/BU1anHiH0eD3Fh80kFcG
	OSXs=
X-Gm-Gg: ASbGncuZN1vhMTamCh5KjFDgZYXqPv1yWjM0nMqy8d48Cs1jqfGkyJsdPJp50Hh7CT8
	5V3GlFMGj0bm8QT59QTdYaO+hUeAjllLgeVF43brX7ITfbUhTJ3t9CgAqSYilgvyRPoe1Hgqnzs
	xvb+hTEhY2TB+xJNCE0WbvzZ9cbVXzZyI44r/4WFaIMP2ONiQTVu142StRH7CCMkm7DdVcHZD2v
	4azKL/n7BYmKz/hRKPcDsu563pxlKJsG1zhlNoYcPH3/PplxSbJjP1RS9H1OAGAz/7hcXYifRfn
	JMLhy6pjSBlEbXRdXreE0GUO4rlI0hJNW1S+XJ+QPu7qMVq+mHDg98U=
X-Google-Smtp-Source: AGHT+IFzlqSdIaYHLSZI599cWVBA7dW7jlgFu/OL/NbLRylvBc/ItMiequCd7pzuj7u4ZD8d08JvJw==
X-Received: by 2002:a05:6a00:2342:b0:730:7d3f:8c70 with SMTP id d2e1a72fcca58-7307d3f9339mr5011190b3a.21.1739074728662;
        Sat, 08 Feb 2025 20:18:48 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:48 -0800 (PST)
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
Subject: [PATCH v5 11/11] irqchip/riscv-imsic: Special handling for non-atomic device MSI update
Date: Sun,  9 Feb 2025 09:46:55 +0530
Message-ID: <20250209041655.331470-12-apatel@ventanamicro.com>
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

