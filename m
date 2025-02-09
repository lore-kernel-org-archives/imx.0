Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B79761FF2
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074678; cv=none; b=Q7ihsiYUlH4gHOdbm3wWct6XirG4u/xVtI97tJtYCiG/VTZXNRrvgZ37n2O7Ns0Hi/Jaori+Yg13x/YKz4pMbsUQ2GdvUjEiAAbM4gzaN/0fqjAFw9rqWqKsuXjODzPV6gqhJCxjLY+GoRKZdkeITYYmLrRdQ7XOD8VXgxNoaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074678; c=relaxed/simple;
	bh=PxpxF0dUlwKn44FGhlpT2SXXiblCpU8cCNLnLI9M4ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgPg2hWG7plYOBRKegYoMgr3jfvkBL0mMGuDQC3OFh7pmhbMQM/ePBMlBKB8RUmxxwduwrptnO1fwsC6UjDdLeRc+3o90NumSf3C47uSyw7YCpe6ByQBKOuFwY9wZQpNM31Pw/r4gGHxe1+7i9ochh6pNElHvVopLRZR7EYH0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HtZ8+zyz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HtZ8+zyz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa19e1d027so3768087a91.0
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 20:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074676; x=1739679476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=HtZ8+zyzL3TM0S3J2RqRdlvGXvXyXapxrexuv1tUoTgtLgHQj4brwbbvM01l9SxOeU
         0v1Bnt7tziwUex8KIZL/+Vs8gzdCqRWlp7POvvA5p4hJcQrRW3Kby3165vpC1HBGsv9i
         E1POtvI5EcNQ7Y5+FWuTs1lUVTTYXHbhqrCFzFfkSYlX6ibzjvIPsJ747PtcwHBAlugF
         4iCQUAStgu0/EuwvfjQ8lcnyE2dPjmrgBD1oA04QW2OEUB23N+w/PIeaCtDaLvEFLu6B
         oYzDfX/xNkqtBng829WPx9WSzPMSD+JiyBrcrx0y4OpIuSAOMmQBihya52gIV4p6mkfT
         xp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074676; x=1739679476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=ZG9l9qj51PBxdZSDjikY1OKW/faTnYdyBKD/8ike/w9blE0vtoiUReMDL5OLbedvV3
         UT3go90JdMfdzCMXXatJypJzPEaXzCulInnoTjDNz4bfi3g8pdXDiFEz96OAlBoitq/a
         D4eskbYCUauWxM4OvT20F+5LLALF4eIiHPxU+Ko5t2dzZJWcNESQczS49ZykTXarhPH9
         2whrwvc7eDz5yQ5XF8tGp8ZekQOPKU41WGvteM1yv8WDNbAPLgYlW/jKJpKFYJ2p5hWb
         bm14dOA6Sz75w/KCnKorfsQc61PexFGOcK6eTocOuBBIXs5sFs2z1s499eFCxUYHp7CN
         Ml7A==
X-Forwarded-Encrypted: i=1; AJvYcCWS+zcVuM4IjnOF7R7FSwfYk+GZ09dJmE2ZKhWDO8xii9rcJGZnpoZfK4rnKOjDV/sP6EA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAKnLLfd+zmKWxmWwJBUbD4QQcO5epVcpCcAfKOC0h/f00hjFr
	fsHRUOqrTlvjC8zHFBrSlO5BDc5v0viFI1xL4mngm0/kx8euK3eaKE5yMBFX37Y=
X-Gm-Gg: ASbGncsISc26SfX7IKKBO4DTu8mIymw7MmXD6RVoVaeIoJGPPSrgJfZj26L6zi3esLl
	MHAx4j9QyxYIOBM+EQXh+1BoRBtcbaMi+NHpli1ywzKEaN5U4+tzYVvoi4MYmWjE6Fqw+hv2zcY
	h2novET4GXp6d2rbSZ+3aF1Rrs9Of+R0K/IB+q9eB6HSS4sk17PPbx8OJqhIkrwTMKCFRPBu7mC
	V2sUKd5iBYfeQlYKJZsmwokwt8dEaBJ7PhQyN6g7OxftDTWpgyO0w/i/CEXmhqUZzTkbs3irODb
	3Nfthh+EwVJCPcrA3C/o2vmxNt9DJNjB2vLWADlcGAqbUU3gnjs7KBw=
X-Google-Smtp-Source: AGHT+IHDq8j70VgdWYD0/5rZSoa9FGuz2H9SOfW3ipfEG4foQkrNVKZyKea9+xF989Gz8oAitxsVGw==
X-Received: by 2002:a05:6a00:a15:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-7305d463732mr13313591b3a.7.1739074676324;
        Sat, 08 Feb 2025 20:17:56 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:55 -0800 (PST)
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
Subject: [PATCH v5 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Sun,  9 Feb 2025 09:46:49 +0530
Message-ID: <20250209041655.331470-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
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

