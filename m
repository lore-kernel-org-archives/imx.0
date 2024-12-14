Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77F1A8F94
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197215; cv=none; b=HISKGzwh/SHTzm/9PGg1n8jbUn0uzYi/8wGLvXAzyOtIoWMU0DoYrpEd/IfRnH75B/3Zk5tBC5Uj9az5Ol6AkuWk8PXkltNsi7xVH5hkRJ5zmKuYjMRggu1sz9+TLRCOhvtNMhakpuN1Y+kBpy+aqOO0HJlYOX3hwKUfj87Q1dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197215; c=relaxed/simple;
	bh=aE+CJCpUn5kUAnEgYyEV3gtDvbC5Svv8OP258wfgmN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVeCrURO8m7Pi4RFYu3BWBhTExqzGOGRea56OPz7NHxNOOX9w00Vr42U+7YFpAPlwdP+KZB4HC2kPNxfXbGMKyA8TEgh+twznBC7MXLlgPupMe64MxF0Roqt9smFALI9jeBZQ6g1gYVw8g+mkcc+8MrblIti/hKq4h7F8tY6JzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=RTK2KRNY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="RTK2KRNY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216401de828so22845625ad.3
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197213; x=1734802013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=;
        b=RTK2KRNYAB1JFHMvzrBqOMU6Bc059Qt6t8ZFq/IMyuBkzbAh2Mf5Kt7TYpN33dVRd/
         Zs2iTLFy1gAkFjX+puqTFdGWMlhzY1od5KG2eyXV9Gr8MB8zu/W4wHWcuEXjz72EBe3r
         16YGyv3gbmojw2wb4jsjhGc53aB0i85x9v7QDrxrvCTXlTecvOpBPwCJ3nRlDBqeK8mL
         E9guE58g6Y5+2hr4V4BR/Ro+DzQnvqeDeKZNL0h+xu0wPUGoFhIzAC8oDDYPq9qrcrAi
         cXOGpPhkxlAgaIgW6mHgcoDIMSAauuafgPVrw/B00LKAvoLwAXbxkHndU8/c6XJIS4rU
         Vprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197213; x=1734802013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=;
        b=Q+4kttDDKnI7oia6H3rpThgtMeYQRlLd3KfcrKuZGAD1hGC384kq27Nhj4HWtbbj3r
         4DVqrH3bzfmUL6rHb0oZ8hfuvMO2XKxHGDXCbxkf0VNoixxqtQRr4AcROV64/8/Y+akQ
         uMFrMnVzByiHcsO2DD4yK6bmEkHTwqZ1ZVU4s4N2jGtvq8ipH9j2jNeDGLvuxUE7h34G
         nxnQ07nKLpo3LVTiDW+jtxKbw00ZveC9svnlOplq/v8idrEtqJWOphtMp2sf2u06DoVm
         LDUzBBD7aF7seCeAuPET5C3vhyjyZkO+Wz42giptO0px/mXYxE4VvtF1iZLQ1k+FGA+l
         Qvug==
X-Forwarded-Encrypted: i=1; AJvYcCVOmrlp6SBFeAlUZpMlLw/DSAKJiJkT0eOrgczxRpYwsPQ82RCyRvc01GWr6F+Oa47tBag=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7QHhaCNomtvWH3Fc7Z5NIZWpu373S1nk/cz/uhm7SuIPBwcoZ
	ATI+j+oM49EFYpHWw6kjFC/eR99AoUr0oLoUV0XatO/g+9srasyeXsbqyR76u/I=
X-Gm-Gg: ASbGncvoNJyrnpw/TwTDrHLnDX9Bqlgc1r6koWwzzA85/ujUMvVBzJ2/rNGKpRqL9gJ
	D7H3MAiG7UiqlZVZuHANcFWwE6qDkqDQ8pI4/5n4+1DvJLpsIUHBmmkmkg+WKtBlpix0fTDPNDR
	rFKmzNv2K4w5BwmlxZsJAXiReN7X7XnBNjrOlNLPBa78QXzQx1B5kX/ood0CSSccIu6DVVdeC/w
	Y5zHy1G5luzBCtBthEMTBtmZKTkKnPWzTvnVOzn6EQipaMj9ipmd9tfSpzxKoJsi57ShdpnDLoe
	Eoq03gatiQyIVno=
X-Google-Smtp-Source: AGHT+IFHcRze2J0M8hyBJEZA/NeT8/eZWD7tT0rfNtTykqj4Jc1ZWMZrjfrUoQxfR7mhTVQoKpV61g==
X-Received: by 2002:a17:902:e545:b0:216:30f9:93d4 with SMTP id d9443c01a7336-2189298bbf7mr99837005ad.8.1734197213088;
        Sat, 14 Dec 2024 09:26:53 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:52 -0800 (PST)
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
Subject: [PATCH v2 07/11] RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Sat, 14 Dec 2024 22:55:45 +0530
Message-ID: <20241214172549.8842-8-apatel@ventanamicro.com>
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

Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS for RISC-V
so that RISC-V irqchips can support delayed irq mirgration in the
interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..adc878f029fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -110,6 +110,8 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
+	select GENERIC_PENDING_IRQ_CHIPFLAGS if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0

