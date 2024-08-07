Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A61BD01D
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029647; cv=none; b=ZBvqAIgMZqzNBZaVHggk526fOB8LCc18ycuoVZXSr9o+i88jOgWvSHKabuydmSakQgaoPK31UClqpYY+7qJY5DATWzSOmcjkVX/OAEnE239/u0UlH6MlBLusO5R3U2Nieu2A2mtwDBbwq9pfHwz8cm/gr4z3PpH5uch34kVL+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029647; c=relaxed/simple;
	bh=4bk7F+gfUwAWtwwRGfVsxEwPVTiYc0lgnFSuLekIYJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e4Pn/l+C2Oq1XfscYXiz9uXot0JmDkhaHHHp1kM4glBSUgVUYIfLEn6RKmJILLN1U/uSZFFK8DO816+nx5WjyS0b6KZ1qbqHKizUsopMOR1pD/xP9DMSxbvsxqp5b6QD29IAxm34aDW75Zk2DoNZdVdyd73HP4bPw5QNOZgLhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+5HruML; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+5HruML"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc60c3ead4so13590575ad.0
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723029645; x=1723634445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwkYws5j52+z2kucEnWsDNWqsnwQjqdjpPPkg/VCoAk=;
        b=H+5HruMLFX061a3Kg0HJcn1nSojQuEGb2GjLcjDQLM+WJu5emXYGHcRsNX/KwKAdfS
         wSkBmqC0v8zA5LupVpSg2Kfg3Gktec4POYqgiL2ewuQknE6BuRvN3bzZrILAYy7dw3N3
         PozLtWKGeJtXFcA40GliWD2mIiOhcrKBt45TehPK1sa0YOchCjZe4BoGzTcXsPCFxiF/
         G4BWZNzuT1MToPglGcRDDzOvTKEfVLyW+Vtk1EItXF4BOvECo0BiY1SY96TGNGzCOm2V
         9YEP5AdLnj1q1L0PN5A6CamipsDnhI6gVU1SmTC1EJUA+tMPdlQzaB8ZIuo6juh/I8FK
         UIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029645; x=1723634445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwkYws5j52+z2kucEnWsDNWqsnwQjqdjpPPkg/VCoAk=;
        b=MZBOxTwfykPmYo95mhrmC23R/dlaPeFWBY5ufnESkb0gkTM8+bgiz87C+GFRq4NOdB
         86DfhJLsNVon2nWBVnMShBewn3unKSZtJdrzOt+qHxKCf305Js5vCpMOvaR4R5WrIrXS
         cdL0+vAjDy0HQfWzbHChYOvoMy7PQ7MzX4m5oKhogd97XQlWCgWj0B59GisdxBhNaflS
         J3crV9C9N7k3Thv4MhGA3iWKftAyT1O1NhmLwtDOo5d8HX9w5ZasHmpOaUgLNa3+pa3N
         PWuez9UmpMHCeBFCj3BiMTX9qtJwwRDkpF/7sRzqhCqQEAe46ynKHXrLEN7kn2f63tHe
         dgkg==
X-Forwarded-Encrypted: i=1; AJvYcCVOGEJGqf9cMO//ER4faDDAW/mdz1tlkkY30je0ES55A3SOnbKRkxak72F35BhKn6OefFJQw0SpMBTq0NwIyq554764
X-Gm-Message-State: AOJu0Yzpf4WfAOjUf+ulqtCGxR+ab0NhGWMiO5bV1Y30Ao9McZhwMkKJ
	coea/IogYhCthJ6rNfE1k/Bgn7L940mjc1km3oeS3UpE6GrascAeWGKALNfS
X-Google-Smtp-Source: AGHT+IE8CHVzTTxp5c9wiYsDiVNWs2j72yJwS534nv7Sv9pDvfeSi7eAyAQSHa8yF1GHShhjSLgjaQ==
X-Received: by 2002:a17:902:ecc3:b0:1fb:8a0e:76f9 with SMTP id d9443c01a7336-1ff573e7561mr222276485ad.39.1723029644640;
        Wed, 07 Aug 2024 04:20:44 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200860f857asm11561445ad.180.2024.08.07.04.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:20:44 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"linux-kernel @ vger . kernel . org" <joao.goncalves@toradex.com>
Subject: [PATCH v1] arm64: dts: imx8mp-verdin: add HDMI audio support
Date: Wed,  7 Aug 2024 08:20:35 -0300
Message-Id: <20240807112035.236036-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Add native HDMI audio to Verdin iMX8MP and all its carriers boards.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
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

