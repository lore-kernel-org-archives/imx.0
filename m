Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCC221733
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905194; cv=none; b=NWolJT53B+iVALHZMO33IH971EUa1swoyMkTe5ks1GAIydwzeTi08/d3gM40/B4w8QJ73ZCy4y0dQjUF5ZAYoy0BsS4k0PSoLTXRzJdcbKs+RG9i/Ahn8C2IXdeN34jt9TBKWkcT6CcFFfEPjdEBXqW9xmbboGL0eZUwpHVD3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905194; c=relaxed/simple;
	bh=+L6M+3/g1Jg0R2zaIa85KoEqKt14CHxdoVxCsLgcBVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/Chf32CMCrVKVMoT7cKMhktR7y2Y+EpzvSCJP1d4eNbRq2dkY4KrtuInNvgMjYsLi85lmW3GOu1CZgOyO8aApA5yTq/KgbP4+Wy0k/GxC6OU5st0TXLW1uBQcfJdr/O5CKA5w7bQ0FuGEiQ2kn7AzzJ724emxlpgLVRKRS+IA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oUjySRZE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oUjySRZE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b780bdda21so135906f8f.3
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905190; x=1754509990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRV/p/LfMjQVL8Vp7f4I6Y+3ln23q8MmT2AnWttCTvQ=;
        b=oUjySRZEKwO0Zl7OBKl/3IxyAlabt2XOzecFp8Q+gCcZ0j/nfDAPqZC6X+GZibHtfw
         98tglN3Yr6txW5L/6Tm9GIYHHYfGE7hD8DaXPE1v6t/HhHpFecLblo5gc7ubxPmfY2ll
         UISCSD16U2KKcZ/NHKXdHMFjclMM2UomMWQH9Yhwt5tzUFc0136t+VxXZmnzG7oaYnYI
         9MAgv8Wn8q6ff1nf59hdGLTB+obSKe4d1OzDVarKxYunU/uvj8L96X7jafHlMkpLhx3N
         5G11chCxTcn9Sggf1o4TqJTDLJ9U7NfxHLoHiE57Edi3KfLDhg6r35hS+OPQifsm13SK
         S+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905190; x=1754509990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRV/p/LfMjQVL8Vp7f4I6Y+3ln23q8MmT2AnWttCTvQ=;
        b=gYVc3/h5Pv9SmR80JOOqZ42mWpxdPJxv695II5gSZW0CHOox3dehcM5PJf1Dq3rAMg
         oMPHs9oA3wc5eyz7Hz6MSx/7X4CPuUwbCbFuonUnus1xmY4ZPR3o+MHogxqPAokpjg5h
         5mee2gYEhC+//HjKnPUIIcl6oATb5EglciCUtkD2/PsmKlZ6Z28SXbGlmuENw9ZeMnmi
         SMCdW2URjFJUc72Lc5N0mHmxZeWDyNv2Xvwmh3uRmG0JfONlHzOmUMr2LYvF3uXpuGt5
         qWd3wO+OSgCO+jEZoBt7AWjDKpotUCUoZ+QgEmZvbj4DFJRzCcTFPRGbn0PPyVjUpJy9
         q6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVLQA6so1Xi9sthwSUUL5JedPmrvYO0wm4rTpOB422SEVbjFkZEI+UvrPvVSKJzMxTYM8k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLX6ZE04+B0fI9ClxvauvkeEtoQRXuiWg6AWbDgqhrLGRPDE40
	edYLoJBrZVoQKj1rS1iRVTAgNcHTFfa5xfOl0kO3Bmw5G9XimhftEkX143hzxV7OblY=
X-Gm-Gg: ASbGncsfiHyDePw96K66A5b9IXxezFXpaso+crjF7Wzuz3CzxYZ5PM5Rn04+tHtLSfD
	1+E8vsaxukgRZViA/37HVy9Yz1HzfwM4aDRQcVYp9SLTGsZDLoe4BSpnr6OI8nkZT1L4NGt46bA
	wALGl5vk4ZqR2xxl6j2VpCZNLqRxWqA/lZvoQtL152rda1cMTzDnH/EvtBMwV5U/s8pcU9h2Cvk
	m+PyCaKNvwIqEt9kXf/Ldf+SS6j42LRTdLuir8cQyc8d+Pj1esBcz6Gra/LKocZtJnv10njtkgZ
	7sP6+uTy/Cx7zT/SydIRKL9egNqQagsGzUk8eNAii4OpQ/H/khk2PCc/X7o8O6BaGOj7s9v3p5I
	reODXYcgl8z7dkQMDdSsFY3/PilqpB1Rt3/2Xvs+NYRRfVBbC
X-Google-Smtp-Source: AGHT+IHoW22IWQzWG2jTmsD5K8X0np0CnF0fBnETsAeghpGo8KlFwVLAjLsmEoVsuIGvC5ZXjhu4SA==
X-Received: by 2002:a5d:64e5:0:b0:3b7:94a2:87e8 with SMTP id ffacd0b85a97d-3b794fd5810mr3799184f8f.18.1753905190439;
        Wed, 30 Jul 2025 12:53:10 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:09 -0700 (PDT)
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
Subject: [PATCH 7/8] arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) description
Date: Wed, 30 Jul 2025 21:50:20 +0200
Message-ID: <20250730195022.449894-8-daniel.lezcano@linaro.org>
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

Referred in the documentation as the Software Timer Watchdog (SWT),
the s32g3 has 12 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Describe them in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 96 ++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 77ef75bad4be..dabad071bf81 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -670,6 +670,102 @@ stm11: timer@4052c000 {
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
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
 	};
 
 	timer {
-- 
2.43.0

