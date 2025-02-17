Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3671A8F63
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782679; cv=none; b=T7AuNlLZd9Jhn70qz+1r7NAai3vo5ebInzGG53d2ki/a0Jh3Zdu3Et79FpUSjuQbL/sRIFm4ekQfZEAiAzO78Ts2uGc7xM0O7hJppqpHGK6a/xIeAlmB2m1UBfRVC0VOtjl+I+DLGMnkkse9Es/aLj9GTkO9JwdiHOMJgq22qOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782679; c=relaxed/simple;
	bh=cA1sVz4q2Oqx8B9mzL6c4pNCSDxS/s6iPI+hzJGQ4U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tz7ndASa9Qkwe4/ZwIg15FNXYKevRTxD9ku8UokozwMBaaRxKCOgChIaHfjudC0FidzSt8LQDhkCseLDUR2H+YF/dbVqH1x46LjnwPJ0EnlRmsnu5nqoF4Ss3eLsAdEKcRXWmJyB7ocHf0IwP/9sNSu1UK/GfD3+HXVvca5TvE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CtFjEVxA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CtFjEVxA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21c2f1b610dso103798415ad.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782677; x=1740387477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=;
        b=CtFjEVxAgTcs2Jtuk7l7xb1aVofKUUUHDUrG7vdzts0N0tAPzwRGbMgW2ksQiBEr7M
         hIUdZ/u44SI8jU851Yi12kufNsIX08wTdrUM0nm9jg0y2+M286JbER1x1aqE10OKEcM8
         +bpkQFhIiKASxp8uKKo3iIVTVhpGP8+uMKZ37VY1GV6nfjy1EmuVMT5FIDlk7O+mbg8t
         9MOHW6Au9MnAMCSDBkFhTfEz1Z3RiuwlEC26Ruf1APgypyi9EIwhWVjsV6as9Zngch77
         VwgQpqEsuaJLz8Jqc5+chqAzl6Qy0ogy1hzfNg5147JyheFCxcLuQD16xAszE9UwTvqe
         A72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782677; x=1740387477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=;
        b=QX3G+fGplR2XZkrUwjTEcU2sN3hhWphkfyemqkoXPJQR+c1G7qk3fMKSOE773+3QSe
         dYbsaJOU1wlyfAIJzPdUv6dh+KtjVEjF4C/WCdvW2ScawlorabnONBPcmS5H1OD/T9nM
         V0Mv2m+o0NgLJw6LwW3qnxbHPbqlcLb8+myk1hikXc2MWy0TGyB083NazIBF45ne6uYP
         ESiFHRqCb1se5CRF8X0HF2JrnHW+t4CLhAV1uUlw8rfK61flHrwy5B2lrTFxBvMVb2oL
         eacsAf4D4BfdbpnOgSq2aUCdBunfpM4QsmSdm2JyVVAyHqa8pKf10QqWDTW3glDu52rn
         FMWA==
X-Forwarded-Encrypted: i=1; AJvYcCVPWZwjQ8Pjv90Abu2FPgT+4LDIvO1WCs3VkQT+nUleRdye5jtybJ4dN1JerdDzIECHdzM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpZ9q4BmrFKe6Rv5QETu1uh3Tjq0QmW5spFITa88GJ8D8YGBHu
	4H+S+I2MnWkHopFSnWj4N2sp2oDj1hHoC4KWabrxL37dAFVuyJpccZU4ytT1dCM=
X-Gm-Gg: ASbGnctkr+HtEjahuVmUA/GWkPjme3uPNeBX+ZeZeh7AGAL88vQVT/tQT/dUIX8zzyj
	tUGPfiDPxDcR5A0cIU4l294sDExjq0uy5Hhu+l0liuId+ZIhF9YB3SpJXLcfXRgfXBSQkge4Kzv
	2ifXBHGsQuPhIMZCF8z6Kc1BIXkteHnwhcC+Pb66g1h59dGWZRxCE5O93Iow7JvSvP5dPmdUHnt
	4EhTgvW50JP8OGTfNHIuGAGn5tkksXoOAugCx5Vf/OsFF9cZpOVzhTJfM3RcL5QBh4uoqr/E9HU
	Z/so6jivW/uDTv1upTSp5mNhLFSwqKwQ2vov3QInxyZWtsezBFSjZLw=
X-Google-Smtp-Source: AGHT+IFPW0gjXYzToorJlW4AuIzo5YfoCgQvbwScUi6k6HolCkujw1LAnVbhNnt/U0DkIfz+68pqpQ==
X-Received: by 2002:a05:6a00:cd4:b0:725:9d70:6ace with SMTP id d2e1a72fcca58-73261798a0amr14960838b3a.6.1739782677006;
        Mon, 17 Feb 2025 00:57:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:57:56 -0800 (PST)
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
Subject: [PATCH v6 01/10] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Mon, 17 Feb 2025 14:26:47 +0530
Message-ID: <20250217085657.789309-2-apatel@ventanamicro.com>
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains, use
imsic_irq_set_affinity() for the non-leaf IMSIC base domain and use
irq_chip_set_affinity_parent() for leaf MSI domains. This is required
for moving the IMSIC driver to the common MSI lib which uses a generic
msi_domain_set_affinity() for device MSI domains.

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

