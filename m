Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746FF1993B2
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771223; cv=none; b=DrBZlnSCmBFRnbGC2Tf5cUrfCecqKIS+36XiApuZ8KpvDLqsoUCms2OeSaOKr0LyASuNnfYAEu7N8TsJwh11Y4LhlXNVXK7HhpqouGQw38Q0s5OKk4qzcdVCUquLpe/V6lAjczsk2QsBI43I+N4sG/6Jtd5rJQS1Glw0nxGLclU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771223; c=relaxed/simple;
	bh=tqqED4GgT6fv8GxxWX7wObYflu49BH84mKUSrCVBeKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+uhqC6q3f8ToRH/qAqDcYGgCy9tnMq21tcYsdc8JH8AE71KeDKqaTaYoO8KjgJt7+7U5OoVbAvo9vXw2N/DSxkdX+n4fy4UppXVYJ/7fKhg+kBIMrgsDb4ufGGXBL91nINUn8iap46gp4UC8t76XER3UdS/0K4KMMllJWJmWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=M8a0T2eW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="M8a0T2eW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216728b1836so122741205ad.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771221; x=1739376021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=M8a0T2eWJLgPOxKLgGU5DWWzUrA0LaCIn3a+p18jDQf7Xo9wWNS9RS9zE9Y2DahEDo
         PyvWF62k/t2ybXjmQO4W4krD24+7h3LLAf+veiE8r68d4Dbblq7P+gXaREiN/UHCBxHJ
         k1L5m4q3E1ugqmpWq+/ROeKw1IgZW7W4n4WjzOoi7SdLmEZuSr5oYLThN9lY4fCvLYXx
         0mHh9KxoZ/RTpnD7+9aCorfYn6xKfi2sPYPigkvFIPy4yLgsncHtmOq7OSzuQI/27V7U
         O60uDQil01e/uyjGXQwB13JsPC44LYVDQ3dwUHg9QJsdklPb5idip9gM1Nk3MON+24Yh
         Dk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771221; x=1739376021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=eeounI7rWuVg8piS0iNPjqiWaGAdR13/joyGYqVvVaTdcq1Ua169R618X0vF05KzJa
         IPufMc5z7rgf3fBbbUpgna/WToOUiIj3fLldhJd4yL6XQkXC/Irgg4Sn6oCD8xKcm/gt
         LLYcoFgP9jYe7XlOnrqcknb/SlZn/i0ljt6ouZZ7yv7G8FiB8QJZERwWNEVagM5Fb4r6
         9D9+T8w+7Nedv7cBYWioJ99vSU2bU5vrnx5HsY0tMoxij71CMSZwJuQBgpzCZfL50wT/
         /oinzaXYTZq6Stfu8TCnVmCnMuEctzJ3Sln1hiGF7uZ0urVy/ekJMg5Pq1Kq+5/LNgP6
         +LIw==
X-Forwarded-Encrypted: i=1; AJvYcCXH2HeBxKzkcqsR1eDF5UBmm6FjzY9gIL92fGskFqKMJJUlGJRQ1/MwEjCgTcEiWlU9Tsg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCjf4D2qm9kRHJMpOcpAiiuoP0ku+vMaHZqGy7QJ7nnNMDVwC0
	35yLB5hlJrEVCJ9f/D/cKjp21lQMLrKzU9+AFyuJeFt5Ge67RycRB+UGwmAB7Bg=
X-Gm-Gg: ASbGncsWW4XQriKjBDEX/Hculbkf5GLiWxAj2vgOWHZg5UlBgKdLsth9Q/0jrui8CCS
	fi6FCghV8SM2G9BkhoJQeXFSnyfwYJLOAE6juXaGz3IgkLJ4uAgN+7c0IDN3s6TEZKZ1xZhHz0e
	ChsKx/3PYLnEXGl0tPU4JpDLOfvslLLXVCTJzjNbuIC99rbuCrgiwXeBRpwKJRr/Tl2hZPzqEny
	PE+4iYwgeJtqtqueoUtbSCWrn8gZMNbE6sW/8y4u7dCMgo9gOOqqQvbw8/xHAisVX6jwHceKKw8
	iwL9pHw2niiZlSr1kCDSZxmFgYP5eT4L2TMrMPW+Pfr4A+FB7mqt08c=
X-Google-Smtp-Source: AGHT+IE61901PT4EUuxStQafEIq8FwJCGiiY6kWb9NQ321aRytwKILvXZvBacg0xie4XwDelkjOESA==
X-Received: by 2002:a17:902:f68c:b0:21b:d105:26b9 with SMTP id d9443c01a7336-21f17e45b7emr53598095ad.16.1738771219978;
        Wed, 05 Feb 2025 08:00:19 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:19 -0800 (PST)
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
Subject: [PATCH v4 03/11] irqchip/riscv-imsic: Move to common MSI lib
Date: Wed,  5 Feb 2025 21:29:39 +0530
Message-ID: <20250205155948.81385-4-apatel@ventanamicro.com>
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
index be063bfb50c4..bc3f12af2dc7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -589,13 +589,7 @@ config RISCV_IMSIC
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
index 5d7c30ad8855..9a5e7b4541f6 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -174,22 +175,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
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
@@ -206,110 +191,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
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

