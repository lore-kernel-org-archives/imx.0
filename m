Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56E3BADB3
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081945; cv=none; b=S7l4c+9m27RLx2yvlytU06F3FDXay6fxw1wzera69/pd8i1s/FgPdgILLXZIFCUkNaGJGN0bjXmT9Ea91HMu8cINreHUkSOFPyImG046kXVXK8GCjg2R+FwYddyBXAumLhfArWmxeJxvThJFiI3DYxywet2B+8ZQY/VohLKVRaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081945; c=relaxed/simple;
	bh=bq7/ysKrio8AyjnSv7hYZVdMF6W5WSM4l6pq71clwwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=imOT9bqJF/oiCvNcfj5DeYCC4w+E9ksKp3zBFmtxwJ1SNa4yI7ioGZKwiSHgIpNf4FdCNeB1gkx37xfYWO40zu1elYcqnQGR1Kgs+XcLp3GC7l9aw8TkbF8NLwzlBLmg3NKvo32S57OOJ2Tc/gaUf0t0wIcJ2ijBu8OJHP7Gl3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kE36DT+0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kE36DT+0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so72138525e9.0
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081940; x=1781686740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=;
        b=kE36DT+0uJkmQHPBDR65je9fBusltHLSLl8RzgZnycnO/8HAh1aHwz2ucDKAdJyPMU
         OnNZ3fKrLvr45RX0bpjPAJy8+9oO7dzcNNMNbLodHk5GWId2MCW1LJXJ0Lw3rOPcXHvg
         inlKR0z6DgFMHhDV1hKMhHWrGqrAofjBQjlMMa7TWjRw6HCTYUiSsWjbuWe+VqitvZC+
         b/aKSQRuQKO5AgUU/b3usTwkH2MhH6l/qtrNxNyRJ//BxFNl0cMRKP8jnzpzAJ9EE18B
         ftkpxdowY6v0A6XlOn2sn6WaMBWIvzHMUjhy5HiWsEoV+i7Q8HXqTutMIZaVYAlYupwz
         uuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081940; x=1781686740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=;
        b=FzrWlhVR5aABSschvapBB95wgFOBN7OpkYCpD5Dy5ubTZ/pK/D3A4apBTBjYviMOIY
         kD/qdxCuTFhn+JuBjp8gRLn+SULp+di29c3OPAEOcBoMvYxZGVQUcmRH8SYxMWVWyV5A
         1WTvc2vMK+l07ixEOL5I6fjHyY+RcPxdTD9nzD4SRN+vnvaTePk/NVtjURgd/V+qgB2J
         VbOAvcCeB4uWAPNevfdTIwdCjCPwL9mvMN2yFkb27KXpCXZa1fWaff+Q8l7H4YWPdFL8
         VhGIm/lvnL++/r5DptOIxt/SX9xtnChbBlTtaY4OkUCYQ5xAad64uEj70G6eeeK6vlHW
         5KeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P/B0B7xq/wX84xB2kTagvqGqurD9vPO2yY6pixlgRaD4YbYXltESFkuGVeFcpY7V/7aw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLdttI+edlvDuKSd836bHyuIac9Jt4XBdqWU3+nldzoVF8mFtc
	k5UKa7ZXEGJW/G03/Lje59lqlwiNiLuqUNiugjYiq3wYmFaQueLff7e1
X-Gm-Gg: Acq92OE9RleY5L9RSqJY9bzL9zUMVwmoKsFyk83xL08IY5kwB6zaP80r+9TouOa9RIi
	ceWReKuUbGhFvLB6WXHwMCCYDiNM9oQYTJpyu3Wet+cwadpX7gVe64W8C1gZjLznk87H979zPEl
	SiWhCGJQJFNfwN2ISPcZgRzoGdn4/VtU0gzn1sKYvKPs/71eoXLgVyq69HhoWUnTVTU7cSaFmgJ
	MNOQBQ9SIcO1Zn5rbmReilzjyFzc+ZAGLQr+Ftf5sb0gl/E/yvweDVH7pIxhmkNjkaecPSTdgyM
	nNmFkoW5ku21eAvzN6hY40h+8BgXPYTrr1E0ldT6c99ZxR7Lt0fJGZQcRKpZXdifOSydMskcSL7
	gr6io8S175vTiUoUzJ059vMb9i9uo0cllUH4F2gSRp55niuyBYvvXh/OyrjsrgVf9wvB4wL3klY
	mdS1NZ1VZ/35k/DSeDK7eyUb9n+LdxYCjLRyWKwl2k24cuw6oSNd4KHdCgHhriaPJgD9W321Aek
	qnisQHJcUMligJ1siUWseSCYiKnIPtTVnMdiVRSqJSta6C3
X-Received: by 2002:a05:600c:4e09:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-490c25acd18mr424540885e9.14.1781081939502;
        Wed, 10 Jun 2026 01:58:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm564088465e9.7.2026.06.10.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:58:59 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Wed, 10 Jun 2026 10:58:52 +0200
Message-ID: <cover.1781024557.git.stefano.r@variscite.com>
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

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 559 ++++++++++++++++++
 4 files changed, 1083 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: 23a7098c710673ce8f245af317903ae46325a694
-- 
2.47.3

