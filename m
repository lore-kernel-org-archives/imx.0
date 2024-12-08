Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A768146D53
	for <imx@lists.linux.dev>; Sun,  8 Dec 2024 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733670466; cv=none; b=FLppGBEsb8HBNzlz4Xv4hYrOd8GLVNXQ6+V8zKMJLDqsC2EamiNtPfqIIDxurZ0Pz1zMQwsAmvAoSzssnZw8aJlSvXfDiGNvgRY2PI0mV8T2xtLbn3p3+abxoRk4x6UXw/lDFtqoGat9y3IMhKuhwTpHoU+RPyG9TGlW+9qNLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733670466; c=relaxed/simple;
	bh=qPscrCNeEuLy0uNhsODOmTqh0/9pAAWlicDOlpPyBzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSwTugMDBYW6IwlgLQ45bla2Ij61oLcwIFT9pSFvEWF1gQWbdfun2UCJiIRSmGsLW9TV+ZqivEobojtO9BLaKPkEHlyciPPFleC8CZlXnyrrrivKFOCWHvxu9otdmnHu68Fof4xEqgVrBktL/A/wjpQ06JFSZZvG1nlsGv+K3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=STUFbhr2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="STUFbhr2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21631789fcdso4789225ad.1
        for <imx@lists.linux.dev>; Sun, 08 Dec 2024 07:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670464; x=1734275264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20bETIAPAH9IUNDRRJ4w+seEOsz0uHbvsdHALnvxjtk=;
        b=STUFbhr2u+5MijuY5WEft/3W1vX0enuGJ16S18ohK2okGL0yqQlizEJbBRU4DS2/E8
         KTXqASgNJcTjTdst9ZFq2sa+nyZpsRpbcBJOrJQg6qkjA+ycjtgK5GiE/ISgbSpMPrA3
         zbe3K6iWq2PMdddDt/slRVvc981NrecNucPH2HqQEqHZyviraytNjitrTvsmiO1udeg7
         feJ2vmU/D274Or+hxT9a2GYt6Ympe8RYEukluKjw4jVJR+/7bK5i3XDNwu/uUy1RoDzk
         ejNxNMM7Fy2zty6xvXpb19C1T0za7dx8IG+CLYAj9+M/o4zktlC0o0qjSTsvaWXMtT5n
         kHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670464; x=1734275264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20bETIAPAH9IUNDRRJ4w+seEOsz0uHbvsdHALnvxjtk=;
        b=oI4hnkLONVs1NriVfNDIgZPyfR+dWwFR3wFC4PdIzjRfCurJcFCKnrL8JWOc0yfyuh
         1OZvr2Q2OIBgUapvjQQcK+GFffr4x5rdj8rgU25wv2vaZVIZbnwearv2a6A6ktKx/d10
         In39Cn2aIsZHA0IPxZwuGvRUwx780vecyPOmpqGuKyx7ReO0LHVvY8UF0I/HXU/TFzvO
         bzY24nFKkpPbyWzZKt9mA91SWs4jvR3QKUGW41Ij2yobIj2OKcV88HAm2q3jzrnfbvGJ
         V/pM2NeCXcjbPBHuAVSn5DO0gqMN7eg4NJm/BS+oVbNHYvvbL7cwldRWVeGhUcasLQPZ
         tEKw==
X-Forwarded-Encrypted: i=1; AJvYcCXGnfYWh7VPd/v4z7GcU3JmatY8tvzGJBzP24f90xR6Bhu1q2z/rs4rkIH2awNmQU1asFo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdSBPyiROmniG5045+sBrt1lja4aEQnVLh4C6efNE2EBgo6mFZ
	Qnp/senk6x0IwIgxMiqkWoa7E8gc0vOfRj9uxXorya+0xUq7bQ2FuQB2LlZnZDU=
X-Gm-Gg: ASbGncsG+D7+cx4KFWHC6LWl9PnHIFAbrWDwTnIAZUj28KqxVxXUMvLloFwkOQc6Cc2
	b6Dr6hd2Od9rMjqKuTyOtKuty1V+Kh3wheOteVpdNYWlnu5QA9eT3JPZDT9U7tYhzo26oyJvy3B
	D+UNi9wbUxxWgy5nB5DjeLYeT9El3RNS81Klm8co6Am4PCiyUXf+WQKJHZO4C5/7699kFbbi/ue
	SiYTkuKWJrAYUi4/MYmLyRC6kd1sCHxxB5cKq/dArDbyUO4/aWHzJYMHdnGyPs9m92s5l4/vKgQ
	suKLLa67udONvSU=
X-Google-Smtp-Source: AGHT+IHR0mdD2VEjATAsegpj67+DjOHvUJ0NNqFfY3GS7J9zIfiIPyfQ/Az29m1dRZNe7ffz6IP15Q==
X-Received: by 2002:a17:902:da8f:b0:215:8847:4377 with SMTP id d9443c01a7336-216112fb5e7mr156331235ad.15.1733670464396;
        Sun, 08 Dec 2024 07:07:44 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:43 -0800 (PST)
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
Subject: [PATCH 4/4] irqchip/riscv-imsic: Move to common MSI lib
Date: Sun,  8 Dec 2024 20:37:11 +0530
Message-ID: <20241208150711.297624-5-apatel@ventanamicro.com>
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

From: Thomas Gleixner <tglx@linutronix.de>

Simplify the non-leaf MSI domain handling in the RISC-V IMSIC driver
by using msi_lib_init_dev_msi_info() and msi_lib_irq_domain_select()
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
index 33a8261e6017..5bc1f03cbacb 100644
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

