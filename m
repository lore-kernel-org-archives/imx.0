Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82462186284
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771216; cv=none; b=Wk55NDjEIU+alPFvv/8i7eYnDBSN1ABxsRpXTJuGBjrENZMMQ2QQODx93/ussDgesqs5eEeKMx2kn0yIzXG/bxYJasilFhCdnd9WLlJiiFtBYr2AFn9SszUrWb8or3+kHzfgYcZvnGESFtNmRZYFQ/z7ecrd5y4vgE/smHMZ0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771216; c=relaxed/simple;
	bh=GQ6h6qnifBeRvwI5lbrzx5DePz9FG/7AwYjLLcTRLyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CF5qvrINY4XXDoFPtruK16ugbmlPhrfbFa2O2HTapiImsG2OAwBcf/20ykNKyBR0b6RVrABwq8C4MmiDQoG9KAwKRcDeZWtGlLLizVDAmQLn/KYgD1av3LCQzhl++W7CW9EsTwV84jCo5CXg/YC33RMr95Qqx9WQl/dLjhBaIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=DSQPySox; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="DSQPySox"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21661be2c2dso118822925ad.1
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771214; x=1739376014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=DSQPySox5YZKmRZcWGsH2Wg8vIT5EphL+f+tNa3oHQFABkNAHKwUUFlmC8Wmo1wLdL
         Ehju5PY9ABlxjJb1gpYCla5lYU0R8wiUasvXQeMiwu6dewwieEmNXN1kj7mTCat3PQpY
         0icUNDzAEoO0DZ0e6BI5qrVuJ5anwvgUCU1Bq/AJ7TDfi/KrIzXreefHdBAzVveEmu80
         RD74CUZl+La9WVLE422M8guVcc49phPY031AZYGpbvdIP4PkzzWmtZnq73HCxIk7Q+bM
         zSrPLNLRNAXzVuapsrbqJA6EFqPxnIsWM7z6pCCIrqRz3YmHF7fQcEVLUBkvR4PLfVIY
         Uk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771214; x=1739376014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=LqNsJEejkYub1d3dnxT22yYXqzw50kmdxq5CjTIcfd3xEIPttQwoxfVTfo+nfH7mJ6
         O44Gp0Ka9KKskEowwZfK6X0rJ9Q1vhmiLZ4d/vDkR+BGDWZgsMY4amvofkpPhD9KrRlu
         vTy9dKyMyaSIa3+0s50Tuw+/5mAi2opTwWjgntj4orMC5tlT+ENk4rAFTBH1A6mpHWDm
         XENrfxVmuU5JBjOjlYhruMxrQMGXAiT3TZmT3gJLZI1M702VjRu9hnvoW4VRwfeLdgB2
         kO2qMtWR4N9TliVBLgAzJVQ/ZiDfcyn0wL4Gj2eA9t7BLSeJZ4OwpZVCLdLCXpY2y5HF
         DL2A==
X-Forwarded-Encrypted: i=1; AJvYcCUoCWclxH3dcC7O3zu92wi/WOVQto9kUThTjjlPCLqBGYMT1s2qKMJggpR9OzF7QfVN1eA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7c1twGWhhgU+kVavt8HjQMnuiuoXakO8iLSUyQhb86Xi6GQx5
	Nxe2NeSNsUITA5RAwmw+BA+TWPAgHhBL0Bw5dppp/jXA5P7tq1L1RZnAparQn3I=
X-Gm-Gg: ASbGnctalp3gs8rjdzITWl9kexchxQ3xlfaVfSh9dxW8cO7pqB1aLSDKUJYQBfxYkS+
	Nm2Q24clPL5HwsYpQch7xp/UTmYQB2nN6OiBZIZgCJwlUcwB86b8R6h6d3M7ZE2fchQktuplwtz
	L3ZrCC0DcfCazNf32MBmONrIUpvoYUJ4/MMuLEkrFGS+iSkdVeMbyfpgS3u5VT5H92h1eNm8gW0
	u3XYWf5VlrZU7T7QMVtho88hygP7fRURLxHqqt1sKCE7XrPk4+Blm5V+nHUQvm60ynhQgVCfPyk
	SLlE3+EvyBiVEqB6wIe6mf9aueuSPkrZs209L/c6g0P4tweSg//SLKI=
X-Google-Smtp-Source: AGHT+IEwSqSk0Kn6tNM2Qd+4lhHoUFawjz0vSYYqNHq2adsR6hxf2+kmSVPrfORkTmMSBvoi8q34cw==
X-Received: by 2002:a17:903:2282:b0:21f:45d:21fb with SMTP id d9443c01a7336-21f17df5c2fmr55285685ad.3.1738771211403;
        Wed, 05 Feb 2025 08:00:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:10 -0800 (PST)
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
Subject: [PATCH v4 02/11] irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
Date: Wed,  5 Feb 2025 21:29:38 +0530
Message-ID: <20250205155948.81385-3-apatel@ventanamicro.com>
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

