Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575645;
	b=ok0lTkXvctl0zO+ON98t1aj0tFSp5Bf6RlzthV0BS/ZOr1cnorGtpyflA/afd8x1uWSh
	 P6tj3xvMPvjnFLEDz3izMFE0ya4gPcjQZWXlAwtfqMpDSuuXCMdv/Hj8VeLZxhmqq3LgQ
	 dtciKTNYwyhkSYu/zKHKEyym+HoVcrmxpE9NW301LpOD/k+h7/fSTv06BBQNOmd/4BEDR
	 pokw8g/gv/rn/vcadaj3nGQ8cU+jnfwOznAnc6CNRKh+TBw/mErGe5lh4BBmj+Elg6YOL
	 hMyhHetjGPajRCophaYPMV+KPiz/8+pPLyPQ9VknDYhhFNw3sxbMe4TXWiXOf11xPdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575645;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=ldwbqj8wcl4ylX139bRN87N0lBqpKTnn+4+S0FjlCSE=;
	b=CQ71by90UXZarPFI2y8zJElz+bzeY4U4CB2spqMgtH0/TmNyih1n1x0sWdK42WnMufMS
	 AW6sJItV7bH4vJL0wIcJI/oSPjvROQ201ADdvp4kmbs8nBaNZk6hjZuQAdGT/ZQ1GH9w0
	 y49bOUrhB9ifo91ZT07Pt5Cy0AcU4YXYQFP3bYlm00fvrcwvVQZT4k6YLezKgolp+xpHc
	 +3Ka/dd2YWiwLnSE158W6Nu87m9sJYx/OKTcJTntphiLB7u4v9DDTrs6pz9UadpuPmCP/
	 WkB9hqyQ/YK/aZeektYDJyzfdJh4h247vuquGejP/SKyv5oK6/vdw8T2W7KLD76jN/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=to8fCwN0;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YLoLZQQJ;
	arc=fail smtp.remote-ip=185.56.87.10
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181760A260E
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3181760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=to8fCwN0;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YLoLZQQJ
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793575645;
	 b=mKEf1E6bwDzzFTdEFyFmoLaW7H0n/0I/qrFL1ou6o8KEfaKDeEfikJ9d4kEUQPZ5gFegjL782D
	  PpCxaBdEgUUt/5So04oadz/Fkh3C6UCXfZg6geNJ9KGkeXq5mWncnX6xQqd0+nM44pmmbwcY02
	  nqxeXRs6BoaRyKPf9JSx4yNOGvOwXaIzlYeY6ck8R/F6+5cMUD8XjJ+DKN32NhR78KRkHr9IEH
	  wzvYGghUWUnAVPj34BbgJXaWfBhvbSpRAMeV9DmZSvpBREsNGHS++zEoJubZ2v7mijxSldz0iE
	  kIV93JfHoiKV9AIjhkud69CtVf1zkbQ6dP1o274u85AM+Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793575645;
	bh=3Fg4PK+/cIqF8QkANbgv/C+fR4vvMWwp5B8keOBqqwQ=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=sZCVfjU+uGTrmS/4F5BmvjZxNxqHPQod06ZwQzSQv0aqW+DPmkrfe7l/xg3tvWrsK2uzvQUwSp
	  b6lctK+J6Uzlg/fUR0rDUbMAug3l28Kf9qJPtfMNBbc4DL3rLAmKb9RcwLDF7hsKXk3ai9ju/M
	  tBfr1ECQKqQCYqAYrA97ODYao9M2xyGylzi/T8DSdF+QM5gImBJQVc+eGbo3FoxDAufwKmL1kD
	  C16Rx/JhNp8OEx6WCzgFLN3VDpWXq3RBt/v1Wbl7B6ZmUz1rJxsLqBf9AzGb1NxsmQiM9I5L1r
	  cut0/OBKKQcDt57sDhH8SCHFkCQnleafh4bPXGlpQ+zRmQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=ldwbqj8wcl4ylX139bRN87N0lBqpKTnn+4+S0FjlCSE=; b=to8fCwN0WxfHnPCBQmAikycfDk
	RBMi2Ruyae74eLvYpOZd5+OFLIkaSVpxaRl4eHq03OwU2CH/OgEl7tGGe1EOGqnBZnyoz/UXNWkKH
	5Edu2xfiLqXaQGp5bwceNIS/1QcvJbizCZPn04f7hE0qXnfH8PxBA9aO54vDBJHW+Otc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexM-0000000782G-3toT
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ldwbqj8wcl4ylX139bRN87N0lBqpKTnn+4+S0FjlCSE=; b=YLoLZQQJYYN2sqdpt28dCcxRwa
	AjUmdS1OiYVdUz0HSdlHW3T+2E2l2+zrSN3MdU+eUrke6P/Y29iLpGyf+h1l9KBTpT8xMKXPQBVzr
	RAtyMijg+2NpzQAKALkG3TzZp5L0fJF7emb5ZZqkn83Uu9tfukHsvudHVVyuBmcaDe/0=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex3-000000002I5-2ObH;
	Sun, 01 Nov 2026 23:27:01 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:46 +0100
Subject: [PATCH RFC v2 09/11] remoteproc: imx_rproc: always use
 non-blocking mailboxes
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-9-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=francesco@valla.it;
 h=from:subject:message-id; bh=3Fg4PK+/cIqF8QkANbgv/C+fR4vvMWwp5B8keOBqqwQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+0Rn5h6r27uKZ2UzMlaATtLbO25NUQTeay9+lYvc
 Muq/9PcUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAExknQUjw3d1o585H7akNHSF
 xukVnMjqqTTVjFy2c3bgfI6rUT4vbBgZDmy9ZuG/lqHttOzCOzoLe5csKPLZvuqalPoCM2Up3UJ
 pLgA=
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0f35a705e668d208a85bca5feffdd3bc
X-AntiAbuse: ID - 0f35a705e668d208a85bca5feffdd3bc
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexM-0000000782G-3toT-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Blocking mailboxes may lead to sleep during the kick operation, which
conflicts with some virtio devices (e.g.: virtio-can) that kicks their
virtqueues with spinlock(s) held.

Align to the behavior of all the other remoteproc drivers that use a
mailbox to perform the kick (i.e.: omap, st, stm32, ti_k3_*, xlnx_r5)
and move to a non-blocking mailbox here as well. Messages need to be
allocated and freed on-the-fly, since they might be sent after
imx_rproc_kick() returns and cannot thus live on the stack.

As a side effect of this modification, the close-reopen action on
the mailboxes during restart and shutdown can be removed, since it was
performed only to have a non-blocking mailbox.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/imx_rproc.c | 76 ++++++++++++++++--------------------------
 drivers/remoteproc/imx_rproc.h |  1 -
 2 files changed, 28 insertions(+), 49 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893..a792b9ca5edd 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -96,7 +96,7 @@ struct imx_rproc_mem {
 /* Linux has permission to handle the Logical Machine of remote cores */
 #define IMX_RPROC_FLAGS_SM_LMM_CTRL	BIT(0)
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
 static void imx_rproc_free_mbox(void *data);
 
 /* Forward declarations for platform operations */
@@ -441,7 +441,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
-	ret = imx_rproc_xtr_mbox_init(rproc, true);
+	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		return ret;
 
@@ -696,28 +696,45 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct imx_rproc *priv = rproc->priv;
 	int err;
-	__u32 mmsg;
+	__u32 *mmsg;
 
 	if (!priv->tx_ch) {
 		dev_err(priv->dev, "No initialized mbox tx channel\n");
 		return;
 	}
 
+	mmsg = kzalloc_obj(*mmsg, GFP_ATOMIC);
+	if (!mmsg) {
+		dev_err_ratelimited(priv->dev, "cannot allocate kick message\n");
+		return;
+	}
+
 	/*
 	 * Send the index of the triggered virtqueue as the mu payload.
 	 * Let remote processor know which virtqueue is used.
 	 */
-	mmsg = vqid << 16;
+	*mmsg = vqid << 16;
 
-	err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
-	if (err < 0)
+	err = mbox_send_message(priv->tx_ch, (void *)mmsg);
+	if (err < 0) {
 		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
 			__func__, vqid, err);
+		kfree(mmsg);
+	}
+}
+
+static void imx_rproc_kick_tx_done(struct mbox_client *cl, void *mmsg, int r)
+{
+	if (r != 0)
+		dev_err_ratelimited(cl->dev, "failed to kick vqid %u: %d\n",
+				    *(__u32 *)mmsg >> 16, r);
+
+	kfree(mmsg);
 }
 
 static int imx_rproc_attach(struct rproc *rproc)
 {
-	return imx_rproc_xtr_mbox_init(rproc, true);
+	return imx_rproc_xtr_mbox_init(rproc);
 }
 
 static int imx_rproc_scu_api_detach(struct rproc *rproc)
@@ -872,7 +889,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
 }
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
@@ -895,10 +912,10 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 
 	cl = &priv->cl;
 	cl->dev = dev;
-	cl->tx_block = tx_block;
-	cl->tx_tout = 100;
+	cl->tx_block = false;
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
+	cl->tx_done = imx_rproc_kick_tx_done;
 
 	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
 	if (IS_ERR(priv->tx_ch))
@@ -1218,22 +1235,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return priv->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_sys_off_handler(struct sys_off_data *data)
-{
-	struct rproc *rproc = data->cb_data;
-	int ret;
-
-	imx_rproc_free_mbox(rproc);
-
-	ret = imx_rproc_xtr_mbox_init(rproc, false);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
-		return NOTIFY_BAD;
-	}
-
-	return NOTIFY_DONE;
-}
-
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1262,7 +1263,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rproc);
 
-	ret = imx_rproc_xtr_mbox_init(rproc, true);
+	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		return ret;
 
@@ -1292,26 +1293,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
-	if (dcfg->flags & IMX_RPROC_NEED_SYSTEM_OFF) {
-		/*
-		 * setup mailbox to non-blocking mode in
-		 * [SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_MODE_RESTART_PREPARE]
-		 * phase before invoking [SYS_OFF_MODE_POWER_OFF, SYS_OFF_MODE_RESTART]
-		 * atomic chain, see kernel/reboot.c.
-		 */
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
-						    SYS_OFF_PRIO_DEFAULT,
-						    imx_rproc_sys_off_handler, rproc);
-		if (ret)
-			return dev_err_probe(dev, ret, "register power off handler failure\n");
-
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
-						    SYS_OFF_PRIO_DEFAULT,
-						    imx_rproc_sys_off_handler, rproc);
-		if (ret)
-			return dev_err_probe(dev, ret, "register restart handler failure\n");
-	}
-
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
@@ -1424,7 +1405,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..9a1400d0d081 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -16,7 +16,6 @@ struct imx_rproc_att {
 };
 
 /* dcfg flags */
-#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {

-- 
2.56.0

