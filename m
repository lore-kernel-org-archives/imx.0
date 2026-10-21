Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594522;
	b=J48wzgCcguOmQtNnVNGzOTLKWNtdnKiDIQNdxfU+5JI9hpr5Loxdshs/b5wqB1ezsXUO
	 yab3UE1otDC44kDVrnTE1megxhlS4j7OFE/CpsL1zSv8+q7I4FO6I6P9gMZGgCcaFxXZJ
	 pEoMraoMniefLLFT2HQKQ+juZhSAfkBUDASmj1mHWRQOgSaCMmZtkq15RiG7GVoERcCOs
	 SQwvbS7/fRxv+jrJMDBRNl4VdGYU5iFhq6DTMDGrwMdsBK+6PCUuj8QH0MD2fdPfwAq0b
	 9LC7X3VuKGQi57urhaNE7uAG/yO35gcYFD47I6Enhc5Xbdks/IIC5p1nMrd9P+RufxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594522;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g1cgKnS8jtOiTEPckWsXihpdl5RsJ7YKp0ZbxVc/ALU=;
	b=IvWMJUnBxAzhMW/ulh34ulSrjAjreok/xR0U9UNhsNpsGkcRFMgu3cHXy72a382iNgDo
	 hbNFNVlLtv5Knn2mhdZG4RiIuf1MZWYcf76+B8ccOm8bEJ28wMZ78641DYhhc4u+KtkMQ
	 0XvGobR91T5Zww3wOE2lbiOFDpKPNDM4Wu64QUdJWwa82VIryL2PhgKlpPchfgnoFhR39
	 OdRHwPEcMaNTjL4F2G1t+K6vPcYwREJQtuGLd7nWdcjDso948UMO5rNAkKolNLaE5mIFX
	 ocodLF7QDmYE12sReVpg3vcoOCUmbX/zsP81SK+Rnu+b4ej/QWq5sZvyhEihkpr4yHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=a6RD9819;
	arc=none smtp.remote-ip=115.124.28.3
Received: from out28-3.mail.aliyun.com (out28-3.mail.aliyun.com [115.124.28.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC760A263B
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 14:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFC760A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=a6RD9819
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792594510; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=g1cgKnS8jtOiTEPckWsXihpdl5RsJ7YKp0ZbxVc/ALU=;
	b=a6RD9819gQKiZV//0llaCFj+tyCus85loWQfvGm7czIkQNXbbU0HGjZBDYVr5NhrxgbIfgHTbGVV2/m89a0Yn4CXr8ggX02AXNCPpAXG9YB7krJcYSg+AII2lHNfjFuJeoEalTEIvWFERBYS0tkrP+enyS5Cl1WmHHRd5cv9VndlQjoc2kFVjg4Ye0bQApcEA3GaT7vwWnO7xa+i7ngbmLNaE3mFx1rF8FNhiHGmdbOA9DPtP4T9P8rNlUpEQdYkx619asVRg9zJXWIgqCHFsuGhf00iD6n90tKSMy7Uu3LA7RkS0DyMaeghqVHiRDjdHyRoYHhi7NHWi5CsiP9Ygg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0149565-0.00188919-0.983154;FP=9817545980616641445|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034017;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jmgQO6L_1792594509;
Received: from galx..(mailfrom:chunyuzhiqiang@yinhe.ht fp:SMTPD_---.jmgQO6L_1792594509 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 21 Oct 2026 22:55:10 +0800
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
Subject: [PATCH v7] can: dev: can_fill_info(): don't wake up controller if interface is down
Date: Wed, 21 Oct 2026 22:51:15 +0800
Message-ID: <20261021145115.153107-1-chunyuzhiqiang@yinhe.ht>
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
interfaces, and the automatic TDCV readback is skipped for both CAN FD
and CAN XL. The other TDC parameters are still reported, as they are
meaningful while the interface is down. Userspace must treat these
attributes as optional.

The berr-counter issue was triggered on an i.MX8QXP board by running
"ip link show" without ever bringing the interface up. On i.MX8QXP the
CAN clocks are gated through the SCU LPCG and the subsystem shares the
IMX_SC_R_CAN_0 power domain; there is a window where
pm_runtime_resume_and_get() has returned but the clock has not reached
the module yet, and the immediate ECR read raises a synchronous
external abort. This is the same class of problem fixed for m_can in
commit 91a55c72a821 ("can: m_can: m_can_get_berr_counter(): don't wake
up controller if interface is down").

The TDC auto readback path was found by code inspection; it is gated as
a precaution because xcan_get_auto_tdcv() reads XCAN_SR without taking a
runtime PM reference.

Note: do_get_state() is left unguarded. Drivers that implement it by
reading live status registers may need a similar fix. This is tracked
separately and is not changed by this patch.

Fixes: ec56acfef2af1 ("can: flexcan: flexcan_get_berr_counter(): switch on clocks before accessing ecr register")
Cc: stable@vger.kernel.org
Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
---
v7:
 - Rebase onto current net-next/main, including e63281614747
   ("can: netlink: add initial CAN XL support").
 - Gate do_get_auto_tdcv() on netif_running() for both IFLA_CAN_TDC and
   IFLA_CAN_XL_TDC. The other TDC parameters are still reported for down
   interfaces.
 - Pass dev to can_tdc_get_size() and can_data_bittiming_get_size()
   instead of a bool, as suggested by Vincent Mailhol.
 - Adjust the TDC size calculation for both FD and XL paths.
 - Keep the berr-counter gating unchanged.
 - The Fixes: tag points to ec56acfef2af1 because this patch supersedes
   the down-interface readback behavior it introduced, not because that
   commit was buggy.
 - TDC auto readback gating is based on code inspection; only the
   berr-counter path was tested on i.MX8QXP hardware.
---
 drivers/net/can/dev/netlink.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/can/dev/netlink.c b/drivers/net/can/dev/netlink.c
index 766d455950f5..ac30d2849543 100644
--- a/drivers/net/can/dev/netlink.c
+++ b/drivers/net/can/dev/netlink.c
@@ -720,7 +720,8 @@ static int can_changelink(struct net_device *dev, struct nlattr *tb[],
 	return 0;
 }
 
-static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
+static size_t can_tdc_get_size(const struct net_device *dev,
+			       struct data_bittiming_params *dbt_params,
 			       u32 tdc_flags)
 {
 	bool tdc_manual = tdc_flags & CAN_CTRLMODE_TDC_MANUAL_MASK;
@@ -742,7 +743,8 @@ static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
 	}
 
 	if (tdc_flags) {
-		if (tdc_manual || dbt_params->do_get_auto_tdcv)
+		if (tdc_manual ||
+		    (dbt_params->do_get_auto_tdcv && netif_running(dev)))
 			size += nla_total_size(sizeof(u32));	/* IFLA_CAN_TDCV */
 		size += nla_total_size(sizeof(u32));		/* IFLA_CAN_TDCO */
 		if (dbt_params->tdc_const->tdcf_max)
@@ -752,8 +754,10 @@ static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
 	return size;
 }
 
-static size_t can_data_bittiming_get_size(struct data_bittiming_params *dbt_params,
-					  u32 tdc_flags)
+static size_t
+can_data_bittiming_get_size(const struct net_device *dev,
+			    struct data_bittiming_params *dbt_params,
+			    u32 tdc_flags)
 {
 	size_t size = 0;
 
@@ -764,7 +768,7 @@ static size_t can_data_bittiming_get_size(struct data_bittiming_params *dbt_para
 	if (dbt_params->data_bitrate_const)		/* IFLA_CAN_{,XL}_DATA_BITRATE_CONST */
 		size += nla_total_size(sizeof(*dbt_params->data_bitrate_const) *
 				       dbt_params->data_bitrate_const_cnt);
-	size += can_tdc_get_size(dbt_params, tdc_flags);/* IFLA_CAN_{,XL}_TDC */
+	size += can_tdc_get_size(dev, dbt_params, tdc_flags);/* IFLA_CAN_{,XL}_TDC */
 
 	return size;
 }
@@ -812,7 +816,8 @@ static size_t can_get_size(const struct net_device *dev)
 	size += nla_total_size(sizeof(u32));			/* IFLA_CAN_STATE */
 	size += nla_total_size(sizeof(struct can_ctrlmode));	/* IFLA_CAN_CTRLMODE */
 	size += nla_total_size(sizeof(u32));			/* IFLA_CAN_RESTART_MS */
-	if (priv->do_get_berr_counter)				/* IFLA_CAN_BERR_COUNTER */
+	if (priv->do_get_berr_counter &&
+	    netif_running(dev))				/* IFLA_CAN_BERR_COUNTER */
 		size += nla_total_size(sizeof(struct can_berr_counter));
 	if (priv->termination_const) {
 		size += nla_total_size(sizeof(priv->termination));		/* IFLA_CAN_TERMINATION */
@@ -825,10 +830,10 @@ static size_t can_get_size(const struct net_device *dev)
 	size += sizeof(priv->bitrate_max);			/* IFLA_CAN_BITRATE_MAX */
 	size += can_ctrlmode_ext_get_size();			/* IFLA_CAN_CTRLMODE_EXT */
 
-	size += can_data_bittiming_get_size(&priv->fd,
+	size += can_data_bittiming_get_size(dev, &priv->fd,
 					    priv->ctrlmode & CAN_CTRLMODE_FD_TDC_MASK);
 
-	size += can_data_bittiming_get_size(&priv->xl,
+	size += can_data_bittiming_get_size(dev, &priv->xl,
 					    priv->ctrlmode & CAN_CTRLMODE_XL_TDC_MASK);
 	size += can_pwm_get_size(priv->xl.pwm_const,		/* IFLA_CAN_XL_PWM */
 				 priv->ctrlmode & CAN_CTRLMODE_XL_TMS);
@@ -910,7 +915,8 @@ static int can_tdc_fill_info(struct sk_buff *skb, const struct net_device *dev,
 		if (tdc_manual) {
 			tdcv = tdc->tdcv;
 			err = 0;
-		} else if (dbt_params->do_get_auto_tdcv) {
+		} else if (dbt_params->do_get_auto_tdcv &&
+			   netif_running(dev)) {
 			err = dbt_params->do_get_auto_tdcv(dev, &tdcv);
 		}
 		if (!err && nla_put_u32(skb, IFLA_CAN_TDC_TDCV, tdcv))
@@ -1006,7 +1012,7 @@ static int can_fill_info(struct sk_buff *skb, const struct net_device *dev)
 	    nla_put(skb, IFLA_CAN_CTRLMODE, sizeof(cm), &cm) ||
 	    nla_put_u32(skb, IFLA_CAN_RESTART_MS, priv->restart_ms) ||
 
-	    (priv->do_get_berr_counter &&
+	    (priv->do_get_berr_counter && netif_running(dev) &&
 	     !priv->do_get_berr_counter(dev, &bec) &&
 	     nla_put(skb, IFLA_CAN_BERR_COUNTER, sizeof(bec), &bec)) ||
 
-- 
2.47.3

