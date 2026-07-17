Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757A3F5BC4
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290744; cv=none; b=rtk16M0DDj+UXKJ5Z42xpvkST++9rDU2lK/jKYG7CKSfnnPSeruGIvhUcTbuIesvjVOE8cVMRkYsd7PYDi2sP+/ZJllU8ImaoQWcP8sDDZoT3/DuoVUZUG8//oEMgiHWVskhzGA8Phnvxl3nIBQzqc0lI98MkNrDgsflh9l0RtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290744; c=relaxed/simple;
	bh=YDmyXfzacxmWKpYOjlQi8dJay5gE/RhnxUFjmqAmlKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0z6L7VVNnD2PywOdUkzNcE82zfanlKTwM3W5uCkD5uxe5LggyfVfZjnKho/F6+TYH4cmdBMZprDHpX4fd57HZhPgshN6wVTEnKk+DwLv8aiMYf/kUDYCB8Mc+iuDeej9g8jHcErTJihUAhROH/jPjv4z39nwgcIDcIeDxfBa74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Cs0qV0Zy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Cs0qV0Zy"
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id F0DE4228CB;
	Fri, 17 Jul 2026 14:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290741;
	bh=hI+gYh3/TRT6FFcKJZ0XasSEEdmxHbnk71spIov2KOs=; h=From:To:Subject;
	b=Cs0qV0ZyWBc8who59FcP+pRQEY7jRK39z+biHbA6BwPqkBxFHqLipsa/nxacukSmu
	 CiNbzozUCxp8zHowxMtWry8aa5Or6WoIm62YOfq0ha42cDaToUjtMsU7YuoEFXio7x
	 oRl4Rrk34wpY1/xUoxPCv35aIKgwqkpDMuT00WFzNheQHpdPdTb5A7qdkD6bDrNFsu
	 nQjAj/zQFt/CcWa4OgFG1U1Qx9qiZUfQCxeO61Ig+TSdd9LjA/jm1FLqmmUW+xB9sj
	 +rfoEqbYmmjBWcqra5b/s57mXBIxDChHgwzJhbFi4IY+cXGxJ70JHrgXaYsS3kRGyE
	 U9EQ2D7CmCHrw==
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
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] ARM: dts: imx7-colibri: Set LCDIF format
Date: Fri, 17 Jul 2026 14:18:46 +0200
Message-ID: <20260717121847.488148-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
the interface-pix-fmt accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..f820a613109a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -533,6 +533,7 @@ &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif_dat
 		     &pinctrl_lcdif_ctrl>;
+	interface-pix-fmt = "rgb666";
 	status = "disabled";
 
 	port {
-- 
2.47.3

