Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8772D23AD
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970523; cv=none; b=h89ftNVJt61sYsgayGZoGvrO5DmM1qTc8mm0KzplWsCFxVOLWomoSdVIDd3ZOVvRLVeMMKsUyX/H3s81MiM0ATWdSEU4HwM9aO5K0wuBrxoGB9P2D1GnmIEJm9wH1tfStJJpPj2QNO2n+BE0kU4/c3sbsXS4zdEgkLkePRk2+pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970523; c=relaxed/simple;
	bh=XlJAvdpOl+lzdvmI0QLsJe4IpCVUpXL32migD58w4m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPWLpGhhleYVKZCnj4V7+A2ic9TmEiihCCFf2vnjtNbl10xXoHkYal3QUDsi0PNLw8UbRRyI54MNB0Z6ChafLIJiX8v4mbpbFMMaEHEhg1QRdI7Kig+rZDlusbFV93WDDT08s6JU4/zSgCk9ZfWP4b1zt1/8G+bhUKFbcfbQuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2CDXOye; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2CDXOye"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45555e3317aso4571905e9.3
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970520; x=1754575320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqjEa6NJuLKhar1Hnx2KGoMXir3yP3J42qYMb2JDkMI=;
        b=l2CDXOyeNx9jL1zdMESP2XYBppd4YRshDfO6KTQTUsdQ1kpzFbjC7uGlWaQ3f+3ZRh
         326eHI9jtcbm7JAxC2FTNJY3p3nQmxcyjkl8/HMnnihrqFJS+JWaqI2TEQgFAr8utBAK
         7HzMZS0w5C6N1x887htGSUoHi2QITvy1E9IYvQ9xxe9oRg04ofnpg4pPTJk1PQDVWrxO
         79YtsCk6O3v4ot3O2CBcHZxY5rTKnCRSMpGIpVJ5MU5Ew5hVGVB4+h34LxW57FqxKMqj
         GHhXrXxPGzBk5+8Ass8Jrv6VpfqOgiOGFZxrMZHxGVESjvNRW7Np1cK7x6i0bOtLhsbD
         Wf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970520; x=1754575320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqjEa6NJuLKhar1Hnx2KGoMXir3yP3J42qYMb2JDkMI=;
        b=duM/gInGJ49IscmNedTzQS+z12swwJpQsN973tPGmCsis+EF1nQkJz0Z8xbdcjWCpe
         IT/8YxzBdgr7MT6205d0n7vXPOdHqjqj2VSohZ0kP90K4gGttzd9Kfktw5RxkmjB2YJh
         HU6hM3jaKBwIcou/llQgtUo6DqOofeDoCbyZ5GSyG22tGTJu2ISE7z7rPDNTWiv5vLzX
         Xmz2r1Ayj3El4eat+8p6mr9gkQdTsR/YvyluZd0mjxKXSAFbuginzn4me0N8tD+N3tsu
         3QMCTEhJysFQwBSYNqLBS0mMH9xg1DHWQh9yYRw+/aqo2/M4/Wc9NIL8PbDKD6TOMqSt
         7qRw==
X-Forwarded-Encrypted: i=1; AJvYcCWwb8ezOtoItY2pYx74fWEbtorYyeARkwRCkjorxvMnv84bPaYDYojj54MrROPG3VZEofs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/jyozgTXAbnatClwPgMEyJS83q8ZumkVebzvo402ccAblXqZj
	LOd/NB96GxMHwDxMnv5jwpbIDJ8oL6BDEJ2EeEjxzZOyFsCp9z49JGAlL7WSlAf6u6k=
X-Gm-Gg: ASbGncsk3NuFuUBRCYZsqt/H48pZbOUXAgTu/GzsoIr+IklQWJ23Zaa4qTw1rN40gP+
	FbGt4Z+Yh1vlNQG2a1jAORmTgshSKeB7YWvSF9RHKdo2UNWUIbZm7SyFsAS/A3TbFyff2qOCn37
	oboKPJoXeiM0eqR7UrfPuvqaLg9sEwJlJiGvirbVPTa6sKu1Z+RfP3U2NQkW5ib0nJSvjBqL18W
	lsTAnwZbtFDQX24BG0KOQLZYuk3hCL5K9pSByB1Rc3MO84CKXemcjktaIbhArI++RfklO0TxIph
	ygSKkNiQC3fK+4nnZTgiEYc8jZGCpvC1xkGBXG2X4S/7SC8x5EyNN/Q9DRiq8wDTU1ck4BRHhLq
	N/47VMyKgz7XE60tL49um/w4QFuWq802UERDc5rwEt6JNZnRrZ535D7irtrA=
X-Google-Smtp-Source: AGHT+IEs9xTRBr8bAi6DfE73RMG6wNvvUR3ws14YWGjYBbTlujwfRrxFnpMHFkgHgq+RtECti1PpDQ==
X-Received: by 2002:a05:600c:8114:b0:456:23aa:8c8 with SMTP id 5b1f17b1804b1-45892b9e4bcmr70544375e9.13.1753970518732;
        Thu, 31 Jul 2025 07:01:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
Date: Thu, 31 Jul 2025 16:01:35 +0200
Message-ID: <20250731140146.62960-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the timers STM0 -> STM3 on the s32g274-rd2

The platform has 4 CPUs, and the Linux STM timer driver is
instantiated per CPU.  Enable 4 STM timers that can be used as
replacements for the ARM architected timers.  The remaining STM timers
are not useful to the Linux kernel and provide no benefit, so they are
left disabled.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index b5ba51696f43..505776d19151 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -40,6 +40,22 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0

