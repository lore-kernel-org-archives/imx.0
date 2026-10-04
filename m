Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D235E1D9
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122509; cv=none; b=p7sEz4rnVu6vY5nZkSSiu9jeuINGxnAxa+Q/6Dt+XK8Xb/GezqkPl//tLIC+nKbQ31kiX3GwNEfAMcFpgeYGl2ioBM7Yb1iyJuGZSLtfxFLfcqioGDkJKKwh+bnGbTxxwXJNGmP2KmpTHYcu4ILY8I2Q03YGAwjy5acrJWqWEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122509; c=relaxed/simple;
	bh=fgDIAowiGVPHmpIQnHv28H9YCPmJ9xtuRXwqmc11gpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3Qmuhy7BfUMObs6LFrF2o7inf2roHEJo57kCA3O4rjtw5dC5IrFIFpoPbWdXbnVlPk3Py9DxSmGmTs43n2/fxMlJ6LOsZspznctPeO9UbgjgZr/zWN2ewAyzCllt6jGk3geAnEOIxgsXuP8zEiw3NKIkdl2BaflOYF5gzjnSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Ib3G8g8Q; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Ib3G8g8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791122505; x=1791727305; i=wahrenst@gmx.net;
	bh=n85cPgRcUMugkyTneQ6NPJYyfdPtF+eqAAlDgpKnEqU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ib3G8g8QIO9XATQO7N5mvN6OmXXvfAh1iFBNVmO/Jfe3jAOYpvdTDQwKJVj8RBsz
	 H3hJH6QDGJXRmBHKxJ6VMfJl+jcwg8FeUTC3S2vhWoJ7P8l2t9OayDe6rpQUuINXK
	 HRBwJp+QMSj+1qy8u2z6b5yFC1S7bmrGH8nq3ASJvZFAU16WNqarMw6FmlNJiPZ64
	 kXPAMTXZAPBi2H2z87c+GQIFgMgq29/dv5cUsmm5HFLF090PSGRI6v9q+KeXIyPwm
	 QXARnKKb+wH/PVKHqWpfqjYLwo0Tg/FUBJ28lm2IfT1/j+TgEadlnPuGULK2YSmal
	 rgrzRHlUEkPN3qRnWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sn1-1wcs2I10CV-00zgOE; Sun, 04
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
Subject: [PATCH 3/5] ARM: dts: imx6ull-tarragon-common: Disable unused LDOs
Date: Sun,  4 Oct 2026 16:01:21 +0200
Message-ID: <20261004140123.46461-4-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:bosZpySA7+akI+72MkR4K/z0kQWc2wkOGFGtgeCUVgS2VphxKOM
 HVE5b/H3c8gStFhf0ut/gR3Hdx9ZmeDc/6zCmARpQ51e2NwjWR84uMUuJymCAMZcaAQwFsD
 8PLeDGy3EJHzkdYAw4mHgmPDRZWZtopsG5mK2JOTsJPsYZ7zcb+LluZPO02m8pd3M4u6zZW
 HI7xkMlCWl0jd4b/ky2mQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h9Buo3RwJrA=;JDjYuKP9bvtlWTtaPPui12dTnRY
 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
 6hjRMAPl75js3gJMBVYTVi5OnQ==

According to the Tarragon schematics LDO2, LDO3 and LDO4 doesn't have any
consumers. So there is no point for regulator-always-on.

Fixes: 5e4f393ccbf0 ("ARM: dts: imx6ull: Add chargebyte Tarragon support")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
index d2aa5285cd18..81761a505d6f 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
@@ -321,7 +321,6 @@ vgen2_reg: vldo2 {
 				regulator-name =3D "VLDO2";
 				regulator-min-microvolt =3D <800000>;
 				regulator-max-microvolt =3D <1550000>;
-				regulator-always-on;
 			};
=20
 			vgen3_reg: vccsd {
@@ -342,14 +341,12 @@ vgen5_reg: vldo3 {
 				regulator-name =3D "VLDO3";
 				regulator-min-microvolt =3D <1800000>;
 				regulator-max-microvolt =3D <3300000>;
-				regulator-always-on;
 			};
=20
 			vgen6_reg: vldo4 {
 				regulator-name =3D "VLDO4";
 				regulator-min-microvolt =3D <1800000>;
 				regulator-max-microvolt =3D <3300000>;
-				regulator-always-on;
 			};
 		};
 	};
=2D-=20
2.43.0

