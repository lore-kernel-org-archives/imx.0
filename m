Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE6366DB7;
	Mon,  2 Mar 2026 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478665; cv=none; b=mtbKZzSyAV5r86oktrpBYxwC9fdm8BnsQoC8loDsuuYCoNT7jPQ1uWGQPrPAkBHX/GVehcjqUj8aqwlJedfqjdUyNtBbk0/r18h1VlQM2vc7vfr6Efx9+7mVVLRu/IeMMcuuTPL47ayHh+4hwV4/F5j9kzVkWoos7zR83u3LPHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478665; c=relaxed/simple;
	bh=GFKwW8tRq9+ZKQI6HFvZlyumfI9eovpnWAO8ZCtqErU=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=i2kFEGwn779yF18eLwSBM2zJwogLax/gMdB/bMZ5a9xKLAJ+mzOtahanxaBJv+uGBaRkqdGDpndK8uG2/SGCmsy5CXpJq9lZpyIj/BluLq9NS3g3gwBHSoiTroL2R0qQUo6kPEywhR2xTDQF0lfM1m+rlVunehl635UldHjPWNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=i6o2lfbo; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="i6o2lfbo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=eptGtomLn+jMzHp1bkZ0E5wTEGfhea4HBPM13R/EfB0=; b=i6o2lfbowvWbbUaLtCAJ0C1UHz
	ieLjxLBuB8x4HiiUrlVOd2zo7FMtXCsOVHG8N2/HWyIFxGiVjJvBuW2FMfIMMEbbCnIh7xKmIJDJy
	4P6oXDBuNYbWDjBLl5jV+ym5dTMsnVeXcP+vx83oDsBnbeZouT02wvbdghwmxfqdIboI=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fE-0007Wl-6l; Mon, 02 Mar 2026 14:10:44 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:41 -0500
Message-ID: <20260302190953.669325-6-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: [PATCH 05/14] dt-bindings: arm: fsl: add variscite,var-som-imx6ull
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for the imx6ull CPU variant of the Variscite concerto
board evaluation kit with a VAR-SOM-6UL.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 99dc1b3f1ba92..61cda40d31873 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -797,6 +797,12 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
+        items:
+          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+          - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Boards with Toradex Colibri iMX6ULL Modules
         items:
           - enum:
-- 
2.47.3

