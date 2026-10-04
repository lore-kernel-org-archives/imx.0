Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8743AAF76
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122525; cv=none; b=qbemXpf4xPpALD0Lk00JZjvZCIdDJep16G7hNOmA4Joeh5neyCPM2A8PDWpvPBxO54jh7Ry0YiDPAvKdxs8N18E120jniXE2xEhvkXPbWgaNsD+DAMB4N13Zk8oCMskG1CrNfPZbFF9bw9tFz6xQRmsnQkwrVCmqpbWqe1pEq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122525; c=relaxed/simple;
	bh=6fcHEm8cbK6XI3ldpzBwPOYEXCcHME+mILg8i7xvT5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYwQL8HhweVMKLou2Ukjc5XempqpeClWHTpBttgKZQ5qb0WDNHpswAKe/OCVHzE/VmwaJwU1IREFxi7OK5d7yJqZJ8eYTDJn/dnKH5yL0axbSLRkGOlDUXXdICC1h8lw4kH+6S80hyn6HegE8+Oj6E7avv7UoXXfZjuYguP6Kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cWtN7KGF; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cWtN7KGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791122506; x=1791727306; i=wahrenst@gmx.net;
	bh=rhAUJiHEb1vOogwaXlW/g0PIpTEXxayoM6DHehZkp1A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cWtN7KGFeTsmhl28sIdKu3z5xEWV1wW0LNCBxwknQ0u6MXsBSZES05Q3ZvxEwoWX
	 g2SnimBTRZqnVtklCVCQCpfGgoRAHmqb/6pshbNdw6UerspnvdKMhozg4jWli5XLc
	 0LQp1P3yxd1jfpYllDIMN/HuQyueHegpHvIXwD2vIa+kQLVPG9UYn7dKPulVPpv+B
	 byHUHBOSixQ2J5aQyMCIbn8uFbfCOg/fj9fXmGwSZ5t6S98J2yy0Otz1SP8dYwyzs
	 M4rVgIVT4JyT+hJji0xUUpla6EM7/r6t4vDP5lUCInqvt/IWPqk9/tznSbK1+Zn+h
	 aznEtFBCCqb2s0/1MA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpex-1wq9iw3YgJ-00mOj8; Sun, 04
 Oct 2026 16:01:45 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 4/5] ARM: dts: imx6ull-tarragon-common: Fix i.MX6ULL DVFS
Date: Sun,  4 Oct 2026 16:01:22 +0200
Message-ID: <20261004140123.46461-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004140123.46461-1-wahrenst@gmx.net>
References: <20261004140123.46461-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iA6STqnYJDKc0Y7OOeTOqK06ttJjKgl1n7UGm3SkhImUaOzhtKC
 69z/x/ZPbnvOOBBAzdWKnVRfWsjQVwIEgxOKYio37J0ezV9BMvC18Svh3J3t62oMj1wVx/k
 hZt0G1yHGQBt4imixSt97ngECOt/8uzYN8ySN8rm/zOOyl61WQmn9Co2UThlf4OV5JcTY0W
 5I0K19HOZDHRQD3uVZXow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lMiu9OCIQzU=;9Uvt+qsSV3AMgitTMuZkoyFygn2
 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
 4wcMW0nhKJPo3C9PvGcjMAZnTg==

During mainlining of the Tarragon boards, we missed to wire up reg_arm
and reg_soc from PMIC to the i.MX6ULL, which result in a constant voltage
during DVFS. While fixing this, give the regulator a better node reference=
.

Fixes: 5e4f393ccbf0 ("ARM: dts: imx6ull: Add chargebyte Tarragon support")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
index 81761a505d6f..afbb3be48d71 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
@@ -278,7 +278,7 @@ pfuze3001: pmic@8 {
 		reg =3D <0x08>;
=20
 		regulators {
-			sw1_reg: sw1 {
+			vdd_arm_soc_in: sw1 {
 				regulator-name =3D "SW1";
 				regulator-min-microvolt =3D <700000>;
 				regulator-max-microvolt =3D <3300000>;
@@ -774,6 +774,16 @@ &pwm8 {
 	status =3D "okay";
 };
=20
+&reg_arm {
+	vin-supply =3D <&vdd_arm_soc_in>;
+	regulator-allow-bypass;
+};
+
+&reg_soc {
+	vin-supply =3D <&vdd_arm_soc_in>;
+	regulator-allow-bypass;
+};
+
 &uart1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_rs485_1>;
=2D-=20
2.43.0

