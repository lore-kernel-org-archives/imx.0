Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F33AC0C5;
	Thu, 14 May 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757277; cv=none; b=ctjgmFj8r1dKReC9/bnqMDTbJL3p4e3jUOD+7sn+FX9PesuHffsTTDa5AS7D7YAuCqhAg6CB97mRf+91kUsPv0yog5ibbiMDmFUs/8ebi1Sqg+o1dIQLMrH2rhqbfMUcKEmJCq3BHTIUDLgeFuTjkiOaYD9vcCL+xyPQ3neXXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757277; c=relaxed/simple;
	bh=zWsNF/tTn94RSQdcgyRSetzkeSvxF7zjT9TnBTUpZKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W+d6kBNHWQTYBPKuFY2QUGvAtylxOJk/E6aNy9q17R3l/b92xiY1QrMrL7ibc8m2Gtxmzc0Xf/HOh3CR7GOeyppmZ4Zw7GJoZvYtX56Edb5ilOgjWoMHn61zfj92LL8vlYkPwRqk1IzI5xcw6GMm7AjUxH6sINlO/ScLXhPkqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsneuJLt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsneuJLt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5E8C2BCB8;
	Thu, 14 May 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778757276;
	bh=zWsNF/tTn94RSQdcgyRSetzkeSvxF7zjT9TnBTUpZKg=;
	h=From:Date:Subject:To:Cc:From;
	b=IsneuJLtb21p+xUOoGkPQQ4Tkb4QVXAIZWj2T6Pyh8XHfhQ8in7QXVoSGd1V51f0Q
	 qE5Jh2tLIC2zRxETNPq1FX3xH3f0vP4q9ipuBkE89HFtBgX65UQkvPhjR9ugrsFORD
	 J0RBhKCXyznejSyizR7NfN7eVkhmB2YWHkNNgauKSU0ZkgbDF+KBVxGUpOJHKK1tXO
	 MhsHdyZpo1SgXvzHHjhlYmzK6+06h0B1LwwwmMtHqudFn0h7jGl1BbAZeoNkVKfGNm
	 oPs6cfEYNY+ift/2a8X4XvyK72lEd2NB/fr+nTz6wriAQvqKyLKjVkJx6IA8XT/5Cs
	 8bh21ZBnqAKQg==
From: Enric Balletbo i Serra <eballetbo@kernel.org>
Date: Thu, 14 May 2026 13:14:17 +0200
Subject: [PATCH v3] clocksource: move NXP timer selection to
 drivers/clocksource
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMywrCMBBFf0Vm7UiT9EFd+R/iIo+JnUUfJCVUS
 v/dtBtRcHku95wVIgWmCNfTCoESRx6HDOp8Atvp4UnILjPIQtaFKiR6XnBYJpy5p4CtNcIb12h
 vHWRnCpQPR+/+yNxxnMfwOvJJ7Ou/UhIoUPvS2Fq60nt9C+Q6PV/s2MOeSvKjV0L96jLrlVKmb
 W3VmLr50rdtewO5yf1a6gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778757274; l=3908;
 i=eballetb@redhat.com; s=20260512; h=from:subject:message-id;
 bh=8pjGWairaSrRO06DfSoKsQGunA0RWo+g3nUWQxcUGpA=;
 b=7m8+d8+HXSaZQcJXX+CZpLJUEAUJXtaBse0usCCid3aNoNa2P6OfNkJUVWIoqLJ5xJ1emN2e/
 b3HZgce8tJkCiYdMH7Kmj8m8AulEqIdQBcKMKeO0CF+1HT0cBvfhivI
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
option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
which lack the ARM Global Timer hardware.

Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
Changes in v3:
- Restrict VF_TIMER_NONE to ARCH_S32 to prevent selecting it on Vybrid
  platforms which lack the ARM Architected Timer
- Link to v2: https://lore.kernel.org/r/20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com

Changes in v2:
- Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
  ARM to prevent the option from being visible on Cortex-M4 builds
  (Sashiko AI review)
- Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc62d4ffa@redhat.com
---
 arch/arm/mach-imx/Kconfig   | 21 ---------------------
 drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 21 deletions(-)

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
index d1a33a231a44..d9c76dd443f8 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -793,4 +793,35 @@ config RTK_SYSTIMER
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
+		depends on ARCH_S32
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

