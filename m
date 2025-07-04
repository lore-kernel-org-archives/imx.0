Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12338189F5C
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 01:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592048; cv=none; b=b+pe8fkWVdWfxPHW1UDiMrUVH4z//JNyUMKl23l150EXp1wMhqhXmyFY2rSbCXh8/zTkDbhk3KDxKru8VwIHmRZT+GUyzv4bV/RhrnJpM86I1ig3cvDqrewJep+a0Uq47n09lCGQaWKweWgTIa2HnR571RcGFrFQX2+QF9eIW1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592048; c=relaxed/simple;
	bh=EKADNKUOgcvSk8Q6BTbOeHECDDwL51pLlaVHXkuF9ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6sesOjOgkYUk86A/sHvXJoAXPT0SFOA09oI4jriFIV6PIszH0pndAaYVisgm0BmD7gvKpVgW2rWpIeI/cWyNxsVAyWgx8l/rHaZSWSOfmMaxbVPmPm6hyDZU/3WunR0tH2z00w0DPNaYh4ezgn0X5OdNDu/lxf9zIs39us8wQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c5mNcOXu; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c5mNcOXu"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735ae68cc78so360962a34.1
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 18:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592046; x=1752196846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=;
        b=c5mNcOXuUgJYy/3EtvSy1brerNmiJ20EUKGTdykfPRMNKlM260r1GELHTtsznl1j9s
         FJv9FHeODiHweERDbtRSmeVlxPYrSqQ4IGuTCQ02B4a6+FWcwwxrlhz8jAsbb2FhqoAw
         R1Uf7apjM2w8pBVt61/udINGXoTfINb2HbWtxqJykj1uCX2K+xU9/CUNI4EnJcu1S2JX
         Q30ECrC63ZtIHmNqPHKTtKc6RT02EjAezAckdz5Npd1f9/nNOu1kSfnz3Q1a/hGA++6J
         s5sc5KDXnD/xorHFQuRjRNCIPU9R+9qKUiE1+wTgi82c4/Dxs1R3WbdrW9h291Wy9A8R
         4utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592046; x=1752196846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=;
        b=Q1SKTPLkuFu+vN/eup+kKsJWHcy7yaznXy+yJXsrPPErHeHu1aLXzL/XnpHNujngK3
         J0Wu3DIvF84Vnx3apQ7uFzEkmF9aQl1De/lXqaMrG9LEuY36XjZ5lNSAFkUzwkyXC8s3
         3rQYi6ymfdbeqMu9+EkJyJMuE2UW0KUxSJu0v2tBlOLO9ORZWQ/tAQsc+sKjS4oiL5H0
         fOlPCMUkcxtJ+Y09oPwkeiPJrHG8+fQpOrr/4ieNasEsaqjIJdyqbhKzcWUwjSodPNXj
         FL0oMczqCdtIfVpAZK3ypVLonURJNbExSlBlOVebp/8TPmzVmNTWsM48oJlsj3wYLH5l
         DMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6rs8l1JA0M5gLrnQGbFvhXJuRCpLuYOGPd1wU3YF6vigSlEcvusPJlNaq0826BUTPB/s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNhkuysux8oMGvMWr2wUJyly/ppZdr2AZ+AqSezKenGtEAF2Eg
	FrRQSTS2I5/bOV/YbROBIg0mjdhPwHStQ0k+L/IJX4TmbFwwYPP7tUuKM2K11RqQQ3M=
X-Gm-Gg: ASbGnctlMfdW6WsDuGuOXbu5VzjcFAKyz9pHV1of5oq2g2tGVG3isvfK/vP6yP0ss77
	DW+EbePmdphENPSe5wP/2kaZjynM8yt+NrVJ7nXffZgYQk4AhNhsoh2yu0vhE4whJZcetJZDHTA
	dirF58iBFmJFWpk4zXl5SzOiU1f8/9eFvMxR64Kpc4h9IcjglwGrZEQCkY3s5SQCW9oVNdpIa3T
	cNABxTQv8VjDdcmxs0//cOAirKn657ujh9qlacfTuMPSwWv4TrOmUKObmngLco2qoqR/C0mYjAW
	7lhZVO4NKlvmmq5sHauLxL1I4nMnxvhorygd7iqq1B0czLBWRChV/omHvn90/XYSdhgH/Q==
X-Google-Smtp-Source: AGHT+IH4YcJJL/QSinLf0papR/EWjmhqn+rfvAaSq4Pn0BhKlOqBtDpJZuz+HI7qT2qYaiQUGHT87A==
X-Received: by 2002:a05:6830:8204:b0:73a:6d48:dec6 with SMTP id 46e09a7af769-73ca489e0d3mr227940a34.5.1751592046061;
        Thu, 03 Jul 2025 18:20:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9621f0sm204964a34.61.2025.07.03.18.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:45 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:44 -0500
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
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: s32g: Add USB device tree information for
 s32g2/s32g3
Message-ID: <e3e5041e-254d-44c3-b645-532d4d7a8f9e@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

This adds the USB support for the s32g2 and s32g3 SoCs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: New patch

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..4be6534ed01d 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -376,6 +376,29 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		usbmisc: usbmisc@44064200 {
+			#index-cells = <1>;
+			compatible = "nxp,s32g2-usbmisc";
+			reg = <0x44064200 0x200>;
+		};
+
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+					 <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g2-i2c";
 			reg = <0x401e4000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..191d2dab4254 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -435,6 +435,29 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		usbmisc: usbmisc@44064200 {
+			#index-cells = <1>;
+			compatible = "nxp,s32g3-usbmisc";
+			reg = <0x44064200 0x200>;
+		};
+
+                usbotg: usb@44064000 {
+                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+                        reg = <0x44064000 0x200>;
+                        interrupt-parent = <&gic>;
+                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+                        clocks = <&clks 94>, <&clks 95>;
+                        fsl,usbmisc = <&usbmisc 0>;
+                        ahb-burst-config = <0x3>;
+                        tx-burst-size-dword = <0x10>;
+                        rx-burst-size-dword = <0x10>;
+                        phy_type = "ulpi";
+                        dr_mode = "host";
+                        maximum-speed = "high-speed";
+                        status = "disabled";
+                };
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g3-i2c",
 				     "nxp,s32g2-i2c";
-- 
2.47.2

