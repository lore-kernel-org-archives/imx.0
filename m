Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B9F2063DC
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655676; cv=none; b=HaQd5qLYErXMonvWlOILvzL8caMFx+RKQPpoB6TV4pU3X+XAQk4X5PF/Ymmo5fxn9ykFk9bSmm8WRJpAqZMTXL+ba6Xz5GnsC2mPxd6JbxWCwlcG6NuvPC0rTzW7q0vF4UO/bmP55Krr3BGA5lCyifuhzoxqbOrQVW6sbcCQNC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655676; c=relaxed/simple;
	bh=AjbhMTp1aGsIYrzh3IEvyIDO76drMFMoCVTh2CxsqAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z14WVw0Hc8+f3XzSJV78t8dRIW50mnzhyWKdOK8UBvC65MeXTVouRMraq6T9rfZeJLZLRxLui1daKrlptudJm2LwhmB1Gs4ecnRYVXwH+MEGBs/aV44MGUWbslWboWzwMmOkRQs6POLhm2jp2fXKCJVjw/coXZ445OL7HnIqORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XbGEyMcN; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XbGEyMcN"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f95d2eafso554449585a.3
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655673; x=1739260473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=;
        b=XbGEyMcNICqIU0KEo4m6b85Ng7gnSnR8L/vNQf6bofptzg0mbAqNAWpXDiZTdnN9YW
         lkpXUS7j8lGv1NtDo4cOE8TvYaeq6G1R2AvesliqixO+iQRrnMTWoEv4L0s2nu7A8to8
         FjG+NfYoct2aVZUiIFsdUXPjHzrCrsx1LbRN/ud33B34Se6fgyN+Jd80ROBRnIPqo63/
         8cG72m+rFisIJPRcPXfrlEvJWw7w8BuhQyLe9Sw4vEa0TbnKEfLvyw1yEUsCn+1J8wR9
         bnJFcYFFV43ny76AqBDaYEnk1lmXq7orncnfBjZumHJTGYOZlInBoonPlr9pM2fkpKD6
         PhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655673; x=1739260473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=;
        b=F/G3nU36tC1jfjntfKnsryl7mQQHTOm3dqWCSM62Qx6mzb0bTjYdwHs3wehLAkO+Ct
         dIfLr/tHsNdOuE9eGCQfXetu4Yv0jo+g5mcp0TywK1g3yBybCEwyv+V70vxQRMuNjfOM
         T55xzQGERl9TwGc+DUQqyFJPca3oKvBINgVoRle8XdSgWRd4nPkvOaif42sdEgqOv4iY
         ZFIlDDwJ5stvi3ljWwaqo4PkRwJFER6U3CcLo076T6U5CZVnixXvsuSX1ui+VkOAm2Yi
         3V2jNur3J4bYiiIyLEG6ibiWV6M4GQkZUxKgBqV5vL6v91u/RvWPbgqlKQGheiqIr71g
         /Cwg==
X-Forwarded-Encrypted: i=1; AJvYcCWqsjZejje6GPWROH85E31frg4pvNQE3XMwfpwZsGlsuZkZmYDBay/+y71pFaWfJXPncDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOgXT4ce8y+esfGOHC5QcWYXp5G65pkS13vm0YBT/YLlDJUBxF
	8MX4hWbziUoI0vuc+LfDO/31gFSVvZtNxRoxqshnHOQFFI1v+C/VMU4ikO9o0t8=
X-Gm-Gg: ASbGncubfnhXVBMASg3qb0E+ELQivH/yMpRevd7+vb8f1TdYMZuRcSyVdnwOoH/rRgj
	B2GfPzENtPhUagVlRcKx3tLVtK0vy2jwFLwhAc6X15BytEh6gjXaOwh30YmNTRqMb4ox1JNqMvr
	tkSsTtSeXdqGd192RMhpycS4nfbuDYh9PAhs6jGyhdiQk7M6YsrqsIM4zag86mtf29CT6t1HYC/
	w5jcWman952bz4AY4wFBnBUDrEmrPodfm92zP77rIKQtgRQKNZ9J9ys+b54jd1BWD5F62ZL5hW6
	2IgumPQJjk6h0WJqmCBgquuKx2V8IIdOfR52RL49qthfmX4em0SqZNE=
X-Google-Smtp-Source: AGHT+IE1kHVojceFVzcf2jbW9XOHhUZiDggCrSxIzTiwYNG5RUoAlilnWj5uEbIRStQ4m23HHT45hg==
X-Received: by 2002:a05:620a:4093:b0:7b6:d1e1:a22e with SMTP id af79cd13be357-7bffcd43a1cmr3525668485a.29.1738655673185;
        Mon, 03 Feb 2025 23:54:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:32 -0800 (PST)
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
Subject: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI updates for device
Date: Tue,  4 Feb 2025 13:23:56 +0530
Message-ID: <20250204075405.824721-2-apatel@ventanamicro.com>
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

Device having non-atomic MSI update might see an intermediate
state when changing target IMSIC vector from one CPU to another.

To handle such intermediate device state, update MSI address
and MSI data through separate MSI writes to the device.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  8 +++-
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 50 ++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.h    |  2 +-
 4 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f..73a93ce8668f 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -77,6 +77,12 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
+	/*
+	 * First process pending IMSIC vector enable, disable and movement
+	 * on the current CPU.
+	 */
+	imsic_local_sync_all(false);
+
 	chained_irq_enter(chip, desc);
 
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
@@ -120,7 +126,7 @@ static int imsic_starting_cpu(unsigned int cpu)
 	 * Interrupts identities might have been enabled/disabled while
 	 * this CPU was not running so sync-up local enable/disable state.
 	 */
-	imsic_local_sync_all();
+	imsic_local_sync_all(true);
 
 	/* Enable local interrupt delivery */
 	imsic_local_delivery(true);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..b44eb0b3990b 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -97,6 +97,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 {
 	struct imsic_vector *old_vec, *new_vec;
 	struct irq_data *pd = d->parent_data;
+	struct imsic_vector tmp_vec;
 
 	old_vec = irq_data_get_irq_chip_data(pd);
 	if (WARN_ON(!old_vec))
@@ -115,6 +116,32 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to some intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check both
+	 * old MSI data and new MSI data on the old CPU for pending
+	 */
+
+	if (new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(d, &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(d, new_vec);
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b97e6cd89ed7..a8645084bd8f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,21 +126,21 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
 
 	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
 		if (!i || i == IMSIC_IPI_ID)
-			goto skip;
+			continue;
 		vec = &lpriv->vectors[i];
 
 		if (READ_ONCE(vec->enable))
-			__imsic_id_set_enable(i);
+			__imsic_id_set_enable(vec->local_id);
 		else
-			__imsic_id_clear_enable(i);
+			__imsic_id_clear_enable(vec->local_id);
 
 		/*
 		 * If the ID was being moved to a new ID on some other CPU
@@ -151,26 +151,47 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 		mvec = READ_ONCE(vec->move);
 		WRITE_ONCE(vec->move, NULL);
 		if (mvec && mvec != vec) {
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
+			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
-			imsic_vector_free(&lpriv->vectors[i]);
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			imsic_vector_free(vec);
 		}
 
-skip:
-		bitmap_clear(lpriv->dirty_bitmap, i, 1);
+		bitmap_clear(lpriv->dirty_bitmap, vec->local_id, 1);
 	}
 }
 
-void imsic_local_sync_all(void)
+void imsic_local_sync_all(bool force_all)
 {
 	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
+	if (force_all)
+		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
 	__imsic_local_sync(lpriv);
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
@@ -190,12 +211,7 @@ void imsic_local_delivery(bool enable)
 #ifdef CONFIG_SMP
 static void imsic_local_timer_callback(struct timer_list *timer)
 {
-	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	__imsic_local_sync(lpriv);
-	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+	imsic_local_sync_all(false);
 }
 
 static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 391e44280827..8fae6c99b019 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -74,7 +74,7 @@ static inline void __imsic_id_clear_enable(unsigned long id)
 	__imsic_eix_update(id, 1, false, false);
 }
 
-void imsic_local_sync_all(void);
+void imsic_local_sync_all(bool force_all);
 void imsic_local_delivery(bool enable);
 
 void imsic_vector_mask(struct imsic_vector *vec);
-- 
2.43.0

