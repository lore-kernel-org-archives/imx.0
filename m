Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41E27E07E
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248036; cv=none; b=XM6I6MnqmqgUSRGHToDAlqJ0LSu0IvdS/qGqK14UhGqnzbFxBHi2uCosN5wKnm5IKzWEkiKFb48FIZVNI0RP8tWCeHdFvv67yULsplfRs+98EMu101cyGpjNTI1mNxMdA91TCa+DJTRGzp28CAADvTgHzi99BDaMkyHwz0jgaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248036; c=relaxed/simple;
	bh=sA04u1PdDgRmLuhc7IHhWUv+JPtsYb7W1PMpqmuQz+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XA3q0zuYVgaIsZeR7p92uOGXHvlw5WSzvyK556+N5DVO+2nmYgjWOfi4ND+fHfRzbFEH4h8IdBckSJSYs3rgOBFtIZ5X9Cae8B0L2g5wyOeLx04eSt/EKj6AsnTDOn1FGW9OHNzQ8txFSdT4OsuxLed683n9Me5m9F5+CZrirtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:d189:60c:9a01:7dca])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id C729766FC0C
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:00:30 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 95AD342B530
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:00:30 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 09BC842B50B;
	Wed, 18 Jun 2025 12:00:29 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 7141dbd4;
	Wed, 18 Jun 2025 12:00:28 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 18 Jun 2025 14:00:02 +0200
Subject: [PATCH net-next v4 02/11] net: fec: struct fec_enet_private:
 remove obsolete comment
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-fec-cleanups-v4-2-c16f9a1af124@pengutronix.de>
References: <20250618-fec-cleanups-v4-0-c16f9a1af124@pengutronix.de>
In-Reply-To: <20250618-fec-cleanups-v4-0-c16f9a1af124@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, bpf@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=sA04u1PdDgRmLuhc7IHhWUv+JPtsYb7W1PMpqmuQz+g=;
 b=kA0DAAoBDHRl3/mQkZwByyZiAGhSqkahux7b8pEGV48hgTPjvgsVEoF/MhMJowe+KK1is1Czb
 YkBMwQAAQoAHRYhBJ/7DNivZ6hf/BVs8wx0Zd/5kJGcBQJoUqpGAAoJEAx0Zd/5kJGc7nQIAJTo
 N/fzhUb43E4oLTJlc3gdzyV7UqD5BaUED+IWZkfkV25Kzlfub3CwHU0xXGCCWP6rl2IREY8+YRl
 4R6HFvlvkTebMhC0boQNBlTRR/KKwRuEEJytT4Oq+S83jEsSgJbSrE7vXYLyNPrln9Bl3KKJiC/
 7OgkK7G99RqYVgfFIaGzN0RCXn3dPiHwyjE7DTNyILbzaJwavFN+QpiToiAhmAZwKyjSPfwNDh7
 opVPhbOk2/DYR1YdKs12d9WEeEuclrigJ3DPhObWDrEG9TeQjFsMwLKm6WSvX3WC1NLiUVxUhgC
 jZkjfXQ7n+NHgJ3iZrFWTyed9VtlH+s88P7Wza0=
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

In commit 4d494cdc92b3 ("net: fec: change data structure to support
multiqueue") the data structures were changed, so that the comment about
the sent-in-place skb doesn't apply any more. Remove it.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 3cce9bba5dee..ce1e4fe4d492 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -614,7 +614,6 @@ struct fec_enet_private {
 	unsigned int num_tx_queues;
 	unsigned int num_rx_queues;
 
-	/* The saved address of a sent-in-place packet/buffer, for skfree(). */
 	struct fec_enet_priv_tx_q *tx_queue[FEC_ENET_MAX_TX_QS];
 	struct fec_enet_priv_rx_q *rx_queue[FEC_ENET_MAX_RX_QS];
 

-- 
2.47.2


