Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD011AC8AF
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177469; cv=none; b=pAF3AjGt43PD13rFnbJlHHVjndgGMHkqKRWsMGlW8X9rdKCaUMumpCA3A/N/RMdx+tzx3HsdX43FrkTIeK1fRc2twtsquQGy7SU0HyprlIIJJU96Sx+WKairtsJ07OK8wx4ZB3jonDKei+NpuwAx5NEMBE6AGiqU7eGUz0DF84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177469; c=relaxed/simple;
	bh=kqCqFpN9v1FXTe8H78fB6N26x+fwYBvAdWQ5hsLRXio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASSnTSop3g1kH1Y9Qm6DlOLr8aa4ZWOnto/Bi4k9Wk6hvny8QSfZA7Blx7sWUzp/6mTHki3a8nE/4m+UkawyyM5etxap4dr9AQjYYCqAKev4KiNTVj/m1lAwqT1Oc6cg8D1waJsUqjVPj3FVi33yFhqmzPRzR0HKQYjBgUJaRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zCS3VJGy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zCS3VJGy"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4C7861FA9A;
	Tue, 24 Sep 2024 13:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1727177458;
	bh=X3I5T6N+k8mSALDhWBHQ9Qrvz6O/s/wkn4hZqV7Itoo=; h=From:To:Subject;
	b=zCS3VJGyFfy7X4BGsCNd4Xr9M+LrXKbduGCMSfjH+Oxr51KR6VVx9CGmx3oUot74X
	 RnnboGxF6a0ZfbyonF9ZQYN0jOgTfu+cvcyONG3tC4aImR94/dGcBbBzC4ni3b5zdV
	 3rwA5lkXskrJE2US+Nj8ee3TqYYej8GwZXz8fS57qCIRch97tVIbDbhaGax/JNI4Gh
	 0iUQBCMKKicy9ixmE08z1qiZxw8x8XV1tyfvFtRIEoN6vua/EROExU4xWcQDEHCtDF
	 P7JZfV+o8ZPkWjhFuDiLgG4yUaVfG4vfzp0fz5kj3HvaJDqaPcNEConIDUvjimV8Fa
	 +WqakWiD0IjFg==
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
Subject: [PATCH v1 2/3] arm64: dts: freescale: imx8mm-verdin: add label to som adc node
Date: Tue, 24 Sep 2024 13:30:47 +0200
Message-Id: <20240924113048.125761-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924113048.125761-1-francesco@dolcini.it>
References: <20240924113048.125761-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add a label to ti-ads1015 node to make it easier to reference it
from other nodes.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fa395914191..c20c2da17524 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -483,11 +483,12 @@ rtc_i2c: rtc@32 {
 		reg = <0x32>;
 	};
 
-	adc@49 {
+	verdin_som_adc: adc@49 {
 		compatible = "ti,ads1015";
 		reg = <0x49>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#io-channel-cells = <1>;
 
 		/* Verdin I2C_1 (ADC_4 - ADC_3) */
 		channel@0 {
-- 
2.39.5

