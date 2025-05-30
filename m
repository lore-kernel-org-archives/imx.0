Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2886220A5F3
	for <imx@lists.linux.dev>; Fri, 30 May 2025 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643450; cv=none; b=mjWodeW1m7m8TMGdFuAXmbur5TtTPXGpbXDWSq8maLIMhF+JdQGzzd6T+DCpP7NZL6THj/IPYwfZayEPjwEmObQzJ9nl2F4AZ15y4Rke0JngiBzkVrwWj5VtPHtZFbeBC2gO7s8t5+eDuwe00RADtGZVedoxPdLlrIo4MAj9ECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643450; c=relaxed/simple;
	bh=DExqEOT0kX/jHMPfIZs0OV/v3fcxxd6h0sqWoIMhHDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCfL0b2EGvC1QT/uMI/twWV5hNdVLsM50mK00AwNI/wEWdqkBlAWHv6BQyhcMYON54aubzqS1foPJmFqTHHsXGoYsoS6y0gIwWFmEzJQKiQDPgxml896+9VQcKtrlob/0FfDHDWAxwasM+m+WtjJl3FLgAlepSVm8c/9RBjX5ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxkqfIJ2; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxkqfIJ2"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7cd0a7b672bso168980485a.2
        for <imx@lists.linux.dev>; Fri, 30 May 2025 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643446; x=1749248246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=;
        b=RxkqfIJ2dDLyCehG66F47vrzSX8+Uvm8Pu4i9tmS2H+rt2hYr/qF9KA4F/avpMMojG
         OUxSGKQGBkPlPm7zJ8DiuXc6q6+XltfK3Bftu5rJ24bdnjJX27HoPwjcK2sHaLPcBuR8
         QDAqm48a3fpJ50wpR9mCDX+Nedt0xnc+AgJXwX92wrdzfAbXibVgjEZGJI5V3jn0fCwJ
         C8gUCi6ZU3zubjzAMRo3v+cJIPK26DAQ++G3qFP6IZhKxhzY0z3lKntqSzCykwpw6mf7
         eq9k9MXPu6Swllh41NyEsmVTLzb7Nh84HyS2ESXnDjCZ6udkg5y73Wm2uF5CUPFVAvXQ
         GqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643446; x=1749248246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=;
        b=WS+A94Y1vBRqaRZStgFX82QFP67VHFzhccRJ9wcRTRiV/sMBag4hQzqO4jKvXmCLFQ
         WKZxXRu2eTlNk8DdfUB02tglfcSu71aBTUy5auRj2ozR+gvUAste+72XUpc98QGIwI9Z
         Nml2gc89Mb3G+aShiMMy9Hg7sz8zkSx4+lbmnYuMl+nVzlz28v8AKCw3Exgk3JC4/nAY
         2uGlunPdTAIGgwWMOXTj4MoqpdZPdp7bmt/k33H1UbwS5b58BC0swmZx8fRodNhN/2V2
         7T9l5iLIZuvagY8Qy21QxL48mKpM2yVe4/tTxC91hKQN8E9c+9T8AxqVy33OleJBlsMw
         9s1w==
X-Forwarded-Encrypted: i=1; AJvYcCU+1hrHZSYGhNGnmdWeHbQXfI8tj0M+z4ybfCOlR4EeEMFq4+RgDh0hmckVASiN1TzFfpM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDyOyTgk2ITDlcWiln3J5dbR/mNi1lFALqFpax3q3x3kXnlHmO
	DaD+sug+C0tCw9GsatqyZGUafMSxupM4zIAnbqeot2GP8iCA1EASZztl
X-Gm-Gg: ASbGncsxnfaHRat4PlA675gpqsLsGpQJiC1vFQzLH+aGToL3CUrQT/evNTHetwJVn8h
	p/53w1hqCPqAP5fnasCL+nfTBaOD174woAZW54fA/O00pNva1BxjggSh2HJO/hyasl/jvrgZG1S
	MclhLAdMYL+61MciTEC+/NdhT3h2N77xi74c9gKVALPB8TFksWFdnjFXwP7kk9se7WSIrYeEz9d
	MCUC1FHKkrh3F3lvc90NhaCoqldBN3VDpBVIpx42n2ykne+s7tFMSlWBJSwltQ7NPrIqNnxmLt4
	GBMJelF2wyWfwUkQzseEpaU7U0xOoUJ4INLnMDBup3JRTq9/gbnV7zw6N9hvbGoTqH2xUS4HHuc
	9YLYRQWWMBTkoMj7l/tbSAF9zRg==
X-Google-Smtp-Source: AGHT+IG5/kDcd76kYK3js7nON8eVvFn7F/M4ye+7rDR9BOtAKIBHqXL1giHYzo1HsEvEPCKdjFVk0A==
X-Received: by 2002:a05:6214:29c7:b0:6fa:c043:7781 with SMTP id 6a1803df08f44-6fad9090d99mr2047706d6.6.1748643445856;
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Date: Fri, 30 May 2025 17:17:09 -0500
Message-ID: <20250530221713.54804-3-aford173@gmail.com>
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

The VPU_PLL clock must be set before the VPU_BUS clock which is derived
from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bf15c502280..909555a5da4b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2283,8 +2283,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>, <600000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
-- 
2.48.1

