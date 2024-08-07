Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0F20012A
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038888; cv=none; b=Kcr5vAIzophAS4jYSjXcrpA3eAeauwcNVSp7VyaHU/SLOpI8x5xfgvb93OWBYeDl5GalUzZIwKcEsPXknAkkgYqy/PYEA7ihiCDGg1zeoCTCmrxbSf2EYIW8mafCi4i8PxPNCAauMLZ76ulUgVsljiLZUS+yz1qS6/yF7om32C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038888; c=relaxed/simple;
	bh=CGQ7vncQJWkiGyiABlgtGn2V24lwV03xREUk34vTOv4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Lrus/x1r7oY6Y2fZwItl5AFRXCAZMRx1nhNL0l3XiLDhBa3ABG57PRvxQNAXILERDiVxxH0+S/lXHM8Kow7QXX+AtI/oHl/WqRR3pp+eVr3oVgJ1y3nDQxWnINGA+4jLMEPw5zkdLUQqsRkJhgYEQAY5Mlp685cN4MgUgq6I6nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcT56da3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcT56da3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso1583272b3a.0
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723038885; x=1723643685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+7ZjMlY8No3qSDfq4wKYHrpdYKh1AhNqpfBDU3gqWg=;
        b=hcT56da3P54B0kP9jkXhrr/kkarSzN1ajzP9jyAvof7BCZXrO6Jrts2omTcmjSFohW
         13LH9P14S95MJVQf61Y1U3EB6K+Jxd2qv9E2RezaCXcTXNv+hLlC7A4tmujSOOlIowEu
         eVcXLIqAPONHk4AW5kKFF4BgH/FcwBkFgNrmEVvO9iFcrOBV152VVLZiVz3sJ3rhHwzn
         y6bLAUJwyPGG5/wmTVVfDCA8B3Ib45og/ZD+wZ1bP9c82We0y4LBcZSAOLozaloEm3kO
         3R3KcxPdyuqVKFAd2gTtgfuBjSZSE/TtuZXoiua4/SirhOAkS/CsoBAsZgYimMwaHSTp
         a1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038885; x=1723643685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+7ZjMlY8No3qSDfq4wKYHrpdYKh1AhNqpfBDU3gqWg=;
        b=Xpn9dhXeUolZI0k0f+D5alq9HLIfpOcglG/s9te4Xo+ZLJZaY4GSejYUpzX/x8crkb
         q0SmtmK2qtqHi8/64nmZ3oqDKRB5pVfoV5QGll9+ltiQkehSwqY1YbCUuMG/ViEmdjXS
         6qqKPN192ZpcFY5z4FH7+eEAId0aygwVRxE3JHp2FOJNkMu6OMc35HPVs+2uBIKF2F6r
         S9sZ5Dx73dOixuarWmCYRYEj7/mGlldI/tcTSrv7iGj94xSaNUWfcpo/77VkSY8BjIUi
         I607kefKCQCWVFWXqyf7YUrHn3u9ZXV7/ohThP0yvA7jf9XdKG+dw8BicafI+YfCbONA
         dsmw==
X-Forwarded-Encrypted: i=1; AJvYcCWbYSGX+y5L9cGzCTHDZeEHs2d0bR9nMejsALbOQqc7F+fxD4mftbPUTkGVKNgaZcZHQqJ5VQt0PeHuIQYP1vfsUkW1
X-Gm-Message-State: AOJu0YxFSGm8I7RnmC/OsabaWv40Cl//LUpzmIxIWvGwG/CNy0rXEcQE
	8tWbL7zo45sGvVF6DHEehnV3c+NncPmwKaGsj0UI4g4xMgNqt/Uw
X-Google-Smtp-Source: AGHT+IEQC3SA5Rtjou8jJDGYcDGSdERECkY0cz/9nJegnkoYsE/gA/jz3C8dGg6iDpJ2Kx2OjiiguA==
X-Received: by 2002:a05:6a21:2785:b0:1c6:a561:d387 with SMTP id adf61e73a8af0-1c6a561d6d5mr16712995637.53.1723038884835;
        Wed, 07 Aug 2024 06:54:44 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec410d1sm8451996b3a.66.2024.08.07.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:54:44 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?utf-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: imx8mp-verdin: add HDMI audio support
Date: Wed,  7 Aug 2024 10:54:20 -0300
Message-Id: <20240807135419.248219-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add native HDMI audio to Verdin iMX8MP and all its carriers boards.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v1:
- Fixed wrong "From:" for the patch

.../arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi   | 10 ++++++++++
 .../arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi       |  8 ++++++++
 5 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index fbcd93e33aea..da8902c5f7e5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -65,6 +65,11 @@ reg_pcie: regulator-pcie {
 	};
 };
 
+/* Verdin HDMI_1 Audio */
+&aud2htx {
+	status = "okay";
+};
+
 &backlight {
 	power-supply = <&reg_3p3v>;
 };
@@ -219,6 +224,11 @@ &sai1 {
 	status = "okay";
 };
 
+/* Verdin HDMI_1 Audio */
+&sound_hdmi {
+	status = "okay";
+};
+
 /* Verdin UART_1 */
 &uart1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 09733fea036d..a38e7c947a42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -64,6 +64,11 @@ simple-audio-card,cpu {
 	};
 };
 
+/* Verdin HDMI_1 Audio */
+&aud2htx {
+	status = "okay";
+};
+
 &backlight {
 	power-supply = <&reg_3p3v>;
 };
@@ -215,6 +220,11 @@ &sai1 {
 	status = "okay";
 };
 
+/* Verdin HDMI_1 Audio */
+&sound_hdmi {
+	status = "okay";
+};
+
 /* Verdin UART_1, connector X50 through RS485 transceiver */
 &uart1 {
 	linux,rs485-enabled-at-boot-time;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 3a40338cf2d8..11cf3bdc95c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -62,6 +62,11 @@ led-3 {
 	};
 };
 
+/* Verdin HDMI_1 Audio */
+&aud2htx {
+	status = "okay";
+};
+
 &backlight {
 	power-supply = <&reg_3p3v>;
 };
@@ -182,6 +187,11 @@ &reg_usdhc2_vmmc {
 	vin-supply = <&reg_3p3v>;
 };
 
+/* Verdin HDMI_1 Audio */
+&sound_hdmi {
+	status = "okay";
+};
+
 /* Verdin UART_1 */
 &uart1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
index 533b7fe218ce..cc389cda2af2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
@@ -85,6 +85,11 @@ led-5 {
 	};
 };
 
+/* Verdin HDMI_1 Audio */
+&aud2htx {
+	status = "okay";
+};
+
 &backlight {
 	power-supply = <&reg_3p3v>;
 };
@@ -192,6 +197,11 @@ &reg_usdhc2_vmmc {
 	vin-supply = <&reg_3p3v>;
 };
 
+/* Verdin HDMI_1 Audio */
+&sound_hdmi {
+	status = "okay";
+};
+
 /* Verdin UART_1 */
 &uart1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d23a3942174d..a19ad5ee7f79 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,14 @@ key-wakeup {
 		};
 	};
 
+	sound_hdmi: sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		status = "disabled";
+	};
+
 	/* Carrier Board Supplies */
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
-- 
2.34.1

