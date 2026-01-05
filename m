Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030C2E6CC7
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608682; cv=none; b=TIMyEc6Dg5jTamQFZmk1PVtBLw57/v5bGofAvGQbDzJ65mGsRYy8BhiAylVv61jpEzzrCefAUGcStLJ6JgvzbeAkxXVm+xz9WkvRN62sPRLUNe4PlODzz/fk9nCCjfuOnQ9no3Me6EJiAOJ64382yLQNK5Ie9ohA5HDAnX2ZRdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608682; c=relaxed/simple;
	bh=SVZiyApNgvZG9HDs/b2smpla49hxwIvoRNlQkDM0jqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5N1NoFRrUEWYbTesEwcBs4tDwBD+WnskV+MoC4nNdWJa1wcDNZrLNgDiJltrTDRMU2LeTsaWZ6PQspEFmjM/05Be6Qec5q4to8x3idav8ShBlYUQ2PoJIias1jTkzbTOwFOLPsVSD1tBuehnsTsl2F8hDfk2dUTTD4pGOTvMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRWD+htJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRWD+htJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so145321405e9.1
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767608679; x=1768213479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IN6vRkNKEVxOczX1saJPQdmukp5i6BLBmJn4SGM91Z0=;
        b=RRWD+htJhJDU3cMVjO24/OH3CQ2wFG1tdk1JCymQR13cxWt3PoFkx66HJ9n29aWHzp
         oB2ipge5maQo37UAZky7RPzL/nKBU5JyfDnwNDWfbCK36qaPeWoAE8VkgWTJS1z98SZY
         SRqYDH9iCa1Evbs7e6U/mkh9tnoQXCsBu9vD6OK6V5Ud/tovZALG0Xi/p7ec3T6qVJIo
         po2MZRdBKhih4BZD26uEJrdY2f34e+EPNNnmq3cBhScGf+kcqE5Qre5X/mnkmQxmcTeK
         YmeZ5GIsSNK7ZhkWXIVcQIJf+cD2dMZ5zhoj9d+1mjzAgX0YV0JCivxsvh+97VF97Z1N
         1xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608679; x=1768213479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN6vRkNKEVxOczX1saJPQdmukp5i6BLBmJn4SGM91Z0=;
        b=IqX/japuBtK1hLAUqEWh+jkmXjLTqIA+h801eTvWA6VhgeEZzVu9IgdAF57rOEifFD
         jWT4+thiiQtKMugDcQAFqQLOoY6Zo+WzyTtv0AgnTR6Fsja+qZCQ97zSKJ/7XcF14w75
         smh5C6ZfSK48FjuHWhf1tXQlWfOYTV6qEM6UOAOdNMFE8pc1uoEZN4L465yEZcUkoil2
         HWYSS2EJTOx7qs4lItPsWLV6bEMYr4G8qm4vADGgGCGMIlxohdoeV5sAT4Seqv4VJGwF
         6lij+7tUujkKlKgChUtJBHjgKPmcNMkcl558VJiAMIlAyaFdrArnfxebXZwiIp1Kqbj7
         wc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV909isb2dyNmMQF+Ps/0W4ofcLgvDqf5yx3QQgPoMdmQrIr3Sp2Fn7j24/+2ulTtqu2Pk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGHt1jCHqy6ETSy8/ia7LRePL2iPe41yUYiqqLFkC3GCqJySVV
	zataBNxwcjkXsgcMFiA3kwSnhy+GUUBvnO3R4+G/x87glwnmgpAybiPA
X-Gm-Gg: AY/fxX4k7YeG2g5WUnCRbi+XLmNgAPoVI94/j13LcnoFr27+crsX7YbtMx0P7CF0p3o
	wwtwOtXJwrWSPVQWEfELGsYz+J9/i3jsuJ+GFoe0ZMsme5wGyCmUtzSjlugoFHN9iySzvkYV52t
	JY87LswJieQw4IqZR65Ux/YH7d19qU7w+bZ3TjfxvY1+I8cVyF1LDHZuhX3JFAgNXci0e3bwR6E
	ppE+GL8wpgU9btUy0PfZ4pFLnbcL/XgLnTLOE1fb4Pnnzy7jW8upHKgoCMibvLkbNCNQhusLqSj
	VxwEPKoVwTERwWNDseg16oulam49Eh9Bh5/IiH2DBgoFXBAJ8zEv8ckzev69EyTy9N+uLYh6yWn
	1odWj2xBuxExEy27q+uCDkWhvBh4xY07iBSah5HkRCkH25aTWNeRQ/BgWYLNl003n5Fs1u0Fbrl
	Vx6mOQE8DokAgXviQWl/MTOFuK2YcjQsVXdokA+RXt5OJ8CTe2R8sKhtZtxJjT6ZeRWt+WtCqoG
	mCdB42sa4o0ptWiZujDA5HsRA==
X-Google-Smtp-Source: AGHT+IE6Ut/zBvkgGiDfA9fqbiDTp9MkLewGpq779KdJeWNbVM5HNW0RBNC8pVKNFd6A70hzt18tlg==
X-Received: by 2002:a05:600c:4ed2:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-47d195b3c08mr635442425e9.25.1767608678952;
        Mon, 05 Jan 2026 02:24:38 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm145607205e9.10.2026.01.05.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:24:38 -0800 (PST)
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
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon,  5 Jan 2026 11:24:00 +0100
Message-ID: <20260105102412.6674-1-stefano.r@variscite.com>
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

v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
- Audio regulator cleanup
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 590 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 461 ++++++++++++++
 4 files changed, 1058 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3

