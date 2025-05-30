Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE9283682
	for <imx@lists.linux.dev>; Fri, 30 May 2025 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643447; cv=none; b=ZQ34gThFhvyg8WRCU8eTSsFxYr6yQjAKfoST0ezCaWhezkoZrqzPPpMh0aGTyX0iPSnBSSXGWGH0Iu8tT/opofs6SX0cYVZzb+hApBsrhEPxOsGL02aim0ywqEgPaqgPEBoWb1E5Xnfaob8H9YKd6f+YXs1Mog/kKDZUMUnAWPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643447; c=relaxed/simple;
	bh=NI/DZMbhfVf0gYJHLEtDEmzY4sUAm9HVyL4cZFmkHQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTPO++t5XojtcnGxJq7GwSettADdCY/rFSIkhoLTPB1Gjz2XOUYMsYTdBQYo3jHf/AHMPj8C1Kb7GhDE1xfveDYb78ZtvLn+8S873D5LDou2anXPKpDzAkrse1EPYbuyBczxX67dW8HXpXNXRDzKgDViqTJPBp0poaSLdbIfNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBgHnEUu; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBgHnEUu"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c559b3eb0bso164816385a.1
        for <imx@lists.linux.dev>; Fri, 30 May 2025 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643444; x=1749248244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=;
        b=FBgHnEUuMEToFyowvz4udesuS4Gv4lol73dA6+H4nu7DAn4vw0MPH8Q5LYUW2+xl9r
         SgP2Sdvzyr1SS1rtiGZ/gc2kvWB9+1vmpoCg2E20MhX7GzDH3kjWd54gY2zZBtR3EfC+
         nMxvQRzWhZpQSOJ92F3Y5mrSUkb618YXQY8+Vb12CMOdFeKHfqmQNVsAhnIGSIL30naz
         HWKYCMZORdKaPXN9Y5nOFhNOR/Z2KKoTijQdctcOQq77duMbSRVACzPj18Lt75s7fKAy
         2cqibcS0RSC4qhDni6flcI7oXNnmCXA3m11qs1HBlKZgjyQLHy+fVDmPt0WtsIMiEyNR
         7YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643444; x=1749248244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=;
        b=huywBrIqXot/QtT93UsdacbJ1zuK7Vg6+BjRMqvzldxaFcbvLBonuQmgGBuSHWJ7V1
         33WciPl6XwYWHvEPdjLGzDpIa5gKPl1nT2yE23GRbjAjKdb592sbNMJF1UB/4cMgXgPy
         DE9TgwHdhl1m0sxzwDQT6TU2nD0FZEMi3ZAiQAfoYe3aBS1o2mGs6kvYaglmFZKP6fy6
         R4pdaC4QzsoM53ADde5DfQUQnn7WUYDmYwiKjWY2v2vsyJGBgMSJFZsdlSrgqfGaUZZP
         dheydVwP3g4d8RApaBlu0vVHaj0TEIFgFr0AsVOto+ryM0AVIYVSQ1V/MzLuGeGWggKb
         of2g==
X-Forwarded-Encrypted: i=1; AJvYcCVDjYbyBkyCmfaH2md3bZRPnhmUTyMyxTq5BsHdEPs/JNdHnOb05prISndyd8BN3uHXQEs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7MbSoVjrDsAaK0secpHyWkxm2TQLpYLvU/Q1B4w9fh5MGEKQq
	ZeQKPKVidlzJky42txWJ2Ec6OWqwn2ZQO8NLjhu6aNdy1+ljBCY0fII5
X-Gm-Gg: ASbGncupjKvrMatnrx9J3TLZD/53G2IW4U1kQ15x0eb97M28X6OS8A3IM4ZsMuVfFfo
	Tp0DDGHSh1eSHXi77yqu9cGGeRPkwol7lHa7Mb+rkiUgp4QXt5+v8YW6zzN1NVioA/NyWvelgyd
	HUAQwucL9Wj1ptyqW1MicxHQfPYOmLmwIddqlqlS7vufGjRYUpUpx5fZi3GQQh/N8gCPKvgLABv
	XmWugA0OXYpG7W9MZ4/srJHaJlBztdgKxhacMinvVzBtJSLgEqkyNw0e+mdnDzapO8ACU/N03cU
	eJownMA8X988eLDw1fTTbYSLvM9Drt2DCLHTRaVwRX9jO0uKXdN/Ct0aMvNGleA1TO05hxrM6e/
	DvqrY0BaM5xxq6F0ZUTiS96PVcA==
X-Google-Smtp-Source: AGHT+IHNIFceukgWG6Du13MXecS6a6ABaNhOzxuX3ppo7fgyDaEE/c/wlZh8kZOiyTHQ1Fg33/RQ8w==
X-Received: by 2002:a05:6214:2461:b0:6fa:ce87:230c with SMTP id 6a1803df08f44-6fad913ac01mr2942996d6.25.1748643444226;
        Fri, 30 May 2025 15:17:24 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
Date: Fri, 30 May 2025 17:17:08 -0500
Message-ID: <20250530221713.54804-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
VPUMIX power-domain nor their module clocks since the power and reset
handling is done by the VPUMIX blkctrl driver.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..1bf15c502280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -876,24 +876,17 @@ pgc_mediamix: power-domain@10 {
 
 					pgc_vpu_g1: power-domain@11 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@12 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-
 					};
 
 					pgc_vpu_vc8000e: power-domain@13 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
 
 					pgc_hdmimix: power-domain@14 {
-- 
2.48.1

