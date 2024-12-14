Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243F194C85
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197208; cv=none; b=aNk60qNDiJQCL1bzdX+G0iD1U9hXsfhTxvvVaNMRW/EIBLsJHEadEM4oRDoTKesx3ZrrwrKkE+DGhLQhye3DWOkdH26nfbKjYNDV07qU6GWnLnNrRvkpzOzZNRtvS4585F7C0E0hmTJRkEf2iVEhg9cAxDAHJHxHbvdktSWFr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197208; c=relaxed/simple;
	bh=KQvgHMf4mn/NJ5Xhw6rUHo6j+G4++aBmhNInEZUS85A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSNXVP+v2NqgZyjQLLNote34tuL/3uYjAoJQTvbS+9CeAYBMJQkng3bg9VxyuUc+y5U0rhexTnwFFoNFunxA5rrYjad/aAJxtYziA1DRK9t02zAqMXpSPKzWx7rRBNxwJOwKR3VIjFt3OcKGioWMzZr5A8pWob/tb9Tqp08YhXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LPkOXNDk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LPkOXNDk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b1f05caso26267375ad.3
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197207; x=1734802007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=;
        b=LPkOXNDkKTPGM6GU2f1BylKoeJAFEScKcgivcR8ta6Pk2dMmuDaPU4zM0L9QHraQW9
         dmmSvhyS65zuzbzvyHqgfkkFNFXd3YLZq/UDGL9Wa1d9e1y/PXt1p3W46SIDWq5q6Pwz
         GwMtGK8hq2UR5eyTW+9XGYvmzsMk9Ji1dyEmIqu8XFwnR7Kk3v6Vblt7t6hCGRbx0IYC
         q9hSRiEK5QTahX1ShOEnLULtqKCOZMuEyfTWkj+572pXZDPq284uXVQAL4vjbHRYplKA
         csjKj3mUxlELKiSST87Uht4qeIaxlKMjf8AkoL3vJF48DehoigOgDSFVMHO5oYPlJKTg
         z+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197207; x=1734802007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=;
        b=nuGEjvUAY8pEB02406Dy0G4Q0oM5NC4qnQGnXxJsYFe//r9DLdbD9Y3voc72QvWg3I
         AoGXi3HskHxT6tOI9T/xu5vZ9DCp0OTX49E1BrrsmZ0grVmbDF44ZXTfIMo7i7tZw4W/
         WetKbKzLJ713FuwV++BSRe9/XWsEM3RPAfT0CoXi6Z7IowgXIwlOAJqBUAYjS5mrmq6z
         fzPAwJGbffiDMETjbKY8F/3GJVveK1usQ2qksCom/ZJolk6POkiWzb8QswxRlk/fZr1O
         PLMIiD+FYlut11lMimPq9Ix7ETuBUZH3p6gjg/I5HF47AsrHrLMXoUMPwDCc7Sm3i570
         R7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBH92uctfWfQWVVq4RLjjEfrX37UAEnwColBQjOX1+XbmT2/eJqc7Zep18Y2sWNOJ7U3s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5kITQ8yBPamFGURekDAj1sIMfE4qmBwvm/h9OZkdetXQ6bJrN
	walYoIvqQA7CPIEDGvPBqzBiJLljzSKyqgH8A6C4/fr5aeITiQqdb2f3Jcni5ek=
X-Gm-Gg: ASbGncuDvkJBbgY7tnhiddLfRpFPFN9d01LB8GyYEW+HWQH2xCPtUfyAOsxlixMIt16
	o0/SdRv5AWO5wevWWP2bTmJaCLLhT4VKPIl4q6faaxLQdCkXIcCrO6hBOxOc53vnHLXEN/cnQDq
	JiqzwZeo2YTYYn0YVo4wLbHHU6dvRAAoZat2ajT4nZS6L6yMe8fE0Q+oPWdWbLcxUkliSYuYNvp
	/EH3glx0OG4AnnCCNiVaxD5aXb1+xcxGF11epLFtU4YeQl1y2K/U12vu3gXQR8PfYYb/lIAi4b9
	NzMITJm+yNZZ9wk=
X-Google-Smtp-Source: AGHT+IHWMVLk7VAHEJKffclkR/GgfiztR1cE76mj+f0onDTerIF7KBl2vajNkAVkEerHi9sn/JzVIA==
X-Received: by 2002:a17:902:ccd0:b0:216:3466:7414 with SMTP id d9443c01a7336-21892a41a9dmr113376145ad.44.1734197206669;
        Sat, 14 Dec 2024 09:26:46 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:46 -0800 (PST)
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
Subject: [PATCH v2 06/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Sat, 14 Dec 2024 22:55:44 +0530
Message-ID: <20241214172549.8842-7-apatel@ventanamicro.com>
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
index b689c8fe8d60..509c0ee4ef38 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -496,6 +496,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -547,6 +548,10 @@ struct irq_chip {
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

