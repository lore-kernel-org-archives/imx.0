Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A7441027
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803972; cv=none; b=WVNwDRwlXIq7cGRKaRJpXaLkjvFRd3SZXB2ZPbueKmYkiWPTJt7uN2Lflew7bLFO2iIOgxRnu+glco1u4iMTmiUiOXTKq4PVCIwWtokUfhNh+P6Rh2vFUNl9KsVeOm8SJRzkD4SGT2xjpOL4TKjHGarVozyj+NVLbQUpfoXv0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803972; c=relaxed/simple;
	bh=aaIIuTJjztqPwKGxgC292rTGHTOWGDLzCUIeP23fyaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CAixfY8NGmXTYuWn2JfYT8ttB3Y7dXrttoydnpEX+hhxQocowxKzquxJY3cRkgkbfYUTf7DsbQRW8z8TsSMWWuKjMNx6A+T0AkU9ngy07NAw1JszFS6w+ENm04aLoC1YqRrz8ws/xp5uGhKq4t7Pxo8gDfir/Gyxc7UYWytRzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=vHpLqG4i; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="vHpLqG4i"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F0CBA1FFD0;
	Thu, 23 Jul 2026 12:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784803966;
	bh=yAtmVwwG7NwqUnf243ukuW2WaRPFl9N+D4QXJl5egn4=; h=From:To:Subject;
	b=vHpLqG4iqYhOPcNkGv+pHi9qy33Hh+xtYwpfVbAUhEYOEhNwEBS4MrmWu68WAQ+UW
	 UW3Kkx7Jf5TCa1l92dP/MYKxN8NECpEGR+N5crSxb6EupVV16GnvvXJh8kMWfKbFEd
	 HYZBSDpn2zWPRz1ppui0BDNrmy7o3Mhz3vNTao5k4BEy1igBrgfIcjiTnDWIochXD4
	 +lhGqM2rTtCZVJbEXUL+9fVZ0Uta5eUKk3timDQsB4swLjTLYrc7XyugrlB2/XNe3Z
	 E/ElaINQe37XogXfnYUMYZp2dViUrifdDasZKLj5fJKfp662CA8yE4SAO5o1IdG5p2
	 9GIPXAHf1975g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Displays 7" Parallel
Date: Thu, 23 Jul 2026 12:52:16 +0200
Message-ID: <20260723105225.194366-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds device tree overlays to support the Toradex 7" DPI displays to
the Toradex Colibri iMX7 SoM (eMMC variant).

Francesco Dolcini (3):
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
    Parallel
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
    Parallel with Touch Adapter
  ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
    Parallel

 arch/arm/boot/dts/nxp/imx/Makefile            | 22 +++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 58 +++++++++++++++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 43 ++++++++++++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 32 ++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso

-- 
2.47.3

