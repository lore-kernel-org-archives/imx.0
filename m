Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3798B1D1507
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700524; cv=none; b=XqtFr70NXB/haeGrS2PzSwJ1U8U3DIrKjvnmxvfCdmxoVfhyFOdcMt0evWZ8aINjE24CmVhqqt29aIUrNEKbCHMSdJETwGu8HNgnZR9tItkzId/qL+wCawRWKzkj4gOUqXoWhFc9YKeXgQvqKn5Ej/TdD6nfBGkyd8Ky4eDUq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700524; c=relaxed/simple;
	bh=CV+a1u31LibQxT1yOOnoJsym4J95d6k8E+g1fOvjKYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m0zc0iMnKSs/l/dETJQhHKQ169A3/7Gu7HMi0yfQW9t0gCppNhlGW5PMaELnUF+2U44dXMW5Nb0EmDq3ZDlbOyu1wXTsDSFSbN2vRauuiZVY6fGtSh+7pypWG2aOaT/LC/FODOoAYY/EmkfuaWorXaRk+HgKokqNgs71qJfveYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgDiqqY4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgDiqqY4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cb6b2b7127so3409259a12.1
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700520; x=1730305320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=;
        b=MgDiqqY4oHEhSis5Ni1lPTxssx4eY8EIFwsEUVv64XnoHYRIUbh1diOfNQQsHx30mh
         2qI/diBiW0yJiD6VLlJ5fSyysP5fb2WtNstkc8aEL6OOz2+sqm0t3PD57aQu8eAeUyoT
         /8x+cmJNTgufP8HSAp7irpN3Y1j7pu3xs7K08OARjAYhgUqiWOzimeXcljB9ehlS3FOp
         VHNdyf0vyuy7v/NG7L554fPAIhF7yuvN0RU7/lK4yNwOx7bnhwuM06fYghXE3dUhvlSd
         nLc/G46yu7Gu0+cQcOwIX2IKUqwQkk4SZQZpY4ghpmzrWHbe9aoJ18g6PBUkOflEOWg/
         U+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700520; x=1730305320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=;
        b=RJv0jxV+SepB3YQ4/iFmg/xv31Z3iNZoP07XJydVrhq0azveWhUPmXHSSNSJYtR/1n
         mADaFZAkQ3Jxb2eRCLrQZt5a9udMrazUjaGB9cEyutiuaPQ7Nd9m5s+9TNhP5fxDcRTO
         pD9sCY6uetwfOT2RpOTpsXwGMmUUuNylHyu3+amChWlOSCiKf+o8h3tlj2LBUZsNizXF
         zCxnbNfHPKYH7tXieTrm2en/x91qExdRBKCsWoJb5JPrSGFoaTiBtS5SdrRuXLeN5lKr
         sD1ASofko1AyUyOa/tqvkVQD8DdvVXwE6JZSGP8ylqb/OY6/VLRKqROJl96Ji9Ecz12t
         03SA==
X-Forwarded-Encrypted: i=1; AJvYcCVEEIuU2RICJCEuu3KxS9JrNddygDzL1AWWshvGjaEiyVTfdVNKArTbgMty5k2rIpTsVnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkeOoL0s9pR//1xOoBFpleJgvSqCgwAhjsT3/6TVnbJatt8xrL
	cx5UIJ+JEz/FE86moQIN90+infPk+xdz/2zvaDqP0cDB1vUWU6pa
X-Google-Smtp-Source: AGHT+IHyWANucfMDs/aKTkkC8XZgbLKNuPqA5aMjbx82Ju9yhv6/bGm9rJGwx/eAlr5ksCAKO44IYQ==
X-Received: by 2002:a05:6402:2344:b0:5c9:59e6:e908 with SMTP id 4fb4d7f45d1cf-5cb8ac5e8ebmr3350503a12.6.1729700520186;
        Wed, 23 Oct 2024 09:22:00 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx: add imx95 dts for sof
Date: Wed, 23 Oct 2024 12:21:14 -0400
Message-Id: <20241023162114.3354-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add imx95 DTS for SOF usage.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2a69b7ec6d6d..94660e3e8b2b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -267,6 +267,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..b10dc1af5ce2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95-19x19-evk.dts"
+
+/ {
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+	sof-sound-wm8962 {
+		compatible = "audio-graph-card2";
+
+		links = <&cpu>;
+		label = "wm8962-audio";
+
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Headset Mic";
+		routing =
+			"Headphones", "HPOUTL",
+			"Headphones", "HPOUTR",
+			"Headset Mic", "MICBIAS",
+			"IN3R", "Headset Mic",
+			"IN1R", "Headset Mic";
+	};
+
+	sof_cpu: cm7-cpu@80000000 {
+		compatible = "fsl,imx95-cm7-sof";
+
+		reg = <0x0 0x80000000 0x0 0x400000>,
+		      <0x0 0x86000000 0x0 0x3000>;
+		reg-names = "dram", "mailbox";
+
+		memory-region = <&adma_res>;
+
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+
+		cpu: port {
+			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
+		};
+	};
+};
+
+&wm8962 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>;
+	status = "okay";
+
+	port {
+		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
+	};
+};
+
+&edma2 {
+	dma-channel-mask = <0x3fffffff>, <0xffffffff>;
+};
+
+&sai3 {
+	status = "disabled";
+};
-- 
2.34.1

