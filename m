Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0339C195FEC
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771235; cv=none; b=taTrE5/pVeqfOOyIg+ICpe44Bnq5/mUvDaaXgVeZIfo1TjMnDB/WrB95PY9W0mt8DVxYWwlimGAXLqQNqFkt8iL03kO2QnKThgo1n75rSyRYws6Arl9e4YV0s3tgWNqSRJYzgzEH6cEIK12ayR+I9YF4JAIYyHO4Lhb8I1/p+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771235; c=relaxed/simple;
	bh=zAamzhUEpJ0Ntfo7PXDoXhLHzC064WJshCcKxat5Ftc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ4WoUGBoXAnzCUww8pyVA19ozNKysg3szzCw8pGpw/v5uqTHsZI0hOEqi+LvfiTdL0d1M35hEaIZ8uYeGnfOCvKy4Fobg/PBKGbUzGx/wcKvL81Db7cUX7+uqzpGRPuK7DAFXfMOW72DNw5dEcW6QY8lLoAYUnuqXozfc/82zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YPDDx20u; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YPDDx20u"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f237fb0eeso10522755ad.2
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771233; x=1739376033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=YPDDx20uIAe+PnIp7mD/A9w+8x5eGfIWPqR8kccOW1wymdBKAWwylBNum4FlQaKzUB
         Avj1tHygSzDE+aXlaKx4oV0wNIh64rz76HTC1R42WY4FQ1g9L3DPqhF3vfJ2rfDhpt/u
         GrMALKl4aA/k0i+mHjCrTNYaHtkLl8JC9X7ziZspXK7XCFTq5NjoH6HbJO9kNmeuAhFC
         8lBpBZsCKf0EsYmglXhjVWoUWRKQHbY1zgkC3DGBLfYoVVcdRBZfZyARtLZZzy3z9a51
         0jlBiA+2oBrzWZB7vA1Kl2pOjqxUQijP1YdfYFWYWTHISnQUo/9jCCk02HzoG9JSAdpn
         iiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771233; x=1739376033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=OAZrBe87BfDJ2ypFivhanEM2ZVfmnSdx1PRHR2LTfSJNTgn631nyoYtvf/oXyapyRs
         4mc+XeZgrqXpnqUQl3zqyhqZaNNAkF46U2agDKjHz7WurwSp7lW3H+dVpF9y3GC98LCA
         R8ZI0UWUuWRYbDFUo7OAaIV+ByROCepxxGG4JxWsV8AEepNCjbWWG2dxM6bm+MuQBfzq
         jycj3I008YyClfGajSMpuwMCjRr2d0mV3KllU0E/mFm9ge4y6ug62ULaMv+c+qN1HEk7
         EpjmP6flh5QWnaoh4ACTmXfoFBuhMhAEYgB7LyLGCIqTImkD9zQ208gQoLPmhAaWqZhE
         2pRw==
X-Forwarded-Encrypted: i=1; AJvYcCXbhlkOZNhWAeqE1uiuz377myBjmlSsyM7O+8WJE3VnigfkP2CgNRn4DqlouEYVq6CecLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwoPsI5OlGzEGjSadFksfogNIeI0CZOXryodZnYrziOuj6/YTw
	255iJuguVlKrpLGBJdsmrZA9RqI41jZVNct6y4fiveqqkpNLx6EeDSz9ZEgtDek=
X-Gm-Gg: ASbGncvBGwr4J5gsqL2YxAEr5E69J9oUivHMyNTnwWlNXHy066JXCx+4GoRliWO+vmn
	2T2OOYZ1BId0W2fgf8fGp1UWlMT1FHgD5GBkNAvSMwv35cWNjNvcZFNDXytqGOaFOmclP4S1mOI
	3Zvup9E6/D3pCTJfMm4qGB0U4FJI8IjzvkNRg6HzP31Vrr6D60QVhQIhqLNKHX3tndy8wJdSIkE
	8giXMePINR3ZC6p9/hDxRZdRsRvzUmW7Y6/xsdZ0a5NpKciywg8gthf5uxb7I9cIZAayOrWygLO
	CkQ2IAwjqVsbDqrqxBsvTSJ2ucAR0P4G37hFsg1m/FBty+IfXen7Ohs=
X-Google-Smtp-Source: AGHT+IFVUygBqhzTxplgfR5D4ALHtsI55bhay/IfP7Si4rFXdhEgGg1YfTQqUROzXYR+kUtbmKwJEQ==
X-Received: by 2002:a17:903:8c7:b0:21f:16b2:9339 with SMTP id d9443c01a7336-21f17e2a39amr53896345ad.27.1738771233066;
        Wed, 05 Feb 2025 08:00:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:32 -0800 (PST)
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
Subject: [PATCH v4 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Wed,  5 Feb 2025 21:29:41 +0530
Message-ID: <20250205155948.81385-6-apatel@ventanamicro.com>
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

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1884fa4ec9b5..5b67a47da144 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -617,6 +617,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -626,6 +627,7 @@ static inline void irq_move_irq(struct irq_data *data)
 void irq_move_masked_irq(struct irq_data *data);
 void irq_force_complete_move(struct irq_desc *desc);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 static inline void irq_force_complete_move(struct irq_desc *desc) { }
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index 2920024475a3..428e42d3bc91 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -126,3 +126,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0

