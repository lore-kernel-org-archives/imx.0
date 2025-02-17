Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881B41AB52F
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782698; cv=none; b=iiGH0ZI8qwomg73GMelS4hHyfwURmfBI7eUMxsuEyYwPMTxSTpvR4ufivzz2I34TzE7frf9LILDUIF7wxNAvQQykbunHRsl72tagUQsNkLOruE9DWU2gnigpMkTVFhVHNd/94d6PmfaEIxcw6yjXKoFOcm8/WTg4ygIsMdkmjqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782698; c=relaxed/simple;
	bh=KPNhzopPF/v+rf0DL/xDUy/p8rwZ0ENzF3r/iosIwvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePk5eUvwVZvhghTzrjJwp6LCbsJI2LUOMskPy0OQ4/aqvRESIe21QeSJaNCmTcFO5l3cjbyzaa2Fc8qdKq0WQK7onunqs+HLng4DZjOFP/JVHcxSSX3ARatotxCX8ppKBRZArJrg2NwYLBrgUdOzCbhPW8R2W+QRPy3SCYN8wx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MPVIQ9WW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MPVIQ9WW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220c2a87378so56556335ad.1
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782694; x=1740387494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oop51W2xPzPgS///BRY5kVWjIpIgQEDQeLtCvsidU3M=;
        b=MPVIQ9WWjxgxltZ7J63JLs2Ko58oTmKQVEZeeVL/QTcYNUnpfqlOUFJIq8Nr/Y5vLq
         KtUeg5/0M3EEyeMr45ly11t6+7WK1mAt4N4Jn1A9avSVBJvcRXMh3yJr5/AjCkTKvf2S
         BH/Q0cl5hbCwEfxDpMXYbUBdo12AVI3V4Z5ohUkKauJET2HmfTX8Wet2D/gIbkZ8pYjS
         lvLfQaclDvdwcND62xxYJh8gQtAT9DoTA7l0n5kwvKoNIs6TAhNh4lUUE4brWhwtXGbb
         CAMIUfSuHwo3eCaPcBG+my/Pt6dZUHyNcVwZ0ocWdXntA/OrCzRG7mu1IOUtv6Bdzhf1
         q9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782694; x=1740387494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oop51W2xPzPgS///BRY5kVWjIpIgQEDQeLtCvsidU3M=;
        b=XgGa4hjGY05gQq+bG+MefhtyUaQ4WceyPtDnBAGKZKZt9zHDWUsxcbXlFVdvVmxAcr
         0ZE1AVp9oodQdVuzMqCw/OS2B5sBOfxnQTKwJYpP6sv8mkr8iO73OZ1A/4Ncjy+D2lhx
         parGeiCjxJkPIm+4eWv913k8PwwaY33lVfNB0wjgoNdfPkhfEnYXv9oLjNCMMjpOvtPl
         Rb/2O68D3Y428Xlw3wyaRmdbK6SWZ735wvB4g8O2GasEgSYLat1Aq4Xza6GH7fIHf3Px
         +SwjX7/7U3OxW1OEZ9+SoXpuORZxZDQY5uH+p4xLjFmBvb7rMpzvUqJcjs20B71lP5oO
         Kcqg==
X-Forwarded-Encrypted: i=1; AJvYcCWW/9NiWCu+Nb6qQZVDUYbQJjCw9KTXEqPTtuVocFQlwHgcVmhT8eZhiiUBmJXGgeqSmck=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc08SNP301TVzLU9GYF+XzjEekJc6JlhZAMyrMzGEgt9BOFfFA
	VMwuOs/ARG2QMMT6ZUcWKsAMuPU6aSM62vtUT7ZpuSEhCgVLtpbzbPkuyQh/NjI=
X-Gm-Gg: ASbGncuX9v7adFyTz08ImRPdH4cB8AXXcgfkxd3I9NKFs3y6zOMqCa2yiiyad7OwZAz
	WIhwKWmPYV5sHJISUb+jhedZuPTXhcjLBEzxcByAZPvBqPMKAfnSr6W2bcIMTiOfV5olAfg2911
	K5QBV4RmrlCzx8S0lnmKJyBMz8hkwnDk78NNJNjvZ3kk/3FY/v0b65Y6rpFzMVUQS/l16V1gWSQ
	ikunFWaoIIpSNg84aTI9DeuFyUxl6xTbmIn3QpK1LofEeAdYOJJ9Ky3DYSZE6dosdxnIhPi0NeI
	i/w+veVoeaAPhuBRi2yO7UEu9qB2Xe8oHmo/I2TqClidGjPaYg1UA7Q=
X-Google-Smtp-Source: AGHT+IHKsFX8G1xeFdGN0LrWZ8KF20LhqcM9UDqb+rrZ1azyG6dWW4gYdjdpQdbPPAsWI3TzMShx/g==
X-Received: by 2002:a05:6a21:7886:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1ee8cb3e424mr12892785637.21.1739782693650;
        Mon, 17 Feb 2025 00:58:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:13 -0800 (PST)
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
Subject: [PATCH v6 03/10] irqchip/riscv-imsic: Move to common MSI lib
Date: Mon, 17 Feb 2025 14:26:49 +0530
Message-ID: <20250217085657.789309-4-apatel@ventanamicro.com>
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
index c11b9965c4ad..fe95ef723bb3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -590,13 +590,7 @@ config RISCV_IMSIC
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

