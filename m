Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8C218E99
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905188; cv=none; b=u6qgqnmrOup+StOCwBSCykmW71oEckNk7oW7q/uAQYUNCbaHB0aCTuBAq/rDIIZhg4h42ouQ3K0TuI9DuxNYjGN/5nWR5oVT/OFF4PGYVsyh/Z2JdvbgoKNVJJgAprTJYFp2JPG4OnvUWnYjQOOOMVbvUYdqlIfk2aIsJug9rU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905188; c=relaxed/simple;
	bh=rmz60z1XyZMfPXoIbmmaBGrnzamPcvt9l/QVKy3Qsiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfCOYEPEE38uzo7KM8y6Sg/Zem/5D/NSjdeJaoxFnaDz9a+R3Nml6VMFj4Imbb9OBjasUmGPImWnh7aA0xmawwibgLtASz1lB0acJ5KR3vue3y4nOyYCvjbIgWdJEe5PKyHrC3jH14nzmZEz6dUsbPPZB0Svmzzl1ePCRDNGhw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mryRPST3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mryRPST3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b7825e2775so136416f8f.2
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905185; x=1754509985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz6eddCfDwzrey2Pd9gsm6USefudsi6UDSY1qIrWHdY=;
        b=mryRPST3uMXfzyVOaJRFqrX+CSS9J/N5yxfrpl4aPMcoe1Wl/STWvipHfNtu/AwXiQ
         MTVQ24ELp+OLVyrDpnMTKnE1gzSojLKrN+q27WwNo3RklTV7+eU9FSKDPIKvUncaQJ7U
         7Drp+4+cVyTJIcwy5JnyoBdsgChkGPd4SuXWlvsHLTxKap2epnAq5QlA8Y5dNal1sa1j
         hUVP8Kz19ICk5PceUlnyQzachqlQHEOOldFIA0XTquuuxto21p4So81qOd97p9DMVMyy
         rlS9mwd3PPJwxeOlagIL0KkLrsk2phgqibLQjrzaSIcGEFpR37cl4fsHPuX5oP5ByhEs
         I9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905185; x=1754509985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sz6eddCfDwzrey2Pd9gsm6USefudsi6UDSY1qIrWHdY=;
        b=KnT9u6onUZKKCT+msPrAEavcbKulUyiWURTf2jWN2+qAUWONoSH0Yb4TCe5qh0tlmP
         G+eW9m7iF9or9obEClhAzHa1a3+XWeBDW/igXDauJJyEyZ/nH804KCGvJJ/9RpeeS+RH
         51xHl0HZzPoa0mRqlXQfRIv0aaLNWxu9wceXE2RptGU5K/qdcu1OFt+IAOCAfIwrSCrU
         Y6eJu/bb1CpKegNnRiNIHx2uspJBPmGcAnp3Q9Q/jPE1oFGvN8I/Jx3nk33H2VDDIaoO
         YV/dSVWlonRFfALGoxE8u5gciD2hvA9zCckZaXH/Q3AOtLKX9stjvyzhbhjNwDnuzuAu
         DwIg==
X-Forwarded-Encrypted: i=1; AJvYcCWgvwHGJfHUDSseX0l1lkGugRgrtvgMUxsAOaigERyZg/geuxKeOHJs/oC9rrueu3nkqIU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2rL9CDezASsdvw4IqKCqVpYOdb2nzyMdH/E0DuoBZ7a/3mYL9
	VFPI5XfwjfOlDPZ9F3Eq2EYmEk8HFvKrootLPI/mGAM6EuC7xpK8nRF8I/VSKDZm0Z8=
X-Gm-Gg: ASbGnct1/pgv6xDpNw97V5lU52kp9N7IwCzZp8W8HWAdYXZXoTSBURjALw7EEOdJ8wg
	tDsbfdcks7fchBHMIPrBxEsThKuu47o//ZOkJ2TYlPksdTWJ85ciqnHmwdlinCBFfVUpvpKHiHs
	9r32Gak6FazKU5BpXnrb3rOfA1uRIoeRCGaMjRqw/pxlrI8rBXZFRc4C5zp6s1EBdVzkFT0ynZn
	wHi9aqFH0MxxyowQjDL6UH4gXBeJFEWcEJCWtAAkFYIwGVfGROFo9963thZqEqOfHHBpSq+dXZA
	hcizp4BGcidN/YpBxNc+JNDLqmsZg+zGrGeN73o17RAuthU4mdekNG3uDTHaitc3qpU2dx2Z6xs
	n2ioHDailjtp/BbTAmGcIdXJuR0OsBdwC8UlHwY6B/cuo2DcWlIu9m2xGHug=
X-Google-Smtp-Source: AGHT+IHzIiy/Kjn2fq5Cd9OViC1/oll8LjWMCbcWSd+u4kL6fJDbI8sMyWN0hXhAmzSyYRVPnfnyGw==
X-Received: by 2002:a05:6000:230a:b0:3b7:6205:25c7 with SMTP id ffacd0b85a97d-3b794fed24amr3712859f8f.13.1753905185056;
        Wed, 30 Jul 2025 12:53:05 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:04 -0700 (PDT)
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
Subject: [PATCH 3/8] arm64: dts: s32g3: Add the STM descriptions
Date: Wed, 30 Jul 2025 21:50:16 +0200
Message-ID: <20250730195022.449894-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The s32g3 has a STM module containing 12 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the STM0->STM11 description for the s32g3 SoC. The STM7 is not
added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..77ef75bad4be 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -571,6 +571,105 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm8: timer@40520000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40520000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm9: timer@40524000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40524000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm10: timer@40528000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40528000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm11: timer@4052c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4052c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.43.0

