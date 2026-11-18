Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.77.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998292;
	b=N2r6hJCI69Nxtm8mMsua0Tvzjx5wW+U9nb5jKLe6ymNXxfSLENDnlXC31PYREg6Pl4HO
	 H5obWEIG4d1Dh4w2lyuFdVHo5r3+nkDURccvtUA2vnXGNnBGytMwQPu1zau4S+jiB9CZw
	 HsLLVHdicY/W8Xtpaj3H4XfFl8JKMVRsyw9N4aTPrkLrAYm50NEhQAw1JTw1sc/zwfYlz
	 77eeOnCFA510NhKfgBQF+Avsh+dqJwsplDghbu5WrxNyUTBMxLAzj8FjwOMjfzc1l/oMX
	 8WVf9BMK4IPICwCrHSH2VpGMeuHoGDt6dh7DbXo4QCbJ4jSJ7C1C+GuE5xhAZJ7MrXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998292;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=n/D0iDwmoJTg+XoeBh7WBm9H62/QgbJubiBufD6hlEs=;
	b=ZGclVthnAgJhkAgknQEamVcf71IXda05XJ6q5tq3XzSjNHU0pSW8U12xKvw6uRdT2ode
	 POewB10C0x8My9/SddZG2fhQ+qaelonh2IC9Q6MRVRbKhUB1HFqgJQQMjq3jU0EJf3Ljd
	 fpH7PVCeEi1NDYM77B+JKb1fcnS0Dvfc2rPNr9MNoV/ttx3McJa5e977JRtAQEv8ZOlqi
	 3tgd5nV3ThA0x08AjaPfV630/SfetpMmQVElK4v+tjt8I5gSJBK9568OIwUfQ0oeW8w4x
	 4A4vhjzDdb8aA3StUsmG7NbC9lC3KexhJBj80vAmYDonYiwTYCQR6Ba7Op8DyCqno7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fris.de;
	spf=pass smtp.mailfrom=fris.de;
	dkim=pass header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=cbdgaM5T;
	arc=none smtp.remote-ip=116.203.77.234
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515CB606A32A
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515CB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=cbdgaM5T
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1794998283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/D0iDwmoJTg+XoeBh7WBm9H62/QgbJubiBufD6hlEs=;
	b=cbdgaM5T5s9jR3A30UmD4cq1fYmDP5VXR7I+dDMc1Zt+6rcAhKQo716cQwG+ycKyVMGqDH
	Sm2mEE9/eiIJmKLZDaEb3lz1u5wqoIwj+zD6uNp2SRKj1HiJomgfEFXpCge+6ga1OC7kzF
	PE+NtndKbQdnT8NVfCLQtXaoNMAcxC4oJHoFgRY5i08m0nK4PV4/yKAwdJ3kVkR0877Aog
	wxpJL2yoYblsKPP3DURIogN4VjIs46rA0cGcDwFKdzkK8+WXWa8EJyFwAI6Kr+M0kgeP/W
	wcenfLPNID6CI6cQKHx3joqNhPwFIYy1iDg/6aECe3iOlEClgGtkvqKRRSdYEg==
Date: Wed, 18 Nov 2026 11:37:40 +0100
Subject: [PATCH net-next 2/4] net: enetc: netc_blk_ctrl: add i.MX952
 support
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-imx952-enetc-v1-2-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
In-Reply-To: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4561;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=d9oMzGdWfXIHl1LXk+KZd1a3xMWwttegSnZ6/LEfcsA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIetvA8fpxYlLyovtt5wse+kbXLtkyRTH4hkL9fvf/ToZ7
 d3O4tLZUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJHDqxgZjojknFsfq7ln8Uwv
 0TJdcaG7QklHZStsZA8KKWtwSs5PYGRYuebQms9Ls4T3z7R+vkYk9k7usd7UAuXk6Azj+4w/ytU
 4AQ==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Clark Wang <xiaoning.wang@nxp.com>

Add NETCMIX support for i.MX952 platform. i.MX952 has two ENETC
instances, each on its own PCIe bus: ENETC0 at bus 0 devfn 0 and ENETC1
at bus 1 devfn 0. Their link MII protocol is configured through the
same NETCMIX register as on i.MX95.

The i.MX952 RM describes E0TXHPTBCR and E0TXLPTBCR as the byte-credit
limits for the ENETC transmit datapath. Both ENETC0 transmit
byte-credit registers reset to 0x5dc, which matches the RM example for
a 1536-byte maximum frame size. That is too small once jumbo frames are
enabled when the NETCMIX root clock is 133 MHz: the credit counter is
exhausted too early, which reduces transmit throughput. Program them to
0xc35, the same as port 1, during IERB initialization.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
[fs: squashed NXP a9dd7adc7e44, 68415a57f31e]
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../net/ethernet/freescale/enetc/netc_blk_ctrl.c   | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
index 658fab31e9ed7..6e3098a0a43ee 100644
--- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
+++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
@@ -67,6 +67,8 @@
 #define IERB_EMDIOFAUXR			0x344
 #define IERB_T0FAUXR			0x444
 #define IERB_ETBCR(a)			(0x300c + 0x100 * (a))
+#define IERB_ETXHPTBCR(a)		(0x3070 + 0x100 * (a))
+#define IERB_ETXLPTBCR(a)		(0x3074 + 0x100 * (a))
 #define IERB_LBCR(a)			(0x1010 + 0x40 * (a))
 #define  LBCR_MDIO_PHYAD_PRTAD(addr)	(((addr) & 0x1f) << 8)
 
@@ -89,6 +91,10 @@
 #define IMX94_ENETC1_LINK		4
 #define IMX94_ENETC2_LINK		5
 
+#define IMX952_ENETC0_BUS_DEVFN		0x0
+#define IMX952_ENETC1_BUS_DEVFN		0x100
+#define IMX952_BYTE_CREDIT		0xc35
+
 #define NETC_ENETC_ID(a)		(a)
 #define NETC_TIMER_ID(a)		(a)
 
@@ -368,6 +374,56 @@ static int imx94_netcmix_init(struct platform_device *pdev)
 	return 0;
 }
 
+static int imx952_netcmix_init(struct platform_device *pdev)
+{
+	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
+	struct device_node *np = pdev->dev.of_node;
+	phy_interface_t interface;
+	int bus_devfn, mii_proto;
+	u32 val;
+	int err;
+
+	/* Default setting */
+	val = MII_PROT(0, MII_PROT_RGMII) | MII_PROT(1, MII_PROT_RGMII);
+
+	/* Update the link MII protocol through parsing phy-mode */
+	for_each_child_of_node_scoped(np, child) {
+		for_each_child_of_node_scoped(child, gchild) {
+			if (!of_device_is_compatible(gchild, "pci1131,e101"))
+				continue;
+
+			bus_devfn = netc_of_pci_get_bus_devfn(gchild);
+			if (bus_devfn < 0)
+				return bus_devfn;
+
+			err = of_get_phy_mode(gchild, &interface);
+			if (err)
+				continue;
+
+			mii_proto = netc_get_link_mii_protocol(interface);
+			if (mii_proto < 0)
+				return mii_proto;
+
+			switch (bus_devfn) {
+			case IMX952_ENETC0_BUS_DEVFN:
+				val = u32_replace_bits(val, mii_proto,
+						       CFG_LINK_MII_PORT_0);
+				break;
+			case IMX952_ENETC1_BUS_DEVFN:
+				val = u32_replace_bits(val, mii_proto,
+						       CFG_LINK_MII_PORT_1);
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+	}
+
+	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_MII_PROT, val);
+
+	return 0;
+}
+
 static bool netc_ierb_is_locked(struct netc_blk_ctrl *priv)
 {
 	return !!(netc_reg_read(priv->prb, PRB_NETCRR) & NETCRR_LOCK);
@@ -783,6 +839,16 @@ static int imx94_ierb_init(struct platform_device *pdev)
 	return 0;
 }
 
+static int imx952_ierb_init(struct platform_device *pdev)
+{
+	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
+
+	netc_reg_write(priv->ierb, IERB_ETXHPTBCR(0), IMX952_BYTE_CREDIT);
+	netc_reg_write(priv->ierb, IERB_ETXLPTBCR(0), IMX952_BYTE_CREDIT);
+
+	return 0;
+}
+
 static int netc_ierb_init(struct platform_device *pdev)
 {
 	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
@@ -882,8 +948,15 @@ static const struct netc_devinfo imx94_devinfo = {
 	.ierb_init = imx94_ierb_init,
 };
 
+static const struct netc_devinfo imx952_devinfo = {
+	.flags = NETC_HAS_NETCMIX,
+	.netcmix_init = imx952_netcmix_init,
+	.ierb_init = imx952_ierb_init,
+};
+
 static const struct of_device_id netc_blk_ctrl_match[] = {
 	{ .compatible = "nxp,imx95-netc-blk-ctrl", .data = &imx95_devinfo },
+	{ .compatible = "nxp,imx952-netc-blk-ctrl", .data = &imx952_devinfo },
 	{ .compatible = "nxp,imx94-netc-blk-ctrl", .data = &imx94_devinfo },
 	{},
 };

-- 
2.56.0

