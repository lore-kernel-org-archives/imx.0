Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA213635E
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688775; cv=none; b=c+uTSh1mbe1FjkhFfet7Cb59GUu1YG0zC4NTunTw5O0bmOQCfUzJMwo3ywbvtjn/tf2tiIOdF2NRSd0Pblp6C81y9dHRKuBl8y2Q+estQjeM/0VOZ2CnSfFJr6I7TvM0b9xXz+XoTls2QR/eq9v2JzwdCb1YqyVFR1Z3s3Y+1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688775; c=relaxed/simple;
	bh=5R1Da6HbnY95VpTxU9D1slBlRFhdcsQvBhecrlxys6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=up9AaOYioYv16k1foJY43H+RDVj+hWgseVHYBOMZvqS4Nc2SEsYZKBogP7aploW5zZ9+MZkq0e7gRhgzuzDjrlSvNGhlSstEaO2LjSn40L7PiNw3kxH3KUYeNsKWgYpsEG9WfNtJcDoQ4MaHA5hb6H9dxOcdrXhBTaE5iRvCR48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyGn6Kyo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyGn6Kyo"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d0a2220fb0so48430885a.3
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688772; x=1750293572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=;
        b=IyGn6KyoVnYl6Msx2JMn/MqQ4MbCkCqOnZ7xDVPh+QjWQVTX4biaEfQFCOUnazAnwH
         ML9xQytwUqPxV5ige/Zl04qEfoT3cY2y5QMhzPnDoZrkOVs0WwRE7DXsA6wcqDGy2pyI
         tfel9J9o2YRFxqTWqMCLia/VOAJ26IdcSwbU9qqvYKXyjfAk+5h4uVr6BxfxwvAUbX3R
         UDfDNZ7UeQUnUxIrwjU97zzXBkmErxGvpMFDq4dDi/mu+TIalRfEiWJY1RBaKDY7BRct
         ih0bFe+hvJ89Z83DyvpzRTlcSpbhY7cRMy9yehnqcCxaruCZ5W/rpQxzIpNdi16CijAH
         6eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688772; x=1750293572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=;
        b=buOHt0fzEqUkqi2s2ywC+RaWjtb4JCA8FUuXlDakGZkBANxPg3UfooFSW4tmgxUC9X
         OD7du4zcsKD3mwHDEbplCxzrp1z0weUEF7rvy4I66sEt8mxC6m1QHY5WhsY9rQpriGw+
         CHhkVT/6CeiJCAFn1KeOZZ60/ZxH8Elgci3d4SNUWS3s/msHs6UdN4vGd5bfBzWZqSxY
         dGpHWF5mH1sYh8GEeElFGf4DUjIPndlzW9kw/YIEBnpZqekPho7jLrvPwTbvrhHJhP/v
         CY3q4NlevpsW654MafgQjxFD1nTSgUOWsTOr/QBZqozgaxOyile6hGf3urd+nd8Dm+vm
         kQhw==
X-Forwarded-Encrypted: i=1; AJvYcCXK4ndbPIc3/IfaOnwFG7rv8z4QVNwy3xUBLtNYhv7BOE7vyTt1jFRB/rc9BBmXvOUHeiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmEjOeCtt0um1PWHFmbtK1i3Stm1FAh2beZUXzdd9oMFSmRvz/
	qDlEaVZLDtmBkn1iXYgS2RgWGvej+7/ikFOv1ZdadKx8DNxTC61xa58G
X-Gm-Gg: ASbGncsZu/pf98TkDkk25djj2/nwwbak7qkkselKHrazfGwQZjLAk80YdB/bVBkOZAk
	+Gxh9HlXEL6gq1KAupLUwlbdhB05IppaR4PGMLphxY4djDx+PtaYg+LXshM997hwAOy8ZzYImxZ
	nuRby2b5t6rWlI+S5w56hfpH26Q3U1UXx5OK2oyk/bcgEqGlfTxwSXdmuSjJvD0eHdXvGOUDfDc
	QZD8QdPxVHRLTVYVHG+yYsTXVZGAWwjkzQO5V1fYQjXsl0PuFWg95r1u5GmtMmlAzae6rSpTOvy
	ZDMyM9VZvXVtnjXaBxIUGFdffmaTLd0pLLQMa5cUsKLvFXMCrGQoxzgzWB8sU5IG29Yrb0sRQnU
	OKWFceXiGAZgZFA4olhMIUPPC1n2QI2py9icLfiTemmdcfpA=
X-Google-Smtp-Source: AGHT+IGRbZTWvC22X7R6MpybUVtQlEi9vm+wQQ7hM+fS2BleTAKnnL9FMh3Xr4rqjJfDAkR/GVwBLA==
X-Received: by 2002:a05:620a:1d0e:b0:7d2:2833:6dff with SMTP id af79cd13be357-7d3b367bd6fmr167393485a.26.1749688772273;
        Wed, 11 Jun 2025 17:39:32 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:31 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
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
Subject: [PATCH V2 3/4] arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
Date: Wed, 11 Jun 2025 19:39:21 -0500
Message-ID: <20250612003924.178251-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
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
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

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

