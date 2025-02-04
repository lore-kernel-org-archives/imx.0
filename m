Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002F2063EA
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655745; cv=none; b=OKsV7q9erT3/A6gq6+kUFirQTcn2QECMMiJkwFuJHqSQIRacvtBBmjkn39pfrzZTSokNs4w+MYyRTdBzwbI6mBPeVWp4YyNV7iP6okkkm125F83Ln+G3VpRnSsK2YTil8SuHL87zLMzwskEWxkJEkEAVY1thurCcTq52p74k2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655745; c=relaxed/simple;
	bh=Ml7O27y247NCehftSqvlxz3dmlGKg5+3Av1RR28gVzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmA49BIjrJ7yRUirpPh8juesV+GOygXBQdk5n97Vh3fXIeCTdz1Mir3ponNrj7Y3Yq6diUsEBPYmTPOnxynzRDP16UhVhvxKpfIGllgtlnRUo/zimx98voKhxo8dmhSTk323UE8UMyscqAp4g4NxF1oIpL4zMdM8vW9m57gQqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GwBupG4j; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GwBupG4j"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7be8f281714so472472585a.1
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655742; x=1739260542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=GwBupG4jHmOW+gz+oLm38wn4iFjPvu2DrHnuj3DqBaa7lyBwGv7wbp+PX4vFN5a8eW
         kX/uZGbKegxueUBOHDrUga7LcUmMfwaL6sQRYSXFqqgYz9l+P1PMR284PPYhQdwUeFV+
         Q7mnDtRRanVxkEy/8fvrJLLkwRzwn8m8zijERviIXbi705ihjGoyoWKXtyz/z/f58yzs
         7g/YeiVTDTH+mEQ9+jUStz0H5ruCHuu+0PSl8QyyD0lXtPZE8evSq5LodTQexyBnXbv0
         ujt0CgP3BW164CmMMt34peku3NFcB5niPbqtWNiuaf5r34STdyWdMk3N3Oec7eA2Hwln
         0bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655742; x=1739260542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=h0p/DMTurtBmTKS8wh1mycK2L3qEu4rIMoxk4GWumjGTqaq3xtdJlqrYOLaKlHwk0y
         5nmmCpXLcOrSC8K6feHHJWkAL84k6iTYdlL1NSKkK8Fr3zUb9PrwfVNUbSPScThj+L/S
         1iS1TMAOk06B3fPXeOmXHEx18JQm2dsbVzj74pq7887aWzF+kC1ffEks/+vhuLuIG+Uy
         LxJRZDXcAwl1+L5EaG0c6whuQdcwkR7JmCLg9LtVX7PAr+Oj+xQ3tN25pV6PpsusINl8
         rpm05t3Se6KVF/0oeirWM/FwwxN88C/bJFo8fva9YH3V+kNuecF3+DiHYCAWG0pCHu2g
         UMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXJe9v+tOyQV9zF3roqZ4egbLI+t6B4ybeFRTvfiuyLnFlwdklGweLqG0V6vgS2XMRqCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMgY74AQT5vGBXwjUN0KZ3xbUesCh9cDQ6YdM21ltK2FkJV9bZ
	uHT5vfQEnOb7tq8JuGA2SwJjGMOd4l6MJtAX0HTwLRzpoY2QSEQDPesaMMsoEJA=
X-Gm-Gg: ASbGncsvJxFdvuJqgjmDe8P7la5zIec06erGkTsHlpZ6E8/3qcWz5m4x7Q+xq6+mBKs
	WkTUa0RrviOt+ZriI4A3H17a1uXg3otQMiUNNcprtB7dMA3+/z96yp0CiAbsiSKC4R8I+Z/ORLX
	8XzqIcBZXCdDdXFSfh3L8j85DizHs5RNnxTfOoa8cRWttZbuhAnvG/7nUJQZnEy0FH0NEiesiqI
	nCykToDIyvqEqGNT4+jY8TzF6FFNugq7LQEHdEmzpNqbhYRDCcIB/ZfazRODkTw1MEjrwqYHVIy
	c5JcaFGp7ham7joOg9cJaz+2R+nfVisofEo5DglqoopcARlSqdyKjbs=
X-Google-Smtp-Source: AGHT+IH3PInyMoZqyc0SRTAjhuFIMbhus6lgn+l4uL8MxLHlStsGNic2bJF7E2l/TEt5N03Sy8JF7A==
X-Received: by 2002:a05:620a:4382:b0:7b1:56f0:e09f with SMTP id af79cd13be357-7bffcda14b6mr4536316585a.54.1738655742363;
        Mon, 03 Feb 2025 23:55:42 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:41 -0800 (PST)
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
Subject: [PATCH v3 08/10] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Tue,  4 Feb 2025 13:24:03 +0530
Message-ID: <20250204075405.824721-9-apatel@ventanamicro.com>
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

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 2fab20d2ce3e..fae47b8ccf73 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -156,6 +156,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
 	return IRQ_SET_MASK_OK_DONE;
 }
+
+static void imsic_irq_force_complete_move(struct irq_data *d)
+{
+	struct imsic_vector *mvec, *vec = irq_data_get_irq_chip_data(d);
+	unsigned int cpu = smp_processor_id();
+
+	if (WARN_ON(!vec))
+		return;
+
+	/* Do nothing if there is no in-flight move */
+	mvec = imsic_vector_get_move(vec);
+	if (!mvec)
+		return;
+
+	/* Do nothing if the old IMSIC vector does not belong to current CPU */
+	if (mvec->cpu != cpu)
+		return;
+
+	/*
+	 * The best we can do is force cleanup the old IMSIC vector.
+	 *
+	 * The challenges over here are same as x86 vector domain so
+	 * refer to the comments in irq_force_complete_move() function
+	 * implemented at arch/x86/kernel/apic/vector.c.
+	 */
+
+	/* Force cleanup in-flight move */
+	pr_info("IRQ fixup: irq %d move in progress, old vector cpu %d local_id %d\n",
+		d->irq, mvec->cpu, mvec->local_id);
+	imsic_vector_force_move_cleanup(vec);
+}
 #endif
 
 static struct irq_chip imsic_irq_base_chip = {
@@ -164,6 +195,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 649012cc47a8..54773c27c411 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -332,6 +332,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec)
+{
+	struct imsic_local_priv *lpriv;
+	struct imsic_vector *mvec;
+	unsigned long flags;
+
+	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
+	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
+	mvec = READ_ONCE(vec->move_prev);
+	WRITE_ONCE(vec->move_prev, NULL);
+	if (mvec)
+		imsic_vector_free(mvec);
+
+	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+}
+
 static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 				     struct imsic_vector *vec, bool is_old_vec,
 				     bool new_enable, struct imsic_vector *move_vec)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index f02842b84ed5..19dea0c77738 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -91,6 +91,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 	return READ_ONCE(vec->move_prev);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-- 
2.43.0

