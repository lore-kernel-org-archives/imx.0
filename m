Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F533803DB;
	Thu,  5 Mar 2026 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734119; cv=none; b=lQiDXzmDWexJ6x96aENAfYtrWckDSarJu7k2yex2cgLZ6ZokaTRdUK+7I8XXJ9aeJk9XDoOv633tC2d3O/j+PqhDQl2Hrju/t+2FyYGfQNZ/sqzJ2tSVtZn4VNze6LHtZ/PEwz4iL2PssmnumTI2LUb0jbLJIbRc6TNzBW5RVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734119; c=relaxed/simple;
	bh=V8u3tYgw2th/H747Fo1Rwb/Zmj5VstI+Lo5MOIYEyoM=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=WCSzpbH32gvh3QcsPC/UAAe+bXW+C8Dh7KlTooCvqewiZPWWmFSFPy6eGVdi7yB5UmjuzIM8a57zPmvsYd7cXgKJ4twI5OqYDtLpba1rq8kGGZ3Uez6nPHKuo5e9n7gNyD/zl9q7lAV7v+xvUO6AKQzrSREUKwzG+gB4tqpZWLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=KIk/9Y4n; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="KIk/9Y4n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=IGz99reFYT/+DoaMSCYXt6fgEmntGIKGtzdIEBnIkNk=; b=KIk/9Y4nPYeds5Lo+K/sbmGmcL
	s5GusCf1EP0uZRRvZ1gw3FftlodSYfEjFrrJYwuETPYcuz0S1ukl6YhRB6r3P+TwU07YCgXOxnEyK
	uMCcdjqz2mgInzVuR9w6f89JBkhXjF60aP8cRVFLjC2VRuHy/o8n/rngeAwjuH7pVp2I=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7V-0002aR-Qj; Thu, 05 Mar 2026 13:08:22 -0500
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
	stable@kernel.org
Date: Thu,  5 Mar 2026 13:06:16 -0500
Message-ID: <20260305180651.1827087-2-hugo@hugovil.com>
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
Subject: [PATCH v2 01/15] ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply property
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The dc-supply property is non-existent in Linux now, nor when this DTS file
was created when importing it from Variscite own kernel.

Therefore remove it to fix this warning:

    imx6ul-var-som-concerto.dtb: cpu@0 (arm,cortex-a7): Unevaluated
    properties are not allowed ('dc-supply' was unexpected)
        from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

Fixes: 9d6a67d9c7a9 ("ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support")
Cc: stable@kernel.org
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 4e536e0252def..3fb5e2fb68777 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -45,10 +45,6 @@ &clks {
 	assigned-clock-rates = <786432000>;
 };
 
-&cpu0 {
-	dc-supply = <&reg_gpio_dvfs>;
-};
-
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
-- 
2.47.3

