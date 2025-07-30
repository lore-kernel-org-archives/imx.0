Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616681FFC59
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905186; cv=none; b=sLDvXE1IrgsySAWJskStMLYH5keQmiBrcDLy8IRmrMkAvgNkxmhAqsyRU76sJqb2kWFhaNKq8bcHpIKfJPGMJCHuTV03j3KGq7FctPAqkyqZBxu3GNuRDDIidsCGHEBfihCwh4AbUp7SoghwPLKW9OkZ+Jb0eHeJkVSA6gyuFXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905186; c=relaxed/simple;
	bh=7T9IvGmnAZ+njhExWBgbmnGfV74VG31YPxFr5ceIVAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jumgrvPdGZeajvReyEBUXByDNJrbE5F/yc+Kom6wt1FoRaIvsvUThq7vmXthHFATGKrdiuYwkBDxAmJPeAqAl5kywLuQuPdQK23masH3LQPiGT0FRfsxbEGraNBX65597OKI1dxnWtT/pXjWmdBVarwvR+XvGS5IFeHflGKyJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EINGwlqb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EINGwlqb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b78b2c6ecfso124638f8f.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905183; x=1754509983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJueEuqTtjiM6Dim8VP7OcBzmxZWJQ/hM96x+rO92Gw=;
        b=EINGwlqbeTTv7VcOCO71utEk7Ed6/9d7zs2B1Vr9XBZz042aonDrT7Vzv13An6BdyQ
         H6TtWHmHUXRc0BBXwW3Bzs7cH/mFYMbkaCJV+x3H6KPNsM7EDTtw/pfSliYNMyOHY6xt
         Yq67GPyaM8yFDDt9aFlgA2nmcy6KJDMnVLfA9EUe33QAiBbeXyTacD+ZQahHCOzvMLwT
         Hc2pmgQAm3kwmschoMRga1m8EOXYC/TF1Jjt29+d7qs7FTHkr6iVy71edJareeKlaa0o
         ej5r0O7b7l3YWKo1Ky1Q1pIp0HemZmfJPWbEc91DIoSnKapm+KAgDb8PI5JyFwJCNUvl
         dI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905183; x=1754509983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJueEuqTtjiM6Dim8VP7OcBzmxZWJQ/hM96x+rO92Gw=;
        b=j6GUoqDq6os0Y863KqykS4ad5irHsa4ot8LL308LrTfccIWP9FzGzk+Ir7dh0ZO9Ph
         Qn0kNuxao8J1nYYuAF0A9+ECjMQhMMPy6lWGufG3sQEplZGuY0QGCUsOQqFRWTDBVmaK
         fvZMcWDgHjEHYQsOFRkFRo1tUPP75UWAIUuhwOMJH9Lh7cmcXnywiakBoLk5DQVylVDL
         KyT+RUnBo4BqCB5s/HDjLU3UuwfTvvRC5z8ExABhXhvBnnIGH8T+SE+8+kuRWteU6qt6
         Jd06JIFNDLaBwsk2IOFyXf7Z/Au+2dj2dZPKUtPTwb3HNkJGbEE/q0cJ9V6gamZFlYDu
         fYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW79NCgF1jVOAhoHOQ5PTPIWfOFR9WydnJeCaoo8OmyW1QWw9DE41YZJNrL+BkP8xscDb4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz94f/GuDXhtO/ye6TbvE432gtb4yLkc8qPuSc34D3UmhpWv5pH
	KoNCaOFw7hlpS0GNLB7j+GblHNC5yBKdSwJLxpX9Q6QpWXZoCEiidvHDkMSWph3DcAg=
X-Gm-Gg: ASbGncsjiwbpejEOH1OS7D4WqMnh/6991yMuvcvsszvhzgYm9RGOOD0H9o+dqhWRE18
	42JFYMc7HK77dK8RkvMa76WljehPYoZ3bWj6iWr2rSiZ+5ljUcIpA+bN5utZtcyYQK+RAJrmcWf
	YOAK1Z6ylXpR0xoxgaD1k8fBYjVyrEM5Ew5qCe/zKnM7m6vRP6GRYt3O4VM+XFwd6DTO6hNLTPL
	uEZE1nVPTEOkvCNN/ZeikEWpanMxymgJ9ZYhSLh4yiNSo9ohPYCs1t/GnJJvQ9ESqOCC0Jpp9kM
	bfDUouSrvinQeGxO9nrN8aY6xALQuQmg7sjXu/fkAaFAAcKmtjlDw1SjJfpRa+eyzHw9ET1dM8J
	hHFfbEXunxx6uG+mFAVs4S4lqNBT74yOd9cx+LDWJrSuFZ096
X-Google-Smtp-Source: AGHT+IF7rvI/lJ/fkpm1P7rRxksLVW4UNZm0omkhDcU4fWbM+p01RshTyd0V7avWFg7SQdZZGsyTzw==
X-Received: by 2002:a05:6000:401e:b0:3b7:9173:6948 with SMTP id ffacd0b85a97d-3b794ffa8admr3769630f8f.49.1753905182660;
        Wed, 30 Jul 2025 12:53:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:02 -0700 (PDT)
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
Subject: [PATCH 1/8] arm64: dts: s32g2: Add the STM description
Date: Wed, 30 Jul 2025 21:50:14 +0200
Message-ID: <20250730195022.449894-2-daniel.lezcano@linaro.org>
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

The s32g2 has a STM module containing 8 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the timers STM0->STM6 description for the s32g2 SoC. The STM7 is
not added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..3e775d030e37 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -503,5 +503,68 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

