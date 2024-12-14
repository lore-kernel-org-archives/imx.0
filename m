Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F319CC32
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197188; cv=none; b=BIZK9tB+NAB2SPSigRTGPfPyHi3sIu6BVI8XAnRrlYYVPFT/H+7yT70ulvjzgpdTDcZB1o8ocbHYuEAJaNS9aHokFY9niFJ/8PPdvcv73rAkfLr7+iHU3INWtE/CJk5JMFaJmTSxs0zPv0ptQoqttyCDKuwqdVJebcJ6dFcDmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197188; c=relaxed/simple;
	bh=PcKCiIKJzPJB4OrlTg224bcO8uJZAUgM9GlGe6uz0Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6SarhlipQpWrQ4ABigaL81cLUZ6s0M+Tacsbt4AhKkyd9zKq4texTN9bcwm7qKh8eDKdshtSxsqevCn9PCB4SOYZ35O24KYCfpHwxyGP1ZFCQq8TaXqCbUq5IkJepRvmlwNIj5IxjtjkQg6Xjy6DhAEmCaFTp/aUXu5zlAIfXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bOZO+0dh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bOZO+0dh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f1459b6f84so1809151a91.0
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197185; x=1734801985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=bOZO+0dhA9I2a5vpG6pZP4wsSVixfxq7xhVqp8TKQyV9z1R4nL/gEGZP98aV5GRo3a
         e07apWV0boiXmyDTDJ1ftbJnA9rBUkKiYU5eLxBGdiMbio9EpaROC14r8k+0ekd5sJWU
         owxxLKEq5dll3B7XUaH/e40rathBeSZEQJugDskLyy3VOs1t5OC6P63PeKXKyIgJAYTa
         OnKlo6vm5gwnR1jkT2RvsQZknQyBnqNOs3AWhwCOy8FhHBsHSYW/q55ORGor+UTUls7k
         EthLlovdDVpYPW9ohhv3mmWStAhnRaMc499AXNEFqrgesYnFqDcogpwf1F52vVyNoUQz
         5gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197185; x=1734801985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=t/MOiUthN2XJAUx/CXqLQ71FEi39S7vBXNlRYAwAP4gt3AbfBI792nQ+Bzt42ojO2E
         szohfSnZvpBC84hiYkWo2RgFkIR8XeK4/hv62qI67szvIxKceMhHytomT6r7vLJHWbWv
         EK59t4z/ERQ0I170cqzoxORgJmrRlIU0acfFeJx9C1DNriwLzbBfGQQQLW554dGqcTrQ
         EZIisFuNKa3Ue0ZoRpP8XxojREDsOkRaDq6GC0XfWhvHGbOMk2IVbs7TwYRf5e0Fh1W7
         ProxWlv0XAz63iFjtIeIROijNjRzwXl87iMvCmkVhFGmGOexFyx5ikSpNDTl0e3gnztE
         BkYg==
X-Forwarded-Encrypted: i=1; AJvYcCXpMA01WQEqfukETFpw37HR/0bnAxnM8kOkfkVebt/uezPBaPDgukRCcRHbRk4ZsprSZLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUmp/VsuFi9XxJTMkvJcmb25DBdcsKydLL+DrT6Tc3UPAGjUbt
	W9K4IKvmYKx8P76RCN+79fM1V5yci+SUAbUgQkEppPiP4PzLNkXYeShimKy4wE0=
X-Gm-Gg: ASbGnctA5E9eWGm2QIws9K6/kBhMkWlwaQyzrFAugl5ZyncSPEi9G8VUyHNkjSE2Uly
	k4ZwNc8Qx5ka+3FAP3sOjgA5mcqqYxwn56Qz6VhFm/m+nvvs79C3i4QdQRQQuBk3oPdDGDmf3zh
	DVaqcBdJKQfnDLGQ0i6+XwbTgIMgbc907jtc6HVpgSDAwHPEQeWRzXMjGLzlH4DvX1o6Ghh7hmu
	FFyivFIOEm2RiNVmma/dbRKEV1X6gW9hIjqKiS6TAKRmvSiCLeFuro0kwGqFBGzP/W1wPx6iHeq
	0mkaESRwPpSDi9E=
X-Google-Smtp-Source: AGHT+IE1SPKm+gzJ6VGXDJy+q7RKdAC9iquVy8ivXNUGMyZxEqe5AtUA6j7vJ+xaqDvjxeC/PzggwA==
X-Received: by 2002:a17:90b:3c02:b0:2ee:5958:86d with SMTP id 98e67ed59e1d1-2f28fb6764amr10436246a91.9.1734197185565;
        Sat, 14 Dec 2024 09:26:25 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:25 -0800 (PST)
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
Subject: [PATCH v2 03/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sat, 14 Dec 2024 22:55:41 +0530
Message-ID: <20241214172549.8842-4-apatel@ventanamicro.com>
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains,
use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
and use irq_chip_set_affinity_parent() for leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b44eb0b3990b..dc6f63f657e4 100644
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

