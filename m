Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56861547C6
	for <imx@lists.linux.dev>; Sun,  8 Dec 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733670461; cv=none; b=t3xHhFghLmGG8Uhld/6NVMrk/vKHhIkWUX+xcqGHZOe0KwL8pkHQwVwteKt4vbferMpmU/0qSwVil9jtlrUjENJpSxibqd8/03if8YKKIa0XRvQWbzC3lLjvvH6mBfNcg7fHbS+rkz6vurHBWswBIElZmHy+OX75SU+LlXFYsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733670461; c=relaxed/simple;
	bh=ECRfKt/zywXTJNgUL5IgZczz3+w5yQEB6eFMizakLMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oaKc3XWg1DXrs3eV4bN48N0NspFOwuraAQSW9ZcBwHmTjh64Pw/OJreXtq4xYUuUQWnjyxdQE5x55P01Mbm3YlRVFXehLEi0FhwZX439JMlsiMqICJTOlDGYi1Elxh8jg3iHFVp+QR1Klmxe2pxpk5TyZRZtokLH8mBan2HnbBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jaI+jTGi; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jaI+jTGi"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2155157c31fso27536035ad.1
        for <imx@lists.linux.dev>; Sun, 08 Dec 2024 07:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670459; x=1734275259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=;
        b=jaI+jTGirXXgkkm8fIP4J7tVvWGAVSbPxiyvw0/BL+NK6xwfrlirylggih4PtieN6c
         zbFaL21Ni2h/9kNfVnLzxfAhMd1OcUTrSSEry0bLYgHMQvSAno4okbV9Dqx9i2zpnWL2
         FElu03CaI2d9CKgTKGD1gYyOdvHT1Zpy+fi9SvQwx+W+9y+bXaYQ+LB0vYPNwHMUN2pm
         UNYTrg5DH1myzVq/xbas7CwX/Uc12+Jfh7PZwoIwuYWmE0Fk8npcO4O7m0Peptssn61X
         +WgIc8P885y9Vm5YktLOh0mYYIMw7BjtUeyrwmvX8Qd/Ri9yIjNFmHI2B43s2uITEqsu
         LNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670459; x=1734275259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=;
        b=Svip5EGNSOwfQK1R+GIYl/MaoBLSB84soVmeVtQm4/hVW7N59UHDqPFPZDDcMxBnd/
         FyLioNY3eu8f0z0KHCfAHRB55kQvRRRt3ql8Ze82ikpN5/dra8r8OLY92d3OXAFO7QIG
         +SkvnKS2smOqWoztGHIJT+QqIVWS6CHYthVa9cQBggIzUSa+k6eJKN/1l0sBKztgFjLo
         z5HIjgnsROpy4yfuXvPmu3eKtJ6zrLjuXLYRcEuAXrDN9oAhchVDxKy3i+DpMD7ow7Ny
         iuo6cuIHfOnWPIenMK5UWbRYFm35VTGr76ggkmhw/FX9kS1tfCaZsha1oFvAbVsZcZYK
         8NJg==
X-Forwarded-Encrypted: i=1; AJvYcCUs42ehhmnozOcx7wGR7fswtG+IXh2oNHM3veivXpTlBTF85rfVmTFxViWIZeV1A+bAjwA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya8/izAA2i9TMiVmkt6N93wBZVHAXoaq21oeaw5Ag2HvaKp4Yt
	LsOv579mXtG2LeSNHAxWPjkNk6PVSG8kv279oMNBh18Lu2bo40//MMgNlxvF8bg=
X-Gm-Gg: ASbGnctzFwDMEJg//jyYs/2sYkdXv9rwhJZbtcO0PeXuVn4JkIqOdhQa/ygZfyqqR5m
	V83n9YhLl143hLNqMG1etB+B1CnxHXwwOYf+YoAres1fuk+w1HDlpL9riVz1pAhNEkpYFyKr0EC
	VJgqYVkizyvceVOG4aL0OBnSI7seac7EJGS0wZfNeVt+JgdUtFyS1wCXsAsLu7Ogxd4NsImJyx3
	Oi+EbrtE14vcOvgEhAQyiFb24nFWJIwkcdl21qaP/Tpn/6TC+Ii8nclnfoLI3QWT4o20nT+U0aF
	NpJc2YjO3Wmf8q4=
X-Google-Smtp-Source: AGHT+IEdCvop71IxVDmxbyI+VLG1bHMgUFJCX254kjusIKOtBxnkHakfEgU6KYI1lpBx+kU5iAXctw==
X-Received: by 2002:a17:902:ef48:b0:215:742e:5cff with SMTP id d9443c01a7336-216114e67eamr186694365ad.16.1733670458958;
        Sun, 08 Dec 2024 07:07:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:38 -0800 (PST)
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
Subject: [PATCH 3/4] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sun,  8 Dec 2024 20:37:10 +0530
Message-ID: <20241208150711.297624-4-apatel@ventanamicro.com>
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for non-leaf MSI domains,
use imsic_irq_set_affinity() for the leaf IMSIC base domain and use
irq_chip_set_affinity_parent() for non-leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 707c7ccb4d08..33a8261e6017 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,10 +96,9 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 	struct imsic_vector tmp_vec;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -139,17 +138,17 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		tmp_vec.local_id = new_vec->local_id;
 
 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(d, &tmp_vec);
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
 	}
 
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
@@ -162,6 +161,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -272,7 +274,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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

