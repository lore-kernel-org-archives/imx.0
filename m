Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE172033A
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197194; cv=none; b=aKwk1qcggKHmJFLvDZUTrxtKO3fH6Lmm9VrziECCEEEgWooVxgARVn375y8IyXimiHoASBtvOxiGbWc0K97skmeK1L2+6ItVOP3uBvBZH8S13POjrtTXu1wAHqEZfzPJF/+fQZect7rLy6ZfVrihLkOWwrrTIBMDE19cYz7+EW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197194; c=relaxed/simple;
	bh=Mfh/oKVyV/v62tUmOG9j432HyhjKXncy+MsddMkaJpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6CCjfJy/0QSL0aNsXUayh4pCWtEH2T52bQY4sCs+NELmZqRoAhjw3BL14aZneVVS4CxHX6VUyB24H9uLV3t3xblOQQVvbPuBC8dtHpwdYtSykDvWXhrpl9gpdQBqWjaXFyshJmZKQ78h/LFpM1eAsUMllwv4myLF8nPwW0D04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HclOy8ID; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HclOy8ID"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so3084855a91.0
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197193; x=1734801993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTMHZPsDjixID3LZgZypNI5zerTGwhJ3oNH3JU/CG6w=;
        b=HclOy8IDPJKAVwZ+uRL8icI4CcbJM+4gSELoBJdRQJnjFR6HcduQbwJeuyiLyIuvHx
         OxBFEMCBJPg/xrGq467290rtmqsEpOWz5HzmkhdZTDjfqvQOOT7SImKG073SQ75yNRU9
         jHo/kDqNfiZqZFcEiLxF60YeT3hxr/6udJZgmJdQJ/LLs+I6J2O7nMJkO3lJIDpS00MN
         qgW556UsEusFvuurSxQGRQGdU2+JDBjHv+c9plY/z63Fr773Sb7iACw66vE0/Jpqwuue
         eXR4jy3FPCbqILB5S3X/3agkuxvB/miCniiErp8Tj98T+0SurDSqLbWvcusakMp3SY69
         3WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197193; x=1734801993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTMHZPsDjixID3LZgZypNI5zerTGwhJ3oNH3JU/CG6w=;
        b=ptSN8rMMy9yTS/s2Db0UFcQG6UIw/w9jBdywdqpQ4wn7aN3BXih88Pv11iz5wt9jr2
         kHS3al4Raua2NNAZDkW29qDUNKUTXR6bz5S1f/g4jWerTCl7HPaqDQRCPqrsF+bb1Pet
         JWOFRhjkBEYeIkYLk6YWbQTXpxAAA5Hi/lSjxE4I3XEd0xUYfhHu6grGOImqFZm3Jl4n
         RaE0EuxvVm4mYt4ZHUuhN8xHsVDfn4bZJG6jaIzB0Nkgp4EUGGtPxsVMyBRLop2O2d4W
         n/kjTCpsVooNn51QCo0YnaG+UfziN8Ir2tFEPIvX2h77P7Bky2VrI5F4OuhWHnw3+tgB
         Ey1w==
X-Forwarded-Encrypted: i=1; AJvYcCUQa/IFmyHQOnme9zk0ubefpsY+x9gGvjQNxYVkSF9GsIt8Ud7uOBqLvUbyKDv6YdZX7F8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoM2gvbcYTRiE5I6/cvAuRh1ylmyAPA+/pyotXdsRuMQVKkZwb
	dnQJVZ+wVkEFnvyFdfWMhlAYrqXW4mTYTGURE26+5OoRR9oa9S87TrGjIljlBUE=
X-Gm-Gg: ASbGnctJgXz74hzpEYlBINTwnMwIt6S9HvA3Ham/3tS32Es7uxLw3KOrKxA03eu0hfm
	UocUDdQPLIHiClePxnbs2nNsze74wsppsUAOmDOhM1eBGswp1SKh1Qsk61bOFFOWW9s+AFC/PO+
	aE4SqMhovILh2gJsroKaRpbqiiiPj+8dbjaLjbD5A3T6cX5m0+S16toewG0OU2qwrFN0cKZiESw
	s4mOFWq/zz8CW2a7zt0tqHk2T6+MbzDdKgEzD8h1S4UTFviSqxvgBDlLt2BwzfRPb7wjnMaqvJ1
	24iDe7OXa1Xbnbo=
X-Google-Smtp-Source: AGHT+IH7cEjTQcM+udD/U5XRPprvWKA6NBoe1GlzDD6yjgsEVTNKRYALRcnCyPJucGTbfWHoFFxtSg==
X-Received: by 2002:a17:90b:4d05:b0:2ef:ad27:7c1a with SMTP id 98e67ed59e1d1-2f13ab74905mr16256697a91.2.1734197192577;
        Sat, 14 Dec 2024 09:26:32 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:32 -0800 (PST)
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
Subject: [PATCH v2 04/11] irqchip/riscv-imsic: Move to common MSI lib
Date: Sat, 14 Dec 2024 22:55:42 +0530
Message-ID: <20241214172549.8842-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

Simplify the leaf MSI domain handling in the RISC-V IMSIC driver by
using msi_lib_init_dev_msi_info() and msi_lib_irq_domain_select()
provided by common MSI lib.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 114 +--------------------
 2 files changed, 6 insertions(+), 116 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 55d7122121e2..6b767b8c974f 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -587,13 +587,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
-
-config RISCV_IMSIC_PCI
-	bool
-	depends on RISCV_IMSIC
-	depends on PCI
-	depends on PCI_MSI
-	default RISCV_IMSIC
+	select IRQ_MSI_LIB
 
 config SIFIVE_PLIC
 	bool
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index dc6f63f657e4..2fab20d2ce3e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -201,22 +202,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
-static int imsic_irq_domain_select(struct irq_domain *domain, struct irq_fwspec *fwspec,
-				   enum irq_domain_bus_token bus_token)
-{
-	const struct msi_parent_ops *ops = domain->msi_parent_ops;
-	u32 busmask = BIT(bus_token);
-
-	if (fwspec->fwnode != domain->fwnode || fwspec->param_count != 0)
-		return 0;
-
-	/* Handle pure domain searches */
-	if (bus_token == ops->bus_select_token)
-		return 1;
-
-	return !!(ops->bus_select_mask & busmask);
-}
-
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 				 struct irq_data *irqd, int ind)
@@ -233,110 +218,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 static const struct irq_domain_ops imsic_base_domain_ops = {
 	.alloc		= imsic_irq_domain_alloc,
 	.free		= imsic_irq_domain_free,
-	.select		= imsic_irq_domain_select,
+	.select		= msi_lib_irq_domain_select,
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	.debug_show	= imsic_irq_debug_show,
 #endif
 };
 
-#ifdef CONFIG_RISCV_IMSIC_PCI
-
-static void imsic_pci_mask_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void imsic_pci_unmask_irq(struct irq_data *d)
-{
-	irq_chip_unmask_parent(d);
-	pci_msi_unmask_irq(d);
-}
-
-#define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
-
-#else
-
-#define MATCH_PCI_MSI		0
-
-#endif
-
-static bool imsic_init_dev_msi_info(struct device *dev,
-				    struct irq_domain *domain,
-				    struct irq_domain *real_parent,
-				    struct msi_domain_info *info)
-{
-	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
-
-	/* MSI parent domain specific settings */
-	switch (real_parent->bus_token) {
-	case DOMAIN_BUS_NEXUS:
-		if (WARN_ON_ONCE(domain != real_parent))
-			return false;
-#ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
-#endif
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Is the target supported? */
-	switch (info->bus_token) {
-#ifdef CONFIG_RISCV_IMSIC_PCI
-	case DOMAIN_BUS_PCI_DEVICE_MSI:
-	case DOMAIN_BUS_PCI_DEVICE_MSIX:
-		info->chip->irq_mask = imsic_pci_mask_irq;
-		info->chip->irq_unmask = imsic_pci_unmask_irq;
-		break;
-#endif
-	case DOMAIN_BUS_DEVICE_MSI:
-		/*
-		 * Per-device MSI should never have any MSI feature bits
-		 * set. It's sole purpose is to create a dumb interrupt
-		 * chip which has a device specific irq_write_msi_msg()
-		 * callback.
-		 */
-		if (WARN_ON_ONCE(info->flags))
-			return false;
-
-		/* Core managed MSI descriptors */
-		info->flags |= MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS |
-			       MSI_FLAG_FREE_MSI_DESCS;
-		break;
-	case DOMAIN_BUS_WIRED_TO_MSI:
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Use hierarchial chip operations re-trigger */
-	info->chip->irq_retrigger = irq_chip_retrigger_hierarchy;
-
-	/*
-	 * Mask out the domain specific MSI feature flags which are not
-	 * supported by the real parent.
-	 */
-	info->flags &= pops->supported_flags;
-
-	/* Enforce the required flags */
-	info->flags |= pops->required_flags;
-
-	return true;
-}
-
-#define MATCH_PLATFORM_MSI		BIT(DOMAIN_BUS_PLATFORM_MSI)
-
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
-				  MSI_FLAG_USE_DEF_CHIP_OPS,
+				  MSI_FLAG_USE_DEF_CHIP_OPS |
+				  MSI_FLAG_PCI_MSI_MASK_PARENT,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= imsic_init_dev_msi_info,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
-- 
2.43.0

