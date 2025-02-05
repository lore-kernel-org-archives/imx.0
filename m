Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CFB1DA617
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771228; cv=none; b=TuPZpoTqvsLfCGh4PPFwflZKToxW4UUQf16T0frl8FC1uhMxRFx8+R/RSv5yoNIwbrKKW5121MTHYIvsqo+j4jDsdh/3YodWRgJYHmJic6fRHknWmlDpWjqn8BJHEQ+AJc2X4dguMUcZ/rz2rJigB1CUC0Ra8TpPnovkygBwtSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771228; c=relaxed/simple;
	bh=3zBJABDp2VjAHeAkIM6CLZBnc4fskYwTWZG6ia7OHWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD3OlQmI6slEbxE2PsiWbA7vwmXnzVVDN3WtBCMK57KH8GZobnF4s7sgYPCRoc7ZEk46KUcJgWlUXxKb3+YkFnpWJsv/nksvhH4bCGGZ6XFPmgE3+6TUOZG+vABFjTbuTY9b4OVrirA79fUyyH7FVTYWg+8SB1W+yHp6JJrGgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=b7+keG3g; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="b7+keG3g"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2164b662090so135455905ad.1
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771227; x=1739376027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=b7+keG3gW+MqZVyVeN5EaT2bAE1sEDzdE6TYs8IWwuCgcH8nZOtifVEyeohEjTKeB1
         kypVJwNfCZ3iqTwJoB0waRVO1Vp5K2Dz2lKxbvj/ic98eboG564fam5AcfrLMsZldUmH
         ViepYwEOF6Rgyyfo7fut8YtgMNCUsCviXQKvvL9CI/4GvM7/yoJ/Fvnm8tUPw5kWVKCh
         DUnz0LW5/miuXgN2mxGgOEPNuEP+NnfIPoYPodTUKrb4tcIYbjqGorv33FnSxEJVyvhB
         /hKLVFzMWbkuUNxme5vYTNLcb8zxcx8sUVXuMMMC5njHwpNMHPitOZAyPn/t9HAIsdUm
         Iekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771227; x=1739376027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=u/rxyDIukg7OPCJD+aYR4cdsAR2Q/eay/D53SkOlwGQkPF5v0eVhFvk5XcKmXtVg9U
         2E0FYoMu7bYbY016DGMWAxWZ2Bqw1Nr9WwBu3VWpYkJkk0+kahYZdV5qLUaW+iBsCFy/
         5ux39tA+i2s8wh39oY/og9wM5z5Y4dxt71Cupm++o/0UN70rVnLUe5pDr7EEj6HUngZ8
         /QEKnXaLd8QeGIPsliWrhDHxVb5G+J4jf9XdKzNfZ/EPAPRt/xh4JenieBlU8XNJmVVs
         s9CxrPbCRUQmWp6vE7hYJwEz4TPyDCazP9QFsltYrgdJbrrMnTjjsSOu3JicK08kiNWU
         KvSA==
X-Forwarded-Encrypted: i=1; AJvYcCVXP8gIzADQEUS/i1W3oAKOggsiZVl7dqe05heOLnFzMkkH+17FX9eCn5ZztCvSCS7/BpU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5wL+aZI9B9lWRXoxkzp047cYA6KeMNqiw82+DfpG4CGuKv/UV
	KO/bwPDw7vVuCQlVrdpw34qAEYIL46ulRuhNzeiArvYIgJLE5nT/5a3PCDi3WiU=
X-Gm-Gg: ASbGncvsEfCXBADJcbc2ifVxxZ9nH8mmJIjbeSyAQjpkM9n4BSYu7F0szgoJqy7RGZs
	KYo9drIKSb7PLaF/gDNNn5IVKotq0cv2zDW2TBeSxYMYkzS38uBes6KjLIOaTJLQbFW9gkJJ+AI
	yvtoNXRcWWkcN8aR5pe3ECuvBXppT9NUHXXpYsQqdYgPRliTR83pCKwhIF1rdM5GFAqXuVY+BVF
	D4PrZ16ebvkz+m3DYtssyWousKpGQTAPEWCjdQLwwfeLw2ixMPZIsvP4RufhGMofGYgf92TSbQU
	zWX0zxuaflOGYmmiZ66anW58G3XP2o2imoYy33qqtzMNnrrpydComgE=
X-Google-Smtp-Source: AGHT+IF8jFyxyV/f5JzHUJJ21FDiQHGu6kpLDQlz+2/R29XsqdFXb5Fuvhx/j03+dIK/P/pfOWQ0WA==
X-Received: by 2002:a17:902:ccca:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-21f17ebb95cmr57042015ad.33.1738771226541;
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
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
Subject: [PATCH v4 04/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Wed,  5 Feb 2025 21:29:40 +0530
Message-ID: <20250205155948.81385-5-apatel@ventanamicro.com>
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

The GENERIC_PENDING_IRQ requires an arch specific implementation
of irq_force_complete_move(). At the moment, only x86 implements
this but for RISC-V the irq_force_complete_move() is only needed
when RISC-V IMSIC driver is in use and not needed otherwise.

To address the above, introduce common weak implementation of
the irq_force_complete_move() which lets irqchip do the actual
irq_force_complete_move().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    | 5 +++++
 kernel/irq/migration.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8daa17f0107a..1884fa4ec9b5 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,10 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+#if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+	void		(*irq_force_complete_move)(struct irq_data *data);
+#endif
+
 	unsigned long	flags;
 };
 
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index eb150afd671f..2920024475a3 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -5,6 +5,15 @@
 
 #include "internals.h"
 
+void __weak irq_force_complete_move(struct irq_desc *desc)
+{
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
+
+	if (chip && chip->irq_force_complete_move)
+		chip->irq_force_complete_move(d);
+}
+
 /**
  * irq_fixup_move_pending - Cleanup irq move pending from a dying CPU
  * @desc:		Interrupt descriptor to clean up
-- 
2.43.0

