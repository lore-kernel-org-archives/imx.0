Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D539C1991B4
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729533686; cv=none; b=c2ktmxi+iMzoTsTi/UeJiNwWIDKg0RmhwOAzv3Zc768jrELoX9DQf+KFkFwjL5EtTJbwbPvyUgQMQTTqsm+8wok+aVTH7Pa+bS+q7x1vOX9Ey786JNWFjuRcPBSaaL0DnUb8h7a31liw/ApBl5JaNuqnTffVdf43UfdJaV9IuKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729533686; c=relaxed/simple;
	bh=0ssP+/C45v+G+qhQEUwDcfAMflnQ9ClkL/fOR4zIRX4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZURsKm01tbE5hBSaBYVYawIVezL6AJaeVdytUWNbcOHZzF3uH0UFuGwWrA8r1eXv1OKQlH1FiY+m13VbBg75TLGSxki1wA6Gh+QLSx8n1veYlzzVzL/ajtMafa34Q3+vJcjiX/Q+2LR7uVyT1xM2Uk6kANXyGiW0tGBr7PJjWVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=385f+IkR; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="385f+IkR"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t2wL2-00A4Yy-0F
	for imx@lists.linux.dev;
	Mon, 21 Oct 2024 19:37:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=y7dzIerB/KI11ADRmN80B/zGm4FVlX7K4IYPNpBrSck=; b=385f+IkRCbWxq59mxLMVgH21Wb
	YDipVHsEzRS8CEZEbEu527EEEoBo17dv0eOTkAW1Ivt44/E9htOhk538HdAT+JSQylZbxD+j1CHl5
	+6b9dJ9TvwxY6+mq9yxFy0oz8fhUBMHovau6reGScFw8jfYEWw2CQHdW2RAqMtum6KKYOjLfoqMpq
	FiwhNI2QDCF5ZEiYD7bPZxPXKWL4n1n+nY933Zfck/XF729NsJoBu+hpWLM40rwETDbz1Zc56PmyR
	dx98rEe/sy0R4bQyDJv0uAmyR1Gsvkjn8UyYdi6WXkCIu/z7g/UQUaKRE+AsHrZ3uh4WzcQf9Qqw/
	DRm5b7wg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/3] ARM: dts: add Kobo Clara 2E
Date: Mon, 21 Oct 2024 19:36:28 +0200
Message-Id: <20241021173631.299143-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a basic device tree for the Kobo Clara 2E Ebook reader.
It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
are not ready for mainline yet.

Andreas Kemnade (3):
  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
  ARM: dts: imx: Add devicetree for Kobo Clara 2E
  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 .../devicetree/bindings/arm/fsl.yaml          |   8 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
 .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   2 +
 6 files changed, 572 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

-- 
2.39.5

