Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B421383AC
	for <imx@lists.linux.dev>; Thu, 13 Jun 2024 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718244485; cv=none; b=EAM979gM+AAvOg49wMVXni7QyiySvQUtR48hXoAimfn2akZgc0xa8xgob55LfUXXrY9PQ5QSE3RzJ+39YNo9kHJFscnCHrP5EOMawSuDQNPXMV8Dtbv2TaXsBIgDM2PTiLFErK7ophJIKhWXnemFpCDNO76qM9ZWMq8YoGH9/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718244485; c=relaxed/simple;
	bh=vwhl2TItuSUrCzO5vdVWYedHOQAkUkhYVgTV88cG0tI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=rNaD26yWbnnPbsD7YA32/jA+n00FmrYB5BAbKTYWHRdNbvcwsUyeILnXVCXW5STMukU551Put5SaOavXv0mwizCWkvmoCqmgjOm2tVksr3Y3duItKaYvJ9XdlqubFbooej+DMGRQWOhNKG4lhszW9tK7wzGAEWaU8lcM/vJtZ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D217D1A152F;
	Thu, 13 Jun 2024 04:08:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8418D1A1501;
	Thu, 13 Jun 2024 04:08:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F690180222A;
	Thu, 13 Jun 2024 10:07:59 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: p.zabel@pengutronix.de,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v7 1/5] dt-bindings: clock: imx8mp: Add #reset-cells property
Date: Thu, 13 Jun 2024 09:51:18 +0800
Message-Id: <1718243482-18552-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1718243482-18552-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718243482-18552-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

The Audio Block Control contains clock distribution and gating
controls, as well as reset handling to several of the AUDIOMIX
peripherals. Especially the reset controls for Enhanced Audio
Return Channel (EARC) PHY and Controller.

So make Audio Block Control a reset provider for EARC, which
is one of modules in this audio subsystem.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 0a6dc1a6e122..6588a17a7d9a 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -44,6 +44,9 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
       for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

