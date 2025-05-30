Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B328B7FC
	for <imx@lists.linux.dev>; Fri, 30 May 2025 22:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643450; cv=none; b=dvjBwH8+doFCtgzopxy70sbh3fP1OGts5Gb24L16xi91Ta5AfHqyPZQRzXb3wH9E073e/Y+0cFkkw2sDwZBgLcHGhwVuMxDx3zYmoWRIwW1czw6UE2tuuhpcKb150YSgKb48GU5u8x0iij2r4L2bmBMvQPlWsBx26jq+e+CdMzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643450; c=relaxed/simple;
	bh=E5H/erw5y923F19p2XHINFrU5SM3HyTy5X/CEi1U/M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhoMB9yNY6Ikoq8XnO9rBqlcsnI2v0NNDdFeOUV1ejOeHmp+AZaCDNppLBz3vEp4TTTM01s1ozttfvoUM0fK6sw/QGJL+OBHY19gheKXaYqjy9TdP92pssBcITibm3U1rvZSSB90rwlcUnTpukymxeJ/rGsTk658OrpBD4LIZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X205B3gX; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X205B3gX"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c56a3def84so246485985a.0
        for <imx@lists.linux.dev>; Fri, 30 May 2025 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643447; x=1749248247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=;
        b=X205B3gX9q+JpH0r0DMNpmAq4ZnLa6yR8Oh6aMaVP8GaoJo7rjfJg7EyU17zt4TBlY
         Iyd+jUds5rQqKesLE8uQpdZ3pnuZW0q/uXkAtrqdh46PaoROcIOjJsz6veV4lXe4lbsr
         OSUo3lD4XGmzGVhOlSeEmhip9GPxj3o/0nuuugp41akxhj5yu1pSBFx2x5VPJxGETRtM
         BUEZHNYS4GfQsNfK7OIfLKpIWX1PzCb/XqEkKzIQVwGI3ePeWfjT17w/a72YpVMLONyR
         Zcgb1PGzFWRswr+kzO1q45nQ8qV8QeCqA5M+jvZmSB+Q3a57zyaP73mcZp9Fa18W17RG
         qWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643447; x=1749248247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=;
        b=YIGDlZ0Wlo86j/RJaZEhRrbnslXjJwYC7l69XobZu44gwKEA4R5Z/I9aBcbHtOpXMy
         wYRyu/8nREIRMF/HTYTT4qoYnfB7IidOKO2x7T3NQlNSDHCNP/D9N1DnIwRUA7KZuTgo
         A7jQidudvANHcubWn12/jqJ+a1uytlAu41IKKnxsJmoru2At+OfaCZHE4/GkCqb9Qe4a
         fvk9CEbVsZQGSL7lMN8LCID3qv6nhk45xZal6ufmRmxZ8FS97L5f4jlpXPSQtVlhevaC
         tyFYgpyVcxNbBHCj/OdU7C9prI5i3C/ljbN+iQ+yxW/irOl4nCeBGP426RRKME4NuUjm
         Ythw==
X-Forwarded-Encrypted: i=1; AJvYcCV1pTzoglhpRZcO9CQY8/QECSDKp5TvVvYsHOqbBp3Jqx84rXKtvxMH0ZVk3qa1BT7z4as=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw35VGmy7qlu0mwdlPM8i8yWgrY8JWgeDNFAI7BcJDv3WmC9N63
	2AvQ6cDJhjT2U+2XYYqvgl29Um/hjGBIP/2vnOM6YNJ5wvAke60hQ+5eG9mZFQ==
X-Gm-Gg: ASbGncseoH8B1dyk44Pw4QUJmKc+nxh910kCJZxrRhC4lS7eQ3XEv9Ey9TtaI67C11E
	WBhqti8T3WBXelxilP6cVhAGF6Z5qYwEFlG1m7h1aNF+ilFVZQjFb+HoYTLInoI9pqdCnXHUreD
	mQyjMKBJQ+z7nIhIgSpF/A8a+HXaWbJpTHeYwWOd7cE/XwnGVyq5fQfwov8cRMIXtHVXs6NvoCR
	MMIoJxSvOe75YR6lYcQ8kWq6BTx+EgpOt4clTsur/Uu9cO+b7oQc1oHT/GoJ9hcJd+6GhEpvovC
	Ej0jhXAezZc2pnx1knD0tF86QZoOQK/gOrstgrbB74V+CWPJAmnoQJW9wfCE4r1HxUbPrn9DXNX
	3Yt0x1MM1PPU1E2n0i1+MCkOK1urb/SOPGTeA
X-Google-Smtp-Source: AGHT+IHVMoarSqMhD1xuUWKY4a33bFNL62O9B28e7MoyTtfr7/Zp5UT6kyBFKWJTYEphHxoEKF6rQw==
X-Received: by 2002:a05:6214:4119:b0:6fa:c0c8:4666 with SMTP id 6a1803df08f44-6faceba8590mr72186116d6.11.1748643447544;
        Fri, 30 May 2025 15:17:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:27 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
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
Subject: [PATCH 3/4] arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
Date: Fri, 30 May 2025 17:17:10 -0500
Message-ID: <20250530221713.54804-4-aford173@gmail.com>
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

In preparation for increasing the default VPU clocks to overdrive,
configure the nominal values first to avoid running the nominal
devices out of spec when imx8mp.dtsi is changed.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/freescale/imx8mp-nominal.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index 2ce1860b244d..f269f7a004fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -89,4 +89,22 @@ &media_blk_ctrl {
 			       <1039500000>;
 };
 
+&vpu_g1 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
+	assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>;
+};
+
+&vpu_g2 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+	assigned-clock-rates = <500000000>;
+};
+
+&vpumix_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+	assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>, <600000000>;
+};
+
 /delete-node/ &{noc_opp_table/opp-1000000000};
-- 
2.48.1

