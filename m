Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E78940D560
	for <imx@lists.linux.dev>; Sat, 27 Jun 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571588; cv=none; b=df3PlKxT7f1nfo9PRTRG5doZy9izOjvMNf+7MtU9w7ByqOOZNoyCVdLw28XfT50uFyXltQoz2alPTx1Bpv3/KMyYCxxxW8Pq7kN96tdFrXbj+q1QBH+ZBO965bxO3Ybm2m+zqOzEB9RxGGOY0Nh+Fxp/PYYylXjElfrzmTTd8ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571588; c=relaxed/simple;
	bh=oOPF8wGesowHZTwgzTTwlv6PG/+pRbuklz/XtIB7O/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKfu/VgNybxPJV8uvuQegAOyL1JSJnOUJ9gDhbIlGEBRI8peI1+J1RM+l3JYnnSoUzC9naVhTdrp1fwizFgZdFlJeKK3LT96x2MkckHKiXCgkB1L71sD5OS8hz9AAAt38EfHrNaSF09vhcyGi67SerFK0YecvJlu3/FwfuZ8syk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3uUppG0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3uUppG0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49249707788so15349715e9.2
        for <imx@lists.linux.dev>; Sat, 27 Jun 2026 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571586; x=1783176386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=;
        b=b3uUppG03pPGlD5m7ESSqlrJQW4rPuruP1zjBO1u4j08hqUgB+x0NTjVJ4EBn7ryq7
         zBwqTAyWzSSANiGiSio+lsJulUaZ04Wdnh8nQj/t1OsXRarxDpMlXZttKYEI021Ef2Ll
         5mzxnyspk0KJluRGNh0OEYT1HSb5AVT7NuMx//hVH10/NhIzh3FgTvL2pQNpVR2jXslH
         0sTK0Xm0ZDFvnwAx0KVo8Ui2O7szx64jfv/IWav5g5PFHrhDzO9p3/hby/0WwDmVoFTE
         ntu0e3KI3IoMUWeDB+Ke/sBSPpbdGTirnwvG50ac892cv3cjPD0W3cmCFAWE/4FdPIQG
         dV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571586; x=1783176386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=;
        b=r1mibcskkjqSSAKak7QYpRrV80mPMEq9cghgTB32QlK2R6Kgk+9xybWB/bIgPGWrt4
         19tDUYrKBKMWiXgAkEq2u1P+dO/QW68zm3GNFIeFgClS9mEf0vqNBLd20AgTlYmHp2B7
         yfANBZfszX8nWsa8kiI9Mqk+4QNXnEsffgTT85WwXutO5iHfGZpH3y6VCU3rsaxTySNk
         iaRu5c/3Mw1W0zpwQpkhLYHEGxXhIZRfm2EOD/XVP5f75123UOKZ9pRi7xEsQ2+FiOkv
         GOeqjsx0Uz++P/+pamuOpbk/BlSd24yGzzO87xkhOYVh4uWZVCrAo44NPmbrYOKq63MS
         BoPg==
X-Forwarded-Encrypted: i=1; AFNElJ92bEFTaQJXY5JscG3RTnZQ9Z00+yEZmJjEMu9nxGAvu8GLd985Kbmt5l+JYJXURhM2LA4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpQGYIvTlb8sTezl4aUUnOuVH68ZlgNWACYwAlYX+/LtHaiFib
	D8xU8coYByRn458RgwlJ3wF0Jg6oL2GDzudCM6cGRYKXDR5yIHjzeFuM
X-Gm-Gg: AfdE7ckS/aCduGlggu6XbGPqL4t6pf+cb0p6aNf1pYzRkSTzap11GjRuf73oqLrez9m
	sTnrqvwF4h2wVTzZoFvEvd9j+QW9tpr67ok0lGtB5BDIxSrhnSCcwiAC1rYIcmMWnd9H/LQts5J
	Figr9/eIgQDiaUwg/wPtWOjGuH2cYlEeWLr1a7ugbiqhrsaDBfgln+5Z3jGyyb28V5+0XVNAveZ
	S1frPhx5Q/Zi+ntvSRT/liIdX/WujDAoRHS9hZvMTsVN6lMSlLXq1x+2RfEunkCfdPTUVfT6n8U
	pwNaJKzuJgdB8VpO7MjcMoN0c7sgzNfPrhtwXqVyGElPKVnUiCE8fcJM6hqJ7K0qBI2lagBhdLz
	pfvKguLoyLCnjtR+xUKeY7TPUeAuKrfX6wN1uq58318KxUOY/i4YAqj7FyHs33gwbnImdYlfLQH
	AJM0ryZN/ZYuDYEuI+kftnXJqaKMwneYoJTZZ3Eukacx6GoVwVrTF/1VfrqdvmftqICDelO1rdm
	mipsnlsl+gAM77ZjljC0jcyGJI=
X-Received: by 2002:a05:600c:c4a3:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-4926fc8822cmr82329145e9.25.1782571585491;
        Sat, 27 Jun 2026 07:46:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Sat, 27 Jun 2026 16:46:10 +0200
Message-ID: <cover.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-MINI
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove HDMI from commit message
 - Fixed eth regulator

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 4 files changed, 1082 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: 23a7098c710673ce8f245af317903ae46325a694
-- 
2.47.3

