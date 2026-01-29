Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572FF37FF49
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683744; cv=none; b=rAH7tfLSbuqjHINIoA8GTo63SDv/W5YAPFGzyE0XbpjWCgxJniHqITiY7TJgfM73N/rxuI+oyAa0sNZYDxnBfDMt3T6ZTmPYhB1ovwzU6erDPkeZMtOv5ozNSPHExQOQD1kiQKK+uroMKYpzUOEX4kQS/dsNfYY0w1k8/oS7f7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683744; c=relaxed/simple;
	bh=+qtb/t+0xDSDGfD5B5cb7Zpuf4UiYelnPEUWlU2u+Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qk7qXOWcDoRj2/sgTV+M+LMli/AtdJLWPqnFMQHXGARKHV6cO6jCHAlVG/W3i0BQc9+inVsq99QU5/Jp1f1RDovddvpfBYYwxKgCQtXWR0DEzfsyaNFaWJXwFZvoKFXzddalnhqrEy7pnDD7z9fz9W1Bzy9mPLWXpU6N4dceDDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXFDaLRg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXFDaLRg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so6301935e9.3
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 02:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769683740; x=1770288540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MaVol00ZtirOaVD8s5awZQiRxb5rtZJQIGYIkDlUXM=;
        b=FXFDaLRgG95u8hXsFM8Jy4nCKOJDX/w4X20zCJ8zOFO9Wixezc7RY0copqk/SdNkgL
         eNmJqIIwDeAG49pmpBSE2zNjJEb475QM3RD4ZwvCHWp0fZdSGL2sP7RcsDE2do/QxiJi
         ZndRDdbTBw0uYr2T+JBt7Na4Wv3t8GCNNKAneGqoJt+5bn13U7Qq7DYe9jOINEmnO5L0
         I8LxI0lZ5w9Yj3hEWfAWhHG2yrI+TWk3UKeZjJ9SQsg+qwj+OVAEKS2Ai9Gk14Lc3ZwV
         mouocUwYNaJYjbu73cNnCtQc/T8xAB/EXLm6rDWE1Drd4IvVqbr/QW6zwH/Qp0SF4+ZN
         FDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683740; x=1770288540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MaVol00ZtirOaVD8s5awZQiRxb5rtZJQIGYIkDlUXM=;
        b=UXtyXWIbmpK4BibZnXlqDMH4+OoYTUtYT6wjv2duIbH83Dh0GDrdzwoWzL2+4gGX5C
         zFmYhfg1Jsnfjug01tRbhfyF1kAyA0JgL8bpcHy7InU0NYOQq21TPERgAgInqufoR2Li
         EmdntMzJyZU6dmf6qoVZOMFljBMp89awgA2Ld8Ljv9VolR9KwmZWbbxG4w+5EWWJMvMG
         0SNVriWZxcN7/2RNPZY86rLdRcKnRTPNUCXOKEP+jmKTh9f0XwGqHoTCSQhHYj2IvjPk
         J7FTEvaMUWqVwohCYuPBsK2k5KZaxFehBWj53/AgYMhKJHVdPnQWsTJfEUF50rSkN53f
         0YIw==
X-Forwarded-Encrypted: i=1; AJvYcCVxkYYrex3QCRkLkNZ7XFIMQArMKbtpy4GTNKB8xACFgQMNFr8LjJDZQTZ/ePePWhvs+h0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKOPO2qkxYzwCTxdSLnNhgmb644+XfnB6ako6BlSB/bIfcgp5G
	SDXobu386rmlpmKud4jm+BHJd2/juLkvNLEjAU0rbUgbTT/GtDMqsBad
X-Gm-Gg: AZuq6aKaPnHnUS7BJPz8rxWGIC7uKf6NyN9RvnTvjJiWrq12flVnCTYGmNpGkt3T4Au
	inFHxwTM7GcP6odFOgXSHub/IVP04ETxFtQWNOvAdzA2x0P64Mo3uzsuchr3dLG6vn/UCjj1O0U
	fDsLra1LZvbtFA8nqJfDs3WZ07oYFzec76+NPwOqXaQMW8ssZVuQ1uJj77vXoCvaNwS1AdMJ0E1
	ja6OfAO0Q8J/uG48zIh0HgImirOCNXaSvYkx+B6wFnZFe1S5kA/W0B1qnD/x8LQFxYKQacnZ7JC
	Fa9fF/eEfKLtOKL2g1xXYhAZ8Zy6TzPEN3pFk9F/yJOJWBJRrJb+STYnfEK0A7suTBNhCZh2TmT
	b39tv6/cpZWWE4pUd+Jh4IsgzIgF57gw7c0NOJKPKvMRXlRSB+WSX6iAQNvRU3PueqWWbkuT2ES
	IL5CBZrHqDBVVXqQto24u9pJTAUVISxBrJpMXWWuhiB4dMK0LKJIp91h4FXb5vrAUmw2IlJ8j/q
	qiR7y4r2Gvu8lYPZlH00yhvf6/Vbg==
X-Received: by 2002:a05:600c:83ca:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48069c1a96emr105858205e9.12.1769683739413;
        Thu, 29 Jan 2026 02:48:59 -0800 (PST)
Received: from emanuele-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm13365525f8f.10.2026.01.29.02.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:48:58 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: fix PMIC_SD2_VSEL label position
Date: Thu, 29 Jan 2026 11:47:35 +0100
Message-ID: <20260129104741.888670-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Fix the PMIC_SD2_VSEL gpio-line-name position. It should be on line 19
of gpio3, not line 20.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Cc: stable@vger.kernel.org
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..f64c05dc50f8 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -262,7 +262,6 @@ &gpio3 {
 			  "",
 			  "",
 			  "",
-			  "",
 			  "PMIC_SD2_VSEL";
 	status = "okay";
 };
-- 
2.43.0

