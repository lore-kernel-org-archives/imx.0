Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88BA1891A9
	for <imx@lists.linux.dev>; Sun, 23 Aug 2026 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508521; cv=none; b=sXx6T2hNrOe9Mo7Ppp10mu5AlCUc5eg1+uRHXla6baItbXEIE9YixGl9fwEXNcNd7s8VAhyg1bxi8NXT2XRkPiB9A7aSQTe3R2nsJEd1tw9eACbj8ord9Lg4P55JCiaAPHzS0XvdCzBrdnRsIC7M6u8YMgMXaxVq7f6CaVbaESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508521; c=relaxed/simple;
	bh=d4+SpXzXQg1I0AEgLHL/3ZdYMeyuisXWriRMDooKRJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDLBKCJBT1s3WeVY/ExA0WsBZ6iQe9fAQem4o95q5URQAxaZEXrE4HSY6555xeTvOfedilz2E3bDvPIZ44i+ivvDUNGRo6KQVJw45H3c1qD0DB4yGbQnJPRfi81FQr2cTI0v3C3oq+im3XNADHYkJQfqV2aa5lztEds2xuNHWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD09Ny3d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD09Ny3d"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1399924f8f.3
        for <imx@lists.linux.dev>; Sun, 23 Aug 2026 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787508518; x=1788113318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gq37rj4bzCyBTGwM7oPPXQqhYUmg5gV71MEIz1jHkg=;
        b=bD09Ny3dsEopfDqrgIEDgUaizp2HiEH4rhSpFZnj96PjNTDydvF643YOScrUlymf8K
         UDji1GwtFmnNcFt5zdEIoBiiMXsVNORjGzcIBSFwIJRM9wSEJFCeQl9KreNA8tX85ygx
         UUm9lGaWLyvMwXej2SfeFrfPUrpFDIWnEgsGSe/LDjXrMGwtFPn1zVXOCgNfg3FuYs/d
         DZz2jDl8cp1AFPJehXNLGYoL+DJYHpgZQSXJYDSvBqTXA30bpNCRodeOwWhoZuangg3j
         I7EZ5MgGW5cH2wMKxcR2upJR1L0o9IEgspcDae63XLSwb0JkKtpCYln/oEFC6yBbMgfq
         agZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787508518; x=1788113318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gq37rj4bzCyBTGwM7oPPXQqhYUmg5gV71MEIz1jHkg=;
        b=Uywl25Tnr9/jCJ3TAOx/3RfSp5SWD/fyuKo1cOi4YOS8cLZC/QN6bcaiiGHrcj6UHn
         TZEztNffck/e5NecyN8r0wGUxd708u27MDM2FODieMlpg4DxmcRHXQwGjg3ANVfuLQOa
         xGiiPQ8fL1HTIkBCk3/IGyQLGR05UQVnGB6jHrIayaNxZazW+kUotzGaQ1KDMwxniNwV
         +e2PIoMMguI/p40NT77usjraZdN6VtbycGv6Y0fHW4uE+o/8RPnL8WzFGSwcHlceeTip
         TfjhDmGYIeql6bMteqcAyTmUZv4ekT/SmbWAuAFIP5HLvw8SCKr5tOJtOzDoiaq/RY+/
         uguw==
X-Forwarded-Encrypted: i=1; AHgh+RrCRyT/eK+mpD91iGc+gSPI0WNeW2baaQA4n3yXEObek0mPFiaMi5C4wpUpbmj1JqPeFSk=@lists.linux.dev
X-Gm-Message-State: AFuF++m2HFrsaUtoD2Y5UCh7AxMtbYSOaDOEIA6IAUVENzavyqdqPz3S
	HgP5gYcE7Ab6IYQYuox2iO+1TXXqxTXeLtERLg2NihJjaQd6YXbSV2YD
X-Gm-Gg: AR+sD12JpndgnY+NhqqAacsgExQ+EA0s0pG8I52/om0meBBoI3XjW6ZEpvDcZzUV/xL
	Mz9miEE8/k3hg2+tCup7XV7CfFJIdeWzHUekyVe9unWN/FskZ8EYPpPSS90p1wYHprjaEIMgCbR
	MdH8+E2B4HgmKpUg4KwMt18IFltc/CkU/HkhKbzsQcyVkFseAlahlJqNy9pAxIVBSwxxUwRtfZO
	FtX3UdSNmoBYQibxyL1t8GQlfTQKu7kIJLy+vjs51T4h5sfS4i3W75EYpwKWb/yBnBrRqCdFHCd
	7Q4QT/XrmPJtf9pgIZp0no/7ioY+2uO8/CnK1FK2vHW7ogTjsOs+95AlDfPEeVj01cKyEOob9+V
	96e+O69ias0AHYAguq34JJdPt7hRU2giqviX3UajL4S/91kMdD6SLU/27CN8h1j1rg9Tw0C4qBj
	CcEgMN7ifr/FXAIY3ZUUQtMCG4sqb+45ueU2cJ/gZJz1HtiJbfN3NHTlT/d9egr4CpyMWKRQQMr
	j9hRaNdPHcMoYYo2yEIflO0gZs5bBIAcqPg7Wzc7VynWRt0MZ+O
X-Received: by 2002:a05:6000:310f:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-482c0b58818mr25065061f8f.1.1787508518013;
        Sun, 23 Aug 2026 11:08:38 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482d4710ac5sm219571f8f.32.2026.08.23.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 11:08:37 -0700 (PDT)
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
	maz@kernel.org,
	sudeep.holla@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Sun, 23 Aug 2026 19:08:32 +0100
Message-ID: <20260823180832.1246363-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW, is met. However, ARM_PSCI_FW is always enabled on
for arm64, and the GICv3 driver only uses HAVE_ARM_SMCCC_DISCOVERY to
identify the NVIDIA T241, which is arm64 anyway.

Also adds fallbacks for callers to avoid needing #ifdef guards when
HAVE_ARM_SMCCC_DISCOVERY is disabled (32bit arm).

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- remove select and dependency on ARM_PSCI_FW, 
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64
Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 drivers/irqchip/Kconfig   | 2 +-
 include/linux/arm-smccc.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..dae023fed7d6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -37,7 +37,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	select HAVE_ARM_SMCCC_DISCOVERY
+	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
 	select IRQ_MSI_IOMMU
 
 config ARM_GIC_ITS_PARENT
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..248624c1af7c 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -324,6 +324,7 @@ enum arm_smccc_conduit {
 	SMCCC_CONDUIT_HVC,
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 /**
  * arm_smccc_1_1_get_conduit()
  *
@@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
  * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
  */
 s32 arm_smccc_get_soc_id_revision(void);
+#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
+#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
+#define arm_smccc_get_version()		0
+#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
+#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
+#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
 
 #ifndef __ASSEMBLY__
 
-- 
2.55.0

