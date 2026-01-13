Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9BE392C5F
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313630; cv=none; b=POPUj2uhrJjjgj6+HoPcxvS2jHqrSP6LGr2qPkTYMXOzILjwJmPwnNSK81kwXFyAk1bMKwqdAnD+arJg6suqS0vZEd+4YD0s4WzsmGl34jFVH6Ei7y1HAR+5lZZEbMapN1EMuURMNqbeSBblJgbnYkTAy5qZLHD5hi7ff7JjbDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313630; c=relaxed/simple;
	bh=RgzcGw7mxH2MIeGgn+VfakoDn6WEzlL4sMS6yNO5ltk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7+1WSAhYumhgrIuRiuOYP8W8QA8LCat+r/72tcItP3/MoBH+r4qpTQaGVdGqVB57FR1IzYWva6fVwMvHxF6BLCiyodSvII2nBhUOCaV5O2AFPbhvQkMbSWp8ljag/4ZABH3+Hp9hxvT7ulHQqYZHwNzcgMJYUuMaDOdj2nuSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bxMdOkmF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxMdOkmF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so6408462f8f.2
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768313627; x=1768918427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ4qhNK6HgJCQRaIfNR/+TyR3qWODgWCDv9ZRAYBUD0=;
        b=bxMdOkmF1t7swtLJsbbTvMVXBXjY7JBVE6rFOX9PDaCKHZK5V+y4w3IozCS12HitCB
         9tWdcKuy74Ai/XgxAJ3DNKB6D+/R6MM43bONdl5oddZJwDM+ssynOi3+/9iKk6BKlm41
         sfCpZy9JT7ATCPrFlB3QEaT5vZ9FeEa1L4RaZZnO4M5WffevGu3p6u/WOIEufqQfPOZm
         zCw2pl48B+hMjLO7tyq5EVnTpAcm2DAZVocUUWR72VI7AqTf4/H1E41SsYRxVjsww9ls
         InZ9ut9XjeaY6MtAjwd0jnwlX2B8FAtefPV7euEmwSnaV9zB+8JYNGzVUU/bZJmg6wfT
         51Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313627; x=1768918427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ4qhNK6HgJCQRaIfNR/+TyR3qWODgWCDv9ZRAYBUD0=;
        b=E/wpjDITe9x0O7b2E7PynwIztrmLUHkPb7/PJqt05qxqGG7ximI4PDB2FEHyl8Oj6p
         Kf18wjVofi5eRs3GcgW0yRW2VjrM2nA5iUh7570VhNEaIm2R4pdUcZgBLuJMl3Wc7maJ
         lv5FK6MOs1YWfmqGeao9HDcNJNJIeXkzJobszwA/5eu7XWmQmWj98hfOJcQ2b2vioG3Q
         6xZSAl5+VVds1SQpB23Bfe/UJ1dGgwH3gbhwi+OAVMKhloA7zzZYYZcSdDC/x05c+Zya
         PI1lN2xCuSuHDpsYPcnNuspy9e/Fmm+JpQBe1nmoULjuGCt0OtmXjaT2l6clohM80nuI
         khpg==
X-Forwarded-Encrypted: i=1; AJvYcCXO7Nl7YbkBQjBwXqZsAO7wLwYDZCMpfdN5rp8mX6lTPri8B1viM5kfwZ8LxBRBUG35pqM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvFY9MHt+cgnqje/gGipM9fUxbcLEZk+2fG8GBJylB0XPGZ6uw
	eYVeSmxFYSyQxzVcId/+0O2aoS+wgIO+R/5NLpM9tSvxgDMRizjDpeHR4d0o+iYz4r0=
X-Gm-Gg: AY/fxX7nbu0r4LPWy89BMGm4SD3ugW+3q8yom9dhEU5W6z2IPypqsEna8mqjddSBjaI
	0l2oznD94mbU5HBdr4pVNckumA3G4Th4MaY03iE3xcGXsPQZzQrZLaL7KaHxtDHDZunNcIMRrF8
	6t2i7Iun/UJeQ9QCvk12UGMvFD1JXNarszk3Vdjc6NB0VV5rWNkAuW73d1ypEKjMHZKF0m9qNs4
	dZDBZcyi50+hR03V/J3Rm/HYTliCOOt/0i04I69DcPwXmdQdeo3tXoITe5PIYg5NiSGw0+4PFak
	GKSy8WJGSAr985fppzF1eh6BhSqa4k+PGqOJiMMPYg5wD8cllENI9ZIoEtOPObsizSYj04VbAH3
	MggOdYjKv0qCTt0mugdMkSML10NqLE/7ji5rEgDffOsdlrpZfBw41c+d0vJukazitUZG5j8k6Ke
	JKKY/jfGMVwEG8DVfy
X-Google-Smtp-Source: AGHT+IG/xqYaef47YaE40Cl836u2Tn4o2f/BCTjQwmPi7rLjNPU1ITQ1RKKteQ7YDa2akmaP7lvqtQ==
X-Received: by 2002:a05:6000:2013:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-432c378a8c5mr27806853f8f.13.1768313627004;
        Tue, 13 Jan 2026 06:13:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm47014898f8f.24.2026.01.13.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:46 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>, Frank Li <Frank.li@nxp.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH v3 3/3] dts: s32g: Add GPR syscon region
Message-ID: <6dfabf2a1f0e6f410c92b0e24be6ff94b409d71e.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Unchanged
v2: Remove #address-cells and #size-cells

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..b954952d962b 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -731,6 +736,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..be03db737384 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.51.0

