Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575640;
	b=gxjR8a5awhzoWHlQj6g4yZkndMyICCF6WenozTZwROB8BC9MjOYSsQBlo2Z8/gZ8uiKm
	 VlaHG2yR+W6aZhFeot4FjlZS2meG16wyuN0WKgOKRexEsGhf5sZnjVeK+6Ik/2jNAH0a1
	 k0IA/uRstZ2IXXx1nDB9kgUTYfrXotOY6FJN8Ec7CvVz/bqRU0XVS+NEMnZOCKBe7PCl8
	 2Sgtpfo3lz/D29ckH7GYejzQLVuR5ROCwdLj6ShGD831W64+xbnPNW3zShzMpVuXDaGxx
	 oKE/DswfeJK3CD1Iw0HL0bEwCeAR07MgR3RUSmTehvd6rBSk2RrTFGG8RX/NlnQ/h5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575640;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=;
	b=0R4/QGPMSPiNJcsZk9CRlbxW6PxcxUCYACOeP/QbTnq4t1zAAqqGaWEN82bAZoltRi6M
	 JPJApD7NOc+dfKN6z6myeOqNdRoAUOpgTO6lCrPHGqB9DxkCXKd/Z+uD6+ewNJ2lbNZMb
	 s+40fQ7bG5VQ0/j4OE2Nckq54qa07Z/Jfc0K5e6xLb4kh8t7WN3BTefM+eVAIqRM00pmJ
	 zj9ZMCE2z28UvAmuo/2bwKFr1W1vzFbvAVsYHKXGu74nzmMu9dH1OKgDniud0snT64SYO
	 j3LX5+8jC0PAU22oQabhfWxcAYHsTLaNwcavBG7FAxSKrrFv9RlVJBhomFlAyazYFXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=s87foWSi;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=U3AlGv5f;
	arc=fail smtp.remote-ip=185.56.87.5
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FAF606A32F
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FAF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=s87foWSi;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=U3AlGv5f
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793575640;
	 b=mFbgiT28JRAcQ6zOJxjiR9IuZu2D0k6EToWjcxkJql2rJmOOuIkpY1dVJH2HhUxzxbGpeHTpjB
	  CnreP88Jkk9AjB4XK9iE4o35NtJJ10WvXNpB5tNQcTnMKJseQgHXmN3JjCu3xuwO8kxS4MskEr
	  QBWDjfRcqE33jbndNrLRkhJU9fBYt2KBmnilQRtifZ/+c/fvsNq+kqNF+Fuy7I0JlX39MdmMW9
	  UjaOxjskOFUmpJ2nCsDEAQzkxBcYf6wwhUp5JBTILkpIYXAfr0MJxqZVD811M7blt3DFEOTX5c
	  FmoHEQaJmJ+Z6BCL+sJUxJ5rYH+nyTsrcwfl333PE63hsw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793575640;
	bh=dMD7NNt02fBQRek8/xXDOk+vJjzCgMQuq+ey9x3Bmao=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=g0KqFXUbPT+LNCy9EFJ91AOZtUulD7ki9NqMEXXDoz3mI1z/87RGOTsaZ3sPGtnAu69NQC4o6h
	  8nQBUCJ5v5biyXYXE3b/hZYhlGmg+UfAmg1jwvtIzqRg08CjFiCyZM6uKG9C3cW4Jlx61lTS2p
	  Ksh9c9Wem6GyhgchE9T5bRfE6UQ4JH7B2EkmZuM+SF4jIFUFIdp4fgABNYY17tEXEdY5TAotNm
	  kg1LzObFZ4hSzugHDDEbXf5JCyvKILvJCvTJbNoGEhjEynZ5eTU0dyakpdoiK7oPVnTsvB49Nt
	  ovqOA8krnHZBJDiY1LWvu26sKsr4isZx6ouCkebj40J1wg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=s87foWSioMTCCY11GI73UAha79
	N5QOTyQpzzOnSBaYBeeduUcLTWR+n7UeUusG7iwZ5uDfi+2nSgPnIGz1UQNPJFZRDUTypbV1aI015
	0cYOedQCNpTc3M24TlDq/RafbUisWgp0nqBHmMkGoR/v0LrtgJiQVRTqFRAKkep9MoJg=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexH-000000077xn-30hR
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=U3AlGv5f7jpjjD2BY3+3SenGka
	aZcHzGJUEB/6uzJVdIySOxtsqtBRQUnGiR5Nuqx1O8UMjJA+RIK4hW6ukmSPKT5rIWRcknLHZGBOk
	VX34+LAuIlqtV6PTMmuZglnARaX9HTV/ttzq5Fl9ijBzKsSNfNaCovfeVyIcBV9L3Z8Q=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewx-000000002I5-2bco;
	Sun, 01 Nov 2026 23:26:55 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:39 +0100
Subject: [PATCH RFC v2 02/11] remoteproc: virtio: replace commas with
 semicolons
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
Message-Id: <20261102-remoteproc_virtio_map-v2-2-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=francesco@valla.it;
 h=from:subject:message-id; bh=dMD7NNt02fBQRek8/xXDOk+vJjzCgMQuq+ey9x3Bmao=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+05E6l1Z8uX6dx5LLHbO+76uzilnM7J/bBedM+ub
 VP3FlV+6yhlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmcvgvw18pRW8uvYidOloB
 OcxSTsH+W2Y1Gi+/HqlWG6j+7fmW8lOMDD/62pZZmx9ccO1E/v/T23pr3P/V7ROLvvpMsHO2VLA
 JPzMA
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
X-SGantispam-id: c391e7c36d2b4064ceec34d0e8710574
X-AntiAbuse: ID - c391e7c36d2b4064ceec34d0e8710574
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexH-000000077xn-30hR-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

While not technically wrong, the comma at the end of an assignment
directive can lead to nasty bugs. Just replace the two occurrences with
semicolons.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index a86c9a949e4c..29a3a4c18097 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -443,8 +443,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (!vdev)
 		return -ENOMEM;
 
-	vdev->id.device	= id,
-	vdev->config = &rproc_virtio_config_ops,
+	vdev->id.device = id;
+	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 

-- 
2.56.0

