Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6119149A
	for <imx@lists.linux.dev>; Fri,  9 Aug 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723195136; cv=none; b=nlWDvADV5IeL2l+h0Km+SMx4+csXiFDGytd2RrnBpLzz4HgDpqC0jzJaNEvVxp5K8vAwPmdmQCh0gQjL9qjQ8wMcxO8HaX/T4hIOs4WCwnFNiiq1O5L/widP/LOWPVFAplzz9n6q8pQFZtF1ahGdexWcdP+HQeVwdebGwxDAkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723195136; c=relaxed/simple;
	bh=QM5RqrqcktqXeIDfRBP175DXMqiPVEAu+7zAxCxcFnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCy9ZWxZf6rDb+20hgD/I2Zz17O13P5Kty2cFCvXFqbESvDmMgCHs8pY7zSF7aSHl+CPEM9V2xcupMg0lncDqwTSZn/ZnjWZRgH/Xt/WAkeraU43MtRgYY2NpTtUZsgMHmN029iioF4jYWKjQGC1EeZxhW6Gb3CwTw7sFWFxQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=S5vGPXQg; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="S5vGPXQg"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8AB5E2225F;
	Fri,  9 Aug 2024 11:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1723195132;
	bh=/l2VIPtGJZdoH2vVzcshpCeh2OG0Hg9867gp1xRmQ5w=; h=From:To:Subject;
	b=S5vGPXQgRtjy8WhmdLXPZF2mVZEi6QOqGFONWI/RSjxDQTFzbo/VIHJlfgEm2eLaV
	 Mh8jUviJBWt2yYNzZDMS7RskV63dOqeamt4kof1+GcHwMbNtE23k2X8wJNlQGelsEW
	 nzrS2vRZy2AQqrN21DsdBgfEetgTLIAr7TGlyuqgXX1VaUtCf6ZT9y5YBrMjUl3mnz
	 FfGhZ46Hn3VDbLlUwoqeNN59NiHTTBJRGpjFOn9yJ9y9AFHs/AnR/mGyWf9nO5WMnS
	 jz6zbj0nFCreDnXyR0uonQGZKU+EGyrYwfCtUSs41n/cz7zJgZ94wgHDSoc1UgFrh5
	 rBqYv5VcraVpg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Rafael Beims <rafael.beims@toradex.com>
Subject: [PATCH v2 3/3] net: fec: make PPS channel configurable
Date: Fri,  9 Aug 2024 11:18:44 +0200
Message-Id: <20240809091844.387824-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809091844.387824-1-francesco@dolcini.it>
References: <20240809091844.387824-1-francesco@dolcini.it>
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
v2: add Reviewed|Tested-by
---
 drivers/net/ethernet/freescale/fec_ptp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 25f988b9c7cf..2e05083cbf29 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -529,8 +529,6 @@ static int fec_ptp_enable(struct ptp_clock_info *ptp,
 	unsigned long flags;
 	int ret = 0;
 
-	fep->pps_channel = DEFAULT_PPS_CHANNEL;
-
 	if (rq->type == PTP_CLK_REQ_PPS) {
 		fep->reload_period = PPS_OUPUT_RELOAD_PERIOD;
 
@@ -712,12 +710,16 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
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
2.39.2

