Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58212063E7
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655714; cv=none; b=cta3ANyni28v3tikZwwFF0YKkyjRzolK2fx6GKWlr0M78RKX7lST47jw6kAMY+OPkd2xVyVMPNbobFwRhptqMz/K2+W5OBxvNZ3T0Bt41v7ThKfxjm+D2covKhB5ku9IOoBooPIeJoBkgPUicax5ybwv2HCZQTp1fhgbhRF+sCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655714; c=relaxed/simple;
	bh=3zBJABDp2VjAHeAkIM6CLZBnc4fskYwTWZG6ia7OHWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oI23B6Off1s5Y5inxSPWasGq8mkIUjos+TaKOXv00U8f1YyDglWvF2C8HDX4ajA0Wj9kG1D7ibIO/jr9qKtia6o6aRi/56CPjRywhUyzHres8gi5mvZGLZPdbt9Z05xMY3jMnOusZk1V6WxejBUP9bBALZYWm2tfXdKGrhKUzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=FfF+7v+M; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="FfF+7v+M"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be8f28172dso263998985a.3
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655712; x=1739260512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=FfF+7v+M1rS1mlKV5FZjlAPYBjVyEUqw8fu/xbuB2/la0reQIFQBD0rJl7tRxgsfa1
         gPsXSG6/O5q0wjUXoXb3vh+XBTFmfSZ/QcdVwrJ5WN1ufwZ8nII6nLgizgI29DsepJQ1
         Q1LD4M6pEKUSrXV1IkdtdZj8xYTXJwBqy0btgOcya1xS8oIxooWKYYhrDm08qIVf0eHG
         1AUWOWdeBnvW04nej7YekVzChgSoKipXIpZqVGn0fwg76G+TB/qsELpoLFTFAApL9sPx
         6Gj+WGn8Q/uD7fW2cr8l6zpbg654RbiEppBK1NNBv9YoRXqG/SvCi1nRwIbm2jFDEq8z
         nhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655712; x=1739260512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=FqDtWf37NmxnB9hcJ+CXYn1cKNl9h4x7fN6T4kuew/kvhaYxRzjqQJbrCJBwO2ljpO
         a97MS9t0hVNAtjg2e4/f/f9Zri625TqDkqNuxiatj+YWIalkyX1UfAurl+z17MfmayH9
         xilEp3CrtUHpK5Juwo+hsMD54V4folTIEvmFGqNXVNrLXwdqxMZGE3QQZgLbQl1UxxKA
         GKR221joYFPMoG7WIg3qF/gPO82uKeutsB9s+IULbpCk8de41RbMiuPT4twYzchxYUU0
         4LS1Gjnq3S6nvuc/0dAkb04v/h2UrZiaMiZ/FfKCQpRB5tEDdj5X6+Vvvgd1ISoEN6D8
         Z7Og==
X-Forwarded-Encrypted: i=1; AJvYcCUNZUbwdM0FOeOprJcY5cRrkWb6U4h4XOSBz+jMxJMF0l+fEkqPJR6GLazb34sarqyRIlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxQAfeeopZ0heyWfqVatcP2OsO/osPJ0LE4KpJ4zq8ajQXtUxR
	+kJBozVwqaPJBRPKAGXFxjzi2tEOh/60ZOafqnrSbN07oEqxl7PY29Dc4Lno6Rw=
X-Gm-Gg: ASbGncs9kRZoMJUqXC1Gu5DsS8WnJYpchB4tA+AcCturelLQ8qU2TMf/JmIjzWlyxdO
	OG/p8LEu6mP0lJZFuuC/DOjnJ0uiV0vw74Hlejb0/j7H+PQ2L7MqtbD3jyzwpk9W8zpcB1TjVC4
	vv0Vcdc8b5PXWSfLiCb2DvoheJ9Kh1CsrPLIIiUy5L3LlWxeFEsLZf7WaU0mLPr2+9tPhy+UPKk
	8DRQZ29oOA6GvLY+/Aw3GJHzux7XFk2BG9yhIfaIA+RoOV3HKS+3q/vMkZhxXEexUQpqypcJvbd
	yq5QxmZXbWXUYCrm3fV8wWcXDtG1nGp/qrSPJBUWjNw0XUByD7+5tHM=
X-Google-Smtp-Source: AGHT+IEygJlzRE1f+LllQAS/xZozPVCC5zlNa0cJxT7IbmhuAFZYxlHSMSOoINty/Bxd6fyVjhK48w==
X-Received: by 2002:a05:620a:2b8a:b0:7b6:6c6f:fb5c with SMTP id af79cd13be357-7bffcce52e1mr3541223185a.15.1738655711939;
        Mon, 03 Feb 2025 23:55:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:10 -0800 (PST)
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
Subject: [PATCH v3 05/10] genirq: Introduce common irq_force_complete_move() implementation
Date: Tue,  4 Feb 2025 13:24:00 +0530
Message-ID: <20250204075405.824721-6-apatel@ventanamicro.com>
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

