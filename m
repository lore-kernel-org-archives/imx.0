Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15903FB041;
	Mon,  2 Mar 2026 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459241; cv=none; b=sT1kVNdNi0MzZturkK1xD6qlXHf43GxsGV5CgvpDHGE3MmewgIs88DvuAjYb5HnWdOSAMnQe2QVozyd9rI7Td7lel5zYVe9wh5ZCFwiwrSInB7TvH2PDIW0HLHJxCckdxd8infUdvW/BRCH6eRZYqfC37OdYN1fNIviigGPCZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459241; c=relaxed/simple;
	bh=W5nnZweFf8NNDcW88ZMmJOYPXBTB0NTyBzW2KTU+qlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JPfGgnagRCTqYadUhiZmnZapmyyup0Lu3/NCcKB8ECHsTcHZZixyQpHiKU11IocaV/3tUdL9Vvn5DYaBHKTntaaWCt8ApRcSwrwqwDCyE21u436wzBMG6pkpStsnFQuCyExwspqNlHE1Le+ntdd3SMtr0ClvU/6krvAe4TraIUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BN9FwMgR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN9FwMgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35D2C19423;
	Mon,  2 Mar 2026 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772459241;
	bh=W5nnZweFf8NNDcW88ZMmJOYPXBTB0NTyBzW2KTU+qlw=;
	h=From:Date:Subject:To:Cc:From;
	b=BN9FwMgR9bSG6+naySUYK6iY1nAPDyLVXNpxi9Q5+Qvum2wnCGAZ93hxFSqli2YDe
	 GZfXKNoLn6JBgAuR05V8drM9y70TQLw6hePImkaAz655J3DDD825nFPfIliZ0I5HGY
	 ua+UbAIG0uCXwcMPrjemFU4jTAF+VkJ+BLcBsLs/RbDU/dyuV2ipAFHa31p+Nyg7xn
	 xYfyMkcXW5g+udI3Z0sauzPgdCPpeHmAJuoWBSonqFv8i2lDAFuzHa/T0bniH/cw4c
	 gZWHl4ktXvxIMUnXyTO+yj1y9FEx0boOZCXtEK7QK/1r7CGh3BkE0EasSQH2ZC6l0U
	 MNQurDZWGmEDA==
From: eballetbo@kernel.org
Date: Mon, 02 Mar 2026 14:47:12 +0100
Subject: [PATCH] clocksource: move NXP timer selection to
 drivers/clocksource
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-fix-nxp-timer-v1-1-af4bc62d4ffa@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkENivpKdEhdaw9ZaIQg/j3pO
 DAzBRJFpgSzKBDp5cRXaKA6AfbYwk7IrjFoqQfZS42eM4Z848MnRZysUd64cfPWQWvuSE34f8t
 a6wf2bI0pXwAAAA==
X-Change-ID: 20260302-fix-nxp-timer-9cb1fbd7afcd
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.2

From: Enric Balletbo i Serra <eballetb@redhat.com>

The Kconfig logic for selecting the scheduler clocksource on
NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
prevents 64-bit architectures, such as the NXP S32 family, from enabling
the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).

Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
drivers/clocksource/Kconfig. This allows the configuration to be shared
across different architectures.

Update the selection to include support for ARCH_S32 and add a "None"
option to allow using the standard ARM Architected Timer. The Vybrid
Global Timer option is now specifically restricted to 32-bit ARM SOC_VF610
platforms.

Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 arch/arm/mach-imx/Kconfig   | 21 ---------------------
 drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 6ea1bd55acf8de30ce300f906924a12c27baa169..a361840d7a047863af85205161aa5bd30f335ab2 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -227,27 +227,6 @@ config SOC_VF610
 	help
 	  This enables support for Freescale Vybrid VF610 processor.
 
-choice
-	prompt "Clocksource for scheduler clock"
-	depends on SOC_VF610
-	default VF_USE_ARM_GLOBAL_TIMER
-
-	config VF_USE_ARM_GLOBAL_TIMER
-		bool "Use ARM Global Timer"
-		depends on ARCH_MULTI_V7
-		select ARM_GLOBAL_TIMER
-		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
-		help
-		  Use the ARM Global Timer as clocksource
-
-	config VF_USE_PIT_TIMER
-		bool "Use PIT timer"
-		select NXP_PIT_TIMER
-		help
-		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
-
-endchoice
-
 endif
 
 endif
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fd9112706545425ad54a84b0c992cf09795c26c4..b5c88ec658025803aa42a034c3f3ce04ab13f7ac 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -794,4 +794,35 @@ config RTK_SYSTIMER
 	  this option only when building for a Realtek platform or for compilation
 	  testing.
 
+choice
+	prompt "NXP clocksource for scheduler clock"
+	depends on SOC_VF610 || ARCH_S32
+	# Default to Global Timer for Vybrid (32-bit)
+	default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
+	# Default to None for S32 (64-bit)
+	default VF_TIMER_NONE if ARCH_S32
+
+	config VF_USE_ARM_GLOBAL_TIMER
+		bool "Use NXP Vybrid Global Timer"
+		# This option is ONLY visible if we are on 32-bit ARM
+		depends on ARM && SOC_VF610
+		select ARM_GLOBAL_TIMER
+		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
+		help
+		  Use the NXP Vybrid Global Timer as clocksource.
+
+	config VF_USE_PIT_TIMER
+		bool "Use NXP PIT timer"
+		select NXP_PIT_TIMER
+		help
+		  Use NXP Periodic Interrupt Timer (PIT) as clocksource.
+
+	config VF_TIMER_NONE
+		bool "None (Use standard Arch Timer)"
+		help
+		  Do not use any specific NXP timer driver. Use the standard
+		  ARM Architected Timer instead.
+
+endchoice
+
 endmenu

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>

