Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84A1EA90
	for <imx@lists.linux.dev>; Sun,  8 Dec 2024 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733670451; cv=none; b=oHKO7g2jDILFRsBmm0UFK4+iggTq62XHJNDkFpAlnHsPxVsP3SdQGRqxVZ44tZRUxhBYmUD50VC+sxiR/dgmGwmrUDk0IMEI93IeaTzsFTlGkwA2iXvlLAarJkyDqGT/YnhK/+RT8lNhxnknlQKXd5I8tpGyAJmfAbf3gFE+MAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733670451; c=relaxed/simple;
	bh=1H+iWfU5NlvI54+uFA8ySfgxCSD3NGISO91+xEb5R1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/WrbSBZYQcXVKTzKjDfYT6X7JDPZ5+nNNEVUo4uBhK7StQtDGcfjmd4YVC3bT+e0l6kL28DC+qbYqlX5wEHlkd3HEc9vElm+Df9nE1Mupxe2DcPwN5xAeqA5yl7bbhzIFokGgd35Q+ZXeuGFKaZj7Oh2vleNL1o5jAuFtmev/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=SGZQzrXS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="SGZQzrXS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216281bc30fso14198265ad.0
        for <imx@lists.linux.dev>; Sun, 08 Dec 2024 07:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670448; x=1734275248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=;
        b=SGZQzrXSQShI2FNKsjBG1d9H8D3Fg4ULvWgvHnMLo8fiLvUrkPNVp3A2GoLqgAOE6x
         yW34Mm65STXXm6n6AbHQl75pw7Mk+TFF4TLhRWknqcoAJ6NPXrfCt1zCbSlxkkI92LQO
         dQnzYYnCU4Qed6oXCNWB7rVRkVIU1z19TDO2+ElUWBDM5k187ErXdpxWf0UbXT3Emu3F
         oYoZdCOD6IERatt9vysfyRFyL5uDZVOk8395JJVNHwLpYRhcOyFBFYqRxwBX5zn10NFH
         loYz94Yijqvi2r4dGmRj+a8+nLI3fa3N7n9S0rHi0nKeSjUBB1fCMM9gue2Z8wKgtEVw
         4GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670448; x=1734275248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=;
        b=CperscaDuSF4ABSIqaUlZw7c72+Zl/+l2a4LV4vrgV/M24CC8kUCAq8WuOQfQbj8uu
         rtYQVtjuMPHTks/MhAL6fWJzjsfEp89G5RAxidvYwXNvCQr87+niV+yGURGQ3PLh7b95
         F05hZQYnIVojpLJJFOYVOW8J/z05OUqeuUayc3A5Sc6Pff5l4cI2qMCpIfnvC1i3A2KV
         RctJEzm7tgJaV3/v/ZtTrt2bKpSfgJxx4Xvl0t58hS0ppP2XkfLGF28XHcsAN1pghoee
         /J8gWaVhycCT0Sz6macY27BqGy7KXxAFrPu4PFPJmBZKElyx8hceDKuOL4IT6DNLu7Vt
         GgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4qdeQrVjsA9nM+VAkj7RokpGauQiWsdLwMl0/B9yUZhmrsnvJB7YbVA4y+sDAGVrGLmc=@lists.linux.dev
X-Gm-Message-State: AOJu0YycHE6cID3oULV5RiHacHh4w/N/JhbqChfh7U6rZgV2mqLnetZY
	q53oeq5gv2lbX1xDZ2oZlKF6phe7drEIcdVcRAKscBT6AekcvqcTYk513hX/rtM=
X-Gm-Gg: ASbGncvw7Cuo6H3z6nvyyh5RjSTnii+TelpjwPO8D0FPXAVZW5w/OHczPW/24zuJIms
	cM77Skv3r5JNkpXlNoJq6lzFQqULpggb40NX4K0yTGfxcaAAVpl3x4B2ZlTOLmz5fxJnB6QvHKX
	uTH7p/BpLadyKJv2QTmA9jl7D+IBuvor9+hzPGY7fmdzLoHzvd+35txIGMygilJNp9evoEZA2x7
	7QYaTuNGdM+PZPP1uyrCl1TmT9b1oE6Rx7kS32YfVEJXwSpHmzSfFKhotVWNw2VQ/gJdsJG70Ob
	mNvsYUvpMzii8Mo=
X-Google-Smtp-Source: AGHT+IGeMHvOT6RCYMvwhhYpeZ8b5RyMdQq1g0U5HspyszP4RDGsvXBxsgKTLdGXoqrj8jvGvqY46w==
X-Received: by 2002:a17:902:ec90:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-21614d98c11mr163726535ad.22.1733670448046;
        Sun, 08 Dec 2024 07:07:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:27 -0800 (PST)
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
Subject: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates for device
Date: Sun,  8 Dec 2024 20:37:08 +0530
Message-ID: <20241208150711.297624-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208150711.297624-1-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
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
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 27 +++++++++++++++++++---
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..707c7ccb4d08 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -97,6 +97,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 {
 	struct imsic_vector *old_vec, *new_vec;
 	struct irq_data *pd = d->parent_data;
+	struct imsic_vector tmp_vec;
 
 	old_vec = irq_data_get_irq_chip_data(pd);
 	if (WARN_ON(!old_vec))
@@ -110,11 +111,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (imsic_vector_get_move(old_vec))
 		return -EBUSY;
 
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
 	/* Get a new vector on the desired set of CPUs */
 	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
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
index b97e6cd89ed7..230b917136e6 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
@@ -151,7 +151,28 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
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
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
-- 
2.43.0

