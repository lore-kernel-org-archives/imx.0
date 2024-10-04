Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB61AA79E
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055475; cv=none; b=swRjYw8jjb9x0gCAT1xaWQlhGI2+vdNHYM3dEJbnpIK5JTljap4tX8hRK5gAUzeP4AA1mosKMfHx+BpNDU5rpUhF0v8xmbe7QbhTDt/iTRfTtJlzFOqyF7iMfTz0T939Veupx6Gf+EIR7/DDGmsdUGWenffL4Tq+M2Znwv5f2+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055475; c=relaxed/simple;
	bh=SBkiaUlKESpkzxowsLPzQ06N4HMke3qJ1FgvApVwVUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=leeljoPMUo8NjJ+e1Tg3BllVVsOipGqibkq/bc0QI+fqRYjZYmkMqwiI51rgln6XcVXpoIvJ+OTjUHgsNXnU47s2QakRts6/VNXXgYrXdGBru2Fw57vH35yTcHaMrGhJtHSG0HO4jf9fjoMb59wfz84lAdljsLSgF3apkjWUKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=YGKx+jKe; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="YGKx+jKe"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7E66320E6A;
	Fri,  4 Oct 2024 17:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1728055472;
	bh=KptdMQH+uxSKHP9pjmqfYtljNFGdshmXN06eLUlgi/0=; h=From:To:Subject;
	b=YGKx+jKeyGwPTK6aIWenY7KyUgJC/HHQa++ChR1Or7cZQhgrC8EKpXUzOQDC4HWZz
	 ES2ETkNGTfLHiLANHkUnT43CETfYs0cab1VDsX4ncnR9XdM1DwIuUD3MCcMNyCV2mw
	 xYme84OqXN9W6XdQZmzVEbMsi+2a8Z7AzObRU1vcNZgrii+eL1idZnuqyKe5xNBMmT
	 SdeCfO7U0ikw0LEaNAhNDfBxzhjr8wi2+5OM7c/WAXfFJIG6uy3u8hhaeyAgXtKdF7
	 yMrihUVHdWbaWh18/u+pXYzXzqQj0Xpglyv+gB1OirYG4LI4SCkiu3lQKfcAv/5NR3
	 rs7g2XPDZA0qA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Linux Team <linux-imx@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Rafael Beims <rafael.beims@toradex.com>
Subject: [PATCH net-next v4 3/3] net: fec: make PPS channel configurable
Date: Fri,  4 Oct 2024 17:24:19 +0200
Message-Id: <20241004152419.79465-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004152419.79465-1-francesco@dolcini.it>
References: <20241004152419.79465-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Depending on the SoC where the FEC is integrated into the PPS channel
might be routed to different timer instances. Make this configurable
from the devicetree.

When the related DT property is not present fallback to the previous
default and use channel 0.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Rafael Beims <rafael.beims@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4: no changes
v3: no changes
v2: add Reviewed|Tested-by
---
 drivers/net/ethernet/freescale/fec_ptp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index ce7aa2c38c7f..aea24575e840 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -523,8 +523,6 @@ static int fec_ptp_enable(struct ptp_clock_info *ptp,
 	unsigned long flags;
 	int ret = 0;
 
-	fep->pps_channel = DEFAULT_PPS_CHANNEL;
-
 	if (rq->type == PTP_CLK_REQ_PPS) {
 		fep->reload_period = PPS_OUPUT_RELOAD_PERIOD;
 
@@ -706,12 +704,16 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
+	struct device_node *np = fep->pdev->dev.of_node;
 	int irq;
 	int ret;
 
 	fep->ptp_caps.owner = THIS_MODULE;
 	strscpy(fep->ptp_caps.name, "fec ptp", sizeof(fep->ptp_caps.name));
 
+	fep->pps_channel = DEFAULT_PPS_CHANNEL;
+	of_property_read_u32(np, "fsl,pps-channel", &fep->pps_channel);
+
 	fep->ptp_caps.max_adj = 250000000;
 	fep->ptp_caps.n_alarm = 0;
 	fep->ptp_caps.n_ext_ts = 0;
-- 
2.39.5

