Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3A39C637;
	Wed, 13 May 2026 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696578; cv=none; b=tV/CY4kBih93zCf5B4bNZr2/8ewEsPOxpLWG2rjs9pXaKxBBSjlpEA0efoIzbm1PsPWSebsVuBvQlzBW/zLdcDll8O2EZBnbICKKAztSFnaUpDoVw3o2s+pyNTJ+yGfpIGerP7D2k5LFJ+BmoIbZJTn9VN0imNteQU9S7ZvMPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696578; c=relaxed/simple;
	bh=PSooL5ZH+dxgPjzMQBWlQZM+uqKj7LMtxK0Ge7AEP2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g+wOru/EnBVDzPsHihhFlYzsu/Wzhsi8CQlD+UOHB2keaaKJ0on1wdw0Ogpj/wukp/rM/lWjoKsCf68NKvvgKOvRBUaLIO8e4bV0UosrEdX8RToomaovGksf9Dal7dpsPujjBrcsa2bldMYrNUoOfnWePnsZa8ugyWBxAQe07ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAn1yUpH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAn1yUpH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C53C19425;
	Wed, 13 May 2026 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696578;
	bh=PSooL5ZH+dxgPjzMQBWlQZM+uqKj7LMtxK0Ge7AEP2c=;
	h=From:Date:Subject:To:Cc:From;
	b=HAn1yUpHcqnEmLyfP5AQVDv9BTDnZDo9JQH+JTF9hqFbs/TVwugfxD84V0uG46UNK
	 BM+7E/yky1TE+hymEG//F5XlCOYN2s6E9yL2HKKeqy1BVqpwikh23CjnhKfs9pkde8
	 4BQX+IxWaT31v2aQp7mJlDdr2R0/r1yHtm65UNR1JhcMVAu3CFEsr57z1PzmaB7EXq
	 e3uZ1Q1kCjCqYBygSxN4cGMkxpwn/M9HqXKClBvqHOaFyAj5Wi0DCOjdiqPgjugG6W
	 hrGkKGTiEoRPSr3pP/G2aCSiVTdQsGjolLj/GGUQu+f8qbQLBvn2HcoeuPk6mV3gV6
	 HVnx0yjHhu9KA==
From: Enric Balletbo i Serra <eballetbo@kernel.org>
Date: Wed, 13 May 2026 20:22:37 +0200
Subject: [PATCH v2] clocksource: move NXP timer selection to
 drivers/clocksource
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMOw7CMBAFrxJtzSLbREFQcY8ohT9rvEU+si0rK
 PLdMekp5+nNHJAoMiV4dgdEKpx4XRqoSwc26OVNyK4xKKEGcRMKPe+47Btmniniwxrpjbtrbx0
 0Z4vUDmdvnBoHTnmNnzNf5G/9VyoSJWrfGzso13uvX5Fc0Plq1xmmWusX38DmnasAAAA=
X-Change-ID: 20260302-fix-nxp-timer-9cb1fbd7afcd
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778696575; l=3631;
 i=eballetb@redhat.com; s=20260512; h=from:subject:message-id;
 bh=ZKQ+5Zn4AouJzksg8Q7tp9yGqOeq6zq6Pqnrb7HW66Y=;
 b=E0GBl4K3fVMf8UCS5PUTZ6QiceEcqApT/KV1zILaMLewnWR37heyyMN5TMejYL6fh0Mw/N56C
 gGLURCNdQtYCDVawSZbJi09SWYzjpQGA2SP0j40lEi7e7EmTl4KKlVL
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=HEWGfVmqrAZfJ4JLImY+V4jOfS+bkE5CQrdmm/kZq5Y=

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
Global Timer option is restricted to ARCH_MULTI_V7 SOC_VF610 platforms
to prevent it from being visible on Cortex-M4 builds, which lack the
ARM Global Timer hardware.

Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
Changes in v2:
- Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
  ARM to prevent the option from being visible on Cortex-M4 builds
  (Sashiko AI review)
- Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc62d4ffa@redhat.com
---
 arch/arm/mach-imx/Kconfig   | 21 ---------------------
 drivers/clocksource/Kconfig | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 6ea1bd55acf8..a361840d7a04 100644
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
index d1a33a231a44..15c02d3e9dbf 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -793,4 +793,34 @@ config RTK_SYSTIMER
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
+		depends on ARCH_MULTI_V7 && SOC_VF610
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
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>

