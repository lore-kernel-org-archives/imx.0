Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685845;
	b=0gE2qAbIflc4CB0Gs3E3wqHX3r8BdQ5GnPbtdW+5Cloq6aHPgrCRUB/YD/GRX658W+hl
	 qRqQe4lYxJL4G/H2jGgvUnbKianxHFRghwIpTCyZaC/mz/CPC/lT9mZ1t+UXQUPLg6kru
	 53E5NJISWR83ofvpk20K0ybhjKh73YvNItKHLIyFzKq5DgDnhVQ6fjKf/gHJ3i5AxrdHf
	 HWsy0ELVAmwCDG2LEmwK0yiEvGdC/EfghzqI63pLJjaAtGqBoqsJ9VVaGta/GcpNXnxr9
	 uMIbIJDRoqE/YvYfztlbDR2EycCN+bM+A5WeDZZnLdfm8qtumE+I9QaRYXmXkslsZNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685845;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MN0UiazmxeHW7SqU7RVeg38ZMCu0rsCgqZRvdUxxdfo=;
	b=GTOd9+dMaykY1qNwtw42iH+77vsk+q4qsVZZk0ZbB3rdV425IaONBkkqGluAMx8f98LC
	 xYuLtbPJKNtUg1ctK9gR5geElJ9u+SYiBa/A8y5E1e89Ot4O4Db9DHQHLaXsc/lm06qij
	 mJ2GQ7emvd6EVof0n/14pZG4cJWVj6ifQAc6ubvWwjOG4s0EXsLgwFAxTgdAwHEk1m6C4
	 xjvpkOA9jBz2a+7QUKspznneKfteCN2Wg6ajGAqyArMK+7Z1GE2YblQqkS+afqQecbWfW
	 WLQqJJGGgGs2b1Wnil5ak/KokECoUHkBxNnYfqnO1dgzREALzM41dCXZE5t8hp+z9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=krTZQ7DU;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1880606A319
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 16:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1880606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=krTZQ7DU
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EFFF61FB4F;
	Thu, 22 Oct 2026 18:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792685839;
	bh=MN0UiazmxeHW7SqU7RVeg38ZMCu0rsCgqZRvdUxxdfo=; h=From:To:Subject;
	b=krTZQ7DUtT0stj2dVB8QD+m2a5CLYrzcVr3zk9IutgFqpT2z9HhO95gbkV5KbZj/D
	 kkdJ9I9S5VCm8+cU3n5VeJZ6x8Sjr1mrPh02zmpDAVMpKmgcy77wZe1sHXESQSIioW
	 fX8xRnTF6wzkUn3xAC+moTMEfTBJUm0NM+frmKHJBVoO+ZHHci2Q9/FqDgNB+7Rask
	 AGYsiCo5ZnDFMZb3MpMqialws5eykADppY4iC+ut/R+sfBl86YLgzqIfArTdgpvxsZ
	 ZxNexj5KK8OMYx+O+TjLabCCl4sfIexEFrdryMztsmQBM/nmT9uN2JrUVy1E4i7SFW
	 DiMYxNU+eUCPg==
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
Subject: [PATCH v1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
Date: Thu, 22 Oct 2026 18:17:06 +0200
Message-ID: <20261022161708.690702-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri standard I2C bus (SODIMM 194/196) is available on the Aster
carrier board on the 40-pin extension header X20, the Arduino UNO header
X18 and the capacitive touch connector X3, with pull-ups on the carrier.

Enable the bus to allow userspace access to I2C devices connected
through this interface.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
index f7bbb2153ae0..11b1d45e5dfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
@@ -26,6 +26,11 @@ &fec1 {
 	status = "okay";
 };
 
+/* Colibri I2C */
+&i2c1 {
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog0>;
-- 
2.47.3

