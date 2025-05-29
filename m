Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D61EB5FA
	for <imx@lists.linux.dev>; Thu, 29 May 2025 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507529; cv=none; b=d5rpN+xLz5rZ8MBMkyzYwqn/pqRy6Iih14eI3X6flGu6MPFTJ3RJJnhcMsGDSg/UpcQgido0VkYI4SI+7LaEHh3uWD/FQx/7Iclu8NDCfdEm34bfWR6ApQcnrQWwl50IF0gudcJg/l12zTYqjZjROpcSFEYa+bwH5GOwx9r0GIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507529; c=relaxed/simple;
	bh=SVloibZzQ4wI3ACpPrgps5nlN9IVxSsCtt4+bvmRtAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neYYDPwuV12w787Csq2KoFMJs8vf1Zh0HxtRbjF9Zd/D2dMGoE6RDol+khuVrW6J8p5/6XNdpdJhen6WKaB517Uom2eifyPCrJW70rH8wpfMBYv5VA6V8Fves3AGSb0hGJyfYVudtNMRVtqbcs5y7eeLQWcxSQSHASayDC+6Xfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=W7vg8O2U; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="W7vg8O2U"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad5740dd20eso90060966b.0
        for <imx@lists.linux.dev>; Thu, 29 May 2025 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507526; x=1749112326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+yd0OdHrM2Itm96/YuqXehoTn8EREnI2dfLKcvCeLuM=;
        b=W7vg8O2UOYxGiMuAaKARhffeZjqKxVZ4QFpanKLHIGO8ewwessg9UKOgdpQtNnH1g+
         a2YyJo4g20N6D8tJjWjUmdwj0WmJicgtFuHApZ6w2LXbuSlW7OtKz6kgjFNwrsQz7RVa
         WvWIuGEjEBm6RSWF4M3qsrDTiRboAQoWujoHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507526; x=1749112326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yd0OdHrM2Itm96/YuqXehoTn8EREnI2dfLKcvCeLuM=;
        b=hBQspGewIyje7zHchsjlz0WgKRDndDSkkAiFOVX4r2FP/7qqiFSyKkvoht74T3S7mM
         ERR0Th15EIp+UjMi5RuL3MD1iT9kU7b49hnswVq5vQ1yJ1ZEkvcBBWlvvo62nJXVVdJi
         cv0N222C0uyTiJkXfnQvqhJ4W0FVZet4g1bqGspiLuJFzhbH4xg0ZEN9eHsWpIct1RYM
         zHDkjZ9Mhaj+ooFuRvJQ7ogJxCs1D1VQHcMGdPInbyfCv6Ub/N9GAxaY8qFsvY2jiDuc
         dGLq78ssTMeIjRcHxFyy4XYg08TSjbrb4xG7KiXoHl/KWyX/of7rQqcKleANc0znftK2
         dV6A==
X-Forwarded-Encrypted: i=1; AJvYcCV/oNqhGTQa0WD84zx7yWE9gqjj5NUlws7HTV35gJKu5od/GJ2yICfa64j0ju/4pg+vvJU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMOVUF0fLuCHJJOBZRqMS7qIwjVcZx1JguMQxAAP9ruj6Cd6qv
	bxaw++X75yzsZdJ0lMvCfmte9pKqxqMAUAMEeYKGj5JejeCEdrsmriAZok8aJQ5dX8M=
X-Gm-Gg: ASbGncte71D4a2jM9qmQo3mXqvGQMyxZjmoWA7aYVtBmTrfbbEK5aRdv+M1yQLZbzBr
	ePRXn8Vn+ulsud9I8NdZwcGrtbeKioeJ1hMWlXDQ3k7VfpFIhPyIo+2ne+8+tMgVl3kJYQ8cOE6
	P7nj5Leqy9eEdzD5crsjzedFVgnVhq2l+LhDqSNVCldjF7h+NGY2Ma4NtFZBzITXC7gawt8XlRj
	D5hNYNStUCNGDrG2Wkcz2STQWBQuylkLRn7o3bXUPZacSAf1jKGt+vCTkSlHkb4sJnPg5GITy4m
	LlTKg3H1/oW7Zw0yohnG+zuOstH6inQF0E5Y4sMi2y59NQWochy4PQPvAxOW1N+l5W2FBOKl8cS
	LEonTwoeDYpfWuzlW
X-Google-Smtp-Source: AGHT+IHJPmyMvrXWwF+oJ+y1YEj0csZRYNNz7OEbL3/Z3gW/L6Zao3qlTysBk8RNZogBxgTqOB++Gw==
X-Received: by 2002:a17:907:9611:b0:adb:1b2b:fe1c with SMTP id a640c23a62f3a-adb1b2c0f71mr86246766b.2.1748507526094;
        Thu, 29 May 2025 01:32:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
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
Subject: [PATCH v3 0/4] Support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 10:31:03 +0200
Message-ID: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
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
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

Dario Binacchi (4):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 6 files changed, 421 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 2d1e9b3978bc041336f1bf6c611fbbf435a297f5
branch: imx28-amarula-rmm
