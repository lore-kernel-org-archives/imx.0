Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635B23A8722
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876983; cv=none; b=MZQwtHELtM3NrVGk49FUaFwOu6pHym8nT4c56zrTqjVXSXBz1Hyg6VXFpUFl9OnEqU9lVOQjhRYrkYKPeZl+UzU1iCUgESvm4fPjIY7geq0ECG9mK1EVmo31xDzJNTjO9vwZeysE68sJIhOaOiBFHXk0TjAYHBXvhRlzqx25lIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876983; c=relaxed/simple;
	bh=DkXnUCN05Lq2i3g17GT3ryuN6y+593SpOvc9GyP83yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifpBUdvkWsxYT9+ybvUeg805oW21GBvZQwUxRwOIddu0vIh2ftLzWKB4VyHX9uA46UZ16//3gvzpXgbN8mm5SnH0bOgcM+hAJ5Avbp84M//47EUanmgoCPs6qeu6aVhapK52Fp7Yjv9DkjQScw9muUDqOAAMPM4YZeMYfjC2y3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=F9QEaVCP; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="F9QEaVCP"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 03BCD20020;
	Thu,  1 Oct 2026 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876973;
	bh=bBvSWJey5DYABgnbVHURMRWOEVtheIo6pFXgiypB5gE=; h=From:To:Subject;
	b=F9QEaVCP9SxNaJnZH0uXy9kvp+MlCdhueQhQzBqhTwpFk1l/r7I7w4jpD1412VwaS
	 YCGVNFdu/4nwjjgyufFAGLSc0Bl5TIjsB/7NBxv2t2nDABfHxY3knP2YTbCzs5ZHSN
	 ytlpVQVexn4W12dM+J7i+6j9bolmyQ267L+oCkEBXwOTkLIV1mIMEmlFesZYySaJWb
	 DIH7RnxVMFEbM5/cbO4i2sxQUAB9B/TqSpdu0S/f36O0MduzYCjFK4YErJ8h5qRzRy
	 e/QUq/taq+Nw8T2vkwojz9KqhFB9PGMeBGYuBQYaP7my70J0Zl2v1B39/9PK10YpR1
	 HWS2+iJjvshyg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] ARM: dts: imx6ull-colibri: Align backlight brightness levels with Colibri iMX7
Date: Thu,  1 Oct 2026 19:49:12 +0200
Message-ID: <20261001174924.3831455-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The LED driver of the Toradex 7" parallel displays turns the backlight
off below roughly 15% PWM duty cycle, with the current brightness levels
only the three highest ones produce a visible image.

Use the same brightness levels as on the Colibri iMX7, which is used with
the same displays, keeping the default brightness at about the same
value.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..c2f8fd195041 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -14,8 +14,8 @@ aliases {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
 		enable-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-- 
2.47.3

