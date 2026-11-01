Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575644;
	b=JuF2lIXd6d9BlZFsuCbFG3sO1f2OyLSRVT72eXS8pGPgcJkgMeY6VhUtD5uUKyGfUA/u
	 yukYRumOqc8eINQjEA4UBKXchMg6JUg0VaecLohW3zAdXounf6RxtCfcYxXxlJkZTjWHL
	 +cPYS8MVZTlpI/Mnn7ZYR4ehjoYDhFMPDNsmWmwQVxK+zVaRua1grrtQrWtpfQN+JFtGd
	 +HDLFb3OqlYvHlOg1HCSZ9QCYQaOFNkA0yqVfUTEdh0bnpPJR60yFM89wtP6+XGYOCxmW
	 8ReHd+UXqngBNvCIYSx1l4KR6Hvq0OQxQgqkiYrnbiwAYIQJOtBzPyDWrkxZ1a2Lx8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575644;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=;
	b=vsubs7A896YI2ThNUZpFx9W072Oyx88wCVeSMsFFwyp8JTw4CB8MGfhZoXnxndtH535F
	 WznTwQNXExL8fhn/YrKwnBj1ZlRnnpV3K2FEzWs9Vu6JZEAbWDL06CfatOPb4GIKeijFj
	 GxUePnqymLQGTWzMINn9k22nc+37qTRi/dsnmoFCCCSgWj6QGhmJ8g9MBTuoQtXCxYC3G
	 4LYoHA8l5ARIY4Z7bwI9JhFJpn0fXLHnMz4E1S80R8GmlToCnm4Olyv3BRVZye0dY1gpr
	 iWQRfR42wgCsoYdPP0IWrpdiKoGx+eD8BSVManDh7K37h0XEnsd7ou5M8NzBV0VK0+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=HTjOJt+d;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=grsQDMZy;
	arc=fail smtp.remote-ip=185.56.87.3
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D6606A331
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F1D6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=HTjOJt+d;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=grsQDMZy
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575643;
	 b=Gaq6o3yOKYo2YEEUSyzvJAUBAKxWuBmilRHYH9u/J6eld79NwVEnMZhZDqww5kbm1SY/AJ+1Op
	  STGyiMHEQO0YHSO7h+zg5MmqiXzlHPfgeo69BRSTi8iGjbEoqyvQ1aPBZULq41FwpSeUWwgPyi
	  H/hmgk12ohCOoz+16LKrnWJ02t8fWKr+Wqpm8tzRE7asWzVvyZ7HN8w51avY3T0sApj/cODDAn
	  n8cY2NDXYaqQj166ZGhHKNHA4sGA4V3UbctphIaPbVQqnf/7jrOleM1ZGauTaaqEF75XZJhxi8
	  hE/mH2cPs4slJ0IbWLObUo3GofwT29QHJELccRbcm/mRLQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575643;
	bh=Rg3NHiv996Ou/uVsQGsnX1PIitVPLmwkUdij4t7Mly8=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ug0g2c9WevhMNjT8CKldWM2Vr4DrRQdbLHS/2fQYZThd1oTN9HhHnBaewfOg7xI6C3NcRVFNvA
	  EBEIcTK4cK3TUhfEc6zpIuSBwrR3+RziJ9Y7jM5NID5/jKJ4xvrPYqPROBaCapozpM1znZ4YrL
	  z5KgLEl6NedqYAa51k2v5BEWGS0KkcorkjQlhp5i2R0iG4kT6bI+LSQ8/kriRboIONrDfzUYdo
	  oeHd6rVK42TdYT1vuQaojy71DG4QKzNI6GHn6XV7E9tg3oDcB8D5PUWkT58KH5WLgFv9+PwhcW
	  eBWvtbw84kfxbHE2R6VOa1WHBkKWcWdS8kTF9dzTt6W44g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=HTjOJt+dptoDj2d2xNPpxQxwPF
	0aqd9GeLuqQKwCs55rnyG1l7tF4wIlRh+xbZDYLl0rap7Bpwn6ecRHEezOtMB9FoqTXsudDFG/KVj
	E/+BYarRHW4KxCiEPU+ReDr578DXCF6BUFnp8CwpVVc4En8yy1sOdpM8FvFaGGX8T2uU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-0kln.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexH-000000075eY-3t9M
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=grsQDMZyuo295cS/AatEIltcsZ
	gIq+4tQBOR2b3XY4ay5NUD2sryA4SPrciSnrmRLl1SvX/f1oXFwddxnz1GKsLtWF0dJiec+my6YbD
	R8lDFlJU0IUrMResVEwN4QIMrNPGaEZl9C2BeoSXpnDtuDgrYgPrubohfZ7iRhrLPE8c=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewy-000000002I5-21Gt;
	Sun, 01 Nov 2026 23:26:56 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:40 +0100
Subject: [PATCH RFC v2 03/11] remoteproc: virtio: support dynamic number of
 vrings
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
Message-Id: <20261102-remoteproc_virtio_map-v2-3-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5391; i=francesco@valla.it;
 h=from:subject:message-id; bh=Rg3NHiv996Ou/uVsQGsnX1PIitVPLmwkUdij4t7Mly8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2ZMD34aojLK7lNmbPPe/44Jvnj+Jb0L3YWT2s2N
 qneTTBT6yhlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmotDI8E/d1Et59hybD+uW
 zv1sN+nfyjvprkVaRuuSTm1Y4Hzbfss5hn+mW//1xnokp6ziLZBuMI+afumjC/eMKFE588lFRwN
 LL3MBAA==
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
X-SGantispam-id: 2fb2978d0159efab04ff50c2c1527fc8
X-AntiAbuse: ID - 2fb2978d0159efab04ff50c2c1527fc8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexH-000000075eY-3t9M-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The number of vrings for each vdev has been fixed to 2 since the
introduction of multi-vdev support [1]; this is completely fine for the
rpmsg usecase, but can conflict with other virtio devices (CAN for
example requires 3 virtqueues, entropy only 1, network a variable number
and so on).

Remove the static vring allocation, transforming it to a flex array that
is allocated at vdev probe time; for the existing usecases (i.e.: mainly
rpmsg) this leads to no functional change, except the additional memory
used for the counter associated to the new array.

The maximum number of virtqueues is limited to 255 due to the u8 value
used inside the resource table to indicate the number of vring to
allocate; for this reason, no additional plausibility check is performed
on the number of vrings indicated by the resource table.

This also fixes the single virtqueue usecase, which was apparently
supported also before but for which the remove action caused an error
(because the remove action was trying to unmap also the second vring,
which was in fact not mapped).

[1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c   |  7 -------
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++------
 include/linux/remoteproc.h             | 10 ++++------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..c946ecd980a5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 {
 	struct fw_rsc_vdev *rsc = ptr;
 	struct device *dev = &rproc->dev;
-	struct rproc_vdev *rvdev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
 	struct platform_device *pdev;
@@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
 		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
 
-	/* we currently support only two vrings per rvdev */
-	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
-		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
-		return -EINVAL;
-	}
-
 	rvdev_data.id = rsc->id;
 	rvdev_data.index = rproc->nb_vdev++;
 	rvdev_data.rsc_offset = offset;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 29a3a4c18097..c56d3330adfe 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -135,8 +135,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	void *addr;
 	int num, size;
 
-	/* we're temporarily limited to two virtqueues per rvdev */
-	if (id >= ARRAY_SIZE(rvdev->vring))
+	if (id >= rvdev->num_vrings)
 		return ERR_PTR(-EINVAL);
 
 	if (!name)
@@ -510,13 +509,16 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev_data)
 		return -EINVAL;
 
-	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
+	rsc = rvdev_data->rsc;
+
+	rvdev = devm_kzalloc_flex(dev, *rvdev, vring, rsc->num_of_vrings);
 	if (!rvdev)
 		return -ENOMEM;
 
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
+	rvdev->num_vrings = rsc->num_of_vrings;
 
 	ret = copy_dma_range_map(dev, rproc->dev.parent);
 	if (ret)
@@ -534,8 +536,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rvdev);
 	rvdev->pdev = pdev;
 
-	rsc = rvdev_data->rsc;
-
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
 		ret = rproc_parse_vring(rvdev, rsc, i);
@@ -586,7 +586,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	struct rproc_vring *rvring;
 	int id;
 
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+	for (id = 0; id < rvdev->num_vrings; id++) {
 		rvring = &rvdev->vring[id];
 		rproc_free_vring(rvring);
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..52e1eccbe42e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -322,10 +322,6 @@ struct rproc_subdev {
 	void (*unprepare)(struct rproc_subdev *subdev);
 };
 
-/* we currently support only two vrings per rvdev */
-
-#define RVDEV_NUM_VRINGS 2
-
 /**
  * struct rproc_vring - remoteproc vring state
  * @va:	virtual address
@@ -353,9 +349,10 @@ struct rproc_vring {
  * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
  * @rproc: the rproc handle
- * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
  * @index: vdev position versus other vdev declared in resource table
+ * @num_vrings: the number of vrings for this vdev
+ * @vring: the vrings for this vdev
  */
 struct rproc_vdev {
 	struct rproc_subdev subdev;
@@ -364,9 +361,10 @@ struct rproc_vdev {
 	unsigned int id;
 	struct list_head node;
 	struct rproc *rproc;
-	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;
 	u32 index;
+	unsigned int num_vrings;
+	struct rproc_vring vring[] __counted_by(num_vrings);
 };
 
 struct rproc *rproc_get_by_phandle(phandle phandle);

-- 
2.56.0

