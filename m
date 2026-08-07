Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEE13A1696
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 03:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786074886; cv=none; b=s1HIW98wwE3rSjd2V0tUEb18Kuklu1IL7zf5cLY+JajYsupZpgNVQLEyfRoCG4bXF8HnKLt9Xmd7Appko9hBI3GMNo8ne8dqSD2I4HnLCRRhYSulSohv85lD6K5B+IfVoOMd+xEY+6zhWirhOecM7xDqZd7uIMtdsjMVskS4XCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786074886; c=relaxed/simple;
	bh=0+TjxDD3Jy9In/dYW3swTJjk2WwZ3m7x7rp80MwetQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmbMb505CMUdUzq5c7jk3euocW/NH5UIh2mqeI/HYo+m2DWJxHnn/5b6Fsdoh9PnpPIGhatIgEW15c9B1xUqFdB24U6lJ78+x0W/MwHi9XECnF9hyPLKccWmoQ/kaufI1ccS9yTsdTBH6KlPy6CMPAaWWR3sPENA/lkJI86t9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJckgvun; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJckgvun"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-455ca262ccbso1649530fac.1
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 20:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786074883; x=1786679683; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oG17fuSe5U2XTSseOTKToMBz/2cRmkeSjfgTvQP48IM=;
        b=gJckgvunoVh/2Yr3bVT17yxDjhAsSxchBB5OEFB/juZPyobdrwI4UEdJR+iPJQMcrn
         /lTG4+irKLiw9lR9b7Y1ZMaVaJsLWNkvpucwlVcXfX/GjUvgOu5zMd3iHnD6ILjzRHPl
         UExscmvNESduNjMi6UTDdw3jlgArEoc36MvpB9LG+Hc3SFs48bS6Uo7wFIr7+8DvfaFb
         jF+UFKOObBIBi6rdkq+wuAviI5KYbCH55+2Ht5Bg2kHN7YISj6FalI07X4cz/up5uqVe
         bGSp8llDU7Q0OsuimROc2Cf2r+A5cTUMlFPygqDLbzTjCqeArQiPY/JcvA9sD8JmAiTm
         Dz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786074883; x=1786679683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG17fuSe5U2XTSseOTKToMBz/2cRmkeSjfgTvQP48IM=;
        b=bvxiHevh7UUSIz1cB87J/gxp/m3mEb/16iIz0E+vAsF7Sb7vnJXVW+QGGP2FQGqVk0
         7ILqGyjdfTt6jNT3zJjjrNP1ZC0IBErxv1OF3de8TVT8rZCxAsJvmUOWXBcEhgjQhR+h
         PuFyAmk5q7/DSPT580V0FOjrxEURgya1VB6GryU78viw2CAVWTV6VP8NdNdvaDtIEMsd
         GEgUi5oSlzihRaS7t0jZ7zIi8h9tmfD2xbjUsN2coZ0z/Vsiha6pzX63QuSpEqNyF1rj
         H1NGGygt/tDAMDf0BKwDKZ1hJd1BH4FEhF19qrj3+yX0xD/WdcDtCc0JM9Goa4S21Izl
         Gv7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqg86dPCZWIENuzksIRUeKHq7LmYf8UqtNAhH9xmzdPFwOXMmVzTsQXstBKJ1xVlI+rHiE=@lists.linux.dev
X-Gm-Message-State: AOJu0YySydUdDVnkARDL8HZZbK9Ge0Rc4I3Pl2Dk4hHnB0NQcEjpDpz1
	ythI41kaAmGrpDngD1JUQQg5X9tGY3BLg0x5Y5QfIko+Ow+auZyEnW81
X-Gm-Gg: AR+sD11XkWlDctqeLg8sawla2XRWnkuIGLm14YQ6J5FLMDn9Imacpmdph7TaVXAnYuX
	RO8heF6Kgv8Rwo4JphtduPIHkNIMFkYVv/m7HYXSWnDh6fR2ptMoQFnABv+43qOXOG2wiblO5fs
	3z44lPaZk7TnvxjL97D0+QhS/2k3lmk7AZw+j7bi+vWQqptPIkI/cKTJuCnD8mq4F4ow+e3oKC+
	Xx7UvJFQrCnM3lBhHrNQo/us65WqIXX7PLZogZp9W0Zk2O/FrGDVC+ziP0qA8f3SmIXHNFf1gyw
	pca/8b+Sfq0nfVg6RM1RoLc9raWgCs4YXRfuJz9DYjKiVdaMtZUp96dHUpCn6vYOJYv/x3yveak
	17Xn1rO1Mz4xAFuscN0dvQXruoHz/oc76SOQa/GkenMDZR4BHorL2ezlwApYBfnt0foWQ6hq1L5
	9AdC0xDS/MDzTIycCPQRrCx5T9eaDbmQpSvAsEmtgkd05JNOvsyIgWgV/pFENxKvjcdw7p6oWjl
	HnERPx8jPKl91rLkqpEfbgfioD2bwKSxn269ZgFWd2w4RYZPwDkIOnDmrwLuc88kEdBZFy1tscl
	wlKhmKrboUxGxHTNmou88RIbcXWI49EWE5V5A1jjyFkP9C4CjSMhIEI3MYjxMletv+6JigPBcLb
	1fvGifrAgKRKl2LQKDQ==
X-Received: by 2002:a05:6820:987:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6ae96d0b246mr11060312eaf.16.1786074883485;
        Thu, 06 Aug 2026 20:54:43 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bbc41bbsm1329339eaf.3.2026.08.06.20.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:54:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 06 Aug 2026 21:54:20 -0600
Subject: [PATCH net-next v4 1/4] net: phy: cache MDIO bus owner before
 dropping PHY reference
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-submit-mdio-of-dynamic-v2-v4-1-4beb0c50d5ba@gmail.com>
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
In-Reply-To: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Michael Chan <michael.chan@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
 Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Timur Tabi <timur@kernel.org>, nic_swsd@realtek.com, 
 Byungho An <bh74.an@samsung.com>, 
 Steve Glendinning <steve.glendinning@shawell.net>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, 
 Thangaraj Samynathan <Thangaraj.S@microchip.com>, 
 Sebastian Reichel <sre@kernel.org>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2

phy_attach_direct() and phy_detach() cache the MDIO bus pointer, drop their
PHY device reference, and then read bus->owner. If the put releases the PHY
during concurrent teardown, the cached pointer does not itself keep the
parent bus alive.

Cache the module pointer before dropping the PHY reference. The existing
module reference protects the cached pointer whenever the MDIO bus and
network device have different owners.

Fixes: ec988ad78ed6 ("phy: Don't increment MDIO bus refcount unless it's a different owner")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phy_device.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..34d00f1ee483 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1752,7 +1752,7 @@ static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		      u32 flags, phy_interface_t interface)
 {
-	struct mii_bus *bus = phydev->mdio.bus;
+	struct module *bus_owner = phydev->mdio.bus->owner;
 	struct device *d = &phydev->mdio.dev;
 	struct module *ndev_owner = NULL;
 	int err;
@@ -1764,7 +1764,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	 */
 	if (dev)
 		ndev_owner = dev->dev.parent->driver->owner;
-	if (ndev_owner != bus->owner && !try_module_get(bus->owner)) {
+	if (ndev_owner != bus_owner && !try_module_get(bus_owner)) {
 		phydev_err(phydev, "failed to get the bus module\n");
 		return -EIO;
 	}
@@ -1900,8 +1900,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	d->driver = NULL;
 error_put_device:
 	put_device(d);
-	if (ndev_owner != bus->owner)
-		module_put(bus->owner);
+	if (ndev_owner != bus_owner)
+		module_put(bus_owner);
 	return err;
 }
 EXPORT_SYMBOL(phy_attach_direct);
@@ -1917,7 +1917,7 @@ void phy_detach(struct phy_device *phydev)
 {
 	struct net_device *dev = phydev->attached_dev;
 	struct module *ndev_owner = NULL;
-	struct mii_bus *bus;
+	struct module *bus_owner;
 
 	if (phydev->devlink) {
 		device_link_del(phydev->devlink);
@@ -1972,17 +1972,14 @@ void phy_detach(struct phy_device *phydev)
 	/* Assert the reset signal */
 	phy_device_reset(phydev, 1);
 
-	/*
-	 * The phydev might go away on the put_device() below, so avoid
-	 * a use-after-free bug by reading the underlying bus first.
-	 */
-	bus = phydev->mdio.bus;
+	/* The PHY and its parent bus may be released by put_device() below. */
+	bus_owner = phydev->mdio.bus->owner;
 
 	put_device(&phydev->mdio.dev);
 	if (dev)
 		ndev_owner = dev->dev.parent->driver->owner;
-	if (ndev_owner != bus->owner)
-		module_put(bus->owner);
+	if (ndev_owner != bus_owner)
+		module_put(bus_owner);
 }
 EXPORT_SYMBOL(phy_detach);
 

-- 
2.53.0

