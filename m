Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02262D5932
	for <imx@lists.linux.dev>; Sat, 15 Aug 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786807925; cv=none; b=p40GyMGX03Q+fUCE3YafrRPQ/c01V6Oi94RDOia9InDABI8uvQ0CG37m5NnK2HWWvmXaYvvocwTy0DA7cHGv58ISg9BFaBW21RDDZxnvp1cP2GHVJcgY74/ckO2tUid3JDFthT6PQ4Jj/ZleDEszsKcq3nMA5pmkR9pxZE7CO8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786807925; c=relaxed/simple;
	bh=LOiuIZCM4KA/xzhMRXgDS+srE7qigkhYJQnVg3UrBzc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=V7RdKssjLILgXsBEciohKGfRNiS4Vj3GJDK3WmvGSAK+poVkLGgX1qzAsS5mr0X4CIgcUXrQki2qyykavZ23DJA8MQ2qpP533vYT+XVqcs714AcsUVOR97Q1sMiTu1akO6jEI4scd7PhBJkRd1OqFQUxLUF3lTtNsjskXKyQ788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P83yak4f; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P83yak4f"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1971113f8f.1
        for <imx@lists.linux.dev>; Sat, 15 Aug 2026 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786807922; x=1787412722; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jnre8c5ELyuSiuJWMhk8ldl+BWHHGb0FtLgEFX/aWjw=;
        b=P83yak4fFvGoPi9xLb20SXSSim4ClpxYTp3gpgVtCzyX++Mj85wJfhAkk/ZFQNewpp
         K/da9/W31h3xd6UxWUPs5qG+2n0T2+wRM/O0j772kE0O6qfBQ5ItF1sAuRSVjgo8my66
         yCXDYIeQ5ELXo8ucxn3ioNH/bw643aSOeF7zN7ARE7Fq4MdCdO8MAXUr8P69a+Nkh4HV
         y0PqKKG4zlFEz4Dln3gQ/UAW6fJ8i/cePAIDCMVXRbCeVzVlmCb4OLyu2xEWpFVHMek0
         q79TY2m0aacxRIrTJi3piEngPEr2e0fuGS6d1BPIa7ewUAORARYjtLaOL8tfRfjuFhf2
         Ftuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786807922; x=1787412722;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnre8c5ELyuSiuJWMhk8ldl+BWHHGb0FtLgEFX/aWjw=;
        b=P3tgzJ6DMV94CO+8s+d1ReNIdGixditG/1BtRivFthv0dCH95yLHkBnZl2pNLEV9OX
         /XhNM2GNGf5OOuTp4rzNnOJwI9nJFn10uyJt/fEUed0iCVocKS8aw82PNVVT602HKpY8
         PUvZdMTdBYeQ0geZJ9Tapmi5P+L7AhhXHdkIAz5s6dUCz3LTB9EBMFaR3Hacir7yTdtR
         nALFbrvOzPaB2qerw6LuStS9OR7BHitfwelR04gLve4OSFzZSl+/DRgToiZ2X/ZDSpf2
         CTQEH0hO8LOhCxHZyyeWpqmTI6sBUCEiOSb9jGqkmcMbxUZvm2qkexpER+CfZSR8YzIR
         oKeg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc2iuqQsdHWsWw7nNQXNU2dum7JrFJA10B0+hu6ILmA7WX2J8W3QzUSGW5Sue8VsfMUck=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7Xyv6vgzyyn6hMLn4L/5dKjSngAjTd9ow5ACpQ83kS3UwaBdr
	YBFDPc3MzjAH0ymtEPVJ2WQ7vKGbNhvXIlvXJYIpa1nE86rfqcf839tZ
X-Gm-Gg: AR+sD13eDTdrQzAkX8aHDukFUJnXknu72I1Xd1FuVrISq7faioGZHuxXjnKARKWP9sA
	HhGx97MogMayBeAEhwzj9z1juHVAUJS8F5NXJ3NYWfxulTVyA/gz2N4SRHJmY9xeJW3/BWI0wOH
	YH65gqYx5/M0QqtS//t1vMtGH8Js62YhOIays7C69za46w3OMyxBlQ4E/eIKOR6AYXjznGwT10M
	aN6B3Mjno9RRDgG1siwm0tMKZvyo4BmsYLyiAI3CbZcUL6Urmko6OQNFi2SAvtK0snwIGPmAemS
	xAM9UO5QuAfAgKw4hcqzu38nQutNnDzQV8CZYU/XyDViMfc1rpMgjDuGsktwC/Tyu3uJuoOPPBH
	uFpMIqO8BIPeqacCoTnJ+yLsdmqmu3tDzwhSlLpBjQryNCBwAPXk0KKzPyyAMNz71TUTvJa1QVm
	bKOXoM9pstk7eoQF5ksO//WzSGrtflbEvC3s4tQQ7Hy9JRnNOHoymadtfgYTNN5aFeJT1R9BYTk
	xo9k8sZ4KQ61xcfON0w5aoa1NPZE4tLdqmWo8FezoTBGoxTZNbuzjPTL0wB88B1Z5vyRoEVCuBs
	h+G8uz9njinKguyd+wjC98bOf1BhtoL4X1anWQ==
X-Received: by 2002:a05:6000:992:b0:481:4f7a:f685 with SMTP id ffacd0b85a97d-4816076c695mr20415359f8f.29.1786807921745;
        Sat, 15 Aug 2026 08:32:01 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f13:e300:f992:e6b5:6d1d:31bf? (p200300ea8f13e300f992e6b56d1d31bf.dip0.t-ipconnect.de. [2003:ea:8f13:e300:f992:e6b5:6d1d:31bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm18253466f8f.1.2026.08.15.08.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 08:32:01 -0700 (PDT)
Message-ID: <8fdc784c-5e2b-40ac-aed8-7639f43df88d@gmail.com>
Date: Sat, 15 Aug 2026 17:32:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ARM: imx6q: remove KSZ9021 PHY fixup
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Stefano Babic <sbabic@nabladev.com>, "NXP i.MX U-Boot Team"
 <uboot-imx@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

477fce49aef4 ("arm/imx6q-sabrelite: add enet phy ksz9021rn fixup") added
this PHY fixup in 2011. In 2013 954c396756e3 ("net/phy: micrel: Add OF
configuration support for ksz9021") added support for configuring
pad skew parameters via OF, removing the need for the board-level fixup.

Note:
In 2013 14078291d89b ("ARM: i.MX6: call ksz9021 phy fixup for all i.MX6
boards") extended usage of the fixup to nitrogen6x and titanium.
nitrogen6x configures the PHY properly via OF, and titanium has no
mainline Linux support. From u-boot titanium support was removed in 2021.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/mach-imx/mach-imx6q.c | 30 ------------------------------
 include/linux/micrel_phy.h     |  5 -----
 2 files changed, 35 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
index 7f620092575..58f53fba202 100644
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@ -20,26 +20,6 @@
 #include "cpuidle.h"
 #include "hardware.h"
 
-/* For imx6q sabrelite board: set KSZ9021RN RGMII pad skew */
-static int ksz9021rn_phy_fixup(struct phy_device *phydev)
-{
-	if (IS_BUILTIN(CONFIG_PHYLIB)) {
-		/* min rx data delay */
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
-			0x8000 | MICREL_KSZ9021_RGMII_RX_DATA_PAD_SCEW);
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_DATA_WRITE, 0x0000);
-
-		/* max rx/tx clock delay, min rx/tx control delay */
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
-			0x8000 | MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW);
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_DATA_WRITE, 0xf0f0);
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
-			MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW);
-	}
-
-	return 0;
-}
-
 /*
  * fixup for PLX PEX8909 bridge to configure GPIO1-7 as output High
  * as they are used for slots1-7 PERST#
@@ -68,14 +48,6 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLX, 0x8609, ventana_pciesw_early_fixup);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLX, 0x8606, ventana_pciesw_early_fixup);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLX, 0x8604, ventana_pciesw_early_fixup);
 
-static void __init imx6q_enet_phy_init(void)
-{
-	if (IS_BUILTIN(CONFIG_PHYLIB)) {
-		phy_register_fixup_for_uid(PHY_ID_KSZ9021, MICREL_PHY_ID_MASK,
-				ksz9021rn_phy_fixup);
-	}
-}
-
 static void __init imx6q_1588_init(void)
 {
 	struct device_node *np;
@@ -179,8 +151,6 @@ static void __init imx6q_init_machine(void)
 		imx_print_silicon_rev(cpu_is_imx6dl() ? "i.MX6DL" : "i.MX6Q",
 				imx_get_soc_revision());
 
-	imx6q_enet_phy_init();
-
 	of_platform_default_populate(NULL, NULL, NULL);
 
 	imx_anatop_init();
diff --git a/include/linux/micrel_phy.h b/include/linux/micrel_phy.h
index 9c6f9817383..bb71b2510c2 100644
--- a/include/linux/micrel_phy.h
+++ b/include/linux/micrel_phy.h
@@ -47,11 +47,6 @@
 #define MICREL_PHY_FXEN		BIT(1)
 #define MICREL_KSZ8_P1_ERRATA	BIT(2)
 
-#define MICREL_KSZ9021_EXTREG_CTRL	0xB
-#define MICREL_KSZ9021_EXTREG_DATA_WRITE	0xC
-#define MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW	0x104
-#define MICREL_KSZ9021_RGMII_RX_DATA_PAD_SCEW	0x105
-
 /* Device specific MII_BMCR (Reg 0) bits */
 /* 1 = HP Auto MDI/MDI-X mode, 0 = Microchip Auto MDI/MDI-X mode */
 #define KSZ886X_BMCR_HP_MDIX			BIT(5)
-- 
2.55.0

