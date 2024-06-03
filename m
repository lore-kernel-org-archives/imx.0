Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C815C3
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423311; cv=none; b=GCy3MoiBowrHmGHki4qd+H2VILOFRkxFqQrd3VIvJfAIDybsbsd8Ts24MOkkBqCVdlcpkL+z/GqclQUuB3ukZaeXvI6og6gw8LeZWYU5ZQMdpTK8rbtkoX2cR9RW5hPVEtTANAmFnU8ShG/gXkNkbnggpuwLLuGAOXDGis09Dlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423311; c=relaxed/simple;
	bh=1eBfmTHL1QaR8pbVnJDmzCh9p4iP+N0vXh+zBPtMsd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7i1XavnZnPd/GUt5rxH9JOOFcDkIGBjwNr1C0GrFvRyb4jcz2kv3OS+9WQFWV24XmubKL0HnwlN+PLm3iH+BLZPpaKhP26Gg++73/p1Fxe/86utS/oQWAHs9sBraFBuxU9T+UA5ugECGuPpHCyM8pNW4HDIcfBPYQ+/WwoSNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQSi2kGI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQSi2kGI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63a96so3845861a12.0
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717423307; x=1718028107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cud/6aqJnRfF1FRYIE7dZy35PpEncKlSngXb7y86szE=;
        b=fQSi2kGIXljxillGeFVXvzpvOvh5XdYQyxybCaoRoXEjhrzdSKxJ42e3AEZCJv4WQp
         VwkE6p0OFmgUKGXAaK87KjN5LzmHJTgV7oKVjTu+2q7Gk5REdiVo3bqDnTYtkHQky34k
         fa9cXWJiW/qGa/TdEVKkd5uvxbP6bgIMUfsoQsJ6tCfjNAS+d0qBK4T61xU+QlnpqzNU
         ABUg6XKqJY0No0BFsm6+74eG83I+Uy1cIpWEoih9fLgGaFOlSMzDMr41uiFengJNfvyw
         2UAQ5Q4RxO1UxXJHuGm/jhoh5qK3zYtdwjvg5bQjvXSEZeeUV1TYdufn2S+b8vx2rd4A
         mWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423307; x=1718028107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cud/6aqJnRfF1FRYIE7dZy35PpEncKlSngXb7y86szE=;
        b=uzU4aB7cZ3AhTeh+43dtHKMxNDRXCxiwqQBHFguDcwDyfqYz6L5R8TfgO5dafk6Ema
         8vtGiJRQSiRfzxV5Wr32WDzXKi6JydtaJpTueP4BoLccUrniApq/bYlCb6ueDAFS/fnB
         PFrgelrClmU6sg/Ye3MQuAlCkEES7Y+JKIGy7t2ByrRV09cqMAuQ2cb1ATqlBdEzmsAb
         Puv4OJ97Prc5lE4aEG8bjd9yQ01ayvjGY+RNchj+LOVy+SCBbEkrKOl8EE3HmzcggxMa
         ydJ1QcGLW3Q+fRLM6s39/3yQGxpoH7QS3wB6N9jgC5VhygSKCzpAOgdtpiONpaf1D8tL
         R69g==
X-Forwarded-Encrypted: i=1; AJvYcCUFx8X/hX7mQsPjwiKjARohUJ8PU50zdaRYdvLYXZPiAjQ/I4VjsJrus6DIK2HOB0RwrO7D4ct1OyhFbcT/1lzF51Iu
X-Gm-Message-State: AOJu0YyeKKfQv5IYh2doMZtWi24SJdzCqenJpV1HEz8kGk0FBCjVLSIR
	IEkaznJ43lCaVKHdXH2/K7Dc/I2kxgO8f869rgGi6/SZAupdTD/f
X-Google-Smtp-Source: AGHT+IHYwq7JslSgiiWPjfYTfZvNj/Ldq8H6hHi/nPS12CQ7DKy5/4mkKUOWlx7SsorXuBkZ1VLOwA==
X-Received: by 2002:a50:9f2c:0:b0:578:3336:92a with SMTP id 4fb4d7f45d1cf-57a3622b9e6mr6527527a12.0.1717423307034;
        Mon, 03 Jun 2024 07:01:47 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bbddb6sm5438541a12.38.2024.06.03.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 07:01:46 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: enable hysteresis on slow input pin
Date: Mon,  3 Jun 2024 16:00:45 +0200
Message-ID: <20240603140103.3845905-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

SODIMM 17 can be used as an edge triggered interrupt supplied from an
off board source.

Enable hysteresis on the pinmuxing to increase immunity against noise
on the signal.

Fixes: 60f01b5b5c7d ("arm64: dts: imx8mm-verdin: update iomux configuration")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4768b05fd765..7a971b235283 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -935,7 +935,7 @@ pinctrl_gpio8: gpio8grp {
 	/* Verdin GPIO_9_DSI (pulled-up as active-low) */
 	pinctrl_gpio_9_dsi: gpio9dsigrp {
 		fsl,pins =
-			<MX8MM_IOMUXC_NAND_RE_B_GPIO3_IO15		0x146>;	/* SODIMM 17 */
+			<MX8MM_IOMUXC_NAND_RE_B_GPIO3_IO15		0x1c6>;	/* SODIMM 17 */
 	};
 
 	/* Verdin GPIO_10_DSI (pulled-up as active-low) */
-- 
2.42.0

