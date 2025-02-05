Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EE8192D6B
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771207; cv=none; b=JJlAWLOkcKKBpomb798MmHPTT4ZqIBWmPGGJ3TvWZpo8I2GPW6BoIisQI2pmPC3KlX8Gn5Qmx6HgtPuLe/KFDUK0ZmyZV3hNgKCqTvkt9ENZbrcQtNgghPAHqrpMQdfE5Z1gA+I4E99dlHGOibKswAJE4a3nJaEPdRgfg3M21LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771207; c=relaxed/simple;
	bh=gGGEYK7VGgFWWdh/qLZbuuJY+xZwb2aTgVHnwmrr23c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0ejduOIFraWWXEER54EkgNPWiTwo61VGWFL85UkvjNBWFJwmUNZIc+IwmaQqDv37VjbXLcjOWEB7SEvfSaq3LHq2f5Wv6+gvMyyvPOZcm1rTpj+DFKzH3JAojbZ0w5AaTHb1TKA9ZGKtRtfwD/UOehAMPNOAVLYCirg/BDBxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=PW163WNt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="PW163WNt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b662090so135448385ad.1
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771205; x=1739376005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=PW163WNt0Or+B7V3NJxx7k4Ai4a8xWM7BMOt0Tdx1iAXzpwynb6ZEpOADew1zB6VHK
         fELSRsX0+ZHzu5dW8g4/+gr7AlExt2v3mIyqo65mnnih3v7g931Hogj47VvtiyyZKrt5
         OZlejyIoq6IeQ6KSOjE18QW1naFa5Cu1EfnxQbINMd2Ro9FTsJ6g5fJdMxPxvoJ/Jwvh
         bkoHrA5Y3Jn8Ldkj29rfV0dtKpDXb/axHnXytkFcsehFDyuiejq6L4azUyd7vomGPNwI
         xAuPpw37BSjUOJa2LCcouTU48Q35PapFPaLU11zu03K3A6J3aByu5PHIjP9bw40C2Oh6
         yIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771205; x=1739376005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=wY7ZEB23VzRkOy0csvtvk3EtKvSD776tTqqshAgefLBLvXfwntT2CWeIIwq2N2JuhZ
         8xex/qAVXn5piAlLtJRG2CCWX4jiOg13KwS+ReDz8ENXPuc5JIj7ttE687x24wqSQqpo
         +a47MkLbqM7JN5RfRnMIdIQIZ28l6QvaA2p0v6g4ODLBkGTRPNGlZmgMn+udhosHPWrR
         Q9j/JP5Oq+gs2UzbY1TIa5PKuKfElZHf4KJUlMXWqETa32v/qrmCsw0NaKXoqaNfCk8e
         xGdMc2NUVXdg2ABPfWOkU6Zic87hEPmnzT5Nmmag478hjzSqymRMZHoRjOI02DJ//dDf
         OsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI6uKXbBX2n6UDhACUkkRXdnH3Rx1c9bbTvlq9EKq98F0ZGkt/eAWR3OGtqbI9f6EK4xY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr3HdICPxMGhM1vgfD64iJCrEH2SlSQbEGsCKeWsmTVW1+RaBv
	NHg4IL7LVSB80srsnPYd3EQ97Nf8V07HzDeisQL+nDuMFEjzewjpLzxvEe7mn1c=
X-Gm-Gg: ASbGnct16gZpSK1pjOlSm+akTWLUQt4FJcZ1kn9xWHrYZ27EF4QPgwdu+/k+CC8fp/6
	IXmozv6Ay70W3MSAMW3cVKpLRdYaoWRl533GqYXaQRx2gpC6Jz+9yfFO89AePEqhOzENjauwJBE
	Qog/d4Ryg5Jjot3Dc9TRySLkBEh85SlsXY1PJmr9qD2fD6kqJ4HBGyeuQwkyh7Bg7OdXrPOwy8l
	flN+4O+f8cfwwV1gVYUQM7ld09Z4unQEtrAzt/1v/rFF9CuQgjJu2oDblmONli11qdDOznK55+l
	so0DhyqhiwpUosZRiNWJril1ueoOB0PjmjnU5EQboS/EnB+xYKlIR1w=
X-Google-Smtp-Source: AGHT+IFxrHkC5lry9v73hirVrwz0VwaueSl7vlCr1NVutMq+Q53roymPHtPchmK1sMCpMcVptQ1tdg==
X-Received: by 2002:a17:902:d28b:b0:216:410d:4c53 with SMTP id d9443c01a7336-21f17ebba71mr44908125ad.41.1738771204969;
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
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
Subject: [PATCH v4 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Wed,  5 Feb 2025 21:29:37 +0530
Message-ID: <20250205155948.81385-2-apatel@ventanamicro.com>
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains,
use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
and use irq_chip_set_affinity_parent() for leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..5d7c30ad8855 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,9 +96,8 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -116,13 +115,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/* Point device to the new vector */
-	imsic_msi_update_msg(d, new_vec);
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
 	/* Update irq descriptors with the new vector */
-	pd->chip_data = new_vec;
+	d->chip_data = new_vec;
 
-	/* Update effective affinity of parent irq data */
-	irq_data_update_effective_affinity(pd, cpumask_of(new_vec->cpu));
+	/* Update effective affinity */
+	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
 	/* Move state of the old vector to the new vector */
 	imsic_vector_move(old_vec, new_vec);
@@ -135,6 +134,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -245,7 +247,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
 #ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = imsic_irq_set_affinity;
+		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
 		break;
 	default:
-- 
2.43.0

