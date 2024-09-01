Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6107185932
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206272; cv=none; b=uJvDLg7AYAJxkIyTBdGphnLGdg/Xx1xulXe1VEsciZfrKamzMrMIPiSKRM7nMS/bO2YAtxbZxAGHk8g+vMmyWjxGwQU+yfiwJbZOMJ4KiZMvrtISN/dtBoWnsMa+o8v358Pv8AvmcV3mM755WS6l3EdtKhHj1x26AutZjXMtmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206272; c=relaxed/simple;
	bh=RGZzKIj0Qs00e/ZOVZpGiXIzRYgcbt/8qh85+64yUjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ss2ldy3e2R0asDZfSm8Hw6FCKlfqfxv6dL9tqD9N3wgPRYRYxKCYmm9VSht7Y7lFrVweKyxVhRffMkxSTJx4FabDN6zSfK6FlJePm3JTmeocDZJPKJS9D1KHpB8DT7RHW7AT3CGP9g9jWmVgTu7oqkV4UcfAmZKqOSvkJsq/DH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=qvWkYrfH; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="qvWkYrfH"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 77C021FB22;
	Sun,  1 Sep 2024 17:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725206261;
	bh=RNvOcUq9hCoNQl4k0iHcvMfQMn0dWq6B44up8cQLmwA=; h=From:To:Subject;
	b=qvWkYrfHy1jUHoJpAZbMqVAbUQ7vrwGCMKdQ1hATVQoQ5RuLmngiUiG0WIUc1rJE2
	 24ffIBdclX9rK6x4PAjWQosL3FlK38dF/Cu4gok6ZufBYjO9LVsyt4e42S3gFlEmhn
	 tZI8Kq/z/s9+T8S+K3lLI4YSCuwQGuxraNfReJkjTFN8TU0Ld59XJbwYHXEZ8KQHPi
	 TQDhPXEqdryr1u5tSocxiz3xBeup21GELBTJVJDcR+rFbCWw8HgaUFWOIQZJj6J+Sx
	 euhVYM4fuxUY4dHBtSECTWMtVdPC10zQuJj3fMXhXV7Kf/lLiPTP6tNcOg9f8qzMFy
	 zgfMQtg+0aCbw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 10/10] arm64: dts: colibri-imx8x: Cleanup comments
Date: Sun,  1 Sep 2024 17:57:21 +0200
Message-Id: <20240901155721.7912-11-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240901155721.7912-1-francesco@dolcini.it>
References: <20240901155721.7912-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Remove unnecessary comments. The Colibri-iMX8X doesn't support FlexCAN,
and the GPU is already enabled in the SOC dtsi.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index cf689904c166..edba5b582414 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -121,10 +121,6 @@ &enet0_lpcg {
 			     "enet0_lpcg_ipg_s_clk";
 };
 
-/* TODO flexcan1 - 3 */
-
-/* TODO GPU */
-
 /* On-module I2C */
 &i2c0 {
 	#address-cells = <1>;
-- 
2.39.2

