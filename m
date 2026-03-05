Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D83D3305;
	Thu,  5 Mar 2026 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734120; cv=none; b=H2H9x+ABvBnvCWZSYllXoa134xVHQfUbm6ObdKzetYMujEt4tqADgYxuQtIf0Xf398ng5viIy4KuG0JUUCDaHTvXvOFlP9GvyrjxIbBxzjAN7hDMNEC9IC8uPf2rrU5VKzxrIcF2AOj+4bCAHRh6N60iBudOdYlO7mObdLpPOQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734120; c=relaxed/simple;
	bh=uRmvo9a+WZvYFqg6CyJHM2DQB+XuHNSAYqGHRD1opjk=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=FXfP7IN0nDu+kMacicIW30eJEahVdqX09ssyx9Argbdn9Ezi7AEdqqF/XzBVRYbp7j+EVeNeeTibgjl/A8XLhEgQQJRWGTuldVFtT8xZRttZ08BysqK1k8qKgIEGbj7+dVIgNvUvCFGd0tbEqVkCYfD3vdwyu/NAggJt62N7/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=FLszohrk; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="FLszohrk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=8ahjnWueAB9zUPombehUVIM9hzo/KNzNVi6UyjOuYxs=; b=FLszohrkFfz2pS/uxNGPrdEUUv
	4WBS25SqYjQBlCivqCH9HLd8mNZReyzO24b6dK5e6XxQnA2xlkvVQxa1ITzQPF+hFTGwMfbWV2lFZ
	PFpPmhMy/Pyl40ag5xJg24C2tw0mMZyVuBI70YvaQnsitvX/ddDDK8uVy1vYfojyaWxo=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7c-0002aR-CC; Thu, 05 Mar 2026 13:08:28 -0500
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu,  5 Mar 2026 13:06:20 -0500
Message-ID: <20260305180651.1827087-6-hugo@hugovil.com>
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
Subject: [PATCH v2 05/15] dt-bindings: arm: fsl: add variscite,var-som-imx6ull
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for the imx6ull CPU variant of the Variscite concerto
board evaluation kit with a VAR-SOM-6UL.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

