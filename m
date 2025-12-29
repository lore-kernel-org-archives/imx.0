Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C123A1E8A
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 21:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767044256; cv=none; b=SMmJKM6G95hsrUZQDDfd1mAF6c4cz0VHmozAf19RW/HnDce7zH/UxcEggUoGxCeseSRN56jO1jlinvBRx6yYisj3lncvj71MVvNh8WPD+Qm0aGcxAcltToD3QGH1nbn/DBmJebvxW9rkb3vEHRekK/ApHDCjvM6tclaUxic1CEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767044256; c=relaxed/simple;
	bh=zIbPbz4p9WDTi045QfNFdh8jBTca3i1CozlJVdUl9KY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIRyAtVsP2DLNChAvLPAurqlpqb3V3Y10hc7AuyxTbV++f9iLxWnALHr1dAFfe1KcshaY3rroSY0ZJnq+o5ww/ppnHaSxUsfkDvjY+CoQ0+JX3rJViHQbo6AEx0R1gXhbFgPxl8cqSYFgaeY8pWt4SYX8VZqbyEbQcIXfFS4WWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0gYxi0F; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0gYxi0F"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so93792575e9.1
        for <imx@lists.linux.dev>; Mon, 29 Dec 2025 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767044253; x=1767649053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGz6E3CsAxGfK1c5nO3wGu40/ZtakdbQb1FmTqKeIMI=;
        b=N0gYxi0FaxDb2hdbWX6fQxbm97TGaUIEO9Tre1Ylb8R15OEe/2iavGQgv1eKa8YCDl
         yQIqoZY5NT/fr5jBlMrsGj88X31L9ek1D3zK7Aw2wFwgPTegb4MMee0s990Z5odBvGYK
         JC2LldE3PPfUOBQmzp0CMYK8OeTzbU0EurV5dQ7a9xUENAteDH1vPGrXvazhCnV1BTOL
         Dlg9WP8nAAfFgCIOpPJKIneEGGFciCNdZ7ePl+xIqIUD9kvR5sMuIPgAqz+eTArfbNks
         JdtkHoDh2s1KFg2vgVRnsgxSkNxGXdFjr7vw5KuhMXWqi1FynTsgrocch90mPzhpd/41
         y1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767044253; x=1767649053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGz6E3CsAxGfK1c5nO3wGu40/ZtakdbQb1FmTqKeIMI=;
        b=AzDZzFvN72q6c3dv+etLPUh9663/Owmd2BiFBj2DPwboAg2Iy4hsj7tpk3sUnOFfdj
         hykvAXlx/J6RSugDhyYiM1FZGQlI2pmpl0VJ6kJ60OY19bS0mPyjKHPeEEDm8XAOQB8S
         1gA2+alsRnI8+ToYUjddcVNO4YOYFf406hN1ifg8Cut8nLFQntWfD3NPvEINhnw4k4o0
         3Ct9RHKNBZhWj/GEHMOMdHL0grPZ2Qs3ml2YzXMiQlc+W5CYF2O0Vvx0AJm07dGK8E3a
         QPuVQFk2u4cRX5GlqUpojpuNlGG7Zs62XuCDeQ+jYIZMLTMyqki2xSJHnW7o/gCngcN+
         okVg==
X-Forwarded-Encrypted: i=1; AJvYcCX0odHWsyIRQmBSgrK4dgwJUnCvJhk2XTJc+yx1mUZbIbU6DpCEwefsDdTAYiYCECIW9v4=@lists.linux.dev
X-Gm-Message-State: AOJu0YznnsEI4qO7JDYiD6dr/cRTAoIIH2ywJFAptz9Vi9WystKjTCfV
	Qg9MeeuOCJPlKvXtZ1vnUdufDmutcwtry0/6bCPnTndwM5S7ht2lyrqO
X-Gm-Gg: AY/fxX7MAcOsqmK8woYcUttvZWsCqz1mTiq1yUN6ejiiqRgJsvjgQkjEYAiZkSxscIQ
	fCnR+H4AXj1EFmhhDtBsj6KmMbGFDd889LrfEj4suXz6N/QDDauu/aXUrTLCvxnYLaaDBOl3ecK
	efhKTkketStEKB7o3NDIg7hVotUrYKfZcSw0rExbUQmCIBcrVXlzRExRgcAQP/mQ0lKHE19GSQl
	huCrhtq4pZbpQ7Y1xjJS5g1Nusl6XFF2Z7vGqM17aco8B6ILNf/ty+g6zOyL1w4/9GKCopOaK+X
	fhFmkdn6VwWS0fP9402lj4f4zkzHZPf2R3rpesYuwKQBwxk+IvUdtSZ/q2G4xE9bFgjrG2L0cFZ
	slwwkvv4QuXbg84ergw7eSp/CgPWtw3prCV6OkPeAzIeVY9MR34CDynbhT+Kb6QYBTlNySOZ/oI
	LMlih5bMtTTl2B+tQW560Mbcdr5GxAHJz1zRI4ezqyuYfmII+WixNob+IgYG0wjCB9SWP5mLZh2
	1i8cj78mlJdInwiV6nC
X-Google-Smtp-Source: AGHT+IEJqCt8LPEO1gH1XPCkgXU5Nau72TepR4FWtrEw6Lak1kKcRdl1oqPEMIXKOijGtZuQP2wEew==
X-Received: by 2002:a05:6000:178e:b0:430:b100:f594 with SMTP id ffacd0b85a97d-4324e50d9bcmr38628906f8f.50.1767044253036;
        Mon, 29 Dec 2025 13:37:33 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm64046230f8f.5.2025.12.29.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:37:32 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon, 29 Dec 2025 22:37:14 +0100
Message-ID: <20251229213726.79374-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 595 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 462 ++++++++++++++
 4 files changed, 1064 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3

