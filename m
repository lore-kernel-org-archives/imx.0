Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61C44683D
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046866; cv=none; b=II1MT2oiXa03hyq9vM0THBZZzDZzOr8tc4EHFYVP5zohPrLOYcFTvQc1nbhfExkBUsrvgHOJVillE+JkyMu3wGj49mnOqfmZV3e5v4AVYGDQFXwBKlhgErdZXxWbRiFDyCIyRP+YdTZbhqRv+s6lfrmPm5SpVBxUSccQdTsAjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046866; c=relaxed/simple;
	bh=pfbliwIyP0P6ymSlVtFlzS6ExrlQ2yEYQFBgukATFxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6c4vQ3xCJ7nSrc4B3he18iL0/wr3QtVkx27GuNU130CpVGc6HW3vdBj0EUDQyfcLle3tquRc6frcZjp4PlcQPpev/5Ady1I4wPVSHfU46JOI2gyCzPR5TOh75AuUMPBK4UnCNzWa72uoc0Jpn5rFeRD5aXy32v7LOD4IlMnnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjI86CX1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjI86CX1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso2157404f8f.3
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046864; x=1784651664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=;
        b=WjI86CX15o8JD/L6oGG3lv+HWzZKLekhHlp1SH9vsA1GDGliL0OOvMWsNbqi022tVH
         87IBUQJ5himw3vi2RQfgzlWWKSLkjtwZom4rJJXpJOEYqfcPtrRD9mtcPJmWCd43fleY
         B5BbdTMHFNj07I6+g4oH1OgGRTzHYADoXMNGS7osS6tdONJcXf8Mz/8yxjAiETb+wmKQ
         e3teSG+lltspFT7ivSHqaT/sERoDYZsDGXg1Q8cqkwmyN91iqXVad9G4ieTY1HeXd03a
         TQxC3b2RBKd+oSnigXrLWSSVLzpA5bLCOrZogSMM8dyGoDXtQJfYn/3PdnJMg3nitvUB
         T39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046864; x=1784651664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=;
        b=FMBDlmLh352cvF+c3q+ZOpYi5Ega80fINGL/skiFKp6lPHBnDLAT0JVzsAOrLHrp6Z
         nUlMPZZmvEHZUCChPHSJZcVzaNAP8le3IeNY64IHOUE8rWM+DwOWTdKM3rHwO5pH5ckE
         Or6VA5qwkFLhN388JkbeIzI1QtW/Gpz6CxXeIixnzI9KwrUqgVpuWi5m0kcts9tLc2ip
         aZv7C/7CyJriHTgFGxSW8146qFCU/GSEcrrnHdfNedIZ6iyTj2hS1+clKZsZi825LBSJ
         8/lqfCTYrYxg78MJdIiCwTn7ecjfxj/ed3SckqgUV0VlYjQUsSF4xP7Y51sV2RoHGKFq
         Pcyw==
X-Forwarded-Encrypted: i=1; AHgh+Rpa+KSZnVTPMfaXL/E4iiXQDueoOhjcVQP+Ud3l7lsy7pncLaUMp+hjtdLGtMNT9k2wbOM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRY9NdDLzGN53wyIiSCnELNa/oZKK4kAygXTjtsZW0YDFdhbjv
	kaoEDtITIDC6R2uExo+FoBikX0f2YlexSQfieMMAhNnUn2twmP4EJEM9
X-Gm-Gg: AfdE7clx5dvQzpuQRcYpiWz1no5l5tdENykVIA5meitGLmOrIlPgvaA7XHyHVBy9LbW
	Sw1+usvgsDAY0mBc3Mq4KQccJQT7MtsrbYlFXSPRkINVXSd9zrJPswW+2WSCKD1P7Z846LpW42l
	wGXZUGLIbMonykDAZrQb8TilHkaHR9KKh/Kob4AS9rY6qD6QxW4vjuphfP3Fn0kGyBDx3QXj/6b
	xFalLEIXv960ZHXaEwUk5MTaXB4BBQ1r0/+ij/ZYOtMZAdvItFK3B7Fz7lBClEKLacB203dx93a
	OOMnrtw5/66xRH1g6dSqXAbmKt9bzWISF0c0GMHGPswXHEh5n4pG9lX1qlRN9Xg2CGfh3gD9pDe
	rNNpBhD0vqbTPS2ogqiwQ5jLc3tD4lb9PZaQjXdpofU9/C7QOBP4tkrZ16X8rfj6PZ44Oe4TW+w
	r5whJKV+P/OZ7rdrtVkXQdpFvHPfAKaalcbUFmoSLFSiCAjWcKxiXQWLYTWnZyFeCv4eguOqPb9
	AQyLzTqra0UIODk65jxh2SZu0//wbxOW0V6
X-Received: by 2002:a05:6000:230c:b0:47d:fa32:c895 with SMTP id ffacd0b85a97d-47f488aca25mr3891903f8f.50.1784046863533;
        Tue, 14 Jul 2026 09:34:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm11213909f8f.18.2026.07.14.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:34:22 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Tue, 14 Jul 2026 18:33:50 +0200
Message-ID: <cover.1784046629.git.stefano.r@variscite.com>
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

v2->v3:
 - Fix CAN interrupt level
 - Remove unused ecspi pinctrl gpio

v1->v2:
 - Remove HDMI from commit message
 - Fixed eth regulator

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 516 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 4 files changed, 1081 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3

