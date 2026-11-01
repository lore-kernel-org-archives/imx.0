Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563347;
	b=Yht07+Ge984aGJogdxQfhS4DiRfytcZ6puiesy3Ulh71lLfi5v46Bl+ZqugV/VHVaWSj
	 A6GGoO0jBj4xKwctb6uY8wUKwoS0Dtgehz9viQTNIp1LnzI/soYHZpMTpsdI3NOXWM07Z
	 nocGOYSUMvc2QibL6/m216SU2W0gXfPuJPh+XKfw1KFKaKys+RTNmLXXEModdhTh+oEUj
	 hIbmlX43uIZm4loU5KH/gKaCoW5qYS8/xZCwYmT/RduKvl64kaKJYFGBsNW69OARM1PG7
	 RbLfgdTiAS8AIxk+MMIc5vJkZwOyAkhpsMplW84sTsw414iP/l2sl60vb1D+tKwo5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563347;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=alXhXFOKUYaYKz0GwHq1XQg64lYoFkFRo/nD4AjehTA=;
	b=ibjysi1a4S7QJAiU8lcVLiwUAPWUN0MioUQWhXsas8fN0RLMcB3ZvXR43ysOpdi2lATW
	 fBulVtOk4L4npddKlcA+goB2DeLsxRG73jRt8uVZ53QFY9rbThnL+UFtSrlQyyW1tuLmm
	 ruf1IIrKDG0/XlWz4KdZbMHSt6zjXUAuZkZYw8emEZVKDbx5E92n9+ebeO6v/hjL6HQeY
	 TaCrumqvKrnyOr3pWPZWEKQtss8zwjRPGgZH4cPcnckoRkv6VdiBxlvEbOWhCtEWTvZ2i
	 qNUC7HvnpQx0GbGHJCeWb71lD/f2YmjpDjUyv8ls3Cb6EyJyKvzPh7L2M3iaLYQ+9Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZwRQpkKz;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE0606A324;
	Sun,  1 Nov 2026 20:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BE0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZwRQpkKz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793563329; x=1794168129; i=wahrenst@gmx.net;
	bh=alXhXFOKUYaYKz0GwHq1XQg64lYoFkFRo/nD4AjehTA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZwRQpkKzkF6o85M2Glyuc34l5sk+sJa/8wU9Ayu8FK1otQJnHcmlra5R5XZRU3lG
	 iW2KvWWjHloWhdefoJUI+rqaY96XNaVNlGmArmPcaHQ2Uj5Kn6yZw5EkrA5wDTdi+
	 sYmS02zsps37pke3ejQwTbBNXw8lxSKH8naIPg0t7KK9LCWm7PntO5j32S27GMNhN
	 GPxIEQsWLnLWZnM8QFkq01gcpQLw6maPX12Uh55ssaWqjyTozJcQvuWGGOhEDeTB2
	 4hLHY5qyWKZonV5xU6GguN414+qbx9fbjbQLxI+/D2WiIwKKAzyULq8MmjZpJ5Hje
	 xaoRi0IUgap2NuTOoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1x0bEj1YCC-00KXJK; Sun, 01
 Nov 2026 21:02:09 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/3] arm64: dts: imx91_93_common: Enable BBNSM NVMEM
Date: Sun,  1 Nov 2026 21:01:40 +0100
Message-ID: <20261101200140.141642-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101200140.141642-1-wahrenst@gmx.net>
References: <20261101200140.141642-1-wahrenst@gmx.net>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vjTPsHBuJGyv9SVZ28cQCRnDoP74cQ1fEs2kRp0HaQ3TYSOfW3D
 Ojo6EctTG6ujdACoHR+MMME/j32VESsENcPpGfINWyjNkt/IrpN1S9QIwFTZodOEqFA2gbd
 rNZsgL1gBrojDJEk6dPlJlxzKkWpYOrzey8wa7eJgC+793d1N2czNTlbp9mGhmadK/lTn2Y
 ngZf/u43PeO5hpsz5d5fg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v4quj7lliVc=;v2ufxIvXtZNNxyM31ZjHmYRWixR
 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

Enable the BBNSM NVMEM for all i.MX91/93 boards.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm=
64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee08..c8bbf6f1bcf9 100644
=2D-- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -363,6 +363,12 @@ bbnsm: bbnsm@44440000 {
 				compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
 				reg =3D <0x44440000 0x10000>;
=20
+				bbnsm_nvmem: nvmem {
+					compatible =3D "nxp,imx93-bbnsm-nvmem";
+					#address-cells =3D <1>;
+					#size-cells =3D <1>;
+				};
+
 				bbnsm_rtc: rtc {
 					compatible =3D "nxp,imx93-bbnsm-rtc";
 					interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
=2D-=20
2.53.0

