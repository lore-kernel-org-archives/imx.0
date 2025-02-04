Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD452063EB
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655694; cv=none; b=WwlvRA5LsBaEzz2Cu3rPjiuA4KGZ4Ut5+PnIfVHERR5v502hWOWyPwgmF4+OftqFbZp/9yKdpIRimy1y/9o7j/SYf3dAdvWIHzqp1D7dISTvCd/tthqhbwRSP9+aWsF6MWLvK7NacjQoGNV75H58rjNlNY9z4JQiVSpZZxrn4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655694; c=relaxed/simple;
	bh=PcKCiIKJzPJB4OrlTg224bcO8uJZAUgM9GlGe6uz0Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXI9E7IoUAUIkHY6foiaKt73Oi+NISsCGfPFLjMUHUsqiP3LrYffiAgm+NjPz0NGHtWSWwYMFnYYmAGinBpWTrzC2ukq4oZ90uRhN5INWnZEd4ePtLP9T6CHi6H+icqvwNUBlHtGnJiG/mi/qP2CsRkJvUiNnrcV3xvxybyIuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=If5Evs69; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="If5Evs69"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7be6fdeee35so833546885a.1
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655692; x=1739260492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=If5Evs69SNvQeLTVNHaBPEwfxjNKVx2f0ue/ky10IEoepcnF1P1puYqTsJjSxFTuPu
         DHHYGGETb6wKpmBKfblRrknfbO0WPi8Jp89sIse1hQ0l+6QLYM4exDykA6JHtDVHF5oz
         Pj1BoB35DABp7ozUDjseSJ23qF5ZKaADRDaB1D/GzajaeqvUAPGKjLCyByXM3lQ+aa2q
         JRSCWyXuBNz72W0iH5ovtPwfRyF8YZuMFi2lX9FVt8EE605uB2cvaS0rl9HcMp+jlWep
         7Gg6BX/OPsWaGIuCWC+gULSsNc5z5Sc0fKVw13Xi+kB23DM1NGhnKzt4rCi5To/darAg
         o20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655692; x=1739260492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=oUGvF4TYL9Mm32R+uq+KSwRJ4MRdjJMTsaT1bp5VGoU+wogaiGH03UnkdhhFfSRrh2
         vlXcZPFdk1qR3oYyMxkRC6PrO/AIyHCwtJzAbXMqvS1VYYqXrC1nr0hJnNQtWhIyId+G
         dPPizWLBlaW1lFRgPyPEgxyZ2dUmjp+qzxqK8bLlRcCZ+e5C9DrGahOlCZl0+GzNg1ly
         ++LNixXW67/+igdHv2YAQJ3DDZyQSH+gHF4ZG0Qs3PsCExOwRDaADYwTXOHP8xeUD1pH
         7Abj948yvsavgI97XTxhuBndARic2pJ+KJt9wmq/cfLcWsr0mDQ0L7t0DuSrHS3EmA02
         niEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvVZ4ZX9m0F/W4gnBxdqo5oF/uGxirLhak0hwv5oKXrD0tnVplMuSM0vZ6Nj/gG+lielI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGNdIqNLYcD0GqsowddmtcAHSHuqmlIc+mEwnbHiaTVKmRf7yW
	aQVL3jpOrnlETM97GYDKK0ZYssy4HcQBPW/ZTYnw/DQN90pr9jIQqHQQ9T8c5QM=
X-Gm-Gg: ASbGncuMNk1Mc0OzTkbsLY/h2oy49h/lj2wlNMIfqqqkFWV8baNNXtZUHQwzcpu/qt2
	IwztHylRuaWSL3AG0y9qhSQd39B3zTJ+GCQEF5TNXfLrXnNDZweBNoUG6IU4zt1xWYffiiSdr1h
	KmPnxCz5Ytf2KyHtmQ02ZBmG6OCFf/TnEcN5zuGbhhB4PuZPwTk01UNQEzikJyU7Y2YCkFXsQm3
	frW3w+p+kxJbhD/pDPGu8v9d9cY7j2X53DoKqyFYZhKxU9HzJ/JvqT4J3Jb5EqZoh0LzvcoTo2O
	7hMgDdF/TkKyB7nY5h7VvbI4ytmtsQpgr2sAKr6ImD/4XmlKAWRgj+c=
X-Google-Smtp-Source: AGHT+IE555JYDjxayJP3hHqE1TDj1cVPpWMaeaM/3WguRaZQLIT7OdX0Wc2dai4BACH0ZbT7vjefxQ==
X-Received: by 2002:a05:620a:8395:b0:7b6:6e59:2864 with SMTP id af79cd13be357-7bffcd726edmr3656909985a.43.1738655691894;
        Mon, 03 Feb 2025 23:54:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:51 -0800 (PST)
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
Subject: [PATCH v3 03/10] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Tue,  4 Feb 2025 13:23:58 +0530
Message-ID: <20250204075405.824721-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
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

