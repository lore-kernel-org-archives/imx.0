Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084B1A4B80
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306477; cv=none; b=AO2wOZjUgsHgvImYg9ePmmlDZKJ4FRpp1zYFHf1CLAjZsM/tHThg7RCdANQm+lnDdM2GITHlqRfJP/BGXmIFuNqNog3yoGSAYbKmSJzicgiIkF2/etu9kwZ8gXcT0xXnMUQ3+JUiFrxeDwsyyzIXk0C3sbCI0SGFgMAeLZ4aQPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306477; c=relaxed/simple;
	bh=hNzNTRUO1xfArrtGz9hIBWhoLSA7T3wdnmriECFga0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dCzQ+tkzRaRwxgcYuPlaUWpVeKX7mUFDh9AEKxDVUp9ET+XUP4axjZJoW1hPWFw3eVZ3EIsBe/uP2+6/Rg4wuQZjg4rDP2mrwFDwxSYezfW3w+5O+fHcPfrNLcSo+LyGhhlK2uC+Je/Vr9ScRuLLmXvEZfn7yRjc5pHhlSrCtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHJX4iXq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHJX4iXq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbddso360955a12.2
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306474; x=1727911274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BZ5x1JardeLzM/m5KAAa5mcr11Ogt+U3TCpeepywJI=;
        b=MHJX4iXqGxwZ5MpEqDCI3ckgznpb4kCPcCmeaoc3W1yJ0mXah8fcPBS0E6QtBjkDQ9
         LjB2Ig3mB+UnziVrzNEnUZPZUcU8X5aWy0/jgDDSoeXIoUh/9BWRDglNm4+MO6r7OzOJ
         hiruGrs/2E48Ho5GP0hT8F8GHP3o2q6wwzKXxQYe0vARXH2TV8HEIJiy3X5zk7ZgVEAm
         bRJH69R9bPqW9Hxdh8HPohdJ0MMehH0PWVrZ4SpuiwxwyQC/thUxlMGKeIEdKiznjeoj
         waVRpjeXgBrdIDicki2Pi76gUm3apfNVZ7V8D/zp5lwz1ohFCIiwB74GqdAqJc3jUeqL
         /TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306474; x=1727911274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BZ5x1JardeLzM/m5KAAa5mcr11Ogt+U3TCpeepywJI=;
        b=L/rrMjHgyoP5utHEMKJpTGO0T5Pvehi63hnU1pONP2WGelHZom/zscm3kgmKC1gavH
         ak/DUymW693A4PqnsNzz/3WACqTJokOPwh2hHzK8dL+XgM1z3uS03M6wg1QTx5A5Iw1r
         5+O5sx0buAI05OU4YI0Nvw2eHR6MtUIByvd4qd2BHJJcYE8qN0deg6y9hNRK+YdNKjvm
         +tc7RXx5J5kiMc4NFCjgcZR/5nir7HIn+2NPRkWpnfUr+Uw60v90hk1iS8g0nqVjm1od
         4X1ZorgqqNnG84NCXBJzZuTUP9V3wWZlP/x8MSyXlI7tQSQc+LL+DyF7cL0e1saB87bW
         5GBw==
X-Forwarded-Encrypted: i=1; AJvYcCU/yXLqVMu4cq0vJyzRKajdO9rtHwOb3PYNmBe5SxZMf7KJFyKBuwo1cWwyMT/TcDjHH4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnlIDQKwXGwx0+F/78kioV1A7MW1PMivmW9zfWadchb0DGcdfz
	JC2XJpxP1b9aPrtQQiyHztyHMRROzMlNAJU8DknwfxqLFocPbosK
X-Google-Smtp-Source: AGHT+IFSfrNX5+ZdgLCD+cmSwZmmpfoMEsHjHpd/2Frq+M22Gl1QZHtrdQuR+01rVBpVHguU2B3qQw==
X-Received: by 2002:a05:6402:51cd:b0:5c5:c2f4:c4e2 with SMTP id 4fb4d7f45d1cf-5c720764447mr2105166a12.36.1727306473734;
        Wed, 25 Sep 2024 16:21:13 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:21:12 -0700 (PDT)
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
Subject: [PATCH v2 5/6] arm64: dts: imx8qm: add node for VPU dsp
Date: Wed, 25 Sep 2024 19:20:07 -0400
Message-Id: <20240925232008.205802-6-laurentiumihalcea111@gmail.com>
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

Add DT node for i.MX8QM's DSP, which is found in the VPU subsystem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index f8b577ebdbef..ae0165a44dcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -581,6 +581,33 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	vpu_subsys_dsp: bus@55000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x55000000 0x0 0x55000000 0x1000000>;
+
+		vpu_dsp: dsp@556e8000 {
+			compatible = "fsl,imx8qm-hifi4";
+			reg = <0x556e8000 0x88000>;
+			clocks = <&clk_dummy>,
+				 <&clk_dummy>,
+				 <&clk_dummy>;
+			clock-names = "ipg", "ocram", "core";
+			power-domains = <&pd IMX_SC_R_MU_13B>,
+					<&pd IMX_SC_R_DSP>,
+					<&pd IMX_SC_R_DSP_RAM>,
+					<&pd IMX_SC_R_IRQSTR_DSP>,
+					<&pd IMX_SC_R_MU_2A>;
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&lsio_mu13 0 0>,
+				 <&lsio_mu13 1 0>,
+				 <&lsio_mu13 3 0>;
+			firmware-name = "imx/dsp/hifi4.bin";
+			status = "disabled";
+		};
+	};
+
 	/* sorted in register address */
 	#include "imx8-ss-cm41.dtsi"
 	#include "imx8-ss-audio.dtsi"
-- 
2.34.1

