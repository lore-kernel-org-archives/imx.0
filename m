Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166C31A264A
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782712; cv=none; b=Rd+QJqX1Fe/AjnFJQLOkIjbF/Wwo+g93+ztaaxRfm7eyckXTiSrumkZapNygr3EnMBsm1RC4RjhF2WzrIxwsyPgiiF6jK9B7PQrVLLWu9Dh6DteEYc5W5rMqWtaUHJ7QuVWcqgsItZOfK3L90K502tPuuSChIP7g1He2hLeYPsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782712; c=relaxed/simple;
	bh=PxpxF0dUlwKn44FGhlpT2SXXiblCpU8cCNLnLI9M4ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQ9tL924Pfwp7voMSDXUXqR12mYw65ddnwuHBdYL1GlQ1jJJ3N8/l3o4zZrPqHxMQigIdyvWLDseM0T3i+Ifo/Pm12EScsO75+P6aWQCADOCK/9f3nfH1gl4KxnsI8yIDQnqP9ZD5ojDRpDBetzxR7f4UEHwS5ikDfObtoHcliU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=eg72FRgb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="eg72FRgb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa7465baceso8397921a91.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782710; x=1740387510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=eg72FRgbpvVXi+nqImCJsRuqCD0sxBO4RFeWrdmkzGcjcbo+ol5YGKr5hMPpyFr4Me
         N4aUv0lpYKyG5HXm7xPf5Pm5VKoCKXROf/d2O28DH/j4cbJLDiw5d0V3FUp+j4ohDog6
         pQ/1SfkImBa2fEsQvaWf0OU1O28/2Q2ATP1chZOMSPR8bY+p1YJc1X+5fwELv5z5OFRk
         iEv1qrWAZxV/wYi18qT/iophzSVWTokCNNNne/i6I8nHdVA35HFJAViKxTwVC3ATSQMV
         xrXcF8SthHXtMLwi5zPrWPTgahido74nwzbUmzBEqrWzrY9ZMjYJ57Um04JYjrOQESX9
         yKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782710; x=1740387510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=r+OEiwzDamaNyTj13V12lGagbnIgFqrxzessc4e0kcduLJ317H1tmovbLfY0CcFBNE
         DMu00iLhz6E0I8SfApmyijYD16bJvnVE3EyajWcR7WGvnvLk5f73Oi9ywGtWANSsN65U
         liHgTvguA1TedPfmyuIvLWM7YQBt6EmsevgXnqJBbRfSMZHwQ20OKWP5z1RGXAFXcYXL
         M8ujBNFtE8brbzXkJWIIJpf0wT1NlD1eBFtCppw+fCNKRs2EpmushruD9OTd2aDNuOMU
         +QZTDdK9bAnv/IC2H3Yi08tEKe5p7837yFUTR62a7L3g0/nL5eDEsFI0N7MuDUDwPHMF
         yq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsxWdSQX0R28Av+ZbASZrCKPMaWvZ7xLC8CiQ8pcKwqlE6hafBRwbdWKqAr2fyYDOKw2I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk8tvd6CKjxuNPTgEQp7YLrHXuKc26mUAQPsSO6nKQgVxZ6yvv
	baUXurRuy32Gz8AMgR1/sPeMZo2vbHrGtnHIHz2C1td7l6Y8dIxU2W+yetM7UNM=
X-Gm-Gg: ASbGncvdNWl29jptT4NcrTlrpGg1ecSHMwngPvOxXp3UVQ7X59tmQpvXGmqK8Zbupu4
	wYs2CQvlDrJNNWYWrzLMhRa6hZd/XMXpBi+TNd1ybPVnzKi1CwKkO6rnAisLjdxkRIoxQIqn00i
	OTY968oj4c1Y5OUA9rOPasPDLUGunRqaSDik96tVIrueM/wfgqFC/7CFTv9XHcpC4PEs293vy3i
	VwLUq/yjvneaRvT6LRLhm50a7/cuns31hJIhVz8QBY8kQ901MNNXqm4bci4VclNwvSPBcDu9eM4
	Y9rif47VrztMwPjFSNs0uWQykV9zHia4bDBIbhHDytN35LibqXMKTbQ=
X-Google-Smtp-Source: AGHT+IG6/Z+Rri3hr4qvHP6StAr0ON9USjeH/PioUg2db6lXPHGQJycOyjvnq3k1DASkiPsG+dguug==
X-Received: by 2002:a05:6a00:a83:b0:732:2967:400 with SMTP id d2e1a72fcca58-732617bfe3amr12464017b3a.12.1739782710139;
        Mon, 17 Feb 2025 00:58:30 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:29 -0800 (PST)
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
Subject: [PATCH v6 05/10] genirq: Introduce irq_can_move_in_process_context()
Date: Mon, 17 Feb 2025 14:26:51 +0530
Message-ID: <20250217085657.789309-6-apatel@ventanamicro.com>
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
index 56f6583093d2..dd5df1e2d032 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -615,6 +615,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -623,6 +624,7 @@ static inline void irq_move_irq(struct irq_data *data)
 }
 void irq_move_masked_irq(struct irq_data *data);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 #endif
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index e110300ad650..5acea2ac57be 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -127,3 +127,14 @@ void __irq_move_irq(struct irq_data *idata)
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

