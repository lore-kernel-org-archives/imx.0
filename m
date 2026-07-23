Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3C4399D6
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799509; cv=none; b=h8fDOkrbhlvdrmdcRM3BFWUQ+WruEMbziT6QhVLaM/qk8CQxbN8WTjWc9/i7wo/N8OvJ6BSCuOx5agJdWXMacFcukUmWCRFKzs0omTdCi3MQ+MpdeJkHq7ONCHsUDoGXxzmxOvZALGTtTdris9IT9iyoxyzBzuO1PCOJ0U6/9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799509; c=relaxed/simple;
	bh=y/hyNb6jUf1ifFjeEnSeVbjCm30PowKWPHEg5zDije0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qo/zeuuLEM96FfDQJQpuycZCTmCTOJ7UPxB0mmUXkjGz5s+9YXV5BP7cLRwRqV/IXRPsx3Aa0Gs5ew4ghFl8bHVWoKqRDPMMuZtykKTRTAP1yLkppVLLPPvmYhaIDJDOrflC/67fyezo3jKhrSyYKlMW2b5Cb89iUkvidD5clQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dVO6wwUU; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dVO6wwUU"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EB2421FB90;
	Thu, 23 Jul 2026 11:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799505;
	bh=rjBDuxRoTymXhYZbg5DT7GQlkHF6XG9c4ffbxQF07YA=; h=From:To:Subject;
	b=dVO6wwUU5F4bNOq8u8U2FJGaaufwMY4eXLkziJSt9gFRihZtJWCs+oKyn6MIiOkXy
	 1FAaQP0VMDheR9MrpLdOzwzU4em/gV+JDSy8j9m+6itzbO2/WEevEyVEFKQsX/cItT
	 7ri5XSl37tv8NwLXGUzOOVP5/c0Eq+I2wu98HBIIO0tr6Q3jx9FE25ttsh6TkyTmNg
	 SaVOPkbU0xmRGmhfzWMkrY5sWX59onqQNaE45RXGSTYaP9p97Sm06PFG/XfbPm0CFb
	 BK+91ZsYEa/K+W2DqX45LTE4IjCHgTnWVCL6u4apQSCbPBZIOePWg7Gsse84Lc7+O4
	 GagYmDLHjJIrg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] ARM: dts: imx7-colibri: Set LCDIF bus-width
Date: Thu, 23 Jul 2026 11:38:11 +0200
Message-ID: <20260723093813.180089-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723093813.180089-1-francesco@dolcini.it>
References: <20260723093813.180089-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The lcd DPI interface on colibri imx7 uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..c4088d3c5ab1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -537,6 +537,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

