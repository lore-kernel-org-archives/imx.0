Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AC37080D
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545542; cv=none; b=S4QqhDfFjVT2NNP+FT/ymX7kehlpj8u2KZf3/aFzCYfKXMyWpoa0KjQtvzUbLrwxyzj/DyttRLeawERqhLDPl6Z3bps/cGVu5JHHqAf+GfORiepQtvoLaVx4KVCQT4NsHeoOY4RfGCRpz601I/oWIhs9xrX50vhUoV1RFJod1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545542; c=relaxed/simple;
	bh=Ual+FVg1sP1hRISdeCnWZofUMoPKpvVvuom2H7m3EJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uM3Be0Qz/wP59xjPSwClS1c4fwlKFgksdixHgERfq7nAI3EYwbYqE6pkvtpeOVWUj1HzHKdat2hhi7pbq+lcil+8MapLQSpM2zE8qzRSP5CZTWMQATOkNPnaST3xitdpZEGJBPJM/eE7o3Yi8yEqVNoF0DfAzfS0uAhfGYQ32j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwuGlA0H; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwuGlA0H"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9159da9bba5so268302685a.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545541; x=1782150341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTBv6R/3G1uCLiky+ruAoiaz4p72UU1rBx31/thiEMk=;
        b=AwuGlA0Hb6oPD3DHzo2D9uVKFg4bUx94eBmUPCI1w5a/LX+P2cSoaGdyMlaNqabVMy
         2bdywFaTN1qAp5u071TRXLubXR/bEz59u3WJaBT8awa6ym2JIZ2AYq5nphM1pKr+X8GC
         cLGN3ncjrsZwxQWwzviwKWYlavnI2pC+pB1lFiHIlvtztc/3UaAjZFCvygSTPKieW9d3
         Xpp3LBmlQTBhApF8GMnLecGYId0of/o4ltSiPDVRvJllq6ZWRRF0NJNhUe1M3K3Buthx
         PLzTSNfnxB+onVu4K4YE9pUPRbcYk2evl2C18oNdMnyScg20Thu9N56iZytiFZtEnHHr
         kZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545541; x=1782150341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTBv6R/3G1uCLiky+ruAoiaz4p72UU1rBx31/thiEMk=;
        b=C5TSK6Y8aK3r5naCMJxGW1MPK3NuupbSWazaCRsidJw+cvCKz5OQt5qfpVgGMOWl8P
         41PEEx7g8ymwwgnOoLEAGlNY4/ItIlccGkX5oGfPpeOhqdf1OqLSHPDdanTj9ytVar06
         SrA+b/dFPQJxFplyCnFPNcqcDbpIsxlnRxqaznJuP2oHy1L11BgSGUfD6IrjV7fl8PLV
         a4iWnW6nDGrAqH9cCCqS0V6wXLh4J65jTugCFHM8dTRkRaUYff6qmyg76Ukttjgy5eZD
         mcXY9c+u0+7nblKwQUvZBmg24LfFfs4zqihjjpzfww1+VxYP6AtqNlYGc+ogtG5/SvhV
         w5pg==
X-Forwarded-Encrypted: i=1; AFNElJ8pfvv54kFB832WyMliZNpj/Fivqzhn10Sk2Peqp/TUFI3vYXxyc8XOcHkBYJxrPYMo+gY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh53KsMhUJZ7NTk6imMEq7V9JvQrwbTSEg1sfPJw5IAYlsI2mp
	Mli4y3LWxOuXSzgd0kuzBA3y9lAs6oUiWUr50+Hihx7rWi63gw7D+Oz7
X-Gm-Gg: Acq92OEVVPH1URs/3tNMU/s4D/xsXm0jQ1AnKPYY3lhtW7JVm0vcCHBq03cjr3IVMmn
	7Js5TIXftlIXdqgZIMtTz88Wf30Dj4C6qqwJnqUBGWj5PUXSSITP4aDrVgsfM7zWigD3zs2O3rI
	9ZEYeYEYOGxC+xxaNVwCgkLFkJuJ5JpfaEHheg08weqka4LWL89Lg4wG1hX39e13lYWiemrkXu5
	Gt6OnKxztX0dtZfVrvB1o95FwsraH7UbNW6jpnT4NmfdMJe/XRuWwgO37TatnaI4Im99jj3lvvi
	oybqgV/uD+qN8ByE89MUK8YQp21whJD99IwOI9IGQdvyKpKUcNvzXiuCTtSMCMh0q+znwqprSv0
	Id+nmI9EzePHwnZZbduWZTBCu2hjWRilXCU34iKplcLnHxTGhEZ4Jrqjev8j0w2tEI0mkSGl5Un
	twW7AA5yvOhOMGH2p6pAKshJFHCIwU4ko8MUjTCIovk4il8Hq+9Oo=
X-Received: by 2002:a05:620a:4688:b0:915:fad5:90a5 with SMTP id af79cd13be357-91c48a33205mr8247185a.54.1781545540422;
        Mon, 15 Jun 2026 10:45:40 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a035849sm1176338185a.33.2026.06.15.10.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:45:38 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: imx: avic: Fix OF node reference leaks
Date: Mon, 15 Jun 2026 13:45:35 -0400
Message-ID: <20260615174535.701013-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a device node with its reference count
incremented. mxc_init_irq() looks up the i.MX25 CCM node for of_iomap()
and the AVIC node for irq_domain_create_legacy(), but does not release
either temporary reference.

of_iomap() does not consume the node reference, and
irq_domain_create_legacy() takes its own fwnode reference for the domain.
Drop the temporary OF node references after each use.

Fixes: 9b454d16e57d ("ARM: imx: avic: set low-power interrupt mask for imx25")
Fixes: 544496ab5cbd ("ARM: imx: move irq_domain_add_legacy call into avic driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-imx/avic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
index 3067c06b4b8e..6873a50bbe2c 100644
--- a/arch/arm/mach-imx/avic.c
+++ b/arch/arm/mach-imx/avic.c
@@ -173,6 +173,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-ccm");
 	mx25_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 
 	if (mx25_ccm_base) {
 		/*
@@ -203,6 +204,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 	np = of_find_compatible_node(NULL, NULL, "fsl,avic");
 	domain = irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, irq_base, 0,
 					  &irq_domain_simple_ops, NULL);
+	of_node_put(np);
 	WARN_ON(!domain);
 
 	for (i = 0; i < AVIC_NUM_IRQS / 32; i++, irq_base += 32)
-- 
2.43.0

