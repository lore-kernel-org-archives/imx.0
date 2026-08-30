Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9E3B95E4
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105804; cv=none; b=nuFmQmRBam7VzQhB7HqiJdS0Jz7weZrDKftyQWjIwhTHaFE9oJkmqrQruwFyhPcTqEjlYRorQXTU9szbudgB6DAK5dYosIaTfQy3vkCzfJKfQCu4SahZHjf4ZcIMYrErb/j7y+J0oqvO0Q+VWJAjR6k4kBLW11T29UrdKrz4H98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105804; c=relaxed/simple;
	bh=oiC51w1NPaioikE1Hg9uEJxGeYzaTROkH+16a9WiVbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJ9PFuiaUz5KBeK/dCPjQs91RZWAJwv680X+dbhwu5w0YgfkJxV77W4vwZXp0I8jON2TDE5LYoxnLM4wHtR5/y7NzCW27qnrXlf7hUMpRjaZsWeq1gahg7Wd8lnM1wy6q1/EqYu7JGn6Wnw44cMKhtPyIsw+ehNHp2zOsoBzFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBlQiH33; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBlQiH33"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c7364550so2754887a12.1
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105802; x=1788710602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=dBlQiH33qlPSgmS202RCeGLuzXbgTX/1rEzA6Ej39QNnvh1iLVzguK/A7G7dKuAl/O
         LgbrWRICzpIOL8SkTWSYksjjv6YJ6CZuSadr+uZNxg/h2aF1S97r18DCqT8a7HrpeMvd
         iB98J5Lh0gmT/fwnt1I15vD12M+PPlWknLZcYYWdociQYmyxzZs6FmY8fLJlK/UdoOco
         rEQT2+mYxBvEh1JzEig0dqoNYWRygbQZoUvPE0qPxMWyrs3pa8RcxPTc+d61Wx6XPI6B
         yhplJtH2iuYQrBiSQ/0CKuseIEZYeeSO9hfYMZ+zqe0K1DQvqKLiRKknb7SHbod2nCjR
         dmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105802; x=1788710602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=dg66StXJwJ/+cDSe8UCm0fJs+zkIeINHB8bZ2pzomGXE2V30kpDQU0UppXcPFLz1od
         O77YrXMxEU/gElScXYvrNhtq67wtGrCWTjCh6f87ccHhAYfxyZ+FWF4w+5cRHcyUr3dI
         yNF3Nlo4WB0+9CEiXi4Vnn2jC9UJGZ7ATsIm37IyT+9qVsZ0yfodLCRYB+nySdA9JQ5S
         1JsRThoqeokngeLMS/tpTwNjF75tS36NeT4aBFZoZI2l4Dj1TiOS/da65Xc7HntKgQCT
         B11ynYznvXlEel5NHAloDenJraZorv/gSttMhHN3uQQIqomyb70rA5WWYUUeoOSmB4NC
         4p1A==
X-Forwarded-Encrypted: i=1; AHgh+RrKx4ijhj5KvFVMgNGuWsa/7MYqnoFZfCQA+zza2/usoKffHzz/gX6NhTbfMPfPzgTQx6E=@lists.linux.dev
X-Gm-Message-State: AFuF++lC4dBjnmmvvOaT68JsIhiqKmD+UZjoxYkZO8gVK8QRYoSnKt3i
	0rI8eGSSELuk7mF8TYAYRvt5G5TKE+xKyp++u9rUND6liJkwMVOWb9av
X-Gm-Gg: AR+sD12C9PN/TM51i8vtOnE2r6slVSuw4agRRxn+E3YUQQwXKbg6ez2pTcqe7jjs6JA
	WB/59rBXyxP2Hr+vK9Sqj87RX6IvoO48q4nB8o+8NgUIRY7U1O0GiyeirNXQBMhI8dIqjS1cdSg
	vgg7e4eoYIicH00+2yURLkD7HwwaoOW7RQXPBMhpg7LULZIy7Mt9mJJ2Y6cMFQWVvpqmPOQb38V
	eClzmprnkgmzcUquCK04iB33kmdFb/PWfY2cnTxl7KoWxZC5RB1W0w1otfT/k65LaPgprOo8rLd
	n59xst/aP53NBHsQjZ0E0g1kuzTAYbufNPXki7YcOLAkzSvS5D6rB6YfnPOY0vmL3gO6VKZqZhP
	ePNjeqWOjCFI5lR1cF6PajcN19CB2+EcN72XjmAgArpJ0BUAmIhUTn5XnYyETmz5/ybzMchGLC7
	xCzLRMZTmXod7Jnx4u9yDBL/QxR8iZDybyitLA5L3U+SLJHSn982GIzjAlH56Eg/70Dr89hZRac
	IOHf3I8z77a7i8WECcFHV3MgkJVwYmARkkPwpMjzhQugDy9sJr3
X-Received: by 2002:a05:6a20:a124:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3d2633a1e56mr31289054637.0.1788105802212;
        Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:21 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 31 Aug 2026 00:00:25 +0800
Message-ID: <20260830160025.211384-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.55.0

