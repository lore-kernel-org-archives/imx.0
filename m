Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7E3CBE7B
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602550; cv=none; b=QQz9/+2UvPbXGoetedvIBD9RD9X236+XSqgMROfhkPiKRa44TXBdn6c0coFD0ZbOG1FNJcm0uh45rH+fiQyFScp4DSYNz+2X2dPgJDyYxPjClGmD3qyBmJ4aRSGMjK1OoHK0PH6ZDbUiLfbufR5YeiQJqGKkmWeC92gu8REPpJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602550; c=relaxed/simple;
	bh=+uF3z6h7Dg/hyeyEZd8Z8rhwZCvglZs6FhC55w8ugzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHMtKkRBjUwgOu35NJ5EHk411DLuOUDHEum5rsvy+FJmcOAT9ee060UAiTGyRspF/dLizwJANG7KvCo4x0fkYnsy8GDDzckFZvxV9jQfPN67z5zA37eGu89niNOF48cbZNVonZfh8Jv4mkAJnXza2OtBOPVE2lEz2NbK4CMxf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqn5ibPf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqn5ibPf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe655187so21456735e9.2
        for <imx@lists.linux.dev>; Fri, 27 Mar 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602548; x=1775207348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=;
        b=gqn5ibPf/u+km19hZpd/A8lbBcTsKIol9oawmHtUUsJaRej9GYR/h744EWcrBB4pS/
         b7S12YYh3UmKBrUow8ND7GvH0+y+M+MxxO5orPm2WEiyVx4+W9reQTqet1oIMIuGQxO8
         cTYheceXjHLVuK1hw/CZLV/gfkxpWnKo4t6w+l4GsEaP9UYf0LUMOOMHT2w5udWOal50
         EUMcga5SP5tu7HY2vG5dqmFozWXP9iv/LKeD1LkfQLKudQFM4z3FvNegRwtFXYkyoi9D
         IVY6nF53PLZ71lWExSX8dNzKbfKOiOZ3lFtAyUQoSAwAuLbzrv8TdYWbk3d0k/2kxbqs
         nZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602548; x=1775207348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=;
        b=I/u0T1yubynQYhQqxrfToEcb0mcuhhiWKh9Q2gK3T9LpxQwm+fbbpeCFO/Uy0dSila
         r2+mUdAV2M7FxEG+B2W+jPQHC2MLtfjIRDSfYZWnZEgGXQAof2l4nGPya7kpDhEQYYZ5
         iQ1s/AyXsh4lLezM5IbvmS1XNM/HleL4Kp0wfpSXYWH10B8ksg7dj37TFJDoGemG/smz
         /TpqIMNMFA5UpVrjvr6psp5aJM9D5Yf6kpVZ67kOi+GsxT1Uy/Iu660lzgzYJmpstLJw
         3sLkMMqbnc+0VV5+iWs4qGNhfE3ysQAHm9ZErTzWlV7OwJNIQ6AE6peV0fi5Qzq0SES1
         fAJA==
X-Forwarded-Encrypted: i=1; AJvYcCXLs4MY9S2SqhhDJ8FQEaVJakGzK53wqEnCn3CdOarPAcKR+10/o/PBf4Na5EUd87dvPF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3DujD/lYJzWwd+2PRCtrzN7E+3yforXyMys1ZpFQ1zFcEMiw4
	LS/va11xGfzJ+YUV/aOKJokg2fK60Wjt9Vyxj6EPhcrpw+waHeX234O/
X-Gm-Gg: ATEYQzydXJUbqyJ4lPI7hOLHCMlBth3gAx+ykrFvroA1MmbGbFnOQCUo8McgrXtfpnL
	Tpv/2o5xqME1FOC7koYh8k8ZMHM8Jps2XKKtvnUSbFZVBeQLX6P6AgF+Z70QVSsVTdBr+rMgDZA
	WfpJ76gL0B8Kwujszs4Wp95jg3fywfvlCMPMCidYqp/NW3tRDE6hiCPSBIFW9/vJyKb1r6WwtAp
	yxsX39KeAf/bkQbIANanAkDy5ykz0vkjo1p2alAl/PY/M0ViVl22UG7m6fmuNfZxPh9GYdmz4ZT
	CwIHEAZEWwI5wQP8j9seSG4MKrioQWE6QjrcbBfrY+kCOedCEiia49sZG1CSWGK4d6QRTD9T5GK
	sajg1Hoa0Z6qBgtYzmajyV2JzheWXRPU9sp63XTTCl+UDHIV92760D7ZnxFCrAFRKIE0hWIYcDm
	ziO5mhAgBSdkVq3vHc0164HFYzIiDsdn3PV3ol6a/hLsNejoC9AjWWrILSor/ERdVu3u42/uN2N
	VzTbF6HzhCZf1kDcrPWOiStkMGw3R4A3uNOQ4SlahE5MFOr
X-Received: by 2002:a05:600c:6387:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-48727ed5618mr24598325e9.27.1774602547562;
        Fri, 27 Mar 2026 02:09:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:07 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX93 and Sonata board
Date: Fri, 27 Mar 2026 10:08:53 +0100
Message-ID: <cover.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX93 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove clock-frequency property from eqos node

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX93
  arm64: dts: imx93-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 461 ++++++++++++
 4 files changed, 1122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi


base-commit: 6c4b48012d57f205c94f25da0c68a4027ea6daf6
-- 
2.47.3

