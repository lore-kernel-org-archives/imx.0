Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE928379EE7
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087647; cv=none; b=uAYU4JaF5mE68LUNOaQfi7Yc3Zg7FsGblivgBYMOiqiJK7k5n8pvuJ7BgFHjBbGb43Al/mn8PX6QXyEvX2BiC+Lid5wJhCIqHqZQfajrOQgIq09Cl4R0dR4sooguvUdbhSfwrp9oamOVEOvvvR8MX2ECqUILRzbYf1E1cD4dE7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087647; c=relaxed/simple;
	bh=HTxXW1i80xc/5ySMCXcIlhCujaED7RaMVu0HGBcwOTk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TGZh5axxeeqDfqN1S01WKWIl5BFobNISXWDRYrN6z5Lp7py0+cWsHUgW/e2qFnoOShkzwso0x+IfEkHj4ugZVvsVEPTvkTy8sVeTQJ6CncPaiK099Lj3AMnh6R2uZK8r2yTIHH++wB78fX6+BCBY6l4/TVXEdqEv54JYUxem+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc65KoaD; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc65KoaD"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso472068166b.2
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087644; x=1790692444; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=;
        b=Bc65KoaDeb+9xPpomdRY2UuacUXrJl60kypi41GN+zL9JSFuMn8jc83KeEcZk+IBD+
         AQKMFKMuhSannBghDuHWxQolSyiISLD/tqUVYCkMiYVurZV3/V1YJOXri+SA/nlyo3aX
         EEkM/lELCL3DM7Ns2gqsEXpR6wVQkUzg5YZHnj1vwhepGqA2wltGLQ1nFwCa92SQCM7t
         cLun+vQG9F290lZWxKeZ/vpbP3TzrBQKnIaYlur+NxiZfTlElERlO++n49jRROVJ2nVH
         c0nxmQajtZ+DzdvhsVXwUWXRG+Kz5QfDf0XqJ9VW0LRIXJjWUwc3/195jESRqSMsLD0I
         /XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087644; x=1790692444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=;
        b=2AuK6yfw3S4eRerulCJ/5Sfduq0KD5XO+9ay7WNPvbjqVvef4N1+NQsGTTeQG1MYmF
         bMwh0iAHouX7Y7DY8IdKLwScudVyoWN7aYEMTdKT3cZ6e5fKvui0tqCeiEwDWXkYYhhW
         50rWtjuMEr5+01lkWthtnE5HJMWM7goIWoNJ8ewx1O1E215qZ19VGtPrDOYh8zpZVpJn
         fbSpYFBWcVduDtULTdFbCe48YgLnR/F+6bwv3DP1gg/RfemadlwYY/gaEP3YoXN5hH8e
         EcRKVXqhvAPNTLcsMc7145qGdA2DCnxk8fAGTqXXp+GRRNVow59RHPl0TSje1N/Jlx5r
         I2RA==
X-Gm-Message-State: AFuF++lBf5vqOj300jvIjT1yfFyHBo6zsnHYJ4LLCDn3f/qaz15wxm4i
	M6lAQRLCZnJg26E1y8+GDJQUum3Kr4s+4TynPyk/lOJLDP5WPbKMEEHD
X-Gm-Gg: AYBFou0iOB4aMaKGnKMElyzqCmkQcevv+wwU/b6qVRUqjU7HUMLjx8lTBq77GkjWGp4
	7INipyN3/UeDil3y5E4GTyEd8pJeZ0mGRYoUCWwBz54B4yiOm63o2jEX79CqP1yGkSWFvQah00d
	7x14jcHBMtyxE2+W7pibICTgpj7pbl0/V8nZgY8t7IB+iK5cgQiDgvKwGzcPUhlWchyAarUwu5d
	owWjkrmTm9EzmJt+1udMpgrmWM/5+V4YgHnYvWT5TIyCTKfGO6YQdnST+lgqLt4nZOiUufUK3mQ
	xOYXEz2fAgTdYDlkNYUwvdTMNyBl4BBQY9md4tXsPPvraqVbsOJkxSzh4tfCcdgJf0Ff+E5ifCF
	ZIATaI3ztNhytqwaE4SRtivZ4PFIsrYj02WlQsV7sYlK/dmTBGMr1lmVkjum3ER0egTZgoifKXw
	fVd6NXAOa5fkCw23c9L6Pdbo0dlEj9c34U5LinXuBhHr9+NKfvZzHZTZdX3crnBgpTV1uZXuNrI
	zGjmpwYcnvFcnVlgN+r1h29PEFJI4i1TiQoZdfUlhyI3AOp+akzc0ifaQOjnUgyEH3u04+bgFRl
	U3otL12U
X-Received: by 2002:a17:907:3cc1:b0:c27:d84e:ebd6 with SMTP id a640c23a62f3a-c2a157fcf13mr1269533666b.25.1790087643972;
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Date: Tue, 22 Sep 2026 16:33:45 +0200
Message-Id: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmRsmoC/x3MTQqAIBBA4avErBtIw2i6SrSwmmqgPxTEkO6et
 PwW7yXw7IQ9dEUCx0G8XGeGKguYNnuujDJng650U5HWGBTKEcngFdjt9vHY0lhbUq0ZqYbc3Y4
 Xif+zH973A8LiKiNjAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin, Aquila,
and SMARC iMX95 SoMs.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
- SER0 reservation for Cortex-M7 firmware on SMARC

The UART overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

The Makefile entries build standalone DTBOs and ready-to-use composed
DTBs for the corresponding Development Boards.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso  | 14 ++++++++++++++
 .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 5 files changed, 71 insertions(+)
---
base-commit: 478f68c644732750f8386e4de7c909c5ffb26ab2
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

