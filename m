Received: from mail-108-mta108.mxroute.com (mail-108-mta108.mxroute.com [136.175.108.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3EE53E15
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717359279; cv=none; b=PfJgDeG1Bo3bKGjgQVKuPu6IAe00dE36g5ym2Kn1RQ4OLxG/uF8Ju+HyGi67x4sHNHmLLXZaAAxADwu7Pp42OuaFwQAg7fW2PuZQ0ztG36DUAnkOxQaRpkUUB9sKk7ctUnzWx8dy10MVbPwg5GYSySXy2yNyzQUwvPpvADEu800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717359279; c=relaxed/simple;
	bh=liAeCOCis53oq3GtruCxMWUheY7cl+d70gOgO+0PYV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhLUaTtOwmOuIeP6YKiCyvkUjF5D+ZhBaGx1PuRv3HNIaROpRMw/s7KZgovdMWa8niv/cgevrmYgdDg+O/b4Mi5/lHdG1nB4Ksh0Gv5EqpKqVGUV98DcTSDgzG5Fh8GzPUHnh9UggUcY3MP9/XJiltoskwi6zzAIudZZMdRjBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=tTvuGlY2; arc=none smtp.client-ip=136.175.108.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="tTvuGlY2"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta108.mxroute.com (ZoneMTA) with ESMTPSA id 18fda96e095000e2b6.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Jun 2024 20:14:32 +0000
X-Zone-Loop: d3c4c54df2358dffaeba5d0d9cf7500c460ce94ce6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PzT4xTOEeVDL66kJK8reXjWQ9fp0oEJkeO2UsrLAT0g=; b=tTvuGlY2R/yvA8ERPzoTDtgZ6I
	FUy0FdxvmaYyVNxmLqegOkq+sAY5FHGlaL5r99/LJtJqt+4ZOGkTntUNaz6yHqitfMaNXJ4bNkF+a
	N0jg3DKgq6PiWo3Vs+fhPpasirB2xOeaKKex461ShwZCVntTqceMSG97yJ26hb3gjdd50Zrh2CeLb
	WhPWFupwfjYy89IkpQrMf0aKZkM1NXfJQnlycbOwSD/eebB9DO8fPT4PbqOmSwyD2Xb9ONM1kyO5Q
	PZ9Xp9rxByYL1hlyzqLM6ZqPdYDFGBHHex9XF5jmDSPjf9kj/L1VqBI4GTA3b6kGw/2qMRVbvlECn
	/StAqmRA==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 18/23] dt-bindings: media: imx258: Add alternate compatible strings
Date: Sun,  2 Jun 2024 14:13:40 -0600
Message-ID: <20240602201345.328737-19-git@luigi311.com>
In-Reply-To: <20240602201345.328737-1-git@luigi311.com>
References: <20240602201345.328737-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There are a number of variants of the imx258 modules that can not
be differentiated at runtime, so add compatible strings for the
PDAF variant.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/sony,imx258.yaml       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index bee61a443b23..c978abc0cdb3 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -13,11 +13,16 @@ description: |-
   IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
   type stacked image sensor with a square pixel array of size 4208 x 3120. It
   is programmable through I2C interface.  Image data is sent through MIPI
-  CSI-2.
+  CSI-2. The sensor exists in two different models, a standard variant
+  (IMX258) and a variant with phase detection autofocus (IMX258-PDAF).
+  The camera module does not expose the model through registers, so the
+  exact model needs to be specified.
 
 properties:
   compatible:
-    const: sony,imx258
+    enum:
+      - sony,imx258
+      - sony,imx258-pdaf
 
   assigned-clocks: true
   assigned-clock-parents: true
-- 
2.44.0

