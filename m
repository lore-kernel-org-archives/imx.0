Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B61A42AF
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306472; cv=none; b=IB+70I9zBnyA+ee17AcHkSk6rfVFELBLSi1teF9uGm6LKIxcQVlYExl6c5lL/UNhYbHZwH6ydjTcr+EnzpnZ5QYByhXN0e3YgiFdt6TsAuAlQGz/sMglPegSHEJY34KnErI/o0cQEG428eUDgpX/EJyfkkLF+mF1LvFyA8WRLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306472; c=relaxed/simple;
	bh=+XN7JVyQjwitoz17emtEGN97FIhTSCOO/FA3S/viHjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WR2sdA14N9oImNcfiIKx9G0pF60iv/aNUeZiUQ+DPDAkeKywRSJrmI8TBDPE5uhdOCZH4OkkejJTTvv80AFVs2gBiP3n0cY8KDgegegZg4T26u68QwhLA4mr13M/Z9TwBIfawvz2w+QyOU19OBpXIPxuAPAKZTt33SME7R1xlhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS4CWwDq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SS4CWwDq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso350801a12.0
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306468; x=1727911268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVFuXuwQq4F0ZLDIr2tAnGQIQ63Zn3MBCQOz7VF/F8g=;
        b=SS4CWwDqiGt9qzjhatLyAIVIKX3LCjtVy2vT/01qflO2PCm08uey88NK0vf/SKMO/j
         uoJdr69akOCUZB+di6q5fI9DrEDsu4JrJbhfTh289LEKC58HtKcrs6e6FBW+5RjCNfGj
         r+fNm0iJfGS1WkzpQYmNtlPZeowXOfsehSCeKQCFnnXE2w83t9wBYaQCKX7ORM0rtTn/
         XE1C7xtJTYofy2hNad1TcBtgK0YWmHfDBMyRIwdLE/Y0fkIf2UFhMuUTTQhar7m0IYYn
         PZsmmTGGAkHURCFLVNrYDAPS2Pe+QV7blgUn9frz0SUpfLtl0cadmw7KCAcUQp9bCxiy
         Xm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306468; x=1727911268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVFuXuwQq4F0ZLDIr2tAnGQIQ63Zn3MBCQOz7VF/F8g=;
        b=V0iPvkM3wkkqE3L6KQYuVHCUUttQyfj0N/3Ja2lxpg4KR5+93gKeu1dwVAedyz1/2Z
         ldvKM2KD6LH/Vwkl6ljl6b+wulZ+o1wKbG5mnf09UU19NAdMyFONz7wGxlmm6+7ABx0j
         8irdcrdcbrqDUo4SnUCoYVtoLzgMdhwpVjO2phrT8m3RDr7Fm86b4HLzLuXDsUCdQ1T/
         wNj7Mknk9J3l4ApTapNn3GY0FywpZr1z+zWASGULwNXg2dkbfMYdrrdFAKnQMgcTTWeQ
         8EHyyhHXYz2Z2Hlav1sFAvwbcEu8rwSF79hrDrRgBx86FN7flj71LLC4UFgW6cT+5B5p
         rHnA==
X-Forwarded-Encrypted: i=1; AJvYcCUQQ8KFJZSabmaj50cio4RZTwlolaW8acqUMxim6XibhKWg1WcEpeuc9cgQOW+rqz9WjuY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJuig9afyr58rEBxd5q4JYZJaJ+iv+IX7yW9JYyxs73CIcy/Ez
	d5GWxCK9Du00u5X2P93iWLlCJZZYMACuCWrHxc43wjAg4Sr8uUwi
X-Google-Smtp-Source: AGHT+IELRInJpxqZYi8CTCZwkwth1Bg0Cn73M4nS4KTBgLzsol54vPnsO/e6qWGAoQS7rVrkDGEtfw==
X-Received: by 2002:a05:6402:40c5:b0:5c0:ad76:f703 with SMTP id 4fb4d7f45d1cf-5c72063feecmr3058720a12.24.1727306467778;
        Wed, 25 Sep 2024 16:21:07 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:21:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/6] arm64: dts: imx8qxp: configure dsp node for rproc usage
Date: Wed, 25 Sep 2024 19:20:05 -0400
Message-Id: <20240925232008.205802-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
References: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Currently, the dsp node is configured for SOF usage, which is not the
"default" case and should be done in a separate SOF DTS. As such,
configure the dsp node for rproc usage, which is the "default" case.

This also includes the addition of the 2 optional power domains which
may be required by some applications.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx8-ss-audio.dtsi     | 20 +++++++++----------
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 15 +++++++++++++-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 19 ++++++++++++++++++
 3 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
index ff5df0fed9e9..28970211dd67 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
@@ -431,22 +431,20 @@ dsp_ram_lpcg: clock-controller@59590000 {
 	};
 
 	dsp: dsp@596e8000 {
-		compatible = "fsl,imx8qxp-dsp";
+		compatible = "fsl,imx8qxp-hifi4";
 		reg = <0x596e8000 0x88000>;
 		clocks = <&dsp_lpcg IMX_LPCG_CLK_5>,
 			 <&dsp_ram_lpcg IMX_LPCG_CLK_4>,
 			 <&dsp_lpcg IMX_LPCG_CLK_7>;
 		clock-names = "ipg", "ocram", "core";
-		power-domains = <&pd IMX_SC_R_MU_13A>,
-			<&pd IMX_SC_R_MU_13B>,
-			<&pd IMX_SC_R_DSP>,
-			<&pd IMX_SC_R_DSP_RAM>;
-		mbox-names = "txdb0", "txdb1",
-			"rxdb0", "rxdb1";
-		mboxes = <&lsio_mu13 2 0>,
-			<&lsio_mu13 2 1>,
-			<&lsio_mu13 3 0>,
-			<&lsio_mu13 3 1>;
+		power-domains = <&pd IMX_SC_R_MU_13B>,
+				<&pd IMX_SC_R_IRQSTR_DSP>,
+				<&pd IMX_SC_R_MU_2A>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&lsio_mu13 0 0>,
+			 <&lsio_mu13 1 0>,
+			 <&lsio_mu13 3 0>;
+		firmware-name = "imx/dsp/hifi4.bin";
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 936ba5ecdcac..527933a3eb5c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -63,7 +63,8 @@ sound-wm8960 {
 };
 
 &dsp {
-	memory-region = <&dsp_reserved>;
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
 	status = "okay";
 };
 
@@ -71,6 +72,18 @@ &dsp_reserved {
 	status = "okay";
 };
 
+&dsp_vdev0buffer {
+	status = "okay";
+};
+
+&dsp_vdev0vring0 {
+	status = "okay";
+};
+
+&dsp_vdev0vring1 {
+	status = "okay";
+};
+
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 0313f295de2e..9522a65b3e22 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -186,6 +186,25 @@ dsp_reserved: dsp@92400000 {
 			status = "disabled";
 		};
 
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+			status = "disabled";
+		};
+
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+			status = "disabled";
+		};
+
+		dsp_vdev0buffer: vdev0buffer@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+			status = "disabled";
+		};
+
 		encoder_rpc: encoder-rpc@94400000 {
 			reg = <0 0x94400000 0 0x700000>;
 			no-map;
-- 
2.34.1

