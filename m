Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550256;
	b=UnsFSU4UvFIMw8erWDhZJoG/6bU1+IkxmQl0MVoI3j4fSHbDUTR7O4vzL9zvVs6u6Gxy
	 BUVXSnCOewTFCND7UpiA0II8Hsm3P13kJqxIDHDFf0kOBr+cPaCQDWmZgSxXnblXodkoq
	 T/TPlvdID9cDKoVjxB4NTw0PI8c7HqwXHr3G3fBw7yBubS9gE50rBXyGldC0tF2fzWA+g
	 JXh2h+ygQlDUbHZemapukP68emBTLvix7Pb6tWMroj+AOR8guPKmfPjGI3dLNBtofpljJ
	 0stO+efu2yovW5uIEjs21RMtmtqJHf2D2EAklho3RhoKmCHiGI/0BSVWZplajOzdi4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550256;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hDOM2tXalzzTZL+I3hmHPar7QZg9wO20POfFRI7De1o=;
	b=KOPi+gQWIJzI3z8HmcBh+kLEtVBDlS3ln3yXqJ1v1C7GeT6sIUY9yUkJGxCKjswDdMxo
	 tk6vhHijTBNWmy2j+YPC9nNMTTp7z+2NhjWoYtNkDvd/FK4lN8jsWbwmdYj75d8B+MC1N
	 0wNH0glmcA4qP4mQRM8/pp3r51b6gqQqVp9EiUjlfPlVh1pNhM+Ry2Whm9RnzWAO7diWb
	 pr3mXe2A56UTRb3zbRPfQ1olYUXA+i/75xFyLktfHtjNUMVVFgU1dT0U2QQaxxpxXUmxd
	 Ywqn0dGYJxJy5j1MzaaUL4c4NyqrMfmMVI5AjLe0PF5HXlcTj1HLjTSXcYbVLTB+FMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=OiqPK1C3;
	arc=none smtp.remote-ip=115.124.28.52
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA74606A320
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 02:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA74606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=OiqPK1C3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792550247; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hDOM2tXalzzTZL+I3hmHPar7QZg9wO20POfFRI7De1o=;
	b=OiqPK1C3Ws3GktZI5TAU64MkJX1/ylZy9POI8kQL0wnQo4+rtKyoFsZ5+74S83cSnd92Xrn1TQdgynCg4BPiifSMhNuJCZDBya7aGIG6fMyVR0ywi7SWgTd6tqB3rhtwNKWfumsT/3nzlwDzY4eskK3gZT6PwVRQuUIaD+EQRsxfBaGRzHrQrS3pCpYFChAUSJtJEQe7iN/qPlBxesOu6P69DwAEvKXI+YMUBTncqRAgtIxfVq4Y9t1E1kriCSVhIVDeUB+AXPRwPnPTC2PUTDJuMzYaa2vLTK5W4ynZljkEa0/ujvYINejIFjRdcb0lbSsPgF+Nhi7/maTxIHIbfQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436261|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0253096-0.00470234-0.969988;FP=2915779513016650645|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jm9xUvS_1792550246;
Received: from galx..(mailfrom:chunyuzhiqiang@yinhe.ht fp:SMTPD_---.jm9xUvS_1792550246 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 21 Oct 2026 10:37:27 +0800
From: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	linux-can@vger.kernel.org,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	haibo.chen@oss.nxp.com,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	stable@vger.kernel.org,
	ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Subject: [PATCH v6] can: dev: can_fill_info(): don't wake up controller if interface is down
Date: Wed, 21 Oct 2026 10:33:34 +0800
Message-ID: <20261021023334.11803-1-chunyuzhiqiang@yinhe.ht>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the interface is down, the CAN controller might be powered down, the
clock disabled, and/or its external reset asserted.

Don't call do_get_berr_counter() or do_get_auto_tdcv() to read the CAN
controller if the interface is down. This fixes a generic logic problem
that exists on all platforms.

As a result, IFLA_CAN_BERR_COUNTER is no longer reported for down
interfaces, and the automatic TDCV readback is skipped. The other TDC
parameters are still reported, as they are meaningful while the
interface is down. This is intentional: the counters and the automatic
TDCV are not meaningful in that state, and calling into the driver can
wake a runtime-suspended controller or touch registers whose clocks are
gated.

Fixes: ec56acfef2af1 ("can: flexcan: flexcan_get_berr_counter(): switch on clocks before accessing ecr register")
Cc: stable@vger.kernel.org
Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
---
v6:
 - Only gate do_get_auto_tdcv() on netif_running(), as suggested by
   Vincent Mailhol and Marc Kleine-Budde. The other TDC parameters are
   still reported for down interfaces.
 - Adjust can_tdc_get_size() so that only the automatic TDCV size is
   skipped when the interface is down.
 - Keep the berr-counter gating unchanged.
---
 drivers/net/can/dev/netlink.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/can/dev/netlink.c b/drivers/net/can/dev/netlink.c
index 6f83b87d54fc..ae0cef791ef3 100644
--- a/drivers/net/can/dev/netlink.c
+++ b/drivers/net/can/dev/netlink.c
@@ -517,7 +517,7 @@ static int can_changelink(struct net_device *dev, struct nlattr *tb[],
 }
 
 static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
-			       u32 tdc_flags)
+			       u32 tdc_flags, bool auto_tdcv_running)
 {
 	bool tdc_manual = tdc_flags & CAN_CTRLMODE_TDC_MANUAL_MASK;
 	size_t size;
@@ -538,7 +538,7 @@ static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
 	}
 
 	if (tdc_flags) {
-		if (tdc_manual || dbt_params->do_get_auto_tdcv)
+		if (tdc_manual || (dbt_params->do_get_auto_tdcv && auto_tdcv_running))
 			size += nla_total_size(sizeof(u32));	/* IFLA_CAN_TDCV */
 		size += nla_total_size(sizeof(u32));		/* IFLA_CAN_TDCO */
 		if (dbt_params->tdc_const->tdcf_max)
@@ -548,8 +548,9 @@ static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
 	return size;
 }
 
-static size_t can_data_bittiming_get_size(struct data_bittiming_params *dbt_params,
-					  u32 tdc_flags)
+static size_t
+can_data_bittiming_get_size(struct data_bittiming_params *dbt_params,
+			    u32 tdc_flags, bool auto_tdcv_running)
 {
 	size_t size = 0;
 
@@ -560,7 +561,8 @@ static size_t can_data_bittiming_get_size(struct data_bittiming_params *dbt_para
 	if (dbt_params->data_bitrate_const)		/* IFLA_CAN_DATA_BITRATE_CONST */
 		size += nla_total_size(sizeof(*dbt_params->data_bitrate_const) *
 				       dbt_params->data_bitrate_const_cnt);
-	size += can_tdc_get_size(dbt_params, tdc_flags);/* IFLA_CAN_TDC */
+
+	size += can_tdc_get_size(dbt_params, tdc_flags, auto_tdcv_running); /* IFLA_CAN_TDC */
 
 	return size;
 }
@@ -584,7 +586,7 @@ static size_t can_get_size(const struct net_device *dev)
 	size += nla_total_size(sizeof(u32));			/* IFLA_CAN_STATE */
 	size += nla_total_size(sizeof(struct can_ctrlmode));	/* IFLA_CAN_CTRLMODE */
 	size += nla_total_size(sizeof(u32));			/* IFLA_CAN_RESTART_MS */
-	if (priv->do_get_berr_counter)				/* IFLA_CAN_BERR_COUNTER */
+	if (priv->do_get_berr_counter && netif_running(dev))	/* IFLA_CAN_BERR_COUNTER */
 		size += nla_total_size(sizeof(struct can_berr_counter));
 	if (priv->termination_const) {
 		size += nla_total_size(sizeof(priv->termination));		/* IFLA_CAN_TERMINATION */
@@ -598,7 +600,8 @@ static size_t can_get_size(const struct net_device *dev)
 	size += can_ctrlmode_ext_get_size();			/* IFLA_CAN_CTRLMODE_EXT */
 
 	size += can_data_bittiming_get_size(&priv->fd,
-					    priv->ctrlmode & CAN_CTRLMODE_FD_TDC_MASK);
+					    priv->ctrlmode & CAN_CTRLMODE_FD_TDC_MASK,
+					    netif_running(dev));
 
 	return size;
 }
@@ -675,7 +678,7 @@ static int can_tdc_fill_info(struct sk_buff *skb, const struct net_device *dev,
 		if (tdc_manual) {
 			tdcv = tdc->tdcv;
 			err = 0;
-		} else if (dbt_params->do_get_auto_tdcv) {
+		} else if (dbt_params->do_get_auto_tdcv && netif_running(dev)) {
 			err = dbt_params->do_get_auto_tdcv(dev, &tdcv);
 		}
 		if (!err && nla_put_u32(skb, IFLA_CAN_TDC_TDCV, tdcv))
@@ -735,7 +738,7 @@ static int can_fill_info(struct sk_buff *skb, const struct net_device *dev)
 	    nla_put(skb, IFLA_CAN_CTRLMODE, sizeof(cm), &cm) ||
 	    nla_put_u32(skb, IFLA_CAN_RESTART_MS, priv->restart_ms) ||
 
-	    (priv->do_get_berr_counter &&
+	    (priv->do_get_berr_counter && netif_running(dev) &&
 	     !priv->do_get_berr_counter(dev, &bec) &&
 	     nla_put(skb, IFLA_CAN_BERR_COUNTER, sizeof(bec), &bec)) ||
 
-- 
2.47.3

