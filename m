Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575645;
	b=xa5i6LZfs9zEDjS8lOFagVWBRlj0cORl35Tb18IbsfFlTHHm2udQyycAOd/vVpv2bZLP
	 NiP9FRTGcr2FgAYHfrAsU0FkxWA7AJkSRYbDnfT0bei+xtSbrbQgElXEvmMb8kMNKkcsX
	 YE6LF50E4ZiF10TW51S/TwjrPJBhbqASrCYGCivj3i+oOOWPw6/PnT64JudnnwZr2WvTZ
	 2Hgngl+sQ95C9Ar2TqJp3MGP4lAb7HM7KyHof5L3ALcSBXNT1kl8T6bph7/SVVT1Z3CzX
	 3zo63wETDSerhZZcmnQpIxMFO97dsKg5RZ/1scS21Pi7ZxVNv9mV7XIstZLLMEa8RdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575645;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=;
	b=nKCDbndeF3h8mHrhUkWtMao+AItkGdTDJ5mZMe2lVfbkfAeVLdCmeWZtE/ihIi9ZKvCB
	 d8y7PmKyn5OQt1B29WbIGXo7StUbBreks+Chwhe7nDcBzpQJiVZI+kPN81K/vqWhY1PlW
	 mYapzddAvdf1f8bL3ffTltndQgfwCjqlzfQvD5He0rM3nuNkU6ZiHjpsKoli2KMB4hpHW
	 t2hYnZm+imOrO8c9i/6lE3pieL/Y6uo0wcItRlOlCb3LiwWqERrRzbZWx5JmAJyRFVPIs
	 fDxlP9yFikacDNavyBtsWjg3wgNXzXBjJ67FzLgIt268LIjgHgYZkd/89tge1A5m7Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=j6vaW3r5;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WOtZwsCJ;
	arc=fail smtp.remote-ip=185.56.87.3
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB060A2612
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31EB060A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=j6vaW3r5;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WOtZwsCJ
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575645;
	 b=njYVhkQpR5w5cnKpuJ6cIYaRvzBLIEIz5PuqXoNyvAG9ujyeTFjy1otiSM7oej26cpZyHVSDni
	  LOGn5/lN8VgG55aLM21Ao2THRe65IdMBY5THaQvhvWNXaNPYpuxueVq8q3DIb50vmmEg0bbygG
	  n/BFNp5d3fYA3kll5RhfrbzZ+qhlQPs08ZQeGyyKYr+Wd99M4XioLHgxV9/25fdxIa8mfAgkp2
	  P+RPINrXnMvmtN7Cq4613WqUju12YUNkNXi1JfalsDNudVwHkxIl7J0HymLNllf/+dPZUHGI9a
	  NCxzvmE9Tw6NnYvricLHuQyJg6iuo0keH1D/3UlKQrFDaw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575645;
	bh=rRnJ3p3OW5d4ywvmFtgBbw5iNIDfFa2rvLbQuPjzuDM=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=K0/M5+2uyZ8jjaqruD7RfsFzfCCwKwoYgP5sCapso2q8I19bNaJWiDTFZ0eYj7E4iN2Au7Thew
	  y6WI5e7iJQ3B6wFl6SVhMc4wpzOwScsvz4pVEtFDr1iHw+PbrYkZNd535twHe/GqxrozoyrQvl
	  zwBGnj9DJgXOo3dcfdNiaVrlo+X9Py6A+7x7pYlT5slDhnPI02yM1780iyrumkjaOp8DJT+gMp
	  g5pTpkTLSfBCvC2UhvuOJVtXvns6dkRnyU1rPToGL5vT4pNGUC4jxa2sNACYsUeuLjtFquOL1H
	  1qY6n+9W/h+qOk1CavJlf1kG2UkdCO3U9C9W4dGDgFx08g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=j6vaW3r567lbcVt8Uzhm4TZVEj
	Mufcb71Y9aIRA2x8at5/cHkh+xwFSMUnG/lAxzDp00ZcI2H+x8rqntSwCl6lW2C9n1GXxJO0mGRo/
	SYjlhp8Fgyw3/olGlor+N1v7mkKd82Rmo2gbvf1oFpNaB638oXVyyCSWCLpRcEhEllkI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexK-00000005i7D-3Pb0
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=WOtZwsCJJL/61oMgV7xsVatlWs
	lB0Uv5+HaqJkpbKM7Wmg7A84tx+MgX12p9asCXoOjvGsDVQnIgV/0HCJixk4F+CwfRBFXGN0aquog
	dzwbaly/xmgZ8cG/GSyNlpTnJaQcRjDtIPRjZ4nxHSEPNJGrX/R9jr0uv4EL9sihI+BE=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex0-000000002I5-0lrl;
	Sun, 01 Nov 2026 23:26:58 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:42 +0100
Subject: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
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
Message-Id: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3006; i=francesco@valla.it;
 h=from:subject:message-id; bh=rRnJ3p3OW5d4ywvmFtgBbw5iNIDfFa2rvLbQuPjzuDM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+05v4Clysj2flHs7Mhj7fLsCRYrrFvTPHov9Ms6G
 pSoVM3tKGVhEONikBVTZAlZd+Penrnm39I2MD6CmcPKBDKEgYtTACaiHcvIcKGs1ewaj/U6br61
 UanmB7XPHHJkv8QZ+tDlmsfZz50vOxn+lyReqn75aH6MiqfX9FX2n5mtt+y6uLYjwfVOuYnsmZu
 veAA=
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
X-SGantispam-id: afd58f96826938f0a06977395c635670
X-AntiAbuse: ID - afd58f96826938f0a06977395c635670
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexK-00000005i7D-3Pb0-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Depending on the driver originating them, data buffers used for virtio
communication can either:

  - already be allocated from the coherent memory area that is
    accessible by the remote processor; this is the case of
    remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
  - be allocated from generic kmem, and thus not necessarily accessible
    directly by the remote processor.

In the second case, the DMA APIs can be exploited to obtain a
functional communication, since they will take care of cache maintenance
and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
feature flag can be used for this purpose: with it set, the virtio
framework will use the aforementioned DMA APIs to map and unmap buffers.

Bounce buffering will be transparently used in two cases:

  - if the buffer address supplied by the virtio driver is not suitable
    for DMA transfers, or
  - if the reserved memory associated to the vdev is a
    restricted-dma-pool; in this case, *all* buffers will be bounced to
    and from this pool.

With this support in place, any kind of virtio device can be supported
through the remoteproc-virtio transport, at least from a data exchange
standpoint.

Note that remote processors behind an IOMMU need da == pa for the memory
region(s) the buffers are allocated from.

Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
they are explicitly excluded.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index f1b362158a9c..1496659ddff9 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 	 * All non-remoteproc-specific virtio devices are assumed to be
 	 * compliant with virtio specifications 1.x; there is no other method
 	 * to transmit this capability from the remote processor to the host.
+	 *
+	 * Virtio devices that are specific for remoteproc usage take care on
+	 * their own to allocate memory from the device's coherent pool; use
+	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
 	 */
 	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
-		features |= (1ULL << VIRTIO_F_VERSION_1);
+		features |= ((1ULL << VIRTIO_F_VERSION_1) |
+			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
 
 	return features;
 }
@@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	features = vdev->features;
 
 	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
-		features &= ~(1ULL << VIRTIO_F_VERSION_1);
+		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
+			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
 
 	if (WARN_ON((u32)vdev->features != features))
 		return -EINVAL;

-- 
2.56.0

