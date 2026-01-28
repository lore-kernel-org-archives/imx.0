Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683F34CFD1
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593615; cv=none; b=nDTE6a2DxTCJc5i1epRRafKNltSI9bL+7vQ3Rq9yijAL8S4a0DofUd6wBpvVRz07M5cB5VEpfwsDo0JKky2mwIUpx7lfrnTmJnloiMyQBhCuRFMK8c+d22AUPtqYkdhcwspvZEX7ikxo+j19qnAe/+eQ/Cbuj0vIgb7cElzhL14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593615; c=relaxed/simple;
	bh=TC15+6dILqv3V4br20k0HKU4BMDLCWRE3mXpBKGswAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KppKiYOrHwfVR32l8dRyCF5n26YpNU776WJVyW2niun1vk7KhpZ/1U6s6hOS4hLuitsOm3LwSnhCLmGzpnurczg+H/GJDcSDysA7HC5gXEXhDYBIQI/lxsjVAdiyqxYyqnpNXqfvSoaY8rwZhJefV8deNJO97TTJGHs/sO2kH1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Y5wb2+4Y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y5wb2+4Y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so74888095e9.1
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1769593611; x=1770198411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbeoicRBBkRysu8QvYpatvGi1IIIWH8ilPA26WAsQkU=;
        b=Y5wb2+4Y2bbLlClIhYjg6Rxqe5hXHdl9LXbYp+4NqePxw26KrmpIHPHdyPIutopfiK
         ZZtVQgWBC6ovv3Gzt3tNn8ee+ToknWeTY55h0Ig1x/yks+KsE3tSDEP7565NITGEXELm
         3fCosuoKeUYKjrBshpuY1tBUpvSzdOX3IVmZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593611; x=1770198411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbeoicRBBkRysu8QvYpatvGi1IIIWH8ilPA26WAsQkU=;
        b=lyxXGh6fdLNBHZ8esmt8uvw6frHgqFDbQGP/cSzmj19bPtZGTTuJhV1vAtEYJJwN+D
         +cWtcNLYN620ZY7hE3shnp8azG/zVSR58UrlbP+/5tprBMxIp4OAbnyTDUqD/PCIruhN
         wnUk4tjKav/zivLW483RFCLNMqY1t2wfTDtNcuOoypc0caThxg2E8yfSYCUr5Wox595J
         dcLhuODxuh1LdSYMQ50363+z5bYC3KVZfW0wD9a95C7MyUM9ZDP4SfbpwAyaGcQ7lBnp
         l/cr7byCYFF5V07t7cUrDg6gInXEK9l5WQpaCEZgGtwZBhkh6kRy0UP9WoFXOd5sY4Nb
         3vrw==
X-Forwarded-Encrypted: i=1; AJvYcCU8lw0Dcey0LOarxpij7scgp5eVditsi8YoFtM5RcnRVDWgD5Awn+uaMD839nRmLQx2fS4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGCb17bb48NS4HxvWPp384opic3HXUvEm+QLkxUCnYHf/e858U
	Ps1CTM61CcSMSUCWhXAQjc/JMUT9NXFD1cLXNpFYt9bwsPxqeBxP9AJVeCPYSXyQsaY=
X-Gm-Gg: AZuq6aJdNV4tzxVuOZ7bwMu+Mwk4Cyg1tr2vnOFaW30/Ee//Njewdv+KG5hX1IZF61z
	OD6H/wmD9T1j3mpIyKRV+k1FRcUS4JPjB+GITnSAf9mh7M5oMoEW3MNYIgdwgWn7uAisdVAPhwk
	7B/eDdxNkTCbFzgKcrpfKjZ7q3Wg3rhNNGzv0JpptxHWRUvX/ABLCX5G2ppdaghanNVoXtaCO4A
	r7EV0tj4o3ohlQTa1IauX9iUxlNS+YGcCre7D3WwI8Y9UeHD8NfxXietufPKwnkEXXmODTMjR1q
	pRrZj4+7bL/vEWFbOHgGnlwodgXxiSs5fUnYK0fIgKJyHk/Lk2MGBjOaaTkgpVh+iJpzXEiTKzg
	cu4gaXN31L79JM9Pf6OcyDvf2aB3+USS/D3YB2cdJM/SYJ87dHrNX1mnWeocEv/x5/BvKYpwh0N
	xLc3b7PTNv2hYnyKhlgdsxb/M04lvmz1/515wc6rlD2tZg5Wdd1s3mqLRnI2S+4eFOm+JJJjgB2
	ORbXuxxr85e6ivm
X-Received: by 2002:a05:600c:1554:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48069c1c2f4mr58353885e9.12.1769593610912;
        Wed, 28 Jan 2026 01:46:50 -0800 (PST)
Received: from panicking.amarulasolutions.com ([46.18.137.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d2585c6sm5821715e9.0.2026.01.28.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:46:50 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev (open list:FREESCALE IMX / MXC FEC DRIVER),
	netdev@vger.kernel.org (open list:FREESCALE IMX / MXC FEC DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
	imx@lists.linux.dev (open list:FREESCALE IMX / MXC FEC DRIVER),
	netdev@vger.kernel.org (open list:FREESCALE IMX / MXC FEC DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH] net: phy: integrate reset-after-clock quirk into phy_init_hw
Date: Wed, 28 Jan 2026 10:46:41 +0100
Message-ID: <20260128094644.302313-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of phy_reset_after_clk_enable requires MAC drivers
(like fec_main.c) to manually track PHY probing states and trigger resets
at specific points in their clock management flow and was created just for a SoC
vendor. This leads to fragile code in the Ethernet driver, involving complex
checks to see if the PHY device is bound.

This patch proposes moving the handling of the PHY_RST_AFTER_CLK_EN flag directly
into the generic phy_init_hw() function.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---

I need to test better some boards that need this reset, but
I need to confirm if the general approach is ok

---
 drivers/net/ethernet/freescale/fec_main.c | 41 -----------------------
 drivers/net/phy/phy_device.c              | 27 ++-------------
 include/linux/phy.h                       |  1 -
 3 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index e2b75d1970ae..ea112385e77e 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2364,28 +2364,6 @@ static int fec_enet_mdio_write_c45(struct mii_bus *bus, int mii_id,
 	return ret;
 }
 
-static void fec_enet_phy_reset_after_clk_enable(struct net_device *ndev)
-{
-	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct phy_device *phy_dev = ndev->phydev;
-
-	if (phy_dev) {
-		phy_reset_after_clk_enable(phy_dev);
-	} else if (fep->phy_node) {
-		/*
-		 * If the PHY still is not bound to the MAC, but there is
-		 * OF PHY node and a matching PHY device instance already,
-		 * use the OF PHY node to obtain the PHY device instance,
-		 * and then use that PHY device instance when triggering
-		 * the PHY reset.
-		 */
-		phy_dev = of_phy_find_device(fep->phy_node);
-		phy_reset_after_clk_enable(phy_dev);
-		if (phy_dev)
-			put_device(&phy_dev->mdio.dev);
-	}
-}
-
 static int fec_enet_clk_enable(struct net_device *ndev, bool enable)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -2416,7 +2394,6 @@ static int fec_enet_clk_enable(struct net_device *ndev, bool enable)
 		if (ret)
 			goto failed_clk_2x_txclk;
 
-		fec_enet_phy_reset_after_clk_enable(ndev);
 	} else {
 		clk_disable_unprepare(fep->clk_enet_out);
 		if (fep->clk_ptp) {
@@ -3554,7 +3531,6 @@ fec_enet_open(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
 	int ret;
-	bool reset_again;
 
 	ret = pm_runtime_resume_and_get(&fep->pdev->dev);
 	if (ret < 0)
@@ -3565,17 +3541,6 @@ fec_enet_open(struct net_device *ndev)
 	if (ret)
 		goto clk_enable;
 
-	/* During the first fec_enet_open call the PHY isn't probed at this
-	 * point. Therefore the phy_reset_after_clk_enable() call within
-	 * fec_enet_clk_enable() fails. As we need this reset in order to be
-	 * sure the PHY is working correctly we check if we need to reset again
-	 * later when the PHY is probed
-	 */
-	if (ndev->phydev && ndev->phydev->drv)
-		reset_again = false;
-	else
-		reset_again = true;
-
 	/* I should reset the ring buffers here, but I don't yet know
 	 * a simple way to do that.
 	 */
@@ -3587,12 +3552,6 @@ fec_enet_open(struct net_device *ndev)
 	/* Init MAC prior to mii bus probe */
 	fec_restart(ndev);
 
-	/* Call phy_reset_after_clk_enable() again if it failed during
-	 * phy_reset_after_clk_enable() before because the PHY wasn't probed.
-	 */
-	if (reset_again)
-		fec_enet_phy_reset_after_clk_enable(ndev);
-
 	/* Probe and connect to PHY when open the interface */
 	ret = fec_enet_mii_probe(ndev);
 	if (ret)
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e79a..3af652cbd7d2 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1376,6 +1376,9 @@ int phy_init_hw(struct phy_device *phydev)
 {
 	int ret = 0;
 
+	if (phydev->drv->flags & PHY_RST_AFTER_CLK_EN)
+		phy_device_reset(phydev, 1);
+
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
 
@@ -1956,30 +1959,6 @@ int phy_resume(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_resume);
 
-/**
- * phy_reset_after_clk_enable - perform a PHY reset if needed
- * @phydev: target phy_device struct
- *
- * Description: Some PHYs are known to need a reset after their refclk was
- *   enabled. This function evaluates the flags and perform the reset if it's
- *   needed. Returns < 0 on error, 0 if the phy wasn't reset and 1 if the phy
- *   was reset.
- */
-int phy_reset_after_clk_enable(struct phy_device *phydev)
-{
-	if (!phydev || !phydev->drv)
-		return -ENODEV;
-
-	if (phydev->drv->flags & PHY_RST_AFTER_CLK_EN) {
-		phy_device_reset(phydev, 1);
-		phy_device_reset(phydev, 0);
-		return 1;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(phy_reset_after_clk_enable);
-
 /* Generic PHY support and helper functions */
 
 /**
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 0bc00a4cceb2..d843415e65a6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1876,7 +1876,6 @@ int phy_speed_up(struct phy_device *phydev);
 bool phy_check_valid(int speed, int duplex, unsigned long *features);
 
 int phy_restart_aneg(struct phy_device *phydev);
-int phy_reset_after_clk_enable(struct phy_device *phydev);
 
 #if IS_ENABLED(CONFIG_PHYLIB)
 int phy_start_cable_test(struct phy_device *phydev,
-- 
2.51.0

