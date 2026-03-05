Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC3288C2C;
	Thu,  5 Mar 2026 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734120; cv=none; b=tptDvaqKRcN74xnoJO1TtrjjDAnhXQOq1kHyF4pqA1fCqi+L+UrpoDUL2DftLjHZSV6Nxf8C2wvFrBlVsxk998B+dJ25PjkUetJ0I/NvHURzHoS+RGtuE1IS4jzvNXrWEZDeQTfwU9xt9NBlbgngl0bVfyqE9OMs5bjOeTz/NMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734120; c=relaxed/simple;
	bh=ht78vGOgPyabcciBgG0XMEuT0626MSS4eZZXn74CEyc=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=AUTuI3vO1FbsUSvvzUUCUWQfNJU/b+VctKwbsgPEHfavzZhZoVOOmY3TZlSL7Gbbte492HLrER5gSq1M7Hqr9WBqduHHu3p/fbb5tXpZtRZsKnDi/p3b2/RHBIYZIn7EtzKyAtKO/Xa0Dh5YuyYQeyo+LzfUgrLNSSRnToMABUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=uy0z1oIz; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="uy0z1oIz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=IHW6n2hUHxLvs0sr4FpK9XY9GiMrXVjYo3Lx7EQPaKU=; b=uy0z1oIzRapkLtTHutr81LzUzS
	7GkEVkblCvTnPUGjWM82B0GkkvVkexOSvg661mVU9FuoP/HRJobgL2o/Zj305wb/zbXy42ODiewCo
	73HRxt0zevM5Rpz1lZ61uAAVwM2UhFEKeZlF4NujLECv134SbX8VWYyXpW9g5sHIYTB8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7a-0002aR-N6; Thu, 05 Mar 2026 13:08:27 -0500
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
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
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
Date: Thu,  5 Mar 2026 13:06:19 -0500
Message-ID: <20260305180651.1827087-5-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
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
Subject: [PATCH v2 04/15] dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6
and also VAR-SOM-6UL, so it is confusing at first to know to which one it
refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.

Link  https://dev.variscite.com/var-som-6ul [1]
Link: https://dev.variscite.com/var-som-mx6 [2]

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..99dc1b3f1ba92 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,7 +688,7 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
-      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
           - const: variscite,mx6ulconcerto
           - const: variscite,var-som-imx6ul
-- 
2.47.3

