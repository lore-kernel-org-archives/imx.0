Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32E3ACA7C
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122520; cv=none; b=texsYj/GYmAHgkbxSHWVpIa9wFds7WQPKQc2UNWCaBtl2jYJA8OJGJ6Z2rSr23hHVFQQuE2lhYcK8qn5N3tMLArSbSGdCRie2WNr6IkIU82NQ68PcqvS+T8yJswXFeoTySmODig/mwWtHxz7qPiACbZVF5937/aeruW10jvFVbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122520; c=relaxed/simple;
	bh=+bEkFYtT8n/8Unz0pPqFS5RnpzgVYk8xdmuo/kDO5zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QV1WNyt7/VpGwylmC+sVTbakFJUsptmYcXINZq80WmR27+gHcmQOSt3r/nRUDavPWkAzksQPHwFhwokA7sC0aQgVUhIFFnjxRSq+stq39AZpacLvD0eyB3/iBBX37cxpLQWnqs2l+UebOwRkSgjdwr3eof0llPV0oDsnaggB8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=I2wfmDzx; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="I2wfmDzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791122506; x=1791727306; i=wahrenst@gmx.net;
	bh=bq1SfSnMsIsUp97gJrjeAci+uZsDQ2hbSiQs2F4E64c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I2wfmDzx4NUNCR8jBTM0ui8vG1sS+bPxIol74coS3r6JuhJ3jtOS+E/qYbsyJlU7
	 hVA/dR8uOEqo1PLYES10j+qFeBMaQI/LQyYswqefwcDxMG0NusFeWWbSFdYP9cBXr
	 7atXar6rRzLS46AVQ8S5q81gesI+3UYFIWdo1Q8UFTMMrfhPpzkDKqYXRNo87mq/V
	 jk89jgXgDHNaxIoQGGlnXoSF0A7P4nCEJPxBX15djMOkABXEwrGonPVNBkhfj7Ljx
	 +YBvmt61c9Ps+q7v8aWjl++A3x4hs+iJg/nkjiLPsEOHVJBG/Q3+oZCoUYYZuU3th
	 ckWcuY2IF210Kl6g/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McYCb-1whrz51wyb-00eBX2; Sun, 04
 Oct 2026 16:01:46 +0200
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
Subject: [PATCH 5/5] ARM: dts: imx6ull-tarragon-common: Fix vmmc supply
Date: Sun,  4 Oct 2026 16:01:23 +0200
Message-ID: <20261004140123.46461-6-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:Pkrv/76vpBKGALxMLfGTJSlH5g4b5mpqxftyRWzRE4NZyAb9bij
 EfLtk8thbSog8EXPmXPS9/UcD/cimO3xE+I6Ilh2r9e9T4rhS8XV0B7lU+a4DehnS/2cuG1
 FJMZkvB6ElGw+5LdFh7DYCTUIBTxq46Gz/kQUQgWx57qWF3LlmUt34yzzp1TBDkHWqx/AO9
 LbzQDmpk0+rjST1ZlrF0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JA41r0ZPaWo=;3U4prm2VX1gm3w8uUrLK5oMA6SA
 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
 dCBDQiOfpEvshLqGg==

reg_dcdc_3v3 and sw2_reg actually represent the same physical regulator,
while the former one is used as vmmc supply for the eMMC. So use the prope=
r
regulator of the PMIC instead, drop the bogus fixed regulator and keep
the better node reference.

Fixes: 5e4f393ccbf0 ("ARM: dts: imx6ull: Add chargebyte Tarragon support")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi   | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
index afbb3be48d71..4d1dab19f593 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
@@ -30,15 +30,6 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios =3D <&gpio4 10 GPIO_ACTIVE_LOW>;
 	};
=20
-	reg_dcdc_3v3: regulator-dcdc-3v3 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "dcdc-3v3";
-		regulator-min-microvolt =3D <3300000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
 	reg_1v8: regulator-1v8 {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "ldo-1v8";
@@ -286,7 +277,7 @@ vdd_arm_soc_in: sw1 {
 				regulator-always-on;
 			};
=20
-			sw2_reg: sw2 {
+			reg_dcdc_3v3: sw2 {
 				regulator-name =3D "SW2";
 				regulator-min-microvolt =3D <1500000>;
 				regulator-max-microvolt =3D <3300000>;
@@ -846,7 +837,7 @@ &usdhc2 {
 	pinctrl-0 =3D <&pinctrl_usdhc2>;
 	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>;
 	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>;
-	vmmc-supply =3D <&sw2_reg>;
+	vmmc-supply =3D <&reg_dcdc_3v3>;
 	vqmmc-supply =3D <&reg_1v8>;
 	mmc-pwrseq =3D <&emmc_pwrseq>;
 	bus-width =3D <8>;
=2D-=20
2.43.0

