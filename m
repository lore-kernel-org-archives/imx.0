Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20C17C64
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722864837; cv=none; b=FhjbO7QXjLyHvevpRXHjTJkWXRtyedYDTITxg8zroH6GUq97Mp0peFQCo9vRey9tf8mBc/o9j9L+zIec61TQwCf8TRR0gS+II+6Kg8YgmMN9wJpZvz9mJTMifKAO0knTV6Kh+VGGOwyMidsJkQTMF24M848xmS+q6091fffRCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722864837; c=relaxed/simple;
	bh=ubu0CotWYKRX8DT3AZEDNKu6rkYv7NNafpkf0mpAy/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=feIID0nTenmBCZcgBrU1TBAr5YyBCJSGnlPWaM7CLSysqmNn25F9O7TLyAuLnM8V7Gl01mPxCFr+y/ZgcnLT07XZEQYOK+MA2r01xCu5btlwR4hx/y4aophUKyuT/GsbPn3Un+8b+zOM/g955HeGb4PQvheUY5VSbNWTaSLLM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=tbmyJwvJ; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="tbmyJwvJ"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1722864824; x=1725456824;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ubu0CotWYKRX8DT3AZEDNKu6rkYv7NNafpkf0mpAy/E=;
	b=tbmyJwvJQulExd7anS5EKng+ZOvEf6G0+Ruwy9ZyZl5P4tGgtsu2rZR84HMvDLIQ
	SfpL9eP+0ckBeRKKgwAPxu9875Re7jryA2LPEbHFYyQ8bz25BWU9acwBZYCYmQFQ
	3kYIeIrb4Y7ToyOZLHSZNcsauWmsHZj5n2ygqoFOybI=;
X-AuditID: ac14000a-03251700000021bc-3e-66b0d4b81012
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D2.1A.08636.8B4D0B66; Mon,  5 Aug 2024 15:33:44 +0200 (CEST)
Received: from llp-hahn.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 5 Aug 2024
 15:33:43 +0200
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Mon, 5 Aug 2024 15:33:27 +0200
Subject: [PATCH] arm64: dts: freescale: imx8mp-phyboard-pollux: Add and
 enable TPM
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240805-imx8mp-tpm-v1-1-1e89f0268999@phytec.de>
X-B4-Tracking: v=1; b=H4sIAKbUsGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNT3czcCovcAt2Sglxd45Q0MwPzJMM00zRDJaCGgqLUtMwKsGHRsbW
 1AA79p5ZcAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Teresa Remmet
	<t.remmet@phytec.de>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722864823; l=1714;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=ubu0CotWYKRX8DT3AZEDNKu6rkYv7NNafpkf0mpAy/E=;
 b=/+OhWp+qpzilt03iSsVgktAI/pCzxvAIrC2wrZ0MDAcaLZsMwDj9w05ydEhzVCyddyS0VdGyb
 V64DxnZisjhDVh4fiuy9FiKP0eLDaChrrgcg6jLX00DZAspjECRTQ7N
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42JZI8nAo7vjyoY0g51LuS3W7D3HZDH/yDlW
	i4dX/S1m3mtls1g1dSeLxctZ99gsNj2+xmpxedccNov/e3awW/zdvonF4sUWcQduj52z7rJ7
	bFrVyeaxeUm9x4vNMxk9+v8aeHzeJBfAFsVlk5Kak1mWWqRvl8CVsX7eR5aCLbwVl/7vYWpg
	bOHuYuTkkBAwkZi18AdbFyMXh5DAEiaJj0ueMEE4DxgllvZOZgapYhNQk9j15jUriM0ioCLR
	v7MZLC4sECKxtuspG4jNKyAocXLmE5YuRg4OZgFNifW79EHCzALyEtvfzmGGKLGV+PxoNTPI
	fAmBFYwSL28uBkuICOxgknjcbwiSYBZYyihxZ/o3VojzhCU+717DBtGxm0mitb+ZDWSDhECi
	xM7XciA1QgKyEjfPb2GDqJeXmHbuNTOEHSqx9ct2pgmMwrOQ3DcL4b5ZSO5bwMi8ilEoNzM5
	O7UoM1uvIKOyJDVZLyV1EyMopkQYuHYw9s3xOMTIxMF4iFGCg1lJhLerdEOaEG9KYmVValF+
	fFFpTmrxIUZpDhYlcd7VHcGpQgLpiSWp2ampBalFMFkmDk6pBsYZOoKqO2f72D1T0c+5cDMi
	dbqp+/oCT9eetW8+22/vrYl95HHTaVrLogqFF/sdKubrH0gu7drS0pe8uMnq7bTdYWE+T6wM
	mytede3cJp3bJyL+JDXimOuRtUt5NT31re+l7+dW7b9/X8qZo/vk9eq5wtzBG6wmumpsZY3s
	9Xj/dX7R515+PiWW4oxEQy3mouJEAMSAtheXAgAA

Add support for TPM for phyBOARD Pollux.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 00a240484c25..b5ee4e265d90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -103,6 +103,24 @@ reg_vcc_3v3_sw: regulator-vcc-3v3-sw {
 	};
 };
 
+/* TPM */
+&ecspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
+	status = "okay";
+
+	tpm: tpm_tis@0 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <38000000>;
+		status = "okay";
+	};
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -300,6 +318,20 @@ &gpio4 {
 };
 
 &iomuxc {
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO   0x80
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI   0x80
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK   0x80
+		>;
+	};
+
+	pinctrl_ecspi1_cs: ecspi1csgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09     0x00
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC			0x2

---
base-commit: 17712b7ea0756799635ba159cc773082230ed028
change-id: 20240805-imx8mp-tpm-3df607b1f5f1

Best regards,
-- 
Benjamin Hahn <B.Hahn@phytec.de>

