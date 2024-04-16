Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6221137769;
	Tue, 16 Apr 2024 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294494; cv=none; b=uHW+ZpgXE3WU401T4Xh9qf4FtvxGJ5ZAbOPPg02Pim50uPFv9pwZLMXKnqASbjoxdNDxWIb+UuEa1RNukzakICzW/FPFcxnaSE191w6+DNGzAcTAtURwvaizVrPtiVytTJGq382Iq2QKswlVMb/3x+3v93XbQ7BArU+gVO4dxJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294494; c=relaxed/simple;
	bh=PEe85yDrpJfP9064T54tsddkdL+XKVlLAq1PSTbFBu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jwo8bEJWK4GMscKXWS0HxRwmXNr/avff09gbZYcJ1pc4WDnL0nX6JmC/wvvmkRaBNYfYNZCZwPaIO4dbuJVYcp+79DPHFSo2R03ljQR11B0VTZRRUQ4P366ymyXfsFvuLpi9+fb7PILvKxYqlMqshfa27NY7Rf2a9aMPjE1nszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LSXatYpj; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LSXatYpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713294453; x=1713899253; i=wahrenst@gmx.net;
	bh=6eNTH1NR9UJkd8glrTCGvxeQETtqM7WHOX7C0LGv91Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LSXatYpj0X41WdiiI8nWaFNPmv8so47bbX07gS+1IKSLkpPkPSgUJE2nNLEwJ1z4
	 cGVwz4MN5NF01hBVx1DqwxhtiW4QmsiT3UD4L6T1xUNh45qmwlQPscfNiz8B9ie7h
	 5yx20dpjirNjObupSNo2t6ZAcOkpcbM4ufmDscKGZ+My7fiVvb+C6PDMTR2gNx0gS
	 IKubGTDRE14ROXxKmBXCTzm56OcCQT8SCIRUWYfVlkQG7DZllavJHsIBa4R/0yvBu
	 6YMWrvU8Yz9vsliNxynHIhnHUzmRfDc1BbLUAmNZZA2JxvYBuMJEt3Fiphu+Km8oM
	 7nKVRwfUxWri9F5dxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MY6Cl-1sFkhV3t77-00YR9V; Tue, 16
 Apr 2024 21:07:33 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/2] ARM: dts: imx6ull-tarragon: Reduce SPI clock for QCA7000
Date: Tue, 16 Apr 2024 21:06:59 +0200
Message-Id: <20240416190659.15430-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416190659.15430-1-wahrenst@gmx.net>
References: <20240416190659.15430-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:96kVfHWmqmisRl4AuStm+7j2jSg2AZu8uqGwvwbHNmC8+U0X6V4
 X4GGrPk1yOlmiFWM1YPkiUX7jizP5IX1BQC8Gd3bbPtcUZcJby0TinIUprr2rs7FjtoCpdR
 0sti3eHtIa84GwHI8sWBR4oj0MigZ6ZYcAWtLtgwZB7IbqQb/3Uk2CQRtLgSRYfVqxcjixA
 S5s7o2ITD5Ot51k6eOpIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5Iw0jdwG3GI=;7+ygiubD9LS+ohSgeMnPbuWM6g6
 VZzd2P9SjuPATGrLuHZ5Z7/NQ57YUgO5larn4JmbbgBbjcET0U+EiEYTZG8dwe1ZZa4/dd+D2
 YtJG7a9vDHNOSVbBIqCBFzzAfkYtnNkGsIbgLPX1v2dkkBczKneEA1VFPp1SSuzDGwn+RJCdI
 cLh0s2jzU+v1yuQ4gSNe0lml7XtUhghtuzGjhNcYLx9+R4b8u9S8FFoDvB/nt0ub6amgj7N5y
 n/3vt8i13HzVbse8PYvoAboPFIhTc+MtbbN4Roay41XMyUguEGeeUD/Rz7gv6qfP3rGXL2BCr
 4yCqtHcvEk4npIwNoB9QWluT0nCQmmJv1Xy1R59/X1xeUtYgnsS3latlfYvChkIwEeWz7sIor
 M7dEYf4FbH/M3uTKgFDsG4daXEMwbsZ4ODqHJRZTNbvef245TvJZCUdcWhToLg2slE/bCTRKE
 hOT9GBS2+0jxQgTWqkzV0ty2NJ+vfdyqx8JADm39AlQmz/PDY45oPX2ocIjAf4828vpg6YOgA
 Io6czD4H7Y0pdmY/FwJ7yMfK1299PeAPud/SuEZt3VGzSy7P5itbmW/LNLr8UOk157CJKImhv
 oqOeG0bCSjv3d67OZ/xzjXisQW+tIlwAW0iZKg0o+0/ZKOYTI/ei+eAsbuwfXD5MHqIaZTbhi
 XM7Eiv8QX88eo7AC6WcmkSsGTIx2MQkTZ33mVrUpe7WH66bB1ZQijJFa0+38fivjscWOSDZzJ
 fSjqgWAWAgQtm7DXkxBiGWv593p9deCnt2HIpY9rIyxACb0rENPHOXXBDLiev0BLppNfHwgNh
 xEbMCXtIXf39UkFBMMNQtUnpqjnoLE6gyR8b0zw/QlkSc=

Our hardware department recently informed us that, according to
the specification, the QCA7000 should be operated with a
maximum SPI clock frequency of 12 MHz. Even if it appears to work
at a higher frequency, we should not take any risks here. A short
performance test showed no measurable loss of speed.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts  | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slave.dts   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts b/arch/=
arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts
index 67007ce383e3..f9bbd589b66d 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts
@@ -45,7 +45,7 @@ &pinctrl_qca700x_cp_rst
 		interrupts =3D <19 IRQ_TYPE_EDGE_RISING>;
 		spi-cpha;
 		spi-cpol;
-		spi-max-frequency =3D <16000000>;
+		spi-max-frequency =3D <12000000>;
 	};
 };

@@ -63,7 +63,7 @@ &pinctrl_qca700x_mains_rst
 		interrupts =3D <9 IRQ_TYPE_EDGE_RISING>;
 		spi-cpha;
 		spi-cpol;
-		spi-max-frequency =3D <16000000>;
+		spi-max-frequency =3D <12000000>;
 	};
 };

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slave.dts b/arch/a=
rm/boot/dts/nxp/imx/imx6ull-tarragon-slave.dts
index cee223b5f8e1..ef06619d7c86 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slave.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slave.dts
@@ -23,7 +23,7 @@ &pinctrl_qca700x_cp_rst
 		interrupts =3D <19 IRQ_TYPE_EDGE_RISING>;
 		spi-cpha;
 		spi-cpol;
-		spi-max-frequency =3D <16000000>;
+		spi-max-frequency =3D <12000000>;
 	};
 };

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts
index 7fd53b7a4372..83db65bf630f 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts
@@ -45,7 +45,7 @@ &pinctrl_qca700x_cp_rst
 		interrupts =3D <19 IRQ_TYPE_EDGE_RISING>;
 		spi-cpha;
 		spi-cpol;
-		spi-max-frequency =3D <16000000>;
+		spi-max-frequency =3D <12000000>;
 	};
 };

=2D-
2.34.1

