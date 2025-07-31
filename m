Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3062D3742
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970526; cv=none; b=HuQU5sprS+6a78U8n5KGtenU/Dz34joabgLZmTGoMEqmGwHsGhlr1rauKxEGyon0cpEFIMHTZLNtHjKKB4m4Ycbv9eEf1TqTp0fZKcpWsbE243G13V5ThR1QVJU08Cxh+8cPzJTBenxDatT+Xm+YG08FUTi7Lnw8D7yX5z3iNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970526; c=relaxed/simple;
	bh=yQHSXj9X+9M9Y9py8Z7kopx308qQsUk3NFruZ6iZnh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKkYyApBee5AaQO9fP+0u2DurI+xBFXQRJBKc5OBIO/75JGK1cCt+D3Pqtumwu48KReNTnGLW9IZL3gKq1lM6OG6jrM7XC0T4fIzFslmAsC24lypAm9u0oe3Vsv7riwAk+oqs2XjSS4Rx2VQ24nHItM1dLxt/awWR91xMbPsXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A4CHb6QV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4CHb6QV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d3f72391so4619725e9.3
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970522; x=1754575322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLgS03msUmp+vuGwcZngE+sO5Zm7YcN21p+x25WXrLM=;
        b=A4CHb6QV26sE/syiCSit4s/uXf7lz53uSaoUga9IcSRXEA/AsZaGOeSKvfPqboUAev
         igcgBF4+2hhXshdN3CRghJTJMHRFEX7qSjpsrIJ40l0Rmix121z7VUUqPHaVIm2YF8et
         UAiaor7Slv3ycu9kYm1PjlPEjbWvh5bM39FP+zVw/4HJvFC2OKmvVWqshua0A2N0srU4
         gr++YEzdGZ6ukL3iIabCdliTkvn2zygw3a2a5Q2+RjHZeLxRNKpOj4h1vQAIIXMMatPt
         A8H/7CgH8BmXXklkXy8TsHa3P+c98lotpQMrXlr6XAZSKeG/3f6xkBrVIxbfnrAkroFs
         NS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970523; x=1754575323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLgS03msUmp+vuGwcZngE+sO5Zm7YcN21p+x25WXrLM=;
        b=KRDuLmm12QvAsAPqRQIkm6vp4J/9QGNYKmzApAIszKk4rfZCIkoSNx0bjz3elX61/w
         3C1F3UNpnayJpJxnUXJ06tYzhKBXZiDEVzUWA1cUQIcQBX6YEa7UH1HlZwaiKJsM+xL/
         ziMhWy95eHuQk+mX4E4MqIDAz8Ukok4RHYbrGIGd3zRaf0UykLSqz0U5cXEq6HCXWrWh
         G2/iI45lfBx6v015oGxhgzfDvnwXEe0Qx2Eyx1bRTZbCADpnKOL9s1yH84TzqR6orUWt
         zXdTkUgUELDI+r7WkD+98BezMPL5cwgnAdcu8gTaXCGIdODSxNturFKB2u3uTglHM2ei
         LZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCUt5LUrKzSUY0Q54Rnbk2SageK95fn/g9ZKvnaoVbp+BtXfCuOY85PXW96MbZENPimWVRM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqHWbyxkxJPeCOhfLlxoFziyManpHXyA+vWZOzulyKcRahrjlY
	F6LnrEoJidlB4gh5olvTgfEsPfzGB6KarNXqgYLW495K4PsfxYk/aoQ6C/K3GsbNuVM=
X-Gm-Gg: ASbGncsAl+TCytYAdr0lD14LaMNxmxCXW5qJtGqVRMX7xYKL2x3JfdKtez6nGpjGU/5
	tAZP5ggTfGVVVoMUQcMx0vJLVz3TRgH6XnY5PVhcNf71QA2TsU3G54CgDY1kINn1/WNNkcHhHz/
	W8pl9G+fjk3o0WoRO2H3pzaUQl8ZyqAT877ZEF2MMDjn6Kx4mIQQix1dHM1tHtnJzoAgOE/cgf2
	q0zqq93i1J/Y0MmJO0C19jpAF5IdoV4uKN3+c5XwgXZSNDXzEhL3HB7DXchscJyRd8O3bf3kuWa
	ta7DIWEqs5IG2od1ch+uj9RhZct4ku8zmXFdYwYYi02qBBPRXAr8D+vvsLtF6sqKgfa9ESppJPh
	IC6lcmNxLgS+jIOWT2SMKqov59GsayIhBy5JDyWSYIhG9Ag7y
X-Google-Smtp-Source: AGHT+IHKeZczvelpwGjx/EOADUEZKpoKSKEfhOoz3VFDbeZbEjT91pFxldnpybLu9UgLDOG6DAcA7w==
X-Received: by 2002:a05:6000:401f:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b794fe50b7mr6057814f8f.2.1753970522308;
        Thu, 31 Jul 2025 07:02:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
Date: Thu, 31 Jul 2025 16:01:38 +0200
Message-ID: <20250731140146.62960-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Referred in the documentation as the Software Timer Watchdog (SWT),
the s32g2 has 7 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Add the SWT nodes in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 1783edb81350..478899d4dd06 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -317,6 +317,38 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm0: timer@4011c000 {
 			compatible = "nxp,s32g2-stm";
 			reg = <0x4011c000 0x3000>;
@@ -445,6 +477,30 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm4: timer@4021c000 {
 			compatible = "nxp,s32g2-stm";
 			reg = <0x4021c000 0x3000>;
-- 
2.43.0

