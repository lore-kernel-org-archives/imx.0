Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0A2D3EF5
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970529; cv=none; b=OHnjwKrv47JRiKkP/PktbdEUDan4nwTLt27PCZvuk0g9c4KUHhl9InZDT06KHN4FbOaKL+hUPaiAoPekAOGItF3rcSNyJ44DHAGvXGSeDp1V8OnCDqhCvv46Ozo67Dv9mjHW1Exk4WZgS6OSQzX4RPqz56dY2ECrn06uR7gbzrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970529; c=relaxed/simple;
	bh=b/zd24rk+o9OlSLaMVLq9Pw8EaD6LUwOrTp1/I6fhs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyfFbQFHDiTrZMP6zk6YbQ1wNS9WUgtWA61NTv16Zx3QxV6xogZAhLYDCdK4x6i/LUeUTzWwRAdJHFmdvO6VLzEmRafVtyI3KHr737qXMhebHQXVDcWYTOoiB0Da1NhUYfjgHMAngMrql6i1Hd6V8qEKrA87KfZjvcj99dDPfmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hDv+/SAJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDv+/SAJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b783ea502eso650348f8f.1
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970525; x=1754575325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z64nEAaTCVKG57zoeUfRDIzBYeQhTygoaGUdQv/8uC4=;
        b=hDv+/SAJYImO1zEz9tHPT+wvBQpVKKES13jdAtkJZKeqrp2tN5jER9LS9HwMwGxfC3
         8dFaGe60KANGqpFzNNG6xKX6rLC7Ngxt2BDREdJkyB6L7NTadPiGG0NVgp845cbXu5C5
         RYO9Yc/wlPTYeozi4jjGpny/I4cImhx3ewyIdHWC2/DefD1WlQ+603cq9gjG6Y+5x7TN
         22l0cPtsRNxh7guVLbDyXyfWTXYfjseXjuJclG4Uv265vwoVsOddsug3bSBQByGYlKV0
         np/WanvWYxKp7Uwmc1nI2Fx1KFGgb5eOte81YVwAoYykBWd7pCbQ992s3YZ7CitiU6Yo
         RVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970525; x=1754575325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z64nEAaTCVKG57zoeUfRDIzBYeQhTygoaGUdQv/8uC4=;
        b=Y8+e1sqvFV4FMiZL9blA4Qzlu4eaF21LQx+2/aL5njR9TGMvsOKDbUryPu+9rLPxwx
         XLRBEqLO4j5grWgSy3A6vACictrNAZ7wiHr5Rr/LLBmDzoR8Lujg6NizbU7hIegL//dD
         RlBNqKadQmY8jO58DfmvYoFwKKMfklc2ShjAJ/Eoly0IlCEOwHVxHaQpLvOZgYTcz8Ep
         neNIRv3ZO7H5FvHVVTgmbnqGn+RZYT6afzBNi/wmgaSEaCD9A+S73WEj4CVwdPiys1KA
         acmsXXzvTolUPQGZkopL4VTKs9vnLffGThyVIHwZDU8yvKXJQI4zE2IB1cmpdAdQGAbO
         kTLw==
X-Forwarded-Encrypted: i=1; AJvYcCXST32fafHDQaTrOpFk9SWvlej/kFeIrubaQYj/+wnZld70jtL4jtiTjxAXjjLadggglqg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy49h3rd6xZjLpFKVOKskDJEe3GhTYZq1MK12zj+Qkb1ngwhTb4
	sGZbjQdqoV939KxFl0kvRcEmFNFLk9sCf5ZyJgPurf44tYirG9PLd6afh5127RWmyaQ=
X-Gm-Gg: ASbGnctK/M4kE2nCBGWfUW1jo44o3VL2PHlH1xgG0f3rp408vW1VwXU7vTHSv/jSMVT
	P7/th2Ts2qbodF3v4cS3wMB3ZjjlL0uj0SZlFqWJBYpt9Dm7uMR4FjS+dAFwDBBQhJkJg6Z5Dus
	OM8o7PoMCiNAsCOdc8uiASXnMwHD5yiC+qKiQhF6Dg4u9kv8ZP6ZlCg8dNXK2d6fZKkZv20uZbt
	/HliMERwi5lQFdGZUruAVS+hqnbK+V0te+ORx3vBCmbB1rc+ZnB7wMVrFzstlTFE9NerjlQYQIN
	ftVPF+HCCMgwPZF783ynSbLy20p6lkADDB4le/CUtvxFpNtAg9c/B5AIgu7OJROl7nS8LTjnRmx
	v41Q7CoB3RA0WSJFC6BJrQ3CMVC7tF6woz0gPsLjGvyBq+NJr
X-Google-Smtp-Source: AGHT+IG0Fg0obv6QNkBb8H8gLrRktxs7boJ84AHt095fewSVZFjevx0sKm5v6FUBwWIQGMfsDR/Uww==
X-Received: by 2002:a5d:64ec:0:b0:3b7:8cf0:4b2a with SMTP id ffacd0b85a97d-3b79d4e3623mr1743875f8f.16.1753970524846;
        Thu, 31 Jul 2025 07:02:04 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:04 -0700 (PDT)
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
Subject: [PATCH v2 7/8] arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
Date: Thu, 31 Jul 2025 16:01:40 +0200
Message-ID: <20250731140146.62960-8-daniel.lezcano@linaro.org>
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
the s32g3 has 12 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Add the SWT nodes in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 96 ++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index c2c986f03986..0ceb0807537a 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -374,6 +374,38 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm0: timer@4011c000 {
 			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
 			reg = <0x4011c000 0x3000>;
@@ -507,6 +539,38 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt7: watchdog@4020C000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4020C000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm4: timer@4021c000 {
 			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
 			reg = <0x4021c000 0x3000>;
@@ -623,6 +687,38 @@ usdhc0: mmc@402f0000 {
 			status = "disabled";
 		};
 
+		swt8: watchdog@40500000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <40500000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt9: watchdog@40504000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40504000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt10: watchdog@40508000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40508000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt11: watchdog@4050c000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4050c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm8: timer@40520000 {
 			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
 			reg = <0x40520000 0x3000>;
-- 
2.43.0

