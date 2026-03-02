Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24193359A8A;
	Mon,  2 Mar 2026 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478664; cv=none; b=JiQLPz4qd8wNWC5A4zXqokNDgdmx4O9Nm5Z24gn6eD+79M9aXclRdfcusdAMOmC5WEqcGDHP63Puk2niFCNQ2CWr2Ky1FoL+3A5bLXZ9pecjd7Ttt1F5XSxklyhxqIQzwjahP7WxLIoZqxgHNzxwadIyd/3C3jy63RdVR2K8bIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478664; c=relaxed/simple;
	bh=V8u3tYgw2th/H747Fo1Rwb/Zmj5VstI+Lo5MOIYEyoM=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=UywRz9z7DcttbJf7bew2g2MzuSMwCimM0jv8PEyCrJkVBK5gCOhFn/H/N3Tt9D/l1vKg8+6oMSf+TmQNzwh8q7jHfj6ustSPrg+aqRASU63F4k0IjJQOpLPzIK7jRLkv8R3C01Y69G6tKI2TONpVK7YgZ0BbPg2f11L/zYAEUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=ZXHwQFf7; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="ZXHwQFf7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=IGz99reFYT/+DoaMSCYXt6fgEmntGIKGtzdIEBnIkNk=; b=ZXHwQFf7VaeR0eY/uwhlW0t05u
	REMVN8NVMJboT/3KKpWhryca+FHMZil27faLxAQjYRm/XixQAvFGf9I6cE/9aQ5YPIlZungfLkcSl
	DcEFLei7DyqxYCr2uUvkdw1yNhwHkrNfMKnQ+mFz/V193C2mRHJLryn5+Q4Pe2Bdg3VE=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8f8-0007Wl-EJ; Mon, 02 Mar 2026 14:10:39 -0500
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	stable@kernel.org
Date: Mon,  2 Mar 2026 14:03:37 -0500
Message-ID: <20260302190953.669325-2-hugo@hugovil.com>
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
Subject: [PATCH 01/14] ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply property
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

