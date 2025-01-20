Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED9188938
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366403; cv=none; b=t8WOkXL2/t4fsPyrRLL3fePX4N2tNZkJlFPifM6+Zg+YtXqFVo0kzrsDM48xCR8TuKWGPObWYlCG0TH9wQi6hvHY1wNkkfWCYoArPrNmhUvmO4BTs87U10Il1cpR+efhbUItEEI0O/8531+rBNs7RqoRhZmuXy2iEv59VwIDgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366403; c=relaxed/simple;
	bh=RpSR9aKkbWRgfacKOSdvE1hTVEa5uy8lYd+oEjn5u0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEbeJFjfyjXRlciV3fdOq2lKnZR3n0cM5wbmpkujXAa1tFNT87X6jCv3v2UiJ3ry9ERak7c8HfxyoTQieNlZEe3Nm2tWEbjyvrkNXFoKANJZUPGuPU15U1VeHE39ljLovK25IUsQQ7zPlZIbsgJEOIFXJFRz3CGr181ej9SiMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3LTxuQB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3LTxuQB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361815b96cso28686665e9.1
        for <imx@lists.linux.dev>; Mon, 20 Jan 2025 01:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737366400; x=1737971200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KS/16UvSfEHeMPEs5zPlC9256JErSLdmqszpJR3Jvck=;
        b=D3LTxuQBr6St14oQNclzVfiYiphJ+ZX7a2ApplCtLgUISZnuGZQUnMHN71uoPQvQKM
         hi3+uZW1lEZU/0ErXU7E0C7b2uHqXxCYtKeK2M4pDT/Al/HqdEhH1tTDGs/acpnFq00e
         SMkrfcEhqtFZwJD9HymTFN97kiWYPgQjWOXAh+9ZwTQ3f+jWFGvy9TG52oiX8cAKg4s4
         e2HGgRQAL0PXcxCZXuLLm437Kgx+IQeR+YyXjhB/Vl7T3Re+gySot4A9vzOHQHvOf+/E
         pgRcIZWXBmEC+gbQMoz1qd4WbQOboxGOM93t1ggrUKtxg6MZEYQgNWuu566f9Nz5Lxni
         1m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737366400; x=1737971200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KS/16UvSfEHeMPEs5zPlC9256JErSLdmqszpJR3Jvck=;
        b=ulp5tHQhnRoY47M5dR+x3fPCaua7jU99kT5poCLoTqvSvjr9Ce+hkT02+ClwYZT3uA
         uKVa2iaSfa2rro9RdKNPQPUR2/KBD1CIRHtzJem4P/2VzXVHRo3+uyYsSpW6t7OjSSr/
         hUqdfcsitUGb4p5+SoRkDzBtHUiQE11HbammWDzfk7AI5DT+xHOWf6NnQtddMHInb1P+
         EBZzPsNe0H01tEUq/Ery6o1hqM79j6D07zzLSURYthOenGrn998dUX+EpQskt2kkry3h
         K/EUSO09k5C0rmyG6+VCUe7ke8Id7+b9qmcpWmLXlpSP8uDH8lia1MiBAcMlhyCpwBHW
         HGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfvlebrbzZyawFM6nIKKGTvHXYSn5WmfulbqSjbKj9LhG4uHaUZ64NzaJcqeS+Cp1WNTA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMYN5vd8DYnZP+ELVl1JGUHxUUZBKlD/RwxUfbbuoKQYU0hpAy
	1t9m7sNZ09e1Lu2N8ReGIDkr2Z9qa4+Ac+AnzaAcZjon23RpnC/W
X-Gm-Gg: ASbGnctfB2ux7lxMzazJ8Mg8IAV0oiPhf3c3lvYVONxj/YXAT22iNfHyeYn5jT64uWx
	g7JuEbvGIC5w2a1EmIL9MGrQY7RZIOGJDoTwv1gPKWDUZEv2dimxh4wJ6pENj/Uo8CybOiNEaMR
	jzaTEdw49qZpQTFe4pInlbYbOykyfzFsmar1DF80wJHrS1JBnaYxcfnDsr3hLMo2S6sJ/FoPgq0
	+9+ecbxDp9A7vtOTgJ/u674ciXGjfReu4orHeCEfWf3QB5mB38tJQyUJQxzhX9h7b5DT2VmAhBj
	vM2fLRojjA==
X-Google-Smtp-Source: AGHT+IE/e8Y0UzEMao6atgZUbcfEv/3tvajzHUJl3OU3gm5cGx1+LX4SFiUZ76g9wAqK/F4I8/8cRw==
X-Received: by 2002:a05:600c:4894:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-43891427762mr99548035e9.20.1737366398007;
        Mon, 20 Jan 2025 01:46:38 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:cc96:d269:5cab:960d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4e38sm191197065e9.21.2025.01.20.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:46:37 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	shengjiu.wang@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1] arm64: dts: imx8-apalis: add clock configuration for 44.1 kHz hdmi audio
Date: Mon, 20 Jan 2025 10:45:22 +0100
Message-ID: <20250120094632.13894-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Currently, HDMI audio cannot play sound at a 44.1 kHz sample rate due to
a clock frequency mismatch. This update resolves the issue by allowing
the sai driver to change the clock parent to AUDIO_PLL_1 when the sample
rate is 44.1 kHz. It also ensures that AUDIO_PLL_1 operates at the
correct frequency for this configuration.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
This patch is based on the following discussion:
https://lore.kernel.org/all/20250113094654.12998-1-eichest@gmail.com/
We use the existing mechanisms and just add the missing clock
configuration to our device tree.

 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index a3fc945aea16..dbea1eefdeec 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -790,6 +790,22 @@ &sai1 {
 	status = "okay";
 };
 
+/* Apalis HDMI Audio */
+&sai5 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
+			  <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai5_lpcg 0>;
+	assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
+	assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
+			       <722534400>, <45158400>, <11289600>, <49152000>;
+};
+
 /* TODO: Apalis SATA1 */
 
 /* Apalis SPDIF1 */
-- 
2.45.2

