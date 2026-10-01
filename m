Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D13D45C5
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855063; cv=none; b=EQKLcm2foh3wr7U0t2xOrYUW2IiOT+0qGkxywUBbIHzbeiJIDHFdHvjSu20TBLf0+Ex9ea8RdAGoebJtyVlqwOO3ys7ZyKRFazJ+8qe+FmTLy6YaSai6ksMiteZByH7Ybv9bGvFYoF92ntf5a6+hdOLP+zNv89zH2hf5djXBvJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855063; c=relaxed/simple;
	bh=TrTvDfFn/k4uiEHyffaC4IKdjtst9K0k0gvyN6WQHvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoB/iLO6wc3T3/LMwJswdzY+rbkHYsI8NJ+IAkzHdJStvmjYRzUn6U19S0k0tZpLOrBKTi/ItDW3u8HOn8GSzr0dJKUlso/9oI0mfokY16gCWG6WaGHC7OU62yspCCNBPf+n95JhURGOuiezmkVGwdiTYOtszgfYMHA+20ZKeI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h21+6H9d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h21+6H9d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so4993110f8f.1
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855056; x=1791459856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=h21+6H9dDUtd8DnitYxtUsUWUuHY1tdTFfas/IPQx/nQCp44Trq3BAl6hrZQ/oJG3R
         g/uQquq3QghZ03OplgzI6BQ/jSc1KFxj3SESkSatfuU3mZSnj+YGUCCJh0qGzJDky8uz
         0VMZC2BVnXBb22XvHgGVAE9vHcxINDDVqDQ1Usya1TYbzJ21E0RU9CzBduHi4UoWaGMA
         oP+r4hnIWF4JFryskrHD/pVGvfGbIcLHXDehQMh7bYu/KwrzCv9Y6z5rbo8C0NXWTlE5
         dSn5jYh/PMAMQ/l4SnFQi7FkGK3CHliUHjsQz9DVVpZB4UBcRmWeb9Un2tvqKKiBfxHV
         UGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855056; x=1791459856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=gVbrq/eP11blrIKm0Wo5MBGzPj3Hk0koYkwNZj0wYU27mePQt2ZPQaDjKPWnI1h6mC
         4Mc1acB5dTgaR96n5SvW1cURPJqFR8JSdcfbG3sIjl8aWrEZJv4sG1wfbaLTnXLy2haa
         G0VW3IyV9LEYqXVlRSs3i2sPZa6YCafh7xH3ewnR8bt3CLiwVyiPx4KvfhnCgTxBt1Pm
         VcqhdH6po3tkEsIuDaRO/pFflTLFc85FvhnG9qIVaA9n04DaFgFQFLHPJ3TWgplwgzOJ
         R6VyB7M2aPXHxp2rbG+yxpvcO4AlsadsnxzzR9rDxo7AwWzVn0eauaLpGmMQkXSM8pOK
         gAxQ==
X-Forwarded-Encrypted: i=1; AKwUvBykPiAlhMoywcV4weA7Ygcfdg+vEwzjURiqikxI41PMqcd8aC3Bc9kyRFHywVjgen/tX4Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYLLqTK4S6d7ClMZo7FNJVOg+0cIwVJ921esjZW1wZHpqlVn+JQp
	oahEAiJV330bBtqwJY09EJ3F6r+kkUgq6kWsxOu2+lrxcAUGUr+9Oaiz
X-Gm-Gg: AYBFou2YT/lR69lQnEX9awXtxYt57qDKOdvOplQcFn99WK7uag7AA9/tqEWCSGIUY7a
	czBZ3esCD5kHLI8anQ79r6f09+H3TKQWa78hxOQM0ZqcTzUsfKSqe4o6+s+bnEvmTctmz1giPLV
	Zb/ynrIJhPbPBDXt6xoYIPkVJ130Qpg+/lY8fN9bthmm4TqQkejZCC8SIGJw1b0Rh5ol+XYC4KU
	SiLhaY90NGc/NrgSvwknHmTMuvgM515WOt/dVnTWKh02iNjhr0AMCflWYHrvVE78RUtsZZPnVUW
	3oFBN4sJKgQEg6qXMYrHCiRXWkLTsWD3QN1hNIMYmCEnrpL7l6YSxaPapkk6g7bNJPK47/DDO7t
	2BTKDGlBLVYP3xjIlqEbbv40VkzzTcwCwzjtfBv5LXEiAsw0r4TZwYlt17eMVu6wV8jLJpaOEUx
	gGFRAJlWv2vu1NexPV3rNWnaRtxiQIi75ckJTSdcdJoX1SdT2QyxkXEoTl0djx7vAXfCMJnmHCN
	UF7lsuIDGMkyIErck7hC9pNpZlDpiR9Q79rvW1wZS/5GPjeX5yR2e5h6BLlR/gUuDL961HYz8Q=
X-Received: by 2002:a05:6000:4b18:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-48b024d523amr7320787f8f.25.1790855056060;
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:09 +0200
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0

