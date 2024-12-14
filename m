Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A25A1A8F90
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197181; cv=none; b=e0j+FPPLt6I5pouVk76+1cpbMKG1scn0n4ZlQrMFzEjwrggo8GKeCN31SBk8PEDjKmmFSHdhJFIkbEw13PKde3ycsne55iiVLzoYIZxiRjVcl22wADvAjwrDv0dKS2Wg+bGKjdo2FUTyE3iWEN/lxNpGvIOR89LJi/toKMIVYQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197181; c=relaxed/simple;
	bh=GQ6h6qnifBeRvwI5lbrzx5DePz9FG/7AwYjLLcTRLyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SeYmOET2LvglBy6d67xMKRH+qPwdLgg4XbtorPl3aYmlQpZMqtB44EdX85/WmqZVWQ309gsH2Fvg/SIB0cU8bg9zOIhaDOA2JZPKpmZftWmWt5obhSpXc9TrVh9U1cLbcR4JQ5h/HXyo/s+DraMUf0Iq6zuskqUhrYQNRncYMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZEGW5259; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZEGW5259"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so1871565a91.2
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197179; x=1734801979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=ZEGW5259/tZtgHpjK1FLA7bdKJYRtSOMCJVHivfasZvwaYA5ZPW5RiMG5CtC0QT4c4
         APX4VKhYhUvziQASaQC4oKjQL0nMV2vxBsI85Rsbvn0l+Y2nBLTqR6+AEPNrX2wGvPKK
         kvdvzv5mpHFD5czW1LsEtNPYARRVlCGVJ/o36bUgsp8trIB+bSHyjz43WI+3sdoTQtys
         JCWH+7ikvzyUxuoHKbKnqRslJBQW8H+CfaR5cgk3mIGGu0iKmELYLfOuzn8KFiBibPQC
         VgUOz58/Upm4yTG85cM9eXYWAh3fvOODOJhFCyy5kBRCtogTeGRHdIBTHhyKu/sYNzoF
         uYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197179; x=1734801979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=oyJz2vp+o/t8ARdScwv0JtTxGTokFEdvO+gX3S/gK5gjQoXM4Fd99dbJE32uz4zNR4
         78GzxiC+UdPGbIVIpWDHfykYUSDu8/1CREoC6I5esNtJhCLvUcaKBR0Gi10K+boUoLGy
         VIu1pnJekewq79aLU1Q5qSep/y/ZPtHKm7mKvX3vugOeILq8fwyEAMEtDgienL5RwAZX
         GxN53V2m/4JC4/t4VeGsRcqYaL94AmRdp5kh/XLqaraoiYyYKaF4AOU2Yxw+QAkfNxKJ
         RmEyV+tQRwVWRxDGMj7fH4dFEH+RmNFKUBa2Zar2x+ma3ANBPmDI7o+55Ivp/oOm+y43
         u7lg==
X-Forwarded-Encrypted: i=1; AJvYcCVJdSe0TdZYP6XKFtRaw+2PXkmlxaJWmvHDi/XLhfi95y/B7ge5AgnWpE0w9GnjvdyOnGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmHKiKUIDFL8Wt7irDWMRj/3Zs2PErTCe7jYWoK4Yzz9a2gHmG
	P9daNeETR4eDZKwUMdFCaVX25AaCLT8EOuvf+5ez1eC6u4QeGCzmuAw4e59FMmA=
X-Gm-Gg: ASbGncvI9tu2egorZSCW7cS2NAbOTCWmQmov4fhpUKq6qjvxxtvkVcJkw29Hv4Qmo+b
	gM9PBPqjMdxVGEFj7mcGFRms7dk/XVMYAsm4WQfPiIYnY/1+zqRpPpA+dM3D2Jggrpjhv32ReQU
	fVSIj/RcIY1Bbe9hsrUfpyZ7zC44kwVr7fajNZ3zY35JSmlww2KOSLFakqj6paRgphseK30a4ot
	xD56QVjUgC6CNTeVSsiUsYiBIzd0+t+tHJB4colCxrwFoVIY4gqB3jeLQAAfzsmeLaSTbGBZ96s
	ZEpqsuSAbRmNVL0=
X-Google-Smtp-Source: AGHT+IG/WGdOL5hzTQ/uQVNfvqxiM0q/u2T5n/4NTjrqHoQ7a33gOPCRMyAXNIWVjXMp94uGcfUDkA==
X-Received: by 2002:a17:90b:1d8e:b0:2ee:aa95:6de9 with SMTP id 98e67ed59e1d1-2f2904a8b08mr10590547a91.33.1734197178822;
        Sat, 14 Dec 2024 09:26:18 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:18 -0800 (PST)
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
Subject: [PATCH v2 02/11] irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
Date: Sat, 14 Dec 2024 22:55:40 +0530
Message-ID: <20241214172549.8842-3-apatel@ventanamicro.com>
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

Introduce chip_flags in struct msi_parent_ops. This allows
msi_lib_init_dev_msi_info() set default irq_eoi/irq_ack
callbacks only when the corresponding flags are set in
the chip_flags.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-gic-v2m.c    |  1 +
 drivers/irqchip/irq-imx-mu-msi.c |  1 +
 drivers/irqchip/irq-msi-lib.c    | 11 ++++++-----
 drivers/irqchip/irq-mvebu-gicp.c |  1 +
 drivers/irqchip/irq-mvebu-odmi.c |  1 +
 drivers/irqchip/irq-mvebu-sei.c  |  1 +
 include/linux/msi.h              | 11 +++++++++++
 7 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index be35c5349986..1e3476c335ca 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -255,6 +255,7 @@ static void __init gicv2m_teardown(void)
 static struct msi_parent_ops gicv2m_msi_parent_ops = {
 	.supported_flags	= GICV2M_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICV2M_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.prefix			= "GICv2m-",
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 4342a21de1eb..69aacdfc8bef 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -214,6 +214,7 @@ static void imx_mu_msi_irq_handler(struct irq_desc *desc)
 static const struct msi_parent_ops imx_mu_msi_parent_ops = {
 	.supported_flags	= IMX_MU_MSI_FLAGS_SUPPORTED,
 	.required_flags		= IMX_MU_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "MU-MSI-",
diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index d8e29fc0d406..51464c6257f3 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -28,6 +28,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 			       struct msi_domain_info *info)
 {
 	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
+	struct irq_chip *chip = info->chip;
 	u32 required_flags;
 
 	/* Parent ops available? */
@@ -92,10 +93,10 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	info->flags			|= required_flags;
 
 	/* Chip updates for all child bus types */
-	if (!info->chip->irq_eoi)
-		info->chip->irq_eoi	= irq_chip_eoi_parent;
-	if (!info->chip->irq_ack)
-		info->chip->irq_ack	= irq_chip_ack_parent;
+	if (!chip->irq_eoi && (pops->chip_flags & MSI_CHIP_FLAG_SET_EOI))
+		chip->irq_eoi = irq_chip_eoi_parent;
+	if (!chip->irq_ack && (pops->chip_flags & MSI_CHIP_FLAG_SET_ACK))
+		chip->irq_ack = irq_chip_ack_parent;
 
 	/*
 	 * The device MSI domain can never have a set affinity callback. It
@@ -105,7 +106,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 * device MSI domain aside of mask/unmask which is provided e.g. by
 	 * PCI/MSI device domains.
 	 */
-	info->chip->irq_set_affinity	= msi_domain_set_affinity;
+	chip->irq_set_affinity = msi_domain_set_affinity;
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 2b6183919ea4..d67f93f6d750 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -161,6 +161,7 @@ static const struct irq_domain_ops gicp_domain_ops = {
 static const struct msi_parent_ops gicp_msi_parent_ops = {
 	.supported_flags	= GICP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICP_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "GICP-",
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index ff19bfd258dc..28f7e81df94f 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -157,6 +157,7 @@ static const struct irq_domain_ops odmi_domain_ops = {
 static const struct msi_parent_ops odmi_msi_parent_ops = {
 	.supported_flags	= ODMI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= ODMI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "ODMI-",
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 065166ab5dbc..ebd4a9014e8d 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -356,6 +356,7 @@ static void mvebu_sei_reset(struct mvebu_sei *sei)
 static const struct msi_parent_ops sei_msi_parent_ops = {
 	.supported_flags	= SEI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= SEI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.prefix			= "SEI-",
diff --git a/include/linux/msi.h b/include/linux/msi.h
index b10093c4d00e..9abef442c146 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -558,11 +558,21 @@ enum {
 	MSI_FLAG_NO_AFFINITY		= (1 << 21),
 };
 
+/*
+ * Flags for msi_parent_ops::chip_flags
+ */
+enum {
+	MSI_CHIP_FLAG_SET_EOI		= (1 << 0),
+	MSI_CHIP_FLAG_SET_ACK		= (1 << 1),
+};
+
 /**
  * struct msi_parent_ops - MSI parent domain callbacks and configuration info
  *
  * @supported_flags:	Required: The supported MSI flags of the parent domain
  * @required_flags:	Optional: The required MSI flags of the parent MSI domain
+ * @chip_flags:		Optional: Select MSI chip callbacks to update with defaults
+ *			in msi_lib_init_dev_msi_info().
  * @bus_select_token:	Optional: The bus token of the real parent domain for
  *			irq_domain::select()
  * @bus_select_mask:	Optional: A mask of supported BUS_DOMAINs for
@@ -575,6 +585,7 @@ enum {
 struct msi_parent_ops {
 	u32		supported_flags;
 	u32		required_flags;
+	u32		chip_flags;
 	u32		bus_select_token;
 	u32		bus_select_mask;
 	const char	*prefix;
-- 
2.43.0

