Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516C36BCEE
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484786; cv=none; b=huAzxv95ZozOtOWqFCdYZ1UmW6yLrvhHlXuajk2p8Ca9WamohmeqM3GRH2P1QfFjhnFMqKVLw4/V8O9nxXBPc2RbN0GhJSf05k4lh+gMX6tRGpcELTrxLJieTgBqCtOPfkVwaQw0qomHC1CSsjqBqQ9dxcTxgT+7tnlry0iytUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484786; c=relaxed/simple;
	bh=A9NT9+ObFVURRY5DrjmPg5SlXTK2iGfpCBkIhmcwnOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVx0+zJKpeqLw5EN4845WMXbTFdXNPKANH31Q9vCdqIC8fbuXPw8W3IZ7CAW3DC59lz395oN8Cei2UPKBfYWYBDb/zB585X1TFxjMFCaXKnwWBBrL/2XxUBPcbuNkZHZaj6n1G6rKBLY1UVHrjnr1udGjqAEFtRPEk+q+clNH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1nnt6XM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1nnt6XM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so3122537f8f.2
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766484781; x=1767089581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=h1nnt6XMhOs4Y+X4BamGi4toF9ynPxUGvb4T7Q14mMKKi7/VG/habyFdXzEmxBw+ox
         pecfjtbbe+u9AV88r8FCLX1sopd07BbNwP2ebi82xfKQCIbcaq8Yo52PY15kfmQgJ1TC
         N6TZwyXRmGZhWF7p8UT3jmH7ac32g4KYSwdDOqEpqZWOvisKzBaGWguI4n8OiKrPVUYW
         n7cpbXEytG7RTNNsxTqR2dbFWwVp+GnZnI+9T8pKA1I7XnoYMafiyDpLZUZnsnyiDA8W
         qpeO24NflQp7tdUcINfCz177eDnK6+bvDfoRrXU0A4FLI5g7YcCAHrUnzFlJS/1AIVkJ
         gDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484781; x=1767089581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=lr/ZKLXzGbFrpBsCHw0LlTa2jegDHsRKIS/McJhqvHCVR3cazTwHPXEoVIiWcgLGon
         Ri4jv0DKhxZAsbROIex/jUnt3PvlJPFfFJ0QvCGvw87xWWNXakNZe+Y6Nk+F6JOST8s1
         oIaqhKr8kjT2derhTIghqHSsB1/PA6/ePCWi/ienLNT+OczZVpgVEzZwHYO59MPYviPd
         uVudQpNPxHIGaubYKHn9Sd18K4eSa3IDA9Oqned5GuWDrGeS3hIlBWBdOT2g7DjDUvPm
         earl61dautA1g4rTKlvvqZ+le366Bqcd3UGK9oRgp9BwzketPzecxHfmNq6UnE4t0J1n
         hFCA==
X-Forwarded-Encrypted: i=1; AJvYcCUMWFDOPUz0uHrX03b9FbLXb4ynIOK2TJvJdG8WhQE20lQVZCf7FcbgWYXGSc9G+lm4nj8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQOrsQvO8hnBK7uUsrZ2jFcbwYz0lMp/J2I2jq7zKG91u5E792
	Y20/DwHjmyE7tLB4k2xvSbLO7Kn/Q88urxqLwVoFRCyD69cV3LqB3HEZ
X-Gm-Gg: AY/fxX6kpZuabx24lRbLILPV4rwQB7G9Et4slhYu0KCecExUEatOlxcptoF+58n09Qi
	3uvXVBUU2FZEYghPFcpJ3HPOdf/FdPD5ciZX6dVrf3bSjsRP6HjS1fjDNdQrDQVnySBU48oMK7C
	qfZjrn+lV767BW0pYawTFBkGCgP8uvsJ+7tBnODZgkNMoQqvtsNerS0VhrD8KuyTcQRFLd1V1Xn
	wSbj0cXdIQwSaZ4dI5QdohI9nSJ3iZXFGFKMsIeK81nqfR8ltq2xa9SnshTsA8EunWGwgw9/eZI
	x4Vr1E/hM5C5dlZeNl49KZ7NGfvdSCaf+PgbbC86NHsZucyMp2pQczq4juv/PV8fqLXjsGl+/96
	ek7o7CzB6IaRxs4iMnXRNQcCAmb+GGnagOZmOxqj8bvsAW5IeRuar4z4+jF9EXYsPOsU4aPPIuH
	5P2i4+kMv0ccvOvhVWZ0qoumOk8g==
X-Google-Smtp-Source: AGHT+IGF0o0X3T9TPemtGA4iv5QpXYtSLA5891eQonPhGoJJdeHdYF9/vi2taBPYEXsT/bnOH7uFfA==
X-Received: by 2002:a05:6000:188e:b0:430:fb26:3409 with SMTP id ffacd0b85a97d-4324e703d95mr14723855f8f.63.1766484780377;
        Tue, 23 Dec 2025 02:13:00 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:db87:3fd:1ea8:b6eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm26759247f8f.31.2025.12.23.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:13:00 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	francesco.dolcini@toradex.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v2] net: stmmac: dwmac: Add a fixup for the Micrel KSZ9131 PHY
Date: Tue, 23 Dec 2025 11:10:59 +0100
Message-ID: <20251223101240.10634-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a fixup to the stmmac driver to keep the preamble before the SFD
(Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
used on an NXP i.MX8MP SoC.

This allows to workaround errata ERR050694 of the NXP i.MX8MP that
states:
ENET_QOS: MAC incorrectly discards the received packets when Preamble
Byte does not precede SFD or SMD.

The bit which disables this feature is not documented in the datasheet
from Micrel, but has been found by NXP and Micrel following this
discussion:
https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032

It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
10MBit. Without bit 2 being set in the remote loopback register, no
packets are received. With the bit set, reception works fine.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v2:
- Use phy_register_fixup_for_uid() instead of adding a new device tree
  property
- I will send the conversion of the micrel.txt binding as a separate
  patch series
- Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/

 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index db288fbd5a4df..23bc917d3f0bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/stmmac.h>
+#include <linux/micrel_phy.h>
 
 #include "stmmac_platform.h"
 
@@ -39,6 +40,12 @@
 #define RMII_RESET_SPEED		(0x3 << 14)
 #define CTRL_SPEED_MASK			GENMASK(15, 14)
 
+/* Undocumented bit of the KSZ9131RNX in the remote loopback register to keep
+ * the preamble before sfd. It was reported by NXP in cooperation with Micrel.
+ */
+#define KSZ9x31_REMOTE_LOOPBACK			0x11
+#define KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE	BIT(2)
+
 struct imx_priv_data;
 
 struct imx_dwmac_ops {
@@ -282,6 +289,30 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 	return err;
 }
 
+static int imx8mp_dwmac_phy_micrel_fixup(struct phy_device *phydev)
+{
+	struct device *mdio_bus_dev = phydev->mdio.dev.parent;
+	struct device_node *mac_node;
+
+	if (!mdio_bus_dev || !mdio_bus_dev->parent)
+		return 0;
+
+	mac_node = mdio_bus_dev->parent->of_node;
+	if (!mac_node)
+		return 0;
+
+	if (!of_device_is_compatible(mac_node, "nxp,imx8mp-dwmac-eqos"))
+		return 0;
+
+	/* Keep the preamble before the SFD (Start Frame Delimiter) for the
+	 * Micrel KSZ9131. This is required on the i.MX8MP because of errata
+	 * ERR050694.
+	 */
+	return phy_modify_changed(phydev, KSZ9x31_REMOTE_LOOPBACK,
+				  KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE,
+				  KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE);
+}
+
 static int imx_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -389,7 +420,30 @@ static struct platform_driver imx_dwmac_driver = {
 		.of_match_table = imx_dwmac_match,
 	},
 };
-module_platform_driver(imx_dwmac_driver);
+
+static int __init imx_dwmac_init(void)
+{
+	int ret;
+
+	if (of_machine_is_compatible("fsl,imx8mp")) {
+		ret = phy_register_fixup_for_uid(PHY_ID_KSZ9131, MICREL_PHY_ID_MASK,
+						 imx8mp_dwmac_phy_micrel_fixup);
+		if (ret)
+			return ret;
+	}
+
+	return platform_driver_register(&imx_dwmac_driver);
+}
+module_init(imx_dwmac_init);
+
+static void __exit imx_dwmac_exit(void)
+{
+	if (of_machine_is_compatible("fsl,imx8mp"))
+		phy_unregister_fixup_for_uid(PHY_ID_KSZ9131, MICREL_PHY_ID_MASK);
+
+	platform_driver_unregister(&imx_dwmac_driver);
+}
+module_exit(imx_dwmac_exit);
 
 MODULE_AUTHOR("NXP");
 MODULE_DESCRIPTION("NXP imx8 DWMAC Specific Glue layer");
-- 
2.51.0

