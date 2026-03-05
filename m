Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B8A3E5EE3;
	Thu,  5 Mar 2026 18:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734127; cv=none; b=HPhtOgwe+qPDAmxhKTSlKqdnIbH1g5MAZamdl9P18/eU6+7nDcqWXev81RHbn+rO5x3lzpvw51Uv1onaic6+Myh1o44RvP1Cp9ahLb3/5czm/1le7VNcqqmYeBINcmOw6jP+plXrxszKsiWju/unkAIniaeiRvDm5694clE2lcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734127; c=relaxed/simple;
	bh=UgVUCY7iMY9KIh/Tt+dMLwE5P1PfOe3fTipMvGV24/I=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=L+CTLXqy2tAg5ecLEJlCzd4FZ36olE1YPbSQh+PjJn6nilwwaie7sKDXEcRFfeHmdL+O/3t5h8y6A0i+ZN70V1SflAy3Uy6hnWZxOKrThPo5v7LdFg3xLbTFH54vd0haUx2VeKeHQ1B1hFJ/kjyQ18m9aaB+OjPdkcT0KT0YQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=kMv2HY+1; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="kMv2HY+1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=xwcBePG6sNEWpweHlUmZfJdvbnJloC7mT6REuR9qIdg=; b=kMv2HY+1obgYipx2KcnUAI0XkT
	G1MkYihwMB3+mXfQa7DLo4swsyYB18cXuSzq4YZRGvouNab9u01r/9O1esZ1bAYG+oBizkeW9yYHE
	7iSeAvYZyw4FU4xNyU3iaCb93MjCIfNFrIEhHEeFGqp8Qn87OJKySnRKcvq0WQZ8MPQA=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7k-0002aR-6E; Thu, 05 Mar 2026 13:08:36 -0500
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
Date: Thu,  5 Mar 2026 13:06:23 -0500
Message-ID: <20260305180651.1827087-9-hugo@hugovil.com>
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
Subject: [PATCH v2 08/15] ARM: dts: imx6ul-var-som-concerto: order DT properties
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

reorder pinctrl_gpio_leds to respect alphabetical order.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
index 1cf4a4d6495f2..d40264b553240 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
@@ -140,18 +140,18 @@ MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
 		>;
 	};
 
-	pinctrl_gpio_leds: gpio-ledsgrp {
-		fsl,pins = <
-			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
-		>;
-	};
-
 	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
 		fsl,pins = <
 			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
 		>;
 	};
 
+	pinctrl_gpio_leds: gpio-ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
+		>;
+	};
+
 	pinctrl_pwm4: pwm4grp {
 		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
-- 
2.47.3

