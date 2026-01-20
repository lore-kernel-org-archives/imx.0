Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90263B8D4F
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768941557; cv=none; b=qYaLaMrOzVYPy7zF19DEvAfP9mE7q1wzx5p0m/pZker6k4jb+M9IoHXDJFdrbZZqhpmvEqp/U+ZUU7bxdPdEAXLjM+XUWhmdSnlR8SUuG3cqPXs1tuB9fKT+iEOHXMwfld0OYOhuS6B0WBUZldNIKqr1R7C8ytzQTY//H840dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768941557; c=relaxed/simple;
	bh=V0JUXLYyIdj3TL2lyf8gwxfS7pvDlhnP+6acRIt+loE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/e2RIUlb6DZ+OXfWR39isUsaOEsmoNYfXXNEUknsCW/uoAtBFcWjgKXE4xxw57PN26UPD7DqLLSGb0em47ri6dm/dYjyHOtwPKvCjDYjYHuGkdVOGuu9YIN+TvyFA3+MaIlCD3HUiVUX5f5ATEAATy/B4aXhrXBGfqehFEEiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPn1/aoL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPn1/aoL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so34135675e9.0
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 12:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941552; x=1769546352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=;
        b=KPn1/aoLF/Y0L3770ad1xabKsVc6eZ7lOecMrBVvSyNTnHHrrloy8HZpTCkOntSopc
         KhJJo0NHUjrbiMjJ5cCgpC26q6cr1z4JHDX01vXxFvlM1UN3b7SyrS8fEiIe+pIk3joI
         pFGbHUIOSw5hEiRjYdgU3I0XitbsokTsxlsEFjmM0pd4n0fWzj/jsgFnSRlU0EdetE97
         CUHNa2GQdWdgsk/hEoNppV++FK1QGKZPQiNY6Z8PqX5qOlHKb71540rYemthGp2yXQIB
         qxFiTrl0aThfPLIEf9+Elx6r/MMIBwf0GIiLlqSaU8pYT/pSU1fh+SX2F1KpRgsZ0Lkr
         rlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941552; x=1769546352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=;
        b=ozx35UIWNNWlCrbTBZHO1LoG0FBrhwRApi+9c0ZnHUnhqNfA2nlxles7GT/hwyN4Jn
         v+Qxt1DoHH5rVgh9IagBV89cSI8jeeNcDsAiAbjzUsl/vDEyizw2PZ0hh3wt0bFzxkgf
         Ji/rPz4gCUsE54Q/DUrsP6mHs8V6pNSFsu2iG8neJBEzCtz0VdAr2Z/KftueeV0FfiHp
         q4LyuQ+Xf5Jyzdzt1+X4TYA/dyF7UX4+YNJZ7R5fouz45My49M+n+uCyDAkg9GQofQMb
         v13N4NSSFKJZQ+RA2TsmZBfxNIAYEUE5lz1hnStproSPLjIr91asNt2dFV+cAS9tu4yC
         kDtg==
X-Forwarded-Encrypted: i=1; AJvYcCV7HFzIRw+Jag8XWenNLBVohcLWpSyaHgUNz0ktF1qFMbRHOqlBbJ4+qkYPoTvb9QshCts=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu5D1WJYhiEsiuTjffPr0x5+tAyNWQEyRQO4HHyNhQ1ERPowd9
	h6U8dvXOdQJl7s5fqxgWdqWGfGu661K9q5I9gx/BJW4w8fcFklvLLhxP
X-Gm-Gg: AY/fxX7BaBu3pyAmV3mfii+0kpk6kHsgQVMjmoCQsFPnukdX1SpzCfqTiPEIOhCUNMe
	vTQ7kV2uvluGrmCvHg3Do5Ll6ogD7Fwrn8LN9JLZjn+Cn9lV9aVU86yb9+Vz7EeBbI0u+zKO5Ow
	NY6HsdYtCy5PKTqUcXpoQ/iHqZirPEoim9E0zilvYAtUCVg0qbYQCnTUc1fKIdn1skZsnm2iyVS
	bwEGK6w8rOZt9m574gO/J+egvxCd4bSnFnPOz8+ZBGCeoCdhs+k5E4JIWgmRQtvX6kMHFjSwtGg
	X0btGN0oX28mtyHtC5YLa6W6AH8UO5uy9X+kxcLKLKIstunxG9LEK5Z2KJ+rA26ckb63fmqAqbF
	Crj+3zzgyJMLLT6hp6Mqn8NxvWh2qwLcgeylyrwpIpif7pT9qJciPpIIMQqs1tK7R4paPqZJRJY
	NFWIQ4eqbFEX5mLnM+
X-Received: by 2002:a05:600c:190d:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-4803e79bbbamr44181875e9.6.1768941551414;
        Tue, 20 Jan 2026 12:39:11 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:10 -0800 (PST)
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
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
Date: Tue, 20 Jan 2026 21:30:04 +0100
Message-ID: <20260120203905.23805-4-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The stmmac implementation used by NXP for the i.MX8MP SoC is subject to
errata ERR050694. According to this errata, when no preamble byte is
transferred before the SFD from the PHY to the MAC, the MAC will discard
the frame.

Setting the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag instructs PHYs that
support it to keep the preamble byte before the SFD. This ensures that
the MAC successfully receives frames.

As this is an issue in the MAC implementation, only enable the flag for
the i.MX8MP SoC where the errata applies but not for other SoCs using a
working stmmac implementation.

The exact wording of the errata ERR050694 from NXP:
The IEEE 802.3 standard states that, in MII/GMII modes, the byte
preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
(0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
be no preceding preamble byte. The MAC receiver must successfully
receive a packet without any preamble(0x55) byte preceding the SFD,
SMD-S, or SMD-C byte.
However due to the defect, in configurations where frame preemption is
enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
byte, the received packet is discarded by the MAC receiver. This is
because, the start-of-packet detection logic of the MAC receiver
incorrectly checks for a preamble byte.

NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
they show two tables one where the preamble is preceding the SFD and one
where it is not. The text says:
The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
between transmission at the source GMII and reception at the destination
GMII. Table 35-3 depicts the case where no preamble bytes are conveyed
across the GMII. This case may not be possible with a specific PHY, but
illustrates the minimum preamble with which MAC shall be able to
operate. Table 35-4 depicts the case where the entire preamble is
conveyed across the GMII.

This workaround was tested on a Verdin iMX8MP by enforcing 10 MBit/s:
ethtool -s end0 speed 10
Without keeping the preamble, no packet were received. With keeping the
preamble, everything worked as expected.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++++-
 include/linux/stmmac.h                            | 1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index db288fbd5a4df..c722ff2dc1fcb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -320,6 +320,9 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
 
+	if (data->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
+		plat_dat->flags |= STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD;
+
 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
 	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
@@ -355,7 +358,8 @@ static struct imx_dwmac_ops imx8mp_dwmac_data = {
 	.addr_width = 34,
 	.mac_rgmii_txclk_auto_adj = false,
 	.set_intf_mode = imx8mp_set_intf_mode,
-	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
+	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+		 STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD,
 };
 
 static struct imx_dwmac_ops imx8dxl_dwmac_data = {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index da206b24aaed9..08a6082fc0c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1205,6 +1205,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
 	struct ethtool_keee eee;
+	u32 dev_flags = 0;
 	int ret;
 
 	if (!phylink_expects_phy(priv->phylink))
@@ -1223,6 +1224,9 @@ static int stmmac_init_phy(struct net_device *dev)
 	else
 		phy_fwnode = NULL;
 
+	if (priv->plat->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
+		dev_flags |= PHY_F_KEEP_PREAMBLE_BEFORE_SFD;
+
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
@@ -1241,10 +1245,12 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		phydev->dev_flags |= dev_flags;
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
+		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, dev_flags);
 	}
 
 	if (ret) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f1054b9c2d8ac..e308c98c7bd33 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -191,6 +191,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
 #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
+#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
 
 struct mac_device_info;
 
-- 
2.51.0

