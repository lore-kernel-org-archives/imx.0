Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948A23FC5F
	for <imx@lists.linux.dev>; Wed, 21 May 2025 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819713; cv=none; b=KmEOS3lbJYBF17ymJkoeeraqcfFHfOdeHuEQbZUEKd3R6hONoRECIpzcLZfOi9tcFUdt1cd2Lr0WiVJV0wWrZEdxfrSwnH14fFbjWOpAuR+jMx6xkqzIrZcgGzVkjzzVfRlDxV+LWvD0nwmzmDnfhhtMlE3ciZf6HaTV9D8XAIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819713; c=relaxed/simple;
	bh=+tdvos/UqVi6pMAhZ0/80FmoEyTCrLTd9vhGypQS3jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O9zUnk76ECJG911i3Ci7NA/pRpnwrXPkyiXF3LdWNx/5PpPD3SdjLITMSZPsStXICYkEeKoyLiCG6Kf/I27hNt1vNp1jMYWOq5Hl7g6BOipXHA477fiLsSOStVKcoLSfw8H64qJRSAQUWtpn7TlsOzxCaWMEQQ1CYlHhd50RlX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A9+Ffjbn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A9+Ffjbn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-601d66f8cafso5045815a12.3
        for <imx@lists.linux.dev>; Wed, 21 May 2025 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819710; x=1748424510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=;
        b=A9+Ffjbnp82vFMDFBeng/kBVW0gw7C4cU7bUbNVg+eapisiXOtBlcyCTEfb7UBHnFg
         OSETwL6XrDCSrDL7Um0UdjXFB5TqYUdD+Gwg7UZGEeycb3ufv4xj/Y6R0EvTKRALeq38
         468sFXG2wPqbFZberekiZkUK5vwjk7x0Bbspo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819710; x=1748424510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=;
        b=vYR9sLZ6TfDdpVAYhgRO6UVLjfYLOiGE5bcV5ppPeqrUCKh/CBIB8kHC1LT5Uok04K
         3rKLPobBSMl/1mF52M/lofHV+Ufr++AhG3ilH3KX6zZIfNKwkl/J/rOmc45m+JzrGbqt
         R6boM/LfwVplJ4YKSQmj2rysajPRfV/Nan01UaNbLrdj3tK5SgBrJ5lBusAeMT8on1R1
         vNB7+W1eBxczywtlbgcvynupYeyYOA/khqMNbtXMggPVNdjp+MloDlWKxjrG3xtzQW1a
         6E/sEhNOWjpWZRpNFzHgTDf+EHJdCsTsyAoUK0pVEUExIfHWYjOxa84deFRe8tkQgkri
         712Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPK7AZIOhENnkLMqpAhMwbzHf6TmjxQrosRyOPju02dc15Ha4pPmuq2oVyPa7a9mrop1I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJvjD0dy3rBPJvpXH4mjTM2p+9qdyrYLsgGXcXrBG6B6jJcz4h
	oA2EwOSYjdKSkAgf4g9O4bXKGwzHCuYEw4FveGHh34qhth8mGl/xGE7pDCA0uQxVLZQ=
X-Gm-Gg: ASbGncuUM/Sf9Z+MazcZBoHnQWziVHFtYyaV82uQSIWtysiY2cRzfNLon1wZZeP+FTQ
	ZEYLv4kp6nN3u+zRlQxrAqm61b4w1Qt/ybi1p/mcI4oNMTCqTgIODgtp78ciy9qaBgfyKYawcej
	7yYDvPmHWdRfIhS/1B8mIUzzbSYOuqA26qvZJsgaYaJgc8Fg/wU2+X7ezFeye8b0hErASF93Sfi
	ub9JafeiZgR1BuI2DViQ+L6KC6eHMry0mUM6p4O4eU5hAwOCDSUb0k3Q2WaA9IHFc/6YlvpWHAb
	DKrUg5YqvEBTNYjU66hBNv/b0thvGmV54S8ghqilE2QOaBzWKDmA4/S4OsWFUpp150AFKDyWXX3
	1R59jdDxphPDh
X-Google-Smtp-Source: AGHT+IE9Rsd+fMS6VUFvdncItJY6md4j6oNw2IpDZyEuTisqE10/bRSVI7wzKmHIESJJG3Xl38x7OA==
X-Received: by 2002:a17:906:dc94:b0:ad2:3723:6bf5 with SMTP id a640c23a62f3a-ad536b81a94mr1643951266b.22.1747819709868;
        Wed, 21 May 2025 02:28:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Support i.MX28 Amarula rmm board
Date: Wed, 21 May 2025 11:28:19 +0200
Message-ID: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 256 Mbytes SRAM
 - LCD-TFT controller
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC


Dario Binacchi (3):
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 302 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 4 files changed, 314 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
branch: imx28-amarula-rmm
