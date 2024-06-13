Received: from EXCEDGE02.prodrive.nl (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CEC15E85
	for <imx@lists.linux.dev>; Thu, 13 Jun 2024 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290614; cv=none; b=uOq4Pm9R6aw4aPFqPcfVym3IKp9RWZbir3AQ64/MZAc2q04tL/Fk4+woFVqebRb2qNtBytoMMUM3dif2+kKdkLAmrzcs8RUERzYF6vSdYjMKqe6Gq5et5txYn+jbI12sx3BQTdpJGKVATlX/EFCJrfUxmZrqyZlTbDryEzA9P/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290614; c=relaxed/simple;
	bh=JBD5JZgYoYP7sSdaelVg7aP3qlQnjwjxKiVYCRSyL+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TLLdcH9j+uhfv6SMBDYk92a5LND7UtxUTsQfLBsvOpWjW3cCuyu2MWozhHdmGASlWT41ihCxr/b//U21k/p/Xlca3b9K+GFWO4TT9T4+5xK2GNQdSxwZou60X/2eJMLhRWDmggg5N5cYV8Bw+hOyxx37drLLq9MYdLLOdtxNQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by webmail.prodrive.nl
 (192.168.102.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 13 Jun
 2024 16:41:42 +0200
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Jun
 2024 16:41:41 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1258.12
 via Frontend Transport; Thu, 13 Jun 2024 16:41:41 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.94.2)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1sHle1-001Uou-3r; Thu, 13 Jun 2024 16:41:41 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <wei.fang@nxp.com>, <shenwei.wang@nxp.com>, <xiaoning.wang@nxp.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Paul Geurts <paul.geurts@prodrive-technologies.com>
Subject: [PATCH] fec_main: Register net device before initializing the MDIO bus
Date: Thu, 13 Jun 2024 16:41:11 +0200
Message-ID: <20240613144112.349707-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Registration of the FEC MDIO bus triggers a probe of all devices
connected to that bus. DSA based Ethernet switch devices connect to the
uplink Ethernet port during probe. When a DSA based, MDIO controlled
Ethernet switch is connected to FEC, it cannot connect the uplink port,
as the FEC MDIO port is registered before the net device is being
registered. This causes an unnecessary defer of the Ethernet switch
driver probe.

Register the net device before initializing and registering the MDIO
bus.

Fixes: e6b043d512fa ("netdev/fec.c: add phylib supporting to enable carrier detection (v2)")
Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 881ece735dcf..ed71f1f25ab9 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -4500,10 +4500,6 @@ fec_probe(struct platform_device *pdev)
 	/* Decide which interrupt line is wakeup capable */
 	fec_enet_get_wakeup_irq(pdev);
 
-	ret = fec_enet_mii_init(pdev);
-	if (ret)
-		goto failed_mii_init;
-
 	/* Carrier starts down, phylib will bring it up */
 	netif_carrier_off(ndev);
 	fec_enet_clk_enable(ndev, false);
@@ -4515,6 +4511,10 @@ fec_probe(struct platform_device *pdev)
 	if (ret)
 		goto failed_register;
 
+	ret = fec_enet_mii_init(pdev);
+	if (ret)
+		goto failed_mii_init;
+
 	device_init_wakeup(&ndev->dev, fep->wol_flag &
 			   FEC_WOL_HAS_MAGIC_PACKET);
 
@@ -4528,9 +4528,9 @@ fec_probe(struct platform_device *pdev)
 
 	return 0;
 
-failed_register:
-	fec_enet_mii_remove(fep);
 failed_mii_init:
+	unregister_netdev(ndev);
+failed_register:
 failed_irq:
 	fec_enet_deinit(ndev);
 failed_init:
@@ -4577,8 +4577,8 @@ fec_drv_remove(struct platform_device *pdev)
 
 	cancel_work_sync(&fep->tx_timeout_work);
 	fec_ptp_stop(pdev);
-	unregister_netdev(ndev);
 	fec_enet_mii_remove(fep);
+	unregister_netdev(ndev);
 	if (fep->reg_phy)
 		regulator_disable(fep->reg_phy);
 
-- 
2.30.2

