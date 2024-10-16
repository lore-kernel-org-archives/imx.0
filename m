Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1791D416B
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729115553; cv=none; b=SOmWckM1JF2NtbuSngFVE7YwKSoMoEWCqGH+tLc2sPjQk3Er/EBaxpRnmgwRbovTNVUiOwGx09L/o5pruOIjGy9xWZvZPHgJEAFxY1ve4TBLXHOdwLlxikTC/ECoMYX4qetwdwxW7Tz6Hwieor8HFwKmatnOdOM31CkRaniJEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729115553; c=relaxed/simple;
	bh=cn22VKjfBAbFtPsT2liZvFbvkJqLykwD+CuiacuoiZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISLbnMMes1IaSLCSJ4bV19kHeEleI5/Apu0guhL/0I9FupSbbKxmFGBChFFAPHQhILiv/6XUyJfNs7DahRUYQfFxGcxBHuckHi9dDwgdlTjeulpZi1HJrc7LvSWSCeSe+oYYWUQTrrnAfvwdsjPAu/5r0DHepaW/8i3rAjWuteQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t1BwS-0003Ne-MY
	for imx@lists.linux.dev; Wed, 16 Oct 2024 23:52:28 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1t1BwP-002ORp-68
	for imx@lists.linux.dev; Wed, 16 Oct 2024 23:52:25 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 78C803548F0
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 21:52:24 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id B5AFF354890;
	Wed, 16 Oct 2024 21:52:20 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 7084427b;
	Wed, 16 Oct 2024 21:52:19 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 16 Oct 2024 23:51:58 +0200
Subject: [PATCH net-next 10/13] net: fec: fec_enet_rx_queue(): replace open
 coded cast by skb_vlan_eth_hdr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-fec-cleanups-v1-10-de783bd15e6a@pengutronix.de>
References: <20241016-fec-cleanups-v1-0-de783bd15e6a@pengutronix.de>
In-Reply-To: <20241016-fec-cleanups-v1-0-de783bd15e6a@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=cn22VKjfBAbFtPsT2liZvFbvkJqLykwD+CuiacuoiZE=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnEDWMBWI4xFi8Kwp4d7kTNXyszpOf9JasgZ+qJ
 ENqBUjL7V2JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZxA1jAAKCRAoOKI+ei28
 b4pXB/0S+MLq7elDcJ9CdljZK4vhQLy5ZMR2hqzxgee8s8zwyDVDtD1Rg6ZrBX6E33sePax7Nuc
 0JTBpmB1ZKkOhi10SmUIcwtRuogixrGmPLoHgW8uT4mVTIy1rEZJwTr3RC3KBFfAEfW9x2zntmX
 AzDBZ/uTz/M7ATRs5yko3ox2oJZizcLxeFqN8PFlyBlxLZOvbmcKhmU5sS3ZJ2yfQ++Gjew8jH4
 Vbdk/IaNZRJpTa/e8GBBFxLzb/VKtGsbpghZ969vwvc11FrZ40+uj7MUXNlfeWkazqR/OlAgCED
 9t5qkAqBgHGTZVDkYQEeEfDpxN9MMScm+aMcCowqAHN2wxfx
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

In order to clean up the VLAN handling, replace an open coded cast
from skb->data to the vlan header with skb_vlan_eth_hdr().

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index eb26e869c026225194f4df66db145494408bfe8a..fd7a78ec5fa8ac0f7d141779938a4690594dbef1 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1819,8 +1819,7 @@ fec_enet_rx_queue(struct net_device *ndev, u16 queue_id, int budget)
 		    fep->bufdesc_ex &&
 		    (ebdp->cbd_esc & cpu_to_fec32(BD_ENET_RX_VLAN))) {
 			/* Push and remove the vlan tag */
-			struct vlan_hdr *vlan_header =
-					(struct vlan_hdr *) (data + ETH_HLEN);
+			struct vlan_ethhdr *vlan_header = skb_vlan_eth_hdr(skb);
 			vlan_tag = ntohs(vlan_header->h_vlan_TCI);
 
 			vlan_packet_rcvd = true;

-- 
2.45.2


