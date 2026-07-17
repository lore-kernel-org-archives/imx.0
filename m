Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B133EC699
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284189; cv=none; b=H1UT3NDU0yntfR6o9BdLCYAkqiFQXMnedKLFN1ak9Ingpw/SmK/r6gfNi8cyyMizPqc+eOb8zIcqHpctUIZhYcqEgIgOKbDW3cT5RrwdmhusEHwRIOZhE0dPJ4pIk7CtL2E9AFNq3utxIhNGrNJyk+1ajneeckt9vmH1USs62cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284189; c=relaxed/simple;
	bh=Y9Mgf/wObsu5bH01+fY7QOGJVcJqNiSbSPNUNqnfhZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FtKhCCIrzwlvQS4T5vatXmPjJd73zoCH9RAJSgeiZjrE0oRes8w+NK11I52x0ZMkeLDcbbIEmDi+Z+T10vWnTbAl0jqvdEkzrDeorz9gtGN7SAJ7NYgjZLfdYHASsGXbSc0s0yghUuij03TRgBXgHLR81riCs/KEGdY8CQ1CcA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0ZXm1nG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0ZXm1nG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47640541585so3822350f8f.1
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284185; x=1784888985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=;
        b=k0ZXm1nGu6ULY2l/28g6n8HN5kdaLmQ7j5+UTggCkXO1sBYnr/P1NGJ7cq1hwjJ8Kv
         /B9TIYXv/RfpPZKpGREOwpcT4XAYnxUtohGkWHan3ERZbB8QSh08dgn/5BUs7QrxIgeY
         Vs1bPukNc70QLaXvId1mhXkWIznIFV8dDn7K71Y1lr4xtkVvatXBl56NdY1rN3fuMTKY
         AGyZtXeLol2BvXmYa1RtxcwZh8tAClp52LuO9lM/F2WjxYI3FU1AaH4v7JYO4k5mFoLR
         LI5YywLJD1+jGy4erV4xHpwslfGGLHVN6GEdK+EauFkjuMTOTxyi5xW7MaMg6YwqNoba
         B5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284185; x=1784888985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=;
        b=l6MopcdAO2Z4FnFJOys8pxidms2lbxiXfnz2Zft6IOipx5y21+KV4Nwkj2p73vG7YM
         ba7B5k2vgZHIeuzap7Y6qgrvoNee8hnkeVHQFcUGiH0OSdQsn1qaTRI5YFdviBW70Sr7
         GG9UhX44HKiJjwleb3LNJb75khmiIqcw7oKVqLlznR4nnglKF09BBo1x9JQ8Q+Ub2I/O
         QKqTAXV887U2qxSEY41toO5jB8IExu8eSjS6CLk8jyXeE4pXyjDTXI9XSTHKdwq60Iis
         uCTf0PgvqrJdmZfaZo96ZSLgvJtm61ENiOhW5a/p0dUu+a9V7VIvzgbUjI9+IOU5WvNU
         Q+1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rolml+/9IO+SqIfFymUIZ4GtW1CEArBl/kRSGhxGY/kG7UTClytAJdbRWomQTcXfioRrk8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrPcc6Gtas2Z0gPFt+cfip2cUK4hLlbJtrvM9Hl/S3kcQvewae
	4PeZOIRhyDohLclXDwq1nHeDwZ2oPXNNC2OiqFmz802zraYmPxN1eddY
X-Gm-Gg: AfdE7clwjNbsZbFkjmXguICwz3FKIMKvzzSjxFnD7HBMl46n623JAxh10uVCztmoFdH
	gDSFQj4XZX6ivajN7wU3juB3w9GMkAKgC8Q1Z8WxnB2/+y9IJ0Alhkw2D6PQVqftj8MTszbS38V
	QvYLbVhwxgAFFAutjjmz1943MYS9RpUiZ3s87j3tYygtOCe4/tp+Eoz2NYTLd0uhkh2JBqRulWs
	LOYTY8VlYxl2a8jBFMCt/YkDNZuSM60k+8dzVlQk5cTW2RrACQU5NLjAuhtGqx+v+1WRZZfqy+6
	kIjIyDk1EwPF6jffKW/7rW33kfyNaetSWcr8lQz+lFZR4ksQNJUFuFWNzQiFq3PZ45M9IXgBE5v
	Uio3hVbvZngJrKNzxWGURr0iIRZYpc5yho+wJdOYtXsDQxOofdo0SsVVgtqY5bR4blvILEvX+Rp
	Tnhm7K5Q6gRJCLo9N68f4tGptUUizPCohP+jdjqeP+/2zq3P3rpsBffFR4yYIASpoA5aL4YxS5b
	5p+LIDOzXQMDkM=
X-Received: by 2002:a05:600c:46d0:b0:495:3e81:770f with SMTP id 5b1f17b1804b1-4954a3f398amr21164725e9.15.1784284184783;
        Fri, 17 Jul 2026 03:29:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:44 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Fri, 17 Jul 2026 12:29:36 +0200
Message-ID: <cover.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v5->v6:
 - Fix regulator typo

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d089adef10f380cbdf65cbb87a59a9aab86cb0d2
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

