Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F431A56B
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832807; cv=none; b=X1vmajI6Aji+z4/m16WXiH3JUl9q7A/y0u2U5VbVDLkI6kk4+uPBKnn1fW1q78/QjqLZnJ75kktqOBd2gz371V4Ve1dwkSnya73aG6xnBCCh/LFNhD/PM3gK3eT+Vg3LPS+0sjJZ8iCBojOkmJYbW5fcMpBLLoY3ayUD1Lveti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832807; c=relaxed/simple;
	bh=ZncW6+YcvBB48gytF/VEQG8PTEdDL2I+lCeAs8DjRJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WuZ4teI4F8g6S6S/NmxdU43Kj5jLmSXkUx4ou2LwLUNDEZzxDa5Zj+Mbncws8hnzLayjFZa3jS3xXMVce6fAp06iyJcJvPooL4OEEVijPyc2BjI5ifKw395yjdM+kwJuthsJl9zy8PfLoPTVQc9dji9kMiJdToa1Nq9tFIssEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Rl+CXYA3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yhFHUA5l; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Rl+CXYA3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yhFHUA5l"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cXlvd1cnBz9tW3;
	Thu, 25 Sep 2025 22:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hc9FLuq1Qle+dUOfMSuq+9OePYiOG6ObgpQkfAy276I=;
	b=Rl+CXYA3AgQzWX/4AJa0LbV/qICcbZO9/heHpxU+S0CyJRddwmTIuB4jnkLQ1jd00wmYrm
	U+O89ng2qm4VGC/6GR/0YPoOOOiuMSbp2wtf/zw8DAsoinoAyT1LZ4B5mK1wVThovS//zG
	ApAubaoJ/SXXqKuGzlTrkdupHZMfFJwvIZ7CyLzuK969sV+juVsw6yw/QFZ8MmK87QLMUu
	I0r4NrnAn97aKephBGdmF8FlFaIeonidCnYdMdVFxYBAdU3dKzttllvgrXNv9/gQUR0vXy
	iqhuO1mkThdcS+hPM1wxJ+0lBYlvw+Gjc6bL4d/iMcrpe2zS6NiWiI2PXQcILw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hc9FLuq1Qle+dUOfMSuq+9OePYiOG6ObgpQkfAy276I=;
	b=yhFHUA5l+noNrPehhfXmDBy6NNPqTttvCXrx58XxmPTr7HFyBWz8s0mmY4CL1V1o5rGdtm
	qshzeQFkR/BEmhBfFAYpGJDBUnqs9QnvmhWtmrYBW8plJQTEEH4SMY6vWaRrnrGd9COHFf
	oUvrl4mlAIc+jNen4vjs8ZodNbgIwIB6H5vNqnyjLVKFxjLlJzgzVSYqqPl8NkA0Frlswr
	KZu9917vOFJbcmDWjYVxLTbiKZ4NZYzE4NlN3v17GL9BHK6guEYo2mOVJ6PDksU3WtwWzX
	kmCrVwEgycfki7OFa/U58/CXnRQdY08HjoqbL4WRHkpD8VrBdb++deUGvQToOQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v3 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
Date: Thu, 25 Sep 2025 22:38:30 +0200
Message-ID: <20250925203938.169880-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1a2f3377f62ae1cf85f
X-MBO-RS-META: tfwgks6u4kmgzo837okm8a7dbguzuxds

The instance of the GPU populated in Freescale i.MX95 is the
Mali G310, document support for this variant.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xianzhong Li <xianzhong.li@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Add RB from Frank and Alexander
    - Make resets: mandatory on i.MX95
    - Switch from fsl, to nxp, vendor prefix
V3: - Add RB from Rob
    - Drop the reset part, this is now unnecessary
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587..b220cbd5362f4 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - nxp,imx95-mali            # G310
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0

