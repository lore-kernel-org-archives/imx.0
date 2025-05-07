Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02828DF5D
	for <imx@lists.linux.dev>; Wed,  7 May 2025 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644910; cv=none; b=EY6rS2GG41/ofSLd+GUJqVXWGtVv1JF16ewp9KlpiEu3DkjG38XpJlN+kMAbuPYxWWbKwLMbf4rC/gPu9xH4DV+XfbqvHtOuZoU+BA5BcFRijKM8TS6Xx2F5NANW5i/pURYpZpJBJ59Wb53r96JnjiArqOZxOIlVm0Mkg0kqiBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644910; c=relaxed/simple;
	bh=tQRiJGWvFyQK/9PUCW2hX+l0RRxQ63a9I+4Q/ac03gI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bDsdz+r84SzNsaiEdOyY6Ezf/EvTDaFbRiahwcFkBA4wpbUuIwbbBQQJdgRtdJdGAmmMxaf46XVp6xUQBqeN5o2m58nivp2ZGUkDuAD9MwubgEU1SPntsU0v2ZPKauvk9ierAwSlqCRz1Cc18vRy8Zs+0pEad7Sis9kTLAMXzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCd60qHs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCd60qHs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso1937755e9.0
        for <imx@lists.linux.dev>; Wed, 07 May 2025 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746644906; x=1747249706; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+1CbxS4smj2Lgzuo4bHWQYqftMNwSyBGVM2dD2Y0Ag=;
        b=ZCd60qHsiybM9Hf0IpWAS5SUyRxEnsAghX5kWm2HSp8qXSWh1yV6W2j6rmAI2pD58m
         1vNHsU1tK6tTGi5MshmQvKyM5bbZt5lHLymHhIj3aXqz4/yifzWxF9bVxdXFLYdlQ5vy
         IlxhnN1bfVkWaYFllvc2zry1IXliIB3tY452khLITXhyw+nM5qobA74qY42xKqIXj176
         E3wWJ2F9AUu/tCDJegw+Z87LPbOLuUx1JohlzbFYESJkZChfZLwrH/jaOA4o9UnVKSq7
         SF+YFNIHb+aE7q7tUen+VHULBo8x2lC1K0wAGxykGiqjn/EbR21G1spjOffXX5lTJxVM
         YlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644906; x=1747249706;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+1CbxS4smj2Lgzuo4bHWQYqftMNwSyBGVM2dD2Y0Ag=;
        b=Xh2g/1af71X6wNCAB5w07lvUQYV9aFdfxzzCgKJz4wqMz6vWcc52OxIy/uDHP4waE8
         8CpcTiglVM/3BjqljVqViX3OCv3saySMwfdeIH+S8AzT4Nqju6Mbz1/2ELA8wRXjaTa0
         KWCDKiq2+mPLOeaRNSP9SkqVlFeoP4GKEn2nz/TjcPwOGunZbUP4TvOwmuHBKiF1sje9
         Wu7rhc1t6e9qswNZWOrezRzPuOFCWLHWke1MBvIoG8jX6albeOYXn47pRA7ZSmXuRRwT
         XpsY+j0oRplwntCFPv3VwahybbKFbJMqZqa9+mxefT8FNnFBLz29y5GyeKlDyst+8i0T
         +XFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRw0plrvhzu2kfOp/kQGw1+6lunCHBTJtVUeuNRsiRKqYggygSfZHqC9yeZjQEVZlK0TM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlvU016Hbmzq7J6gEO8DIkcrfKu10NvjWEA+8HclXDOUscXh35
	BTWIvWU2MrApNuGs1MhPg7strdy7M9cSmQ95jkQ2fHXxjNdHK7Fd
X-Gm-Gg: ASbGncvTB9bx+ri/LE27e2ahbaz7YB+BOrUJYqMzecd1uw7U/JuDM9P2bPPRxUFESsL
	Iwt2+3RX5294d9JmiJ2p6qQkHfeSdbYRxStyTAUn1JTr/nbTv3ADzApq9YSnmgvJA1XnfcfRQaV
	sstq1BnuTrTQWnvPkQp8yZH/oZa1jNlcXsGjY/ULbymGHuXWiQQ0jvn7kiP2nAvr8d/XpzIRIvp
	LV2ko9M9hrj9JWqNjVO1iHlOpQgx2bc3enhGYAJCO58WkfR18KoRkvlLVSrwWD5gSLGgnmnmZNh
	QqjNZt05hbf5Eux7EpKTtlIbeM98evj9vbVr6BzpEk9jl7GjJ/wFF4NF5QmiaNnKisMIH8icuHM
	5ZiX722h/ZSqp3yj2TV2BMbRVogHz10Bhh1ffHyZdtOuN7li21YurzgeL6QEWIESA2Dgi/Gv9se
	lZrpMj
X-Google-Smtp-Source: AGHT+IF9cZuprcaIF6vXN+RuBLtlUKvSGOlCMpXk+1a3y4aY/b6Po71jzZWL7PNZ8SxXke3tiIw75g==
X-Received: by 2002:a05:600c:5919:b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-442d0325520mr5277615e9.13.1746644905700;
        Wed, 07 May 2025 12:08:25 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2d:8d00:5d7a:c11c:67f1:717e? (p200300ea8f2d8d005d7ac11c67f1717e.dip0.t-ipconnect.de. [2003:ea:8f2d:8d00:5d7a:c11c:67f1:717e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442cd350f03sm10147675e9.23.2025.05.07.12.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 12:08:25 -0700 (PDT)
Message-ID: <3c34a2f1-d163-4854-9146-4a9440671177@gmail.com>
Date: Wed, 7 May 2025 21:08:36 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
 <olteanv@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next] net: phy: remove Kconfig symbol MDIO_DEVRES
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

MDIO_DEVRES is only set where PHYLIB/PHYLINK are set which
select MDIO_DEVRES. So we can remove this symbol. mdio_devres
is quite small, therefore make it part of phylib instead of a
separate module.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/Kconfig       |  1 -
 drivers/net/ethernet/freescale/enetc/Kconfig |  2 --
 drivers/net/ethernet/marvell/Kconfig         |  1 -
 drivers/net/ethernet/qualcomm/Kconfig        |  1 -
 drivers/net/mdio/Kconfig                     | 11 -----------
 drivers/net/phy/Kconfig                      |  1 -
 drivers/net/phy/Makefile                     |  4 ++--
 drivers/net/phy/mdio_devres.c                |  3 ---
 8 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index a2d730092..bbef47c34 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -71,7 +71,6 @@ config FSL_XGMAC_MDIO
 	tristate "Freescale XGMAC MDIO"
 	select PHYLIB
 	depends on OF
-	select MDIO_DEVRES
 	select OF_MDIO
 	help
 	  This driver supports the MDIO bus on the Fman 10G Ethernet MACs, and
diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index 7250d3bbf..f3a6b3752 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -18,7 +18,6 @@ config NXP_ENETC_PF_COMMON
 config FSL_ENETC
 	tristate "ENETC PF driver"
 	depends on PCI_MSI
-	select MDIO_DEVRES
 	select FSL_ENETC_CORE
 	select FSL_ENETC_IERB
 	select FSL_ENETC_MDIO
@@ -36,7 +35,6 @@ config FSL_ENETC
 config NXP_ENETC4
 	tristate "ENETC4 PF driver"
 	depends on PCI_MSI
-	select MDIO_DEVRES
 	select FSL_ENETC_CORE
 	select FSL_ENETC_MDIO
 	select NXP_ENETC_PF_COMMON
diff --git a/drivers/net/ethernet/marvell/Kconfig b/drivers/net/ethernet/marvell/Kconfig
index 837295fec..50f7c59e8 100644
--- a/drivers/net/ethernet/marvell/Kconfig
+++ b/drivers/net/ethernet/marvell/Kconfig
@@ -34,7 +34,6 @@ config MV643XX_ETH
 config MVMDIO
 	tristate "Marvell MDIO interface support"
 	depends on HAS_IOMEM
-	select MDIO_DEVRES
 	select PHYLIB
 	help
 	  This driver supports the MDIO interface found in the network
diff --git a/drivers/net/ethernet/qualcomm/Kconfig b/drivers/net/ethernet/qualcomm/Kconfig
index 9210ff360..a4434eb38 100644
--- a/drivers/net/ethernet/qualcomm/Kconfig
+++ b/drivers/net/ethernet/qualcomm/Kconfig
@@ -52,7 +52,6 @@ config QCOM_EMAC
 	depends on HAS_DMA && HAS_IOMEM
 	select CRC32
 	select PHYLIB
-	select MDIO_DEVRES
 	help
 	  This driver supports the Qualcomm Technologies, Inc. Gigabit
 	  Ethernet Media Access Controller (EMAC). The controller
diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 107236cd6..d3219ca19 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -38,9 +38,6 @@ config ACPI_MDIO
 	help
 	  ACPI MDIO bus (Ethernet PHY) accessors
 
-config MDIO_DEVRES
-	tristate
-
 config MDIO_SUN4I
 	tristate "Allwinner sun4i MDIO interface support"
 	depends on ARCH_SUNXI || COMPILE_TEST
@@ -60,7 +57,6 @@ config MDIO_ASPEED
 	tristate "ASPEED MDIO bus controller"
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on OF_MDIO && HAS_IOMEM
-	select MDIO_DEVRES
 	help
 	  This module provides a driver for the independent MDIO bus
 	  controllers found in the ASPEED AST2600 SoC. This is a driver for the
@@ -130,7 +126,6 @@ config MDIO_I2C
 config MDIO_MVUSB
 	tristate "Marvell USB to MDIO Adapter"
 	depends on USB
-	select MDIO_DEVRES
 	help
 	  A USB to MDIO converter present on development boards for
 	  Marvell's Link Street family of Ethernet switches.
@@ -138,7 +133,6 @@ config MDIO_MVUSB
 config MDIO_MSCC_MIIM
 	tristate "Microsemi MIIM interface support"
 	depends on HAS_IOMEM && REGMAP_MMIO
-	select MDIO_DEVRES
 	help
 	  This driver supports the MIIM (MDIO) interface found in the network
 	  switches of the Microsemi SoCs; it is recommended to switch on
@@ -156,7 +150,6 @@ config MDIO_OCTEON
 	depends on (64BIT && OF_MDIO) || COMPILE_TEST
 	depends on HAS_IOMEM
 	select MDIO_CAVIUM
-	select MDIO_DEVRES
 	help
 	  This module provides a driver for the Octeon and ThunderX MDIO
 	  buses. It is required by the Octeon and ThunderX ethernet device
@@ -166,7 +159,6 @@ config MDIO_IPQ4019
 	tristate "Qualcomm IPQ4019 MDIO interface support"
 	depends on HAS_IOMEM && OF_MDIO
 	depends on COMMON_CLK
-	select MDIO_DEVRES
 	help
 	  This driver supports the MDIO interface found in Qualcomm
 	  IPQ40xx, IPQ60xx, IPQ807x and IPQ50xx series Soc-s.
@@ -175,7 +167,6 @@ config MDIO_IPQ8064
 	tristate "Qualcomm IPQ8064 MDIO interface support"
 	depends on HAS_IOMEM && OF_MDIO
 	depends on MFD_SYSCON
-	select MDIO_DEVRES
 	help
 	  This driver supports the MDIO interface found in the network
 	  interface units of the IPQ8064 SoC
@@ -183,7 +174,6 @@ config MDIO_IPQ8064
 config MDIO_REALTEK_RTL9300
 	tristate "Realtek RTL9300 MDIO interface support"
 	depends on MACH_REALTEK_RTL || COMPILE_TEST
-	select MDIO_DEVRES
 	help
 	  This driver supports the MDIO interface found in the Realtek
 	  RTL9300 family of Ethernet switches with integrated SoC.
@@ -204,7 +194,6 @@ config MDIO_THUNDER
 	depends on 64BIT
 	depends on PCI
 	select MDIO_CAVIUM
-	select MDIO_DEVRES
 	help
 	  This driver supports the MDIO interfaces found on Cavium
 	  ThunderX SoCs when the MDIO bus device appears as a PCI
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 0b8cc325e..677d56e06 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -15,7 +15,6 @@ config PHYLINK
 menuconfig PHYLIB
 	tristate "PHY Device support and infrastructure"
 	select MDIO_DEVICE
-	select MDIO_DEVRES
 	help
 	  Ethernet controllers are usually attached to PHY
 	  devices.  This option provides infrastructure for
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 631859d44..5556e0344 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -3,7 +3,8 @@
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o phy_link_topology.o \
-				   phy_package.o phy_caps.o mdio_bus_provider.o
+				   phy_package.o phy_caps.o \
+				   mdio_bus_provider.o mdio_devres.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_MDIO_DEVICE
@@ -20,7 +21,6 @@ obj-y				+= stubs.o
 else
 obj-$(CONFIG_MDIO_DEVICE)	+= mdio-bus.o
 endif
-obj-$(CONFIG_MDIO_DEVRES)	+= mdio_devres.o
 libphy-$(CONFIG_SWPHY)		+= swphy.o
 libphy-$(CONFIG_LED_TRIGGER_PHY)	+= phy_led_triggers.o
 libphy-$(CONFIG_OPEN_ALLIANCE_HELPERS) += open_alliance_helpers.o
diff --git a/drivers/net/phy/mdio_devres.c b/drivers/net/phy/mdio_devres.c
index 7fd3377db..acedcf441 100644
--- a/drivers/net/phy/mdio_devres.c
+++ b/drivers/net/phy/mdio_devres.c
@@ -130,6 +130,3 @@ int __devm_of_mdiobus_register(struct device *dev, struct mii_bus *mdio,
 }
 EXPORT_SYMBOL(__devm_of_mdiobus_register);
 #endif /* CONFIG_OF_MDIO */
-
-MODULE_DESCRIPTION("Network MDIO bus devres helpers");
-MODULE_LICENSE("GPL");
-- 
2.49.0

