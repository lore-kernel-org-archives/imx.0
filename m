Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40293158DB1
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719837865; cv=none; b=mr+ZShcW2Xpj/9dYA9wdNJvob1g1JMe2cTtSAFdPUw6vmfCI7W5GIm7H2IFf/uBF/dCtIzpg8p6p8I+cFc2ZZjnkjYhqHrId2yK+dZHDXD8tYTxt97lVUQ2lip7qVvncs9sGS1z4i2tswnAMXoyGzuKMNvaxDcJ9/XH31/trR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719837865; c=relaxed/simple;
	bh=O8BXXu90uaFR1Jb/1zZyV9jZStuqATmFhCnlzHlMlVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BCKwPGbtUUFusxZes0F5xpGoUgEKp8Lid+nagPf7dkXhroJYxKe5yMtQxK9ERuYzdbF6WjoK4JyyCI0YgbYb4eYiSREhPSXrQTWNZO7Swyp28rJ6N1/EeGt4eeuL4c3qJS4xknoAq9z5PeqUUltb5ZHTtrWF4voeR9EPuF0fLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2ZZ7af+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2ZZ7af+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso23135465e9.3
        for <imx@lists.linux.dev>; Mon, 01 Jul 2024 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719837863; x=1720442663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9oUdv7urUmTInH8QMPbAXnIwXW+SLweFqKTOXeU2hk=;
        b=j2ZZ7af+iH2Esy5/U21LX/6xKMRVqHn4woTjoUyLc/wZsEv+uWSwZaxHPeeky2Hh0l
         UQaXmj1dkUvVF4QXykJpArrfXcMfseTN9kETr7GqI4aspcYl1omH54glanUFed5x8FmZ
         5rJbfQ/QZ4eDLiS1SVPAP8cFux3kJP/RAVFny+rK6HABAbHaUqYNQniGOXA1AJ4dMFTU
         XbviQL7KvXyHcdWop6DyBAyshgfgC3BWbsO4o8XhtF+w69zFQTs8dAS8N4ErnKxZ4Yv2
         GFjq/N4Z3rH3uUwRrx//mtK1DIiKQjKNfshUH8yfwVweoMmc8TxwjL2K7yoRava3sM4k
         Z20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719837863; x=1720442663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9oUdv7urUmTInH8QMPbAXnIwXW+SLweFqKTOXeU2hk=;
        b=kWsH5upeD24NoEu/n6ySDWyVuOmsCqMfmejke7ztdzs97cow/G4QmqwaW/yHsOp3Hv
         TLFJ3OCoHnoKxGHBxvIACZ3mV5DvPtYLFZ3dCD9O3I4Zo9PkliPHKqy+EuwP5ux91ipd
         puRbJw5do+XKgiLoS40nplprZ5uRlyKA9o2i0iMgA2hPwp4NvaWFntwm7baiP2Yb7GkW
         KnP7W17kdhnxf0B/F6/j/MfG+6kdB5OXLzYZj1OsEJgBZwQjw/oKYA4FAYDFFXTe+vwl
         flckx8Mevg2cJDenUAFtQl2ayha2VLSo/XXf4GdiAoD9fBitEbpLkZAowmDydzv563fP
         KhpA==
X-Forwarded-Encrypted: i=1; AJvYcCVru+ETnz0yZZOTuaVzYnC0wSO6qlu6QeeOhFdTchLQdObTS9H1/7vhb0nLuymZvS0fANSzVdn8qvItQnSIQZSTOk5y
X-Gm-Message-State: AOJu0YxrjeqxwlK4rapyvi3shcIEqBJq0wogd56iTtqR4Vb4JxOboLKU
	cAJ7TSRzW89ncGdN8MJfybPFZTUQm9wjm7NNPk//LGfTEON4+Y4D
X-Google-Smtp-Source: AGHT+IG/m5dh7OIdKUq1Jt30kdZeI3XnThzntipad3x9UGAxTUw1PaxNZ2+WOT85Dz5soydlYmB7ow==
X-Received: by 2002:a05:600c:4c14:b0:424:f2b9:81f5 with SMTP id 5b1f17b1804b1-4257a028321mr36950435e9.9.1719837862346;
        Mon, 01 Jul 2024 05:44:22 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e622:f700:f55c:ea59:1259:5240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e16b3sm9921005f8f.61.2024.07.01.05.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:44:21 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	ivitro@gmail.com,
	stable@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v1] arm64: dts: imx8mp: Fix VPU PGC power-domain parents
Date: Mon,  1 Jul 2024 13:43:02 +0100
Message-Id: <20240701124302.16520-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

On iMX8M Plus QuadLite (VPU-less SoC), the dependency between VPU power
domains lead to a deferred probe error during boot:
[   17.140195] imx-pgc imx-pgc-domain.8: failed to command PGC
[   17.147183] platform imx-pgc-domain.11: deferred probe pending: (reason unknown)
[   17.147200] platform imx-pgc-domain.12: deferred probe pending: (reason unknown)
[   17.147207] platform imx-pgc-domain.13: deferred probe pending: (reason unknown)

This is incorrect and should be the VPU blk-ctrl controlling these power
domains, which is already doing it.

After removing the `power-domain` property from the VPU PGC nodes, both
iMX8M Plus w/ and w/out VPU boot correctly. However, it breaks the
suspend/resume functionality. A fix for this is pending, see Links.

Cc: <stable@vger.kernel.org>
Fixes: df680992dd62 ("arm64: dts: imx8mp: add vpu pgc nodes")
Link: https://lore.kernel.org/all/fcd6acc268b8642371cf289149b2b1c3e90c7f45.camel@pengutronix.de/
Link: https://lore.kernel.org/all/20240418155151.355133-1-ivitro@gmail.com/
Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b92abb5a5c53..12548336b736 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -882,21 +882,18 @@ pgc_vpumix: power-domain@19 {
 
 					pgc_vpu_g1: power-domain@20 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
 						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@21 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
 						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
 					};
 
 					pgc_vpu_vc8000e: power-domain@22 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
 						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
-- 
2.34.1

