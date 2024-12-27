Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DFD1F9A89
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318666; cv=none; b=F3kBCdbiZEKyK7uCT2zwFiQcdH7lMO+FHxV5/3RIP25L2V5B4UXt0oCanpYoozwcyJkGjR3vx9W/yhPxi+hs/JH8j+BDVyT1+YbAGNE4/P5hD9FDSECWY5e3vwXR2yGHXAPI7oY0Tiidon1Y6bXkvzZqiUs9TQZLbJNfFrPcSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318666; c=relaxed/simple;
	bh=VanAOZliSmRzy7jeQcKxNf50IVe/tzUMFdewwmrY7jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuF6EEAWiMoBPdcCZRvLKYVQXK4a5yWsppCd31N3xf+5gBtgYcOgE/TUhAbi/gyvKzRH24XFBY3Ne5I+1wLz1MCyZWOSwOtmRGIOJaw4NheZHrPbeE6aHyNqijrWy5ov1Uvm1SBCIgB+1XhbsMnupW4XO5Du/ThzJrKH17T52q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BOtAwjiO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BOtAwjiO"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaef00ab172so487124966b.3
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318663; x=1735923463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Ol509AXN9QcKlnnsRu6lr9QP7BcBqQWxrtIjE7WLU=;
        b=BOtAwjiOjDFMs9pwUtGESUqw4L0xenh+QxPKRJjqvqClaxSv929qxB4mV47ACb9kOP
         dXJ3XVb86vku6Jdu5EqskBp8G4a4mKLCMeY8Twv92Ohb7p5I92JgktFV/RYg2fqP+brQ
         7DBU73+gImpZHppjj0xSA+xDYCnICdKPVfYII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318663; x=1735923463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+Ol509AXN9QcKlnnsRu6lr9QP7BcBqQWxrtIjE7WLU=;
        b=r5mK4hHQ9Ieg6GivtSVbZGMni//qM4eDVqby3M1nKjR2tvXFRVDpluRDByIb+zU9J6
         0YxABgySqbUgP5a0JyQ4A9CkQMIXyxrBjWCXl2Oq4p5DwfHLzUDyloP1tsiHLb9te80J
         +GmtiXt0ISENTovvcfsO8jzMIbzKsIduPwA71GPenW9CG6zf1L0Q/OoEGwccGC2JOAfw
         M3lIffJqT+GKaARc+DdHKhZlR22yTwenMG4AvSDPfjvGnDMaDQmjX5jpk60rbolZGwqD
         0GIkWJIUX5/JP/IbAZz4h7EruQzA3kRvGxozbAyCMMisiHx2Lmy+WL9pLWELsm544D6L
         O/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw2Xw07vjVVcFxpiEmcN2za+NMXtJb0QM3LoRhend4jchYqgv3rjpdcYnneEPfZu4O/mE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2H89mDEJxRX4vD0vj5B5dLLSobAf+/tMJsYTSP2Ec2rchRyBl
	Ez30AVWBfDYpECbWs+3eLDtLjOkVPd4WvYgGsnBLe6djs1iMRfrTfdHF5wuiGdY=
X-Gm-Gg: ASbGncseySEysjDGFT2ug2Y1jz9mqQVbfxi5mgg/WQNv0ahgtZmhubu8mId4OBah1rQ
	AuzMmiuWVL9lFgAZF+oEcSevuCT9IOJMyd3fw+B71jretDsa+78UKezYGgHdNg3ou5Z1R6KcbWS
	9Vy4v+aCfTVMnxW7lsVbLSxiiEhuNy7SEQOtYwisN4gGaYtfLQsZ4btyeB2D9ORrd7qwB6ZMfiq
	GjH0cCJ70hJ5b1bXrYfHRKYxmeUvadH4EmkWJ5ImF7+HATCjMO90lvb+T2CbqFP/h0R4tA5Z996
	dctBAGNBVX2/fry2r6NXlA==
X-Google-Smtp-Source: AGHT+IGn15Euo6aKn+YqBtAxfzqKuDORdglC2oyMCv+ocfoAc484ttWncQyapARm20g2sBw1veFNrg==
X-Received: by 2002:a05:6402:3206:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d81dd83b23mr61279573a12.5.1735318662742;
        Fri, 27 Dec 2024 08:57:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 11/23] arm64: dts: imx8mm: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:14 +0100
Message-ID: <20241227165719.3902388-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..b1a4cc521bf4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -645,6 +645,7 @@ clk: clock-controller@30380000 {
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

