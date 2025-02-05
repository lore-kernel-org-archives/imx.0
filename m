Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418718CC1C
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771264; cv=none; b=f0oIYmXZN64VysGUiqLfA1kyW8f86/2R/cO2K2JKYCIgFNz+ixcXyZWl4+YyAq+uTy+RcFqC7B1G4rwQb6T+pA8GPRohq3z5FvL8xdb0pkYQ8yMx4f4zIaQ7+C2IfYmFNC0nNC367eVdu0baAbKbur3SyBrrLMQrKH59v0XAZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771264; c=relaxed/simple;
	bh=mFFEh8+hZeEVXl9Ut+Oj3ibjoUtqS7w8eehuqLHhRt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKM0+hNXKlrDAWDvpxcBaIVk9RrOukT3sjZtvL0D/xw7VtFMKmcdnLuvmcHqKlYgQZk1P/JRH51n/9OxU4w6ykorqSmWBt0ZFKSXYtOq6O607wInSHrBvqQwKLrvwotrMporH7PL2H4XzKXtFHB561RHVyQqMe0lcz2s/S096Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AMmoxh0P; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AMmoxh0P"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f01fe1ce8so30821085ad.2
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771262; x=1739376062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=AMmoxh0Pnq7NJRCniRp4Uy4Skl4X1z4gkJNDg+i5KATuupnE7JtqPS/m3uINXtMQNL
         LAO2GC5e1epl7qI7Mle8P2EA0cwZG1CnvhCey5pyhAiGI0Dnz301WOieWJhDqGhoxuCl
         mpzixbuuz9bmpp+5Bt877zst3rlPsdU1oSaJegg1O08bbRDRo6NhBTVcVyCTuSAQC8rg
         isUiwNKPoeHGw6AFsOuKDR/PITDUd+gA85zmB+ThqCV4I+X+FZL74qDVdX+kIMeSnFtI
         Q5V9Eg5pYBYvrPA/RFHUXATZKAutE2mMSZbdbX3rfVkQjTtU544YjKsjcj3anZFVgTBm
         FfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771262; x=1739376062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=hznF3YCYa1uxau5QK+7qcypADmVfnGHiIDijRxgzey21kFjHEfYP5Xrm9Bg5GH53Rf
         zA23MTwf6lDDsNxYxfIXLSCFxY/2lnWMySaWdPILJjarbDudpW+d/9aYJWaDYmq2bBcq
         yc58zM9Km+Uy9RSx9+5D3W2XVtUgeHL3kOnNzLSOzS7/m31hqcdP6LSohQqc+uHzXVGi
         zC4nDEq5l8ilr1pVFU8LNk3deEVbVIlyMOLMrXSMRfRwJKKJlerejencj9vmBorPmfyD
         XAhEDcDjiFbu1qDn97KCPiSqjbBF8VFBb3Sko7U3EkrdNphFepNqDEg5mo0+Z/QchWyP
         O9jg==
X-Forwarded-Encrypted: i=1; AJvYcCWSQsshW2mB3wUY9mqTa2QkEl+LOvCN2RAE7q368S9IeZdxNyj1EnflXYoPzQCpJACnP5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmW26pCpPibGigjJHQZGhDLbM/yJpAoo1cszToZDbzGz/mrlfM
	yphFKTpZcoDc53YQuJZ6zEH8mtEwmdhGYqF0lxT2FGrVhWLiZdr1fQxpQno3K4n0CvQEwPTP2da
	K7E8=
X-Gm-Gg: ASbGncsH8HYkeVpp91ahWBFXFN1iQLEbCpKRIp3sjq0Dvm/EBp/dMp53/WMN/Typk+G
	gH0KA3nUimHA6E6slUs/wRDaMiDGHxlavZLTb/Bb3wWfvX7l49VuxLQ4dWpjgwfIKpHRXrZp3GV
	vWPEN1yCkxRgNA9ZSZZZUDwjuP+9bDIYEGZlBXsF3TLHKH9VrRdp6PhRWStFBQQslp4aLfQCFed
	1BeMJ8A4niCYOoNxE4xuvF1TIZ6rot+7jSrcvGB7OPJbXV2Q2oz41wt0369DnnPyyC5jsoAgmtR
	AJATSbGJpUCMUUpt3n8wsp/eEBEDHLcV2nOxvd3tCd8WA1UOCGnApEk=
X-Google-Smtp-Source: AGHT+IGA6bIArcQBSZQINkR2ug10cWLWOtAjnqU2/HK+jfs8kC57mwS6eJ+lRGDZ5WGk1pjMRxBEnA==
X-Received: by 2002:a17:902:ced1:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f17e2719dmr55903235ad.8.1738771262008;
        Wed, 05 Feb 2025 08:01:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:58 -0800 (PST)
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
Subject: [PATCH v4 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Wed,  5 Feb 2025 21:29:45 +0530
Message-ID: <20250205155948.81385-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
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

