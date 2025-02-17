Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DECA1A4F2F
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782704; cv=none; b=U57IMlOpeJkjCL+N7zXBruc3aDCRWxUkKOBMyV40OO9PEggH63cOxjnSYTPfu7Nis9/uH40AkvnBu8jzqmocelm5xH8hfO/6PaeZhN39BCdzBE1hHof5428suu+7Mg9swHlCMZX7QHZBSFZPtoU3uZoQKr+/kvWI3MG3TrrG6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782704; c=relaxed/simple;
	bh=yfLmkM6qEAtePtmZAV08Oc3zFbXuNPHytenOkvHgx/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G22uRTliWYrO0i1j9jnsBG+uOXrxm5Fmi8P7RR1fn37enlmSqwC3P3BSxuhrU9k52G9b5cx2rIK+PS+NVD6ZLgJ6OZK61TloVjlYlZCtqcFUxup0zhuZzkoZgFDWVvMposPaMwmJnlfqSx/jligkQzomvhbPyRqqdgz1qK0gfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gMgEJeAf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gMgEJeAf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22101839807so42414695ad.3
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782702; x=1740387502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muAXlG/uZk+Ut1w5NICM8ivKf832EJKGEf1Ht7zOCxs=;
        b=gMgEJeAfcW019T+sd2/kGp3WKvqE8RrEfcZpHLDhEGFuz4yQPgfqitPnbieWocqJ68
         bjf2W8D7ry4FON4EfPNYRFfGCQh6BJrI3l8WGYdRlB1g2lUFzDovK3SBJT7Q10n2gZg0
         4fOoiIKuMNzz4BDiZukMD7FuFXxHSJlGb8O5om6+dlCLhEfHHcTkd4kV8xZQJuU/Vudn
         MQhu1lFrknB0mXHvG1WXB4tUG3zz5nUnOmZrW3E3OrY4fKImw8J3qgYZ9oA5Q6D4kgTR
         So22VkjmXzcZgRCrUC7vgt5HQnI4c22kO7Zs3h1yW05qyRnI88VS/LrEA/CrD8COEABv
         xhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782702; x=1740387502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muAXlG/uZk+Ut1w5NICM8ivKf832EJKGEf1Ht7zOCxs=;
        b=gj8zBv7KjApwqI019JIAWGG72wrafsI2Z1ggC7CVbrZ2GCHwLUN3TM6v494uCF7+mB
         7cS8VzIcSTFdU8sMpHVDJbKgQ463Y0Dxa1hFhi7gxrHeMNkyhfdX6HYd5Ika4OVMagYm
         +tamOqfPj9Jnic0nYJgrL/KazP8DjKG+4apeGHeZ1PkKGDf9fEJFY315kaRpRASvBC44
         zoDYqZC8I6m9EGOAqiAuCdrX19/DtIvl6iQnDAtKg9hJnEd5P4+xJNzMtn1IcskIrWR1
         dAKmZju/iRkCrm67n9Le4NR+PLEKa/jumvEli523HIaQ16isWJL/cwpOVD1RTi3hR5Jg
         /Cbg==
X-Forwarded-Encrypted: i=1; AJvYcCVPwNcCd5Oa+EWaVj+dKBEeagDh14Z1HREZpaMpbFOGjB4ezgbL71sfHjqiwui3/Kh6Tbs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxKzvagMsQM4J1nV7cqA/2VuubIOcwRlu0xUPSih3yNu/PJJYt
	qXIU9gb4gZrmhYlEFWaqIOsu6QAM2mNG4etNAKuYCB7TB0BgoV7anUzDx80wRcI=
X-Gm-Gg: ASbGncscyeICEM+cZQ+f2qYjNJEJBePyQvZmSl2VQIW1Ru0VPH88bPWGK3OJCFjqyZN
	OPfS2v1M+i/5zKcbvO45Oq9wgFQaSC3d1u4HJRI8egXsAt+SfwJDt/zDyoMIjf4/ChozSejhYlr
	JLlfxXjfOfyW5lJZZWTnGYermV+jFSn9N7Eh9CxbW2DS5f02Bt7TTDnOvDDu3Qu45GDMyxcTtJB
	vshq28m2PmRn/ct/7xCodxg8Ek9htB4FSgPRaIum9cNU0ZwdCmhqOjq9TgiXQRLlq+pZQ0CQE1r
	O5hW0/xH/uQvRtKTP/4HYNEaDg/MFtodatU4rOu4lVAphwx8joK8enc=
X-Google-Smtp-Source: AGHT+IGeeSKqQaB04W0hYbcp5SOMBU/2KVamXBnyldtu8MmORMjRPb5xrOZF3XnR9hLS8Nh0YSNDYA==
X-Received: by 2002:a05:6a21:1693:b0:1ee:8099:e657 with SMTP id adf61e73a8af0-1ee8cbe7bb4mr16765666637.40.1739782702160;
        Mon, 17 Feb 2025 00:58:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:21 -0800 (PST)
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
Subject: [PATCH v6 04/10] genirq: Introduce common irq_force_complete_move() implementation
Date: Mon, 17 Feb 2025 14:26:50 +0530
Message-ID: <20250217085657.789309-5-apatel@ventanamicro.com>
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

From: Thomas Gleixner <tglx@linutronix.de>

The GENERIC_PENDING_IRQ requires an arch specific implementation of
irq_force_complete_move(). At the moment, only x86 implements this
but for RISC-V the irq_force_complete_move() is only needed when
RISC-V IMSIC driver is in use and not needed otherwise.

To address the above, introduce a common irq_force_complete_move()
implementation in kernel irq migration which lets irqchip do the
actual irq_force_complete_move() and also update x86 APIC to use
this common implementation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/x86/kernel/apic/vector.c | 231 ++++++++++++++++------------------
 include/linux/irq.h           |   5 +-
 kernel/irq/internals.h        |   2 +
 kernel/irq/migration.c        |  10 ++
 4 files changed, 123 insertions(+), 125 deletions(-)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 736f62812f5c..72fa4bb78f0a 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -888,8 +888,109 @@ static int apic_set_affinity(struct irq_data *irqd,
 	return err ? err : IRQ_SET_MASK_OK;
 }
 
+static void free_moved_vector(struct apic_chip_data *apicd)
+{
+	unsigned int vector = apicd->prev_vector;
+	unsigned int cpu = apicd->prev_cpu;
+	bool managed = apicd->is_managed;
+
+	/*
+	 * Managed interrupts are usually not migrated away
+	 * from an online CPU, but CPU isolation 'managed_irq'
+	 * can make that happen.
+	 * 1) Activation does not take the isolation into account
+	 *    to keep the code simple
+	 * 2) Migration away from an isolated CPU can happen when
+	 *    a non-isolated CPU which is in the calculated
+	 *    affinity mask comes online.
+	 */
+	trace_vector_free_moved(apicd->irq, cpu, vector, managed);
+	irq_matrix_free(vector_matrix, cpu, vector, managed);
+	per_cpu(vector_irq, cpu)[vector] = VECTOR_UNUSED;
+	hlist_del_init(&apicd->clist);
+	apicd->prev_vector = 0;
+	apicd->move_in_progress = 0;
+}
+
+/*
+ * Called from fixup_irqs() with @desc->lock held and interrupts disabled.
+ */
+static void apic_force_complete_move(struct irq_data *irqd)
+{
+	unsigned int cpu = smp_processor_id();
+	struct apic_chip_data *apicd;
+	unsigned int vector;
+
+	guard(raw_spinlock)(&vector_lock);
+	apicd = apic_chip_data(irqd);
+	if (!apicd)
+		return;
+
+	/*
+	 * If prev_vector is empty or the descriptor is neither currently
+	 * nor previously on the outgoing CPU no action required.
+	 */
+	vector = apicd->prev_vector;
+	if (!vector || (apicd->cpu != cpu && apicd->prev_cpu != cpu))
+		return;
+
+	/*
+	 * This is tricky. If the cleanup of the old vector has not been
+	 * done yet, then the following setaffinity call will fail with
+	 * -EBUSY. This can leave the interrupt in a stale state.
+	 *
+	 * All CPUs are stuck in stop machine with interrupts disabled so
+	 * calling __irq_complete_move() would be completely pointless.
+	 *
+	 * 1) The interrupt is in move_in_progress state. That means that we
+	 *    have not seen an interrupt since the io_apic was reprogrammed to
+	 *    the new vector.
+	 *
+	 * 2) The interrupt has fired on the new vector, but the cleanup IPIs
+	 *    have not been processed yet.
+	 */
+	if (apicd->move_in_progress) {
+		/*
+		 * In theory there is a race:
+		 *
+		 * set_ioapic(new_vector) <-- Interrupt is raised before update
+		 *			      is effective, i.e. it's raised on
+		 *			      the old vector.
+		 *
+		 * So if the target cpu cannot handle that interrupt before
+		 * the old vector is cleaned up, we get a spurious interrupt
+		 * and in the worst case the ioapic irq line becomes stale.
+		 *
+		 * But in case of cpu hotplug this should be a non issue
+		 * because if the affinity update happens right before all
+		 * cpus rendezvous in stop machine, there is no way that the
+		 * interrupt can be blocked on the target cpu because all cpus
+		 * loops first with interrupts enabled in stop machine, so the
+		 * old vector is not yet cleaned up when the interrupt fires.
+		 *
+		 * So the only way to run into this issue is if the delivery
+		 * of the interrupt on the apic/system bus would be delayed
+		 * beyond the point where the target cpu disables interrupts
+		 * in stop machine. I doubt that it can happen, but at least
+		 * there is a theoretical chance. Virtualization might be
+		 * able to expose this, but AFAICT the IOAPIC emulation is not
+		 * as stupid as the real hardware.
+		 *
+		 * Anyway, there is nothing we can do about that at this point
+		 * w/o refactoring the whole fixup_irq() business completely.
+		 * We print at least the irq number and the old vector number,
+		 * so we have the necessary information when a problem in that
+		 * area arises.
+		 */
+		pr_warn("IRQ fixup: irq %d move in progress, old vector %d\n",
+			irqd->irq, vector);
+	}
+	free_moved_vector(apicd);
+}
+
 #else
-# define apic_set_affinity	NULL
+# define apic_set_affinity		NULL
+# define apic_force_complete_move	NULL
 #endif
 
 static int apic_retrigger_irq(struct irq_data *irqd)
@@ -923,39 +1024,16 @@ static void x86_vector_msi_compose_msg(struct irq_data *data,
 }
 
 static struct irq_chip lapic_controller = {
-	.name			= "APIC",
-	.irq_ack		= apic_ack_edge,
-	.irq_set_affinity	= apic_set_affinity,
-	.irq_compose_msi_msg	= x86_vector_msi_compose_msg,
-	.irq_retrigger		= apic_retrigger_irq,
+	.name				= "APIC",
+	.irq_ack			= apic_ack_edge,
+	.irq_set_affinity		= apic_set_affinity,
+	.irq_compose_msi_msg		= x86_vector_msi_compose_msg,
+	.irq_force_complete_move	= apic_force_complete_move,
+	.irq_retrigger			= apic_retrigger_irq,
 };
 
 #ifdef CONFIG_SMP
 
-static void free_moved_vector(struct apic_chip_data *apicd)
-{
-	unsigned int vector = apicd->prev_vector;
-	unsigned int cpu = apicd->prev_cpu;
-	bool managed = apicd->is_managed;
-
-	/*
-	 * Managed interrupts are usually not migrated away
-	 * from an online CPU, but CPU isolation 'managed_irq'
-	 * can make that happen.
-	 * 1) Activation does not take the isolation into account
-	 *    to keep the code simple
-	 * 2) Migration away from an isolated CPU can happen when
-	 *    a non-isolated CPU which is in the calculated
-	 *    affinity mask comes online.
-	 */
-	trace_vector_free_moved(apicd->irq, cpu, vector, managed);
-	irq_matrix_free(vector_matrix, cpu, vector, managed);
-	per_cpu(vector_irq, cpu)[vector] = VECTOR_UNUSED;
-	hlist_del_init(&apicd->clist);
-	apicd->prev_vector = 0;
-	apicd->move_in_progress = 0;
-}
-
 static void __vector_cleanup(struct vector_cleanup *cl, bool check_irr)
 {
 	struct apic_chip_data *apicd;
@@ -1068,99 +1146,6 @@ void irq_complete_move(struct irq_cfg *cfg)
 		__vector_schedule_cleanup(apicd);
 }
 
-/*
- * Called from fixup_irqs() with @desc->lock held and interrupts disabled.
- */
-void irq_force_complete_move(struct irq_desc *desc)
-{
-	unsigned int cpu = smp_processor_id();
-	struct apic_chip_data *apicd;
-	struct irq_data *irqd;
-	unsigned int vector;
-
-	/*
-	 * The function is called for all descriptors regardless of which
-	 * irqdomain they belong to. For example if an IRQ is provided by
-	 * an irq_chip as part of a GPIO driver, the chip data for that
-	 * descriptor is specific to the irq_chip in question.
-	 *
-	 * Check first that the chip_data is what we expect
-	 * (apic_chip_data) before touching it any further.
-	 */
-	irqd = irq_domain_get_irq_data(x86_vector_domain,
-				       irq_desc_get_irq(desc));
-	if (!irqd)
-		return;
-
-	raw_spin_lock(&vector_lock);
-	apicd = apic_chip_data(irqd);
-	if (!apicd)
-		goto unlock;
-
-	/*
-	 * If prev_vector is empty or the descriptor is neither currently
-	 * nor previously on the outgoing CPU no action required.
-	 */
-	vector = apicd->prev_vector;
-	if (!vector || (apicd->cpu != cpu && apicd->prev_cpu != cpu))
-		goto unlock;
-
-	/*
-	 * This is tricky. If the cleanup of the old vector has not been
-	 * done yet, then the following setaffinity call will fail with
-	 * -EBUSY. This can leave the interrupt in a stale state.
-	 *
-	 * All CPUs are stuck in stop machine with interrupts disabled so
-	 * calling __irq_complete_move() would be completely pointless.
-	 *
-	 * 1) The interrupt is in move_in_progress state. That means that we
-	 *    have not seen an interrupt since the io_apic was reprogrammed to
-	 *    the new vector.
-	 *
-	 * 2) The interrupt has fired on the new vector, but the cleanup IPIs
-	 *    have not been processed yet.
-	 */
-	if (apicd->move_in_progress) {
-		/*
-		 * In theory there is a race:
-		 *
-		 * set_ioapic(new_vector) <-- Interrupt is raised before update
-		 *			      is effective, i.e. it's raised on
-		 *			      the old vector.
-		 *
-		 * So if the target cpu cannot handle that interrupt before
-		 * the old vector is cleaned up, we get a spurious interrupt
-		 * and in the worst case the ioapic irq line becomes stale.
-		 *
-		 * But in case of cpu hotplug this should be a non issue
-		 * because if the affinity update happens right before all
-		 * cpus rendezvous in stop machine, there is no way that the
-		 * interrupt can be blocked on the target cpu because all cpus
-		 * loops first with interrupts enabled in stop machine, so the
-		 * old vector is not yet cleaned up when the interrupt fires.
-		 *
-		 * So the only way to run into this issue is if the delivery
-		 * of the interrupt on the apic/system bus would be delayed
-		 * beyond the point where the target cpu disables interrupts
-		 * in stop machine. I doubt that it can happen, but at least
-		 * there is a theoretical chance. Virtualization might be
-		 * able to expose this, but AFAICT the IOAPIC emulation is not
-		 * as stupid as the real hardware.
-		 *
-		 * Anyway, there is nothing we can do about that at this point
-		 * w/o refactoring the whole fixup_irq() business completely.
-		 * We print at least the irq number and the old vector number,
-		 * so we have the necessary information when a problem in that
-		 * area arises.
-		 */
-		pr_warn("IRQ fixup: irq %d move in progress, old vector %d\n",
-			irqd->irq, vector);
-	}
-	free_moved_vector(apicd);
-unlock:
-	raw_spin_unlock(&vector_lock);
-}
-
 #ifdef CONFIG_HOTPLUG_CPU
 /*
  * Note, this is not accurate accounting, but at least good enough to
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8daa17f0107a..56f6583093d2 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,8 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+	void		(*irq_force_complete_move)(struct irq_data *data);
+
 	unsigned long	flags;
 };
 
@@ -619,11 +622,9 @@ static inline void irq_move_irq(struct irq_data *data)
 		__irq_move_irq(data);
 }
 void irq_move_masked_irq(struct irq_data *data);
-void irq_force_complete_move(struct irq_desc *desc);
 #else
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
-static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif
 
 extern int no_irq_affinity;
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index a979523640d0..d4e190e690bd 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -442,6 +442,7 @@ static inline struct cpumask *irq_desc_get_pending_mask(struct irq_desc *desc)
 	return desc->pending_mask;
 }
 bool irq_fixup_move_pending(struct irq_desc *desc, bool force_clear);
+void irq_force_complete_move(struct irq_desc *desc);
 #else /* CONFIG_GENERIC_PENDING_IRQ */
 static inline bool irq_can_move_pcntxt(struct irq_data *data)
 {
@@ -467,6 +468,7 @@ static inline bool irq_fixup_move_pending(struct irq_desc *desc, bool fclear)
 {
 	return false;
 }
+static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif /* !CONFIG_GENERIC_PENDING_IRQ */
 
 #if !defined(CONFIG_IRQ_DOMAIN) || !defined(CONFIG_IRQ_DOMAIN_HIERARCHY)
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index eb150afd671f..e110300ad650 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -35,6 +35,16 @@ bool irq_fixup_move_pending(struct irq_desc *desc, bool force_clear)
 	return true;
 }
 
+void irq_force_complete_move(struct irq_desc *desc)
+{
+	for (struct irq_data *d = irq_desc_get_irq_data(desc); d; d = d->parent_data) {
+		if (d->chip && d->chip->irq_force_complete_move) {
+			d->chip->irq_force_complete_move(d);
+			return;
+		}
+	}
+}
+
 void irq_move_masked_irq(struct irq_data *idata)
 {
 	struct irq_desc *desc = irq_data_to_desc(idata);
-- 
2.43.0

