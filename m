Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676342D4B77
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970530; cv=none; b=G9cP2ITnLL0RQsUE/alfYF6IMvEMM3PoMD4Q5oMEwfi/y+xznh+dc3OZ3NRH1mL1tI4AwoD13OvxIub59xMHLXraYw4lX7owuXgwyYs50L3DAzb8Enhz9Dsmljo/saMS2RFNqNkooaECkap+3vSUWK0X4tHbh7mftyFLvwm856U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970530; c=relaxed/simple;
	bh=Q6gqUDKWSByswweoa4MByrpih4dPJFAYYxh1yHsXWcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orrCMyVF5mdD47jBLEVegvhWuUVLea0bsjECgqGgVdZbwrlxLhnZpDFG/Uw+OdZoZl3O7KKYZ0UUxSVnftZtLOi+0FgMP0wStmOyD1fZezM+uzAOkS+VgLwmAwDfh9sxI61eCVICBWe0OzEEmfdLocK07DrvDtQgV41KTyd/xIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFLOF8rA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFLOF8rA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso5048155e9.1
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970527; x=1754575327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=pFLOF8rANquIQGlYBauYC5laCHbLWeqhjrJvk3It9/pmMQtJW3Kl5kphkp4bdv4Gq4
         PE8iwA/mvHjWPgeur8908gehmtIinv1uAOWYdmAnNlgWBt9EKtGsqPs38utYBax6COMR
         o/7+uJXI3XeGLW73m9an1WR/U3IHh8nWXeWDGOwmOB4sPlmDvmID80IibTO0tvbViBxf
         zHpPWAZOFE+GCbn31YEvrqrskdAt19875DGU+ffbAZ8RjxpAa3nAlkDxcwomFTyWNAFm
         nWwdzVNQB2/sDm8ODJgaAJv01hWSQyAyXMUZJrRSuaOVeQ+hmSdC0UCn4TGGhyb0wNIY
         tq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970527; x=1754575327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=WggwZQAaWTVLhX0t+e6ewJpkO5igLLVQRu2l55ibgop/qweDS/hgZWav7lYQHNGTeh
         8EkH/ltaHNkbHudmc4DxorH6VgIjqNHYmcLQkMr/jR/YxpSSleU1cZvusuWA5ns7T4rX
         xwLEKbIpliaRj0gNKKXB5BlC/AjMpfnkGDOBALP7ozmmuIbUP5DGsGrBar/rbgGvl5Xm
         5bw4r7saZje6w3+x3ThghdEJSZ0aEvYsxyOoLnYLGkp2gGQGgizMFZ4PBpK+DDvkdCmn
         t5QyFri6xxRbd+JJHxWhqBUjW3vdS1T10g9AKYDNrW6XA4lvhMsXUD8Mlr2UcQzI8Owu
         K5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUkIkdYve9BHYDU8ETPPHxWg9f+Y+FC8nQIosux6MWoXHjxqVqd4xlYU/BCepIokPFnREc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzLLlQkBjW06tlr8GxNrujSo2WWCfhEdsYgAHOvBYqYWux3O/E
	qM7tOLBf1sJFQRBWV6cnpsdAkd3h2qypU7erJyzXiY9gLqcjKPnwW057HmcqRfP7OIA=
X-Gm-Gg: ASbGncvNpSdpgcjaa3LHOTH+suI7W9jL6Zqxy6gRmC0EzxHPLyppQ4gE1y9Sv1/xy5t
	jhMoWvWWkdf6ux8yoiTrRhJF981CQtXeS13wDmEKBeNpFR3kpVZFVB3ridO1cwpuBNosptNTOxA
	vrGpZg+96k3qlD7laUJ6UcILI4PBpCUEOgSK0fEdHpbMZwEudKmrOiqZwa8a6nNMXJzu16N7KkC
	qvQaLEv24gfZvbIaxjMInkws0UZ2Dq1p26VoEIxDGLYetLFe6thBTDpzqczS/lH5Fi0pL0p1zyA
	4AtXa6XezASftWpmrhcIWbl8oWAFuxqV2TUpiTnEWGTGhCZhpU2tL9PLCij6pYTq/5tHuAIcFEV
	1yveZJwpa8/x60NaO0BU2D33VU88VA+yACRIv2M8Cj23YWPs1ib7/kCUBzaw=
X-Google-Smtp-Source: AGHT+IGoCseWUX+0lPWppwUdmNG0l0frr+iK8vwkU/QkBfN7U5WGI3OnPVlPht7D/5AVPZPGmJkn8g==
X-Received: by 2002:a05:600c:8812:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-458930ec808mr51382735e9.14.1753970526033;
        Thu, 31 Jul 2025 07:02:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:05 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: s32g399a-rdb3: Enable the SWT watchdog
Date: Thu, 31 Jul 2025 16:01:41 +0200
Message-ID: <20250731140146.62960-9-daniel.lezcano@linaro.org>
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

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it on the s32g399a-rdb3.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 467e0c105c3f..e94f70ad82d9 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -72,6 +72,10 @@ &stm8 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0

