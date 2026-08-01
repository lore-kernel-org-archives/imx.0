Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA83CCFBD
	for <imx@lists.linux.dev>; Sat,  1 Aug 2026 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619364; cv=none; b=ggKi7wmcVDAgGKOzy3w3eezqiWTvt7ywvhcnQjP4tToiTFhsulBdjsahg+YKNmkduL9B2kZ3rKH74oSBL1BpG2lvksviuWeUw8+TWVLqDjE3zWY973zBo6nKIE4IYeoD/RvRlBiNdMblm2uls9bZUEVNv0P/z8Ssku4W8plhZLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619364; c=relaxed/simple;
	bh=8lVzvrdPHQXNjyV29fGvYBAe0DV03AGaIZ2hwuOhPr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4SHvXeqI5TsV0wKMvBctwBeJiJXGR/G9evMS4NeUf+6sehbPigNxkQN3AOTQvdqD4+4X7PLoaj7zglZeTMRA889rxii1IFrDCvstyFRySfmzZTQcGIoKgeU7QSHBFaIi57czuf8yhMGsjhgQmyOVDWsCDCDSInUi6mQ+FvYy2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHqO9f6G; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHqO9f6G"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1994357f8f.1
        for <imx@lists.linux.dev>; Sat, 01 Aug 2026 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785619359; x=1786224159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YItn9UN/FPZMLv/eaPs9b++UQIA6LNhw5J6n7UpAldo=;
        b=ZHqO9f6Gr8AvnEQQM1ZqvSAfwJ2sqQ+ENgfCaQQE+Rjf2ObSUDfafIgr0F4OXlwowY
         V97RhmRrf7RT/MvfUfUPbYhbyS7IhVhPK5WlrmnO17mw9HwZ1jhnJkKaYp+SdEoakMSu
         Q8hTcERF//q2NNCbjyYn/Lt7K97squNxBG+Se3mmMoyhASMjEvbLwFl8RiLVulIuokcz
         toQa3pPHCrvmK4xUIGTx0YMj5O9rp+q9Z4kJR6xo9kNTbmqhzphcETQOLKmZvekEhAxZ
         WCq/y+1XP/o0wX5UUNaYW2U37WKmeUKvzpFepkOT51WwgPdvXAwzR7IHKYuaEGlG3asN
         x7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785619359; x=1786224159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YItn9UN/FPZMLv/eaPs9b++UQIA6LNhw5J6n7UpAldo=;
        b=axCSPutPRqJRLs0FS2+d2LK0SfJTorh6wiAv+4jdSjyv526VyWefWGZcDFCwUf7ISM
         hypS7SBdPNMvJ7SgGDldb/7aDhm3dGD6zuyT0yye7b8wEFje/WMedzJwBYrEei64V0Kc
         mBbu6EFi9begyvb2fGK1aq5fI2iqgHWP432t1R42cFghQYHfrTENfHlM7GnwQq3n1VU4
         EgS3uioy17RuuxrkEGma8FdpXBB0NnEP5Y9oM85uGkT9KYAi3iR3BMGoBEITqEsubM+C
         FdIsi3YpdL556kFr/mGddVX5QWKAJzoTF+MlNoKFvy9JJKmDNPXGxC0xEcjDsMBk1KK0
         n8vA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7YEVtsG2UAfKvmI893vEYX/VQXyU9/ZY9ZxheOyR3tQ90Er05lYRPVIaxn3ZGOuQPP6I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxno4nKOtGrYvnaX+GuQIsm25qQy/QPleu+Jt2TMmhhEVeDfUTw
	oM58x7OPIMoZhsWepi71kIfIALU/brZcwv5hfKrM9tXPxqdxk9Dqt9FG
X-Gm-Gg: AR+sD13yJuuyttvMt5OXVLB0y/rpXGFyuOVu0kE7ONJyZ+kU2MA+ijH2DLJ+jpykMaY
	cTVmZ9D/YtN8WfUHHe9xTpAxCVzRxP9gq7M509E5Lrx45wA4CCWNP46Gde6DzKGmBDdjkKOqc+y
	DArYbmJmpwrn+uBIEikCCS1nJi9USy8cBfbUZEt+59EnbvM4ZnieKNID5u4mVCninXWXeJ9C2ZS
	ZAHTe8VNLPrUlL49mZ7pq3At1BUBegfcOtrUl78GNhNh7q340/Pw86GFYOD/9c0mMjqLxk6eBek
	oWrXxOIlRCWf5mmZhuLViBd1t9xXbhyV5NMFv8yjD64ThiX7GM7KFcOd4QWx4+dwzPTDOR+mwOW
	z6aqkO6MkXxt+5d9OwOAyjg81VyFFL68r3dkIOEn/M43Rl0yPGeVy1C+Y/ohs0RWZ0DWhXbZx2Y
	Pr8lBFLJxgsTjDhz8XnwknRFNMZiVU3WEZ/xELyU1gyFY7Wix8No1pGX9xYdaO70vlQe7UNnXeS
	6k1NmsHTet/tDSiwpU6LByPrYq9X7UhWyWJFzqZIj3OMXNGyvAy
X-Received: by 2002:a05:6000:1cc4:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-47fd72bbc55mr9339524f8f.3.1785619359188;
        Sat, 01 Aug 2026 14:22:39 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm18102766f8f.37.2026.08.01.14.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:22:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux@armlinux.org.uk,
	tglx@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com,
	radu@rendec.net,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	arnd@arndb.de,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Sat,  1 Aug 2026 22:22:35 +0100
Message-ID: <20260801212235.2692694-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM_GIC_V3 selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW is met. However, ARM_PSCI_FW should be
selected by the system type, so ARM_GIC_V3 should depend on ARM_PSCI_FW.

Additionally, the systems that select ARM_GIC_V3 (ARCH_BRCMSTB and
SOC_IMX8M) need to select its dependency, ARM_PSCI_FW, too.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arm/mach-bcm/Kconfig | 1 +
 drivers/irqchip/Kconfig   | 1 +
 drivers/soc/imx/Kconfig   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 24bc6e18d806..ff7c161df1f1 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -184,6 +184,7 @@ config ARCH_BRCMSTB
 	depends on ARCH_MULTI_V7
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
+	select ARM_PSCI_FW
 	select ARM_GIC
 	select ARM_GIC_V3
 	select ARM_ERRATA_798181 if SMP
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..726804295545 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -35,6 +35,7 @@ config GIC_NON_BANKED
 
 config ARM_GIC_V3
 	bool
+	depends on ARM_PSCI_FW
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	select HAVE_ARM_SMCCC_DISCOVERY
diff --git a/drivers/soc/imx/Kconfig b/drivers/soc/imx/Kconfig
index 2a90ddd20104..9f0be8b66c4f 100644
--- a/drivers/soc/imx/Kconfig
+++ b/drivers/soc/imx/Kconfig
@@ -6,6 +6,7 @@ config SOC_IMX8M
 	depends on ARCH_MXC || COMPILE_TEST
 	default ARCH_MXC && ARM64
 	select SOC_BUS
+	select ARM_PSCI_FW if ARCH_MXC && ARCH_MULTI_V7
 	select ARM_GIC_V3 if ARCH_MXC && ARCH_MULTI_V7
 	help
 	  If you say yes here you get support for the NXP i.MX8M family
-- 
2.55.0

