Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDD6317701
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594520; cv=none; b=liwde+44Ifdk0qJPN4zV9T56zimSfHK27Wu60L73ftcOjhkhirjYurlLIb+3qxFh12g0yHA1gERLSKOL6GkGhki58x6trRApAyYLbUk4AHX8EIU2bB/62rZBtIS9RCc8bpzKAEQTeHSshnQX58pl2Vl0+xoQjf1J3CmxHuqUcJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594520; c=relaxed/simple;
	bh=yK2o72zQe+DCz+K/wPAmdcA6PJnQHLVXjQkN9fm3wv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5KC54+iMJsd7YUAG9bPrvJXWsIYgIh/5wgfiQMvwmX11PkEKrJs19kzQe0oCXG5iLhYKs4ZGn0+X1JsPKaqL241EOhfNgZPwqiT2sZTXWnAGRfnfYNew+hn6l5iq06e6KtqXLMGJg40Bx+RSHJG6yqcHtMKHN2ETCg1z3Bmk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjkqEuCO; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjkqEuCO"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so6236652a12.0
        for <imx@lists.linux.dev>; Mon, 01 Dec 2025 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764594517; x=1765199317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ART4te0v+vV281V0YHRF37dtpcBxay9iLJ0GSUM95g=;
        b=FjkqEuCOUn2G4bPZGc7HDrB+7TkEo89pjwcU5Hg5jta85ArX3sBFW6E1aso+DuJ5fr
         rdhl5lOhy10FhR95usikkfRHR0o9PFJyvJdDVmrKObwGtmISsj+ZMXwgZjgaOACuJraR
         mHYxOomHJ0ybJo0YsznMpgZt5EI45eLG69LN2CqEYdEuWm6/GCD+meQK2mAw8dPc76kV
         DP1MLJ/jN4GiajT8B6YvwptYOWYLXFu4NcUgAqIbnPphW2jLq4m57fEInV440c77YC69
         j4NE2vfow/aYepk/FPhumuUR+lkLlTCe1pgJwzRUjRHnS9AFatc0ny5ai9I7EI2zcFRv
         a9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594517; x=1765199317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ART4te0v+vV281V0YHRF37dtpcBxay9iLJ0GSUM95g=;
        b=tAwZZYr+X0rGZFODs4D67/DGgMDCwZhvZ6npj7hmc59xwCdDC04IJ1cnDdnlMMN4Xj
         r5N69m1E/lqo/aFaweUJel7Uk9jXg5b1Lhk78z8srI3EauIOH9hrmdPUC2+Y0C6FGXvU
         igIjE5weqPF/FdBQjrSbOkUhLu0Kv0wMdod4iFSphao6iUeN9d0zdYePNZ9bTP1Q0vC8
         n3KRIYyjzkWkHK9NxivJRixva54VBVudSdy2Nrwvy5C5/JJGi4nyTdbjZVblHXPO7MrO
         zTdNIeDCyLLrlrx63xaeUY2yqOo0BBvU8ETD4pSoXXPK1uRItX4rr0jvOUwvAIGi7zuR
         DL5g==
X-Forwarded-Encrypted: i=1; AJvYcCVeimL54LVpYwPZWso23jYLjHS1i4ldLvLidADszIZdCFKxmZrcarcMAnUUiE61kv+JaeA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjKSPu5DoEafoTZr3gW35yY8RIZyc67y1PoKaUNZE6fMwPbrIe
	pywBp27T8noKmUH/cIgXXSMGDCmQc1Lq3XzJ+MO2PtKugBQiU1HALLyU9L/0Dnllrrc=
X-Gm-Gg: ASbGncsC2VQAJ6nznhrEdr3UjHHT07dR160ROlCuKOrSCBD82nsseBSn83hQh4wf2rT
	HwNrCyzI1+OAcw223IHOHk5c1+vn0KNxvJiYoHIH5KdWKWJVJVtcZnz71AKbs7M78rBaHu83yuo
	ofmj/T3I4XNkRXd0FxjaMho6kUkDs8+5ArcsqoajEiUBGeyJlqwBMdAaJwo11K3lwSKV2SToq+/
	6xoKT8xnXD84uzjt101EuKdnRZcoQlQyo62a+u8lmIqHHGnopVLbWF35leSLQuLFHI+BmGEfaqp
	h7mZjsa9h1cp5JJvOXuA+GravgP83YxvrRqywcSw3tZRptV+qntfq0aXnjJYdy1ig9LoXDs3VoO
	yipGIW5M5raOFXxc9cs4wUG4s8OUFNMCz8r0r0d10Q+aYuz9+MSIjRszIwR7GNsWiz/WYniHPH2
	dq9E2rI0Tzzz3noo6+8Aq+mR0Eka4=
X-Google-Smtp-Source: AGHT+IGy8H4hZkMdsPgp5ClNfSZPP5T+1EX7uyKwcjKjvElb0fOWVlyxh4nPkZ/Ts/Rfemd9Q4kkuA==
X-Received: by 2002:a17:906:b4a:b0:b73:53ab:cfa1 with SMTP id a640c23a62f3a-b76715ab9ebmr3096430866b.17.1764594516820;
        Mon, 01 Dec 2025 05:08:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f51c67e2sm1228965866b.27.2025.12.01.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:08:36 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
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
Subject: [PATCH 4/4] dts: s32g: Add GPR syscon region
Message-ID: <c8302f53fcbb5cb5afe42cdb15aba7e2e6ed7338.1764592300.git.dan.carpenter@linaro.org>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..3c9472f6c174 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -731,6 +738,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index eff7673e7f34..0ceca3caf133 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -808,6 +815,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.51.0

