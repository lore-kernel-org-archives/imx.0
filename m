Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36411F471F
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607375; cv=none; b=CtquEk9otpGneeTtwY0sPLCMfWyGjqoXaZSYvuyiKxQ4LJ8fZwnFDE33D0qEU1UbwbH7xL42b40LoRg/SsjIqS0Ce+MjI4KBH8Q6/h5ingevjaoCegJZ4XQzvVEirxm6J60Z6qxakqNUF4Eyu0xfmFY7xlKn7i2JJBBYLt34t7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607375; c=relaxed/simple;
	bh=A9NT9+ObFVURRY5DrjmPg5SlXTK2iGfpCBkIhmcwnOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJ8VHdG4CJwqejFyeJ7f3Wz52ELl6eJ1j73Di9DIZw8Hg7BkFyHGH2AcjzyEiBAT9dKtjCELbR3jwgoIncpwEL5d5kuiHPger1pribcaI473wKcQ93bTeNcWQxmetkBJg5M4gebrgWL1DOqQF1pE1LdM3OUxW2i4cpfhfWU7Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMIingxC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMIingxC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432777da980so4061051f8f.0
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607372; x=1768212172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=XMIingxCXad5bvHQPMDXp/aj5vdZ+PWOOOPgGGqJ5vHVS6+ZLBtxmQaZ3HpG8Zo+XA
         07HkjReVDyxvAcS8KWG+FfXNNAoNtCj5yGN494fre+GcCOA8GDHaItQT1MQLb9emFrg/
         6/FdrSUZtjtVY+9oVzA9uerr8RTuVBkjjU68yflRu4TIiL0mAEL6xXSIEG5LZKA2zkO8
         Ey+4XDpI2aZi2jco25GEpBmNxEc+KuSK8FzjkU4qN8hDsl+mCQjst3r2qtQATj3vBug5
         fSF7iHRUsbA//lvB2A6B5KIlQaK8d8waCC2rw0qqd8FlAJuKN2ke3ESDvk70hSuK5ggH
         uJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607372; x=1768212172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=GkQloJjlYgYvwRiEWfLFWNNlH6Kk0bms1FJ1/3VirrrTbKgPEm0OIsw/jUMa8DOwYD
         5ZpkytVhzKpixBiAKCmzHqR8IjC10L84AkM3pVcjV1npoHb+lbI6fYOs7XjCF+Va6rrj
         isPVX7WvXgfGY3ESfK4fm/d8EQ9CCZ5QBypXF2d+T4ZWZCihBvdZ0fYkiUJqbTC0tT6y
         Ps+UxVw3bxpfNXJCU2joZnN9N0jwVcWkg3z7Zd3kLOqQOC/TaO6/mftODu68jncmZQjl
         6ZZePArJ09LgqXq+zV5YLKyq4bqJstLySl3o39vvk/+va2xbfKNzl3cJ+OJjUytJsvp4
         vbbw==
X-Forwarded-Encrypted: i=1; AJvYcCU+zM7dCLIOkWnaJBa8J0lI7rfmO/Jw/oHiPCY+lR1l/FOTZhyESgnty5juDDOUIN8KwZE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC2hBPW83U1C2IVYhKrZ4IkWN3KSP9wJ7JN85dfYJZW7p7dGFL
	bs09rFPLm8aZmJkgSfQT2o7rZxPXQLRFhbpG76i7xUf6xdFVdS2d0543
X-Gm-Gg: AY/fxX4ueC7emiR93LU2TaMtNesip/DMyHE6w8oPFtztwNK8zemikSX4O5o9B2VRhqv
	OGoQ5xQG9wiHtDcQcl5dCXuWt9NbC2MPi6aPOpwGIiqSoyR4fAUAxizkJlJRislN2BKU78sRYVF
	9673FkFKgJozq8e+Zd6rNIZ7pC2ZL6T132Bk0tXgb8TXJFBFsZXQN+z7wM7uFh5cMajkbSRKpho
	+44y3NacXJHPWyfTXAd7SCW/18WRu3rIi0pBGLS2+egI4EzNXNkkcUl9evmWxeRqWqTKPIn3Zy8
	NxKysk5q1Ul0MffTAeuT7fTdgjW1iDeHd/PQXBT/0BbbtDDfUJQr1fn+BQFjakI8WG0Rr+SEkJ/
	KIEubbZVTT5zlZgQ2RARBHXcmxjv9LKJW/HjtiQNUnt8mFfptPkkYzYzDtdj24Ssrn3KVnUhtf3
	9dOg2T2/hihP0o/Y90ucOPPYSi
X-Google-Smtp-Source: AGHT+IFKkMH1ZSx5o/rB6BTbeL4h1LkJTSLLqMkYzmB0QdI0255AUuWQv6qVkyZaadRtjHotP2jJUg==
X-Received: by 2002:a5d:5d87:0:b0:432:8651:4071 with SMTP id ffacd0b85a97d-4328651421amr32457140f8f.18.1767607371844;
        Mon, 05 Jan 2026 02:02:51 -0800 (PST)
Received: from eichest-laptop.gad.local ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm99270630f8f.5.2026.01.05.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:51 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for the Micrel KSZ9131 PHY
Date: Mon,  5 Jan 2026 11:02:23 +0100
Message-ID: <20260105100245.19317-1-eichest@gmail.com>
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

