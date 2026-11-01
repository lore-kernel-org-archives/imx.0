Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575646;
	b=ur1rF24vQL02ww1OWd984lnsUOP3xR74ThZNWrmK8T6aLgDm6+BG5nrV7veGIXyid4dH
	 7ar3BqbCJW08RxmcmxLmqEUhINE4KJV32fe30J8IF14h6+yALBO6AkP2N8vKiJKyjp4IH
	 ro7nqXDqRXy+/i7SKv1uy+wE5oXR+L0pRFx4sO9EF+R60k88PgWDhAWOafYWBlZ4PoagA
	 V8jyjqLIobusZg0bbGc5VSq4kfcCAjvDHAaO1GsKCrdXgcpZhYASiCikW1adQfLN4SViE
	 3Ma4hlAoAWQhhKq05BNzARdpeYrH/pSMx4XrPgS/vENu0Fnep4Ueaakj7HozRCnHd+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575646;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=hQEY2J2hT546u3uGtTNrs7am++RTs0ZtPTD1ZhWioiw=;
	b=kqJpEPoeyZy9DGvu4quBC6D7VXcygHLaEAdPWMFc795mhE3ynY1+6gpG545PxzkWqXPz
	 H+BhOHQH+XJ+LcGX1rvz6t73/iiOF50/ST5Y1ZZwUXpxMBIVajmF13yI0reEqzg19khJF
	 NEjqAeenZkLDv/ZBnR1QEcPBkPSGaP/jYBDX0OIPPeJ/rRl+beD5OxM0Hsmq4F1voh98w
	 Xa6kZb8NBMRYybDAl5hC+yOAzJm+uFnL/Dfg1KAIhUXfpiVPasoeDY00iv4tMtccais7c
	 x12ABKKuzFm9y8qGhJqA61dacqLiwg9INXF+5/MMLc0vftN/k0Bk+oJICDbslpfmzVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b="Esw3w/ty";
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=eJ9zH0v6;
	arc=fail smtp.remote-ip=185.56.87.5
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB060A260A
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AAB060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Esw3w/ty;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=eJ9zH0v6
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575644;
	 b=AILSYhWCfB4mvlA03nNnCvlAtCrI7McmRhVv/iJTL+quoRSFYmohq+hKyNEj4RjStlTYUexaiX
	  a4bAHI3UupTEBYAY95BjUPYnZTTQ4vE/A6SAHMp56rmfMSK5fE5VuEXdbjRyGQRxJaiRxjUepS
	  GO5oj9CpnZ1Iah/970+tANmj3gkDueHBM/O7o3VQ4b52/JFMbnOJcwIwXtMHXlQlHtZplkYscK
	  x+SIHlM+FFT66ooo3eTG8W2J+r/miqccr2jyUwChayD5zGXUykTUuvfSQRIEWV1pGB8yhX92t3
	  sXEW1+yytkKfv6PMkb6GKudPZdivNUEjhlykjcUTDvz0GA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575644;
	bh=ODOj//n2T758yDrWXGaWs7F0B4AN5rXXzzLWY/66aRk=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Rn+OUR0JmQ3wzDhif/a836DCyZY77leVZ/J7mbNHunt9y3UjXYCypn+wqeeePfpsmf6YSgdSI3
	  9CwSYX8hJxg8fDQticpOIokmjlzmiFi9av76l+noMzwJXurxdU0Ttf1Oq/53Ay6WobaGdmF5Qa
	  69Fp4qe4r4buEVHpN8ihFR+eNrFxhJpAcR9wmILQ2PcDqr1xjQND2In5iNVQf9bSRPnSbZl0xN
	  zZQ34NDi4+hgbknBfCg4025+eHQPpTkosopqhIngLVHTru+XkWY2oL9qgKjK93DMRC7h+K3gKX
	  kwBt6Vj3wfSVsol2Q+X6nHBZyioHo8OINX+bto3+3FGtaQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=hQEY2J2hT546u3uGtTNrs7am++RTs0ZtPTD1ZhWioiw=; b=Esw3w/tylbOyCYf7NJhqf5Age7
	5VtyeyqdQ0UBlm3Zhgtn+K4wgw36vsOUjheaC/Oz1NZLLnVQakRAXgLwpzUMwdKuzb51O/hDZ1BO+
	deomkoyHfAzkY9fn/72pM/wo+Q0OiCSpBESprV1AakoOz/qIJuCUt0NiHs95RqdIhV5E=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexM-00000005i8I-1lbN
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=hQEY2J2hT546u3uGtTNrs7am++RTs0ZtPTD1ZhWioiw=; b=eJ9zH0v6RMRtrVmBcNB+rjJ85R
	WfRGrfeEQcV8s8qiFS/tbBW+cGct13dmQTmTuyGRqQB0AVKi4XOM1B/FDZpa2K4GPGJW/Re+z0xwB
	Kmt2WYCtRz7HJO+et8vnZXnP98Ey6HwvfHEo91XuwK++n0NZGUfk6AoiXdmjRwN2WxcE=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex1-000000002I5-3ibe;
	Sun, 01 Nov 2026 23:26:59 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:44 +0100
Subject: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
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
Message-Id: <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102; i=francesco@valla.it;
 h=from:subject:message-id; bh=ODOj//n2T758yDrWXGaWs7F0B4AN5rXXzzLWY/66aRk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+15rSTVEFgiLMzn9Mzak+Hq3Vs1dQ7ibVw/1t5by
 XLbMNWqo5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZjIijUMv9ni3nXNW7z0nmN2
 IpeOzeKpS4XyjOd2aTEpy/VzH99wfAkjQ0fAlaP8O7zbORMr7z+zcrwTkvhsYX2fQsbV+yeFahb
 t4gYA
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
X-SGantispam-id: d3714e29da2d67249451f2dec486ac54
X-AntiAbuse: ID - d3714e29da2d67249451f2dec486ac54
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexM-00000005i8I-1lbN-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The virtio subsystem already supports a fwnode describing a vdev; search
for a specific node during vdev registration and supply it to the
rproc-virtio platform device that is being registered.

A memory-region specified inside that node is also used for the virtio
device if a carveout was not supplied for it through the parent device's
node.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
 drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c946ecd980a5..e833853ae7f6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
 	if (rvdev)
 		list_del(&rvdev->node);
 }
+
+static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
+{
+	struct fwnode_handle *group, *child;
+	u32 reg;
+	int ret;
+
+	group = device_get_named_child_node(dev, "virtio");
+	if (!fwnode_device_is_available(group)) {
+		fwnode_handle_put(group);
+		return NULL;
+	}
+
+	fwnode_for_each_available_child_node(group, child) {
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			continue;
+
+		if (idx == reg)
+			break;
+	}
+
+	fwnode_handle_put(group);
+
+	return child;
+}
+
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	struct device *dev = &rproc->dev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
+	struct platform_device_info pdev_info = {
+		.parent = dev,
+		.name = "rproc-virtio",
+		.id = PLATFORM_DEVID_AUTO,
+		.data = &rvdev_data,
+		.size_data = sizeof(rvdev_data),
+	};
 	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret = 0;
 
 	/* make sure resource isn't truncated */
 	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
@@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	rvdev_data.rsc_offset = offset;
 	rvdev_data.rsc = rsc;
 
+	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
+	pdev_info.fwnode = fwnode;
+
 	/*
 	 * When there is more than one remote processor, rproc->nb_vdev number is
 	 * same for each separate instances of "rproc". If rvdev_data.index is used
 	 * as device id, then we get duplication in sysfs, so need to use
 	 * PLATFORM_DEVID_AUTO to auto select device id.
 	 */
-	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
-					     sizeof(rvdev_data));
+	pdev = platform_device_register_full(&pdev_info);
 	if (IS_ERR(pdev)) {
 		dev_err(dev, "failed to create rproc-virtio device\n");
-		return PTR_ERR(pdev);
+		ret = PTR_ERR(pdev);
 	}
 
-	return 0;
+	fwnode_handle_put(fwnode);
+
+	return ret;
 }
 
 /**
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 1496659ddff9..950d65480be5 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -13,10 +13,12 @@
 #include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/of.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 #include <linux/rsc_table.h>
+#include <linux/swiotlb.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ids.h>
@@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
 	put_device(&rvdev->pdev->dev);
 }
 
+/*
+ * Attach the memory region declared inside the vdev's own devicetree node.
+ *
+ * A restricted-dma-pool region is attached by of_dma_configure() when the
+ * platform device is probed, but it is released together with the virtio
+ * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
+ * when the remote processor is restarted during a crash recovery.
+ * Any other kind of region (e.g., shared-dma-pool) is attached only here.
+ */
+static int rproc_virtio_init_vdev_mem(struct device *dev)
+{
+	if (is_swiotlb_for_alloc(dev))
+		return 0;
+
+	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
+}
+
 /**
  * rproc_add_virtio_dev() - register an rproc-induced virtio device
  * @rvdev: the remote vdev
@@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	struct device *dev = &rvdev->pdev->dev;
 	struct virtio_device *vdev;
 	struct rproc_mem_entry *mem;
+	bool has_mem_region;
 	int ret;
 
 	if (rproc->ops->kick == NULL) {
@@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 		return -EINVAL;
 	}
 
+	has_mem_region = of_property_present(dev->of_node, "memory-region");
+
 	/* Try to find dedicated vdev buffer carveout */
 	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
 	if (mem) {
 		phys_addr_t pa;
 
+		if (has_mem_region) {
+			/*
+			 * The carveout takes precedence: drop the region that
+			 * of_dma_configure() might have attached at probe time.
+			 */
+			dev_warn(dev,
+				 "vdev%dbuffer carveout found, ignoring memory-region\n",
+				 rvdev->index);
+			of_reserved_mem_device_release(dev);
+		}
+
 		if (mem->of_resm_idx != -1) {
 			struct device_node *np = rproc->dev.parent->of_node;
 
@@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 				return ret;
 			}
 		}
+	} else if (has_mem_region) {
+		/* Use the memory region declared in the vdev's own node */
+		ret = rproc_virtio_init_vdev_mem(dev);
+		if (ret) {
+			dev_err(dev, "Can't associate vdev memory-region: %d\n",
+				ret);
+			return ret;
+		}
 	} else {
 		struct device_node *np = rproc->dev.parent->of_node;
 

-- 
2.56.0

