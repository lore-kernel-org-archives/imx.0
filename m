Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB628C5A4
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166736; cv=none; b=rHUKRwfv7PG9+k/phkhdyGo2BLudQPgqw2H7aTaq60+5Hj+HXInwqQ+YxEM94FSVswWvOxJEz7GINBkJGb5AJPy4OoIMIgTSiigWjRHrEDVQcxzZFGUtPKYJFe8jQHH3Rvm1oZ+VJIKtXACaaY38L/U8dYXO32DNNzwbutuPrQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166736; c=relaxed/simple;
	bh=zZnkF0g1+NgLVLuMRYVtdKFIaIV0BCv/KjxVB6ihNus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMeiJkmpkG7NRJRiK61CYAkfr3eFwqrLYybQIu8tfV/C2GL6CUvbjcZhljWzRJXjoJsT0FocyhpiaQc4LlPK7BrouS1G+ufQQ6ckP4dv0vHr2l7Pxy3sQaXNcJzBLo9bveJ4UjDLX0RE6NkOuIiCJo5FxOPlV7PLiZ9KQ4Diw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e2bf:c3f2:96ab:885d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id B4A1C66ED20
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:26 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 81E4D42A812
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:26 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id DEC5042A7AB;
	Tue, 17 Jun 2025 13:25:21 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id cdadae14;
	Tue, 17 Jun 2025 13:25:20 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 17 Jun 2025 15:24:56 +0200
Subject: [PATCH net-next v3 06/10] net: fec: fec_enet_rx_queue(): use same
 signature as fec_enet_tx_queue()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-fec-cleanups-v3-6-a57bfb38993f@pengutronix.de>
References: <20250617-fec-cleanups-v3-0-a57bfb38993f@pengutronix.de>
In-Reply-To: <20250617-fec-cleanups-v3-0-a57bfb38993f@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=zZnkF0g1+NgLVLuMRYVtdKFIaIV0BCv/KjxVB6ihNus=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoUWy22nuNGMEDjC255Pj31pEFlgnX4R4nR+T9L
 R/Nj384ey6JATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaFFstgAKCRAMdGXf+ZCR
 nD36B/4klelXCL97pKygjz3uKV3IcqsvEZZhOBHY4KZMiQV/YRMNjLpPt690anhMB+GKEUEXFQG
 NNFIlOgm7FOJ4p9wcnac++ayRJhd0z6nAnwKjScV9ilZoH34u3LwX4QNtQmQT79eRvR94vxXmhn
 s35GojXxIkQLpzrGI7HRWOR0jUK2lhG4DgkAHBsamT3UHih8kWEtzrGpNQI7Tu5D2JATjGX0etX
 6jTgCGU8qxGyPFld/fTQ6TNDO6ExRlJ4bKxCAaf5Hx4DEkY6l/vOx85TKoBd7w04EKhqaXUh+Lr
 aoNiO/XQkWKZ532TQ8slerN79w2HdeTLW80fXzH3bVT/yDt6
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

There are the functions fec_enet_rx_queue() and fec_enet_tx_queue(),
one for handling the RX queue the other one handles the TX queue.

However they don't have the same signature. Align fec_enet_rx_queue()
argument order with fec_enet_tx_queue() to make code more readable.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 21891baa2fc5..6b456372de9a 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1713,7 +1713,7 @@ fec_enet_run_xdp(struct fec_enet_private *fep, struct bpf_prog *prog,
  * effectively tossing the packet.
  */
 static int
-fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
+fec_enet_rx_queue(struct net_device *ndev, u16 queue_id, int budget)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
 	struct fec_enet_priv_rx_q *rxq;
@@ -1940,7 +1940,7 @@ static int fec_enet_rx(struct net_device *ndev, int budget)
 
 	/* Make sure that AVB queues are processed first. */
 	for (i = fep->num_rx_queues - 1; i >= 0; i--)
-		done += fec_enet_rx_queue(ndev, budget - done, i);
+		done += fec_enet_rx_queue(ndev, i, budget - done);
 
 	return done;
 }

-- 
2.47.2


