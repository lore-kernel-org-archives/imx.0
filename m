Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B423161BA
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945713; cv=none; b=dRXzuaBuAvyHKy/Zgk+F8Wh75kaRj/oT6IHAvKbJ15S0knZ7Vr2sw+Cl3TLmBWzo7luIxDgkY6mVZ4bCCgLEmKtBv4mp+hcg+dIMM7xr5qnvNiXpXVteEYhFq5Zoir87/7l3arRNTaBs6APtLisnYDA/97iSZuoczsfjtMVZWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945713; c=relaxed/simple;
	bh=1wpmT3kyX1LpHVuDOa8WduzvRAXtfYcozUELimXaQV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH6ok4lZWWqLHIYtL7D+VfjO75AYoDj0PxDblI9uEARHqdOIEvaR0jTICmfCVvp3dRhksYXvsDkNNASy+DqjHiJR5YTB/GBfQT+dmf+dRvkLORnDJJ4O2M1V5Y0bHQ7mQJLFBOoUeqomPPsl2YlS9pCXoIgooSIWcIYsfl/SSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf6aAuk8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf6aAuk8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso23346875e9.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945710; x=1774550510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p40Qcv2G6Nwq3NC4ZmBz0invegjnt7tZxrcbDvxluio=;
        b=Nf6aAuk8n5I+CRU4QeGea5nZHz77+7B+dMz0MSyVio8eYZ5XgW57yz5rjLYK44ziRS
         c2RuDPYgOSkr1blI7A2cAKEGjdvRRoyytGrv9ptzYcEccPKq8pgM4Dg+R3sT59xw+Jat
         2AT0Szc+Wt4XxdTmB2jdbvlPfcSHxs/psOAS582JeYUUpi9dsIkZ5KeTyFAwOkouOS79
         FGP/YGW9z0EB4C0lOOBGVYPyL4Nkvqf0aBfBG9WIOMau7x6qsIogmPwieQDX2+OE2ETk
         LOFNfd7d7LxC9JeJYG0MmzMyrkQWUaAX649vDE3cF9oGpAhnowI6vltZEyt8LW10f3En
         0gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945710; x=1774550510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p40Qcv2G6Nwq3NC4ZmBz0invegjnt7tZxrcbDvxluio=;
        b=Y9phPyT2jmi05aqj0Q2pT0d83nHG/81mBoWhOdrKIkD1Ofw16sR1Ly1tMGk74L2bEh
         FBFS5maLeCCVKXRk6TK+eYqLeW107Gce5i6FObeYwB8BFi5oWF2vSC1APLk2QOuDN8yJ
         iVzn2ksvceVcYe2fXQaVVhfckbBgc6ZuZDY1zf3i7yRL/PYFW+JbhK7bzHVX52xwVXOo
         P00QaHvlwfy46lTria0lV1lm9ml1N73nypZppwe0999WAkSRk0jygcuNfakrkP0Tmh8a
         SKUF/SdsRNaSaRCtpubUImbCTTB8aViDWEs3OELxzzQT4Vkv227Ly6aiqHkc7SbsMt0g
         eMQw==
X-Forwarded-Encrypted: i=1; AJvYcCVCDzruoQT81iZreeGt/hgDOqoyfqyqQHqn/Rp1OvAjwzZiXg6kG6uqJiwb384XuzG4jrE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDVeLaw0TmMJ1MKYC2tltygsyhbj+l/ldGgEwj+tQ+01ZCvRtI
	VB97xVG5ZqGfj7ccgHIKfn0B8koy7jDoyvefk/Byt2lV5U3R+1ASteiT
X-Gm-Gg: ATEYQzxtazU9fgk5i1ptM7IAu+ec6bfUVOYohlSaavSfHry89i4HAIMpHhF3ABfzv/s
	2cCaLG23Tv2/hCpMBg2zZ1w1RVRo0q5PjU4uLFpDHFy2t+BzZ/GgZyttP5jOsZ972OZFl2nL66T
	j9tKqUm2TqEw7unkZmauZeU3eovzcMUjYDxKryOH3J5V4X/qWU0CScagZnCWF/U+rn9UKgtwQhw
	QIagFopYUVxB/E9JKHs49YPD3fzbyX1Bw49zpzi2kj7QuXr+J7a++EbXTVzxzFDnkfyALb0p+V3
	dYyMEKhsyvhfY0gjxra8czuCfUNxuUy/Ns/4UUWN2pPYL40HYMH+iquR8Tup2lAcRCAvo6qy35a
	2M3q24gCwLAem/wkiecGKzGJLu9rtfSiZDKP1SC1Ezo+rUgK2zehu3dT++q99TRlE/I9p9U1fzH
	m59XtSSCF7/lySWUuJ9aoHoDGqPG0LHMdSNC18A/ldV1/25HmTksVjjfte8WDjez0oPuUIUFVVQ
	U/0Vn2x+Q1QMtWNUJkX2spH6kHgf3Rtm6Ehff0=
X-Received: by 2002:a05:600c:a312:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-486fe8b7afdmr5739095e9.6.1773945709911;
        Thu, 19 Mar 2026 11:41:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Thu, 19 Mar 2026 19:40:20 +0100
Message-ID: <cover.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v3->v4:
 - Remove "This patch" from commit messages
 - Remove wrong enet reset gpio hog
 - Add symphony legacy dtb to use old brcm wifi module

v2->v3:
 - Add clock-names porperty along with clocks

v1->v2:
 - Moved phy LED configurations to symphony dts
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

Stefano Radaelli (11):
  arm64: dts: freescale: imx8mm-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add legacy
    dts
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../imx8mm-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mm-var-som-symphony.dts | 214 +++++++++-
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 366 ++++++++++++------
 6 files changed, 514 insertions(+), 143 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi


base-commit: aa31e3bb9b98a86e5dde5c0c637a11cc57470281
-- 
2.47.3

