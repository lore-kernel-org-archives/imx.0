Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D80A32E13A
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704916; cv=none; b=K/594BnBpO6+toRy9QAiJ+WE+2g3oMtjRuM76hGpjtFI2PAjbquU97mPnemBfCH/u1qV7YprregHEjv9b4i4aGVP8onSkh1ud1iL+OU2t6KMKscCJAXzMS1wzitEZGsUUoWXcgVbZVcne6gswtZLe9yR6G16VbfgkWOqjMq6+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704916; c=relaxed/simple;
	bh=3Yj3IoUFPWPcV4vDC4ntfKd6PAML/0x47IaIe6uKki8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHecbAorL+musDWhkbnmWBSTfSCbR7xjbOFDdfdwrmPL7l09yzcn0wLT+ONsVifwoJdpzbeWvwpjEMJ2KHXEz4f6RmfvYe1wtvA9H4pYsI/QE7F2CvKcmGEO4+V/1gQ1ZQt+M6WQusOQI7/IWw6eShQzOKKt4rkSIWqzvMHMwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHmtdch5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHmtdch5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so7278105e9.2
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 05:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767704913; x=1768309713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knA82HoFVq5Vl5qoZqEkHj4/fd3hThuMjeSabaCgNw8=;
        b=LHmtdch54aPyhAGEaYZKMltoV8+phUxafB6h3WbYzbXj0Pm94jAtPS2kq1DG3Hy8Yz
         oTYAdue0X01wQDVdvJQb3KXeZhjLIubLDyqOuhaijD08+tqACkvUCRbW+woO9tF/ye6x
         H8FRhcHvAzwgAUp9TBPeFO+dBILsBe0neIAnMNAfVfk1IEfxftNidRb2rsGHQ0WAe5Ke
         29KqdP8JYtca9+k5rEw4Iq1VG/hcjQQpWmpxgBgdNMmgJuYwyQ8wyhwh/byC41sJ8sYd
         jf6R8gQsV3At8K3Uy9i5YMBe0B2eKQvnv1THhzeGcf69MSY3/Sx6tO0+MtdwfTqeVIqU
         bLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704913; x=1768309713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knA82HoFVq5Vl5qoZqEkHj4/fd3hThuMjeSabaCgNw8=;
        b=kpUvQIsQPRRDycg+ZMsiDU66QkBXXV6wKAWZINv7ZQUWu13/yCM+YVcLjoj3e5zG7B
         CNKiw6Ap7tofS4+vH0OHq5nj2iKUePnrMSK2txiRZ//RCHi9+pokL9eMh9vMl4P1lg91
         rOJK4JbwIqhcrUZlnPGqQyOyWg7WNoB2QlIXo/jVxV+XaKL+rFIglJXgq/MLawVdCH+I
         +5x76w3nbax3piaJWYZSx5V5H/9VbnJ/BJOf2skyR0D+Re+3HOoKoF5R5k254/Gbuln8
         1rKj90981eecTdYY9AYeHjjBflxdxkOtZZOIEhNCynNMv7nb/XqVZeyjtuOPunTYLSKQ
         FsDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqP3Uj3fiKEQqzeMAxYXx/vGhHqFgIeOetTAE7sVIztCvqog0kghLWQyLEKl2fjdf6IJA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAHYdTWkDNxppJPMwK7+E+erU/1DGu7TpAwUwHONr79AX2Y+sT
	1p//KJuBxMT/tAgUyub+m+LcOsWWFobNbiVDwAHTYRBg3speHWAL93v2
X-Gm-Gg: AY/fxX6jihgRDSZ7hnRFxgFQEyO6giwoTU7oZfu310YGEMr0B+wRg/2p5jGc4rdq4oa
	gK15ZaifqvLDe2/XUt3uTLZeiUF8hLFR/6V8ZHZ3pkHcwgkG2dFwrvOoXldE6xQHuf3cHRxauKd
	j3Z1hV3p3IEAzqX6pa4fhtbnCzyqScrZQ1tnyvX26LVVyvjGYAvFAz7tHEI2o5v1nWNkXJG5iZN
	uw/pfAkh3R6dFiA9HqLw6XvgNbRatxF4Z2FvuSwKqlyesru8h3eNSu7GNTBQHZJWKi6krg0LeOL
	yf2v1eYou3ZhY6ghNNrXb5bdu6jUhSTT9zvgC5d6XG3QgEIhDUkQ1umN5HXRv8Rk0ia3JknskZP
	ST8CTf/RSVONMX7IDAPJjIJ4MsOj7qi8rohs5Y+XU8Max07IoUJqpZfWRDKDTe1yFBY4ITWC//M
	MNWAXJSNEBDhiRV+g9yGW8dJV1kGko+lOxN53SJYshkZGs4vL9SQXoCGBRpCWEoYbDOL1Ip5nlr
	CP4Vm2or2UXBD+BE73xh3TrjQ==
X-Google-Smtp-Source: AGHT+IEgdDduQB8C1wxDqFC9WBdiYOJOB1Zvyi+DFvPEzDYlB1IWXSDoybQxNllxp6wpNzMK+ExQqQ==
X-Received: by 2002:a05:600c:4f93:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d7f0929c2mr31848395e9.18.1767704912499;
        Tue, 06 Jan 2026 05:08:32 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm41601635e9.15.2026.01.06.05.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:08:32 -0800 (PST)
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
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Tue,  6 Jan 2026 14:07:29 +0100
Message-ID: <20260106130741.91532-1-stefano.r@variscite.com>
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

v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
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
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 4 files changed, 1022 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3

