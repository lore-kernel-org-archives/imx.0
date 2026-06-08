Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D73B52F1
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910660; cv=none; b=PZ37G5ChN3Re4e7WiJl222u/vzAksCbp548Oxv3/SOek19wqJDvPQJRw7tjia19vh8j9HG9JvSehGf8B9lHXfAgrX5cVVdtMkcA07h+uiudKY2vjiv29p5+6CIm4l5ijsNEbZfMxVNex5bl7OeiN8J4YTM79WA6QN7wn2bHp9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910660; c=relaxed/simple;
	bh=En/q0heF3qYJlklctPna/yGfSfPsTXtMUWQ44otHp0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/rj9XtXUGDTqqK5FUfMRilI4aHmMGAs/4SMlzeXWbrtUTgFDPvIRTYD2VysZZVH9sabymGXEdKkpkbPMxERSIgAS83N3C69R2fME7k9qnHynS/zewnkQhzwBsybl1SQjNwBtNd6ZlYKiTGwSatv0QSrirbdbACbU++xVgTfMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5wuIjFr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5wuIjFr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c1915793so24160355e9.2
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910657; x=1781515457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=;
        b=e5wuIjFrLRej2kfQAgdLh+PH7+5mxb3WWZ0MLHtn+fndKi2IByvrte0ks47jDY2iq1
         8ZtOUIv1kgyBltXbGKTo3OHcX5aFhUgj/XFKC8q3Awmw8IAjj/da61QqHQAjdCQn/XOZ
         SPMTzes/LuMG88W9iU/GYhV8IYKR3yntfEnl3XeDA7rtOWBtTK/Fh5rE0c3Ag55CkodU
         HshuevPFJmmTJZ0hVkALX9OaAUZ3W8ZldFQme+5bxDlob8bFM4o6N7mFpHpeYMa+ESC7
         P5JBocqwmDe2dtLyVKgGJ8mEKN30QWhCsj3s61ydbH5ixkw6/phzNl2rNsEy8hy7dmQ5
         Tgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910657; x=1781515457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=;
        b=PChSwDuY13/GSME9O4EhpQDUxz05q7UBGBull9JlP5/zcGx/GD/5Mv6FpmAb9an4Vw
         PJa80Qcx5J4A/lxD4tz4A0zt9w44knCXRBuiRRzrOGvyznJAf0VsxjEfNV8+7cii4bL2
         pedNoLstdEurg/NAnD1NiUc21YyxKkCXsd1rJzVwRg6lBEJfsjXFiPYPfwTI1mEQvDqm
         ez2O7AzUDIkWkPyegbhMULgzn99K6uClFZs8OHYPZRReJ7RoNk9oVSi+iekE1waKQf/B
         3XiDtGDj2adCsoHH77NHOE/GUkxaK17/ipxjSxh02nqh6ABbUzCLFWPgh36tdUUEky7n
         DLDA==
X-Forwarded-Encrypted: i=1; AFNElJ8ei+7xNu+3HKax4MBe2WBr5cuyAyWeOjQF57XEobJxcPs54uGdv+fcrDQSItCxwBGXbQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE9Ut9/MQo9ECLOe7GhmvE7zoynNfe0rCm72R+QbBOObXQd5lz
	z2itEoCknAAHKO7vTMzkZzcBdgfRDICN/FMmL0DDSLY3FDFom5CtjRRs
X-Gm-Gg: Acq92OH7F49pRjeQXmK9hn+2rErH7Ez1eqS6IAhpLCsXonisuGQgxedm+0telcHDZCY
	9Ql37BlV4RhisMRg8v+YnlVdzRfheFj1KaJyBkzsIDSdcQqNIJ+rtLQtuzdttx7bnUm1vLOtiBR
	rXpO0B0f0j2uN68nukkwpaJ27I07EDBKrUv2T9xsWFpaNwvjILNwuzeTPrwuT5EjSluadcqEq5C
	P4gW8bZF3qfLa6WXjNtUjhfRuEcd0wQRgWMhEnja1ptXpSJRfwXpVu5UrD3wXZxdW6NN+hETtO0
	N3MeM6paUk3odacxf448szaJTlm3Ss8fZvD/q3LmZjtk5rWKUUjR1SImXXboeCZxLfy4EpsW3s/
	+YamywdQ0CF4tvo9/NJ3pvcyqxhFae91A2a7ZfMPgZtA29hvDLBSDt2Kz4Gh/RSgw1NdPvVSflA
	ExotXgOkaWvLPYE4+/QPl7G1alY6/l58zmR4CseXdDD8UM4gUxj+6GMa2C6BNxBLfSMp5fAEnF6
	iTyRC4JoEad1IULG5HcPvyDdrZOAhRgnaJJqrapRe3r138n
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr233896345e9.29.1780910656960;
        Mon, 08 Jun 2026 02:24:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm364812725e9.13.2026.06.08.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:24:16 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  8 Jun 2026 11:24:08 +0200
Message-ID: <cover.1780910435.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 716 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

