Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F37206F23
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655764; cv=none; b=Md5/lO2UC+ynfDm0+wK48VWewqPjQH28YkFVkuRkUvGVyVXj25niQWQ9ScCBY9VerTy4EGoeyt9rCH0IViiFMHBdKVW9XbrxRwy0ojAdVDhK9l+po0K7KBJ2BXcxY5dWKCGKYuAC9tGwqy5o8cFenyocuPd+8j/biI638RrOubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655764; c=relaxed/simple;
	bh=6xkXk113SKzH+HghpDpklZ4GMsdI6UuIpAuY82dZFHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtptQljHCSYLewKerZx5n7JDdsMPYSMfUI/b8okCrtMHgFnqw9D1xOAqUX94taCi3Ho5L8iNfy5kgiOzl/rI1N2YVRwFdURx8S6FL0Ai7l/qfAYOgC5idS5AAycEBsRu3lG/0S7pJXE9j85aM0VvE5qGEqlnRRi9d9njncTRuXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OzqTRvNS; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OzqTRvNS"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6f1be1daeso504353485a.0
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655761; x=1739260561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MADFF5SwXkzmIBLKmDVwps1qS+gME3ryVy0pflkh7M=;
        b=OzqTRvNScvy5/LWYzcwqSBat/G65TPY0BrnBty2zqMRRlPy5iXwxbVQbow6dUXOK0t
         4L7j9wkut74U3FJdEM2wwqNmIhoQbbxEHlM5O7tCTXo9wrR2H/bsJSPToQbb2LW1NMme
         n5OGMXROqNUCNp9g8L3XPh9qVa+bqyOZLfQtOckXLHu4uocDvFY3UE/ARHSKJ5i6NRmM
         5PuNKDmdjkAGjh+vQD7W0+x5wNqkTsPWh2mG9LHZSec5q3GYaAAdL2SizN2NH1LUzz2w
         OAz1/WHtVzfS775s6fa/h0YURg+Zg+8qW4hnZdGKXD7cs1WpjjZ6hLyAOXf11Tj2jjON
         GuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655761; x=1739260561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MADFF5SwXkzmIBLKmDVwps1qS+gME3ryVy0pflkh7M=;
        b=NegfbLpW0W2RskcCBHGlovZ/d2jeFbafMBsmYEWy3zfhaN0WChVs+eq3C5xsY6JYuk
         Ax+CJl3cSeuQBmDWvTnj+YLz3mBhiA2V76pI/MedfG+vKcAsIBEN5NZ1tRbYtZTNCjj+
         lYcvn8g7RXWGYr2d2UObVmgJeCKrbdro3YqPlr86VuWlXS9qub7myt770lzNdLmFtEPt
         9vLUUJjsKIjUEI0JcLQYv7h4dSjbEj3pQcZzgql0oFtcf7Kp3Hx6NC3th4zfT95qc+Qp
         jBp3Di6pnbkm+SYjO/FoCzeMj0eOjwngmEsSkD6FTVkCOMdRYDBzZg9h1DsILtEkjpcB
         DiAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlX0Wir1IrTrXZXFYOorglDDaqBRh5SOAJH2deiAOPnBYh0hTsQ5MUS+9/gwqckg3Sun0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDIsJAtgyTnwpEU5CwwWHu26SKg6oHGcYZWVfjKxQ+8H+iQwPL
	R7dyOXxN2/kbMjjVgFe5+sPvCwyA7XD8Ru4I9hVjqW32O9ddei/uw599S8dZHsbVwxIcr3KpM1y
	4adE=
X-Gm-Gg: ASbGncs7Kppss/sB8b6ptHuUQpiN6RoPJ8xX8UzkzPN7Y8z90DsOg9OLXAFYIDyzG8T
	MvDrvkszBY1RjAJAW1+Ps2zQtGNDld9Fqd2YG8S0DTL7pvCmxODFtSwpEw3aBsMupGQZ0RHXsHi
	6uMGpxkCw4x64l65mcOHp13RtZDlksomtxNjQyK2MvP7AqxfJGkK/tV6aneub/G8QTI/Ai35KPn
	TlXIBnt0vswdkAAonZa+RRDc5kLT9hKSNjRT+PPs36Rd4+Su0YzxKxsXTzku8OnJDiJhzxK2dQR
	z0LVoNyR4aKbMnZyJ1AIoiLfzwkj4X1Ma4tHGjHIQMFll5vtzTlOShQ=
X-Google-Smtp-Source: AGHT+IF7prdvtKiSyJ0NFqTW4MBl378F96libEZvgvmb2g4BOpM5Yj9BonZGCkzjTLLgOdYhNcWtUA==
X-Received: by 2002:a05:620a:8427:b0:7c0:a2:e68a with SMTP id af79cd13be357-7c000a2e980mr2573236785a.30.1738655761078;
        Mon, 03 Feb 2025 23:56:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:56:00 -0800 (PST)
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
Subject: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices
Date: Tue,  4 Feb 2025 13:24:05 +0530
Message-ID: <20250204075405.824721-11-apatel@ventanamicro.com>
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

Devices (such as PCI) which have non-atomic MSI update should
migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
flag for corresponding irqchips.

The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
movement as follows:

1) No need to handle the intermediate state seen by devices with
   non-atomic MSI update because imsic_irq_set_affinity() is called
   in the interrupt-context with interrupt masked.
2) No need to check temporary vector when completing vector movement
   on the old CPU in __imsic_local_sync().
3) No need to call imsic_local_sync_all() from imsic_handle_irq()

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 74 ++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.c    | 25 +-------
 2 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index e6c81718ba78..eac7f358bbba 100644
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
@@ -97,7 +102,20 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct imsic_vector tmp_vec;
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
@@ -117,31 +135,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/*
-	 * Device having non-atomic MSI update might see an intermediate
-	 * state when changing target IMSIC vector from one CPU to another.
-	 *
-	 * To avoid losing interrupt to some intermediate state, do the
-	 * following (just like x86 APIC):
-	 *
-	 * 1) First write a temporary IMSIC vector to the device which
-	 * has MSI address same as the old IMSIC vector but MSI data
-	 * matches the new IMSIC vector.
-	 *
-	 * 2) Next write the new IMSIC vector to the device.
-	 *
-	 * Based on the above, the __imsic_local_sync() must check both
-	 * old MSI data and new MSI data on the old CPU for pending
+	 * Downstream irqdomains (or devices) with non-atomic MSI update
+	 * may see an intermediate state when changing target IMSIC vector
+	 * from one CPU to another but using the IRQCHIP_MOVE_DEFERRED
+	 * flag this is taken care because imsic_irq_set_affinity() is
+	 * called in the interrupt-context with interrupt masked.
 	 */
 
-	if (new_vec->local_id != old_vec->local_id) {
-		/* Setup temporary vector */
-		tmp_vec.cpu = old_vec->cpu;
-		tmp_vec.local_id = new_vec->local_id;
-
-		/* Point device to the temporary vector */
-		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
-	}
-
 	/* Point device to the new vector */
 	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
@@ -198,6 +198,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
+	.irq_ack		= imsic_irq_ack,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -217,7 +218,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -ENOSPC;
 
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
+			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
 	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
@@ -256,15 +257,36 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
index e70f497a9326..f9b2cec72ff2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *tlocal, *mlocal;
-	struct imsic_vector *vec, *tvec, *mvec;
+	struct imsic_local_config *mlocal;
+	struct imsic_vector *vec, *mvec;
 	bool ret = true;
 	int i;
 
@@ -170,27 +170,6 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 		 */
 		mvec = READ_ONCE(vec->move_next);
 		if (mvec) {
-			/*
-			 * Device having non-atomic MSI update might see an
-			 * intermediate state so check both old ID and new ID
-			 * for pending interrupts.
-			 *
-			 * For details, refer imsic_irq_set_affinity().
-			 */
-
-			tvec = vec->local_id == mvec->local_id ?
-			       NULL : &lpriv->vectors[mvec->local_id];
-			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
-				/* Retrigger temporary vector if it was already in-use */
-				if (READ_ONCE(tvec->enable)) {
-					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
-					writel_relaxed(tvec->local_id, tlocal->msi_va);
-				}
-
-				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
-				writel_relaxed(mvec->local_id, mlocal->msi_va);
-			}
-
 			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
-- 
2.43.0

