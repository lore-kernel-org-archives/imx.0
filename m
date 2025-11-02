Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749DE221F00
	for <imx@lists.linux.dev>; Sun,  2 Nov 2025 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762099789; cv=none; b=FNrPHS0jailg8ySnudxjaNlwT200wsLWBuBXyLKhSKk9rbtLTHtI9rhiaaTmZ4hSPWbGGIhbgu/l2v88pVdHXwlLwdtxs5Lt2k/XZHLXJ/ea3xvCPLe2xW/oZ1iWXpmofyijnaJov2rjLupv6fD+uzdI1MNZbfFWdftLtleiyMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762099789; c=relaxed/simple;
	bh=elyW8NLd4DlS1HHkYDaS/O6acEUOc8I9ftJ7xJwCPZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSxsSAtuxTIVn9iA28Ys0umlaZQs2zdUCzohlxXxbRUQStDVbbkxOjoLbJyLSruWpxLknKSBfgwLIM13dKO/spGC7RLfnsjK14XIQ3cel0hEu3YKjv4mOmNaswVef43YD02AEEVph3kKexk8qpte1911RS239z5b1tRZqlNHJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=F9GC5Haf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CmZydwOX; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="F9GC5Haf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CmZydwOX"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d006C1mXzz9slq;
	Sun,  2 Nov 2025 17:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WRWlBAxaLwlIJ+KJHtMqZraX6wDCd2McXv/vowb6x6Y=;
	b=F9GC5HafzrCeSJU3lMXKf2jcEjvnBUojT6aRb3vRMIaHDsJN9LuYprMzKWTc9bb8VmTpha
	j/jGvjATNXZdaFBCwBY+O8Mx1fxda4WBLiExXthmRGAEb5yI+aq7DlBh1K//rWBUzM1o1L
	ja+X4kiDZy5G1WQIizSB9Wle8qH+E644QBxe24p6sEhajCd1wTo9SawOz0dR/cqPciHWD5
	MdXeelDnqCRFxOBH6EWnc/E56AJXqIK+U4QcyYEKJvRyPgG0xcsZqXGQBqlZPaRm8I/MHJ
	Z8lgiQKmspkXSlzczL/CYMphZAUXCLhBhheuQgs1BeFEBqrLM9eO1IIyA7R58A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CmZydwOX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WRWlBAxaLwlIJ+KJHtMqZraX6wDCd2McXv/vowb6x6Y=;
	b=CmZydwOXCdqv2rs2s4kd4EQ0FhAUY+kyls/iw2j1iTsmUCQbrqM2oDtu7NLYpPUwoyCixp
	GXGB9IQ+iLy40Q+BDHyXAFUQD9qBbBtwHsakb/PHPMsJhmci1Eypj3nwm39Jj62AArybuL
	tKStgfRAEtTnC9KiFwTT4soUwa0j3r3N3frMGwKruqcIJ23Fvooi0BAh46d8H50syCk4qv
	YYtmEjhUKEqClp+A6w9ZLv8iVxrWZiYhm7HeNXj7gCLU5aAIi78l8LBme7mjGWtUYr334O
	t6VAN7W6Vj2MumG2vpcDpXxCIRuG/YJ5ZwlvPPrNryZlDzMkPCLBqZZvgFippw==
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
Subject: [PATCH v4 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
Date: Sun,  2 Nov 2025 17:09:06 +0100
Message-ID: <20251102160927.45157-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wnbswggsbryxtn3g8tpcuso9gjh438be
X-MBO-RS-ID: 36e0d0c2e5fa586b9b5
X-Rspamd-Queue-Id: 4d006C1mXzz9slq

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
V4: - No change
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 613040fdb4448..8da8ceb0308d8 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8196-mali
+              - nxp,imx95-mali            # G310
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0

