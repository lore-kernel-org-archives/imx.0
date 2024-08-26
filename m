Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210591422B8
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 22:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710549; cv=none; b=odtHFuA8Y1spHxud8xr7R7XGfQZL8MjSZj4TlmxN7NooifYVDfflGzE4XoeP2iWEh/Uy2brxmGpmr6EAXF3BISnKOQMuGIrWWIXJW3nL0nCukjJqBiFSBtgiCEqnd79vPC5aN3Ietq3ve+8cSbGoxFIFIsCq+ZMGUaTTE5F+UvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710549; c=relaxed/simple;
	bh=Q5K8h8vtctElYoApciSD5Xc03k0F3aLZ0gRJkUuQmN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MFQerfMQO5lSJcFJnuOc0qmVX+c703n5KaIT84vUDtiUwgsVdD4t/wWfDv6vghJhb+JXt0P13nQ3mKSXYkzHjNOjfi1rOgy6C4uTavHUSsp8BPKZRvBlqQ057zyBI7axVHLV4xRuyYa6LnADY1YucgNmTyRxLjfiuU1Kk4UZ1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=SaKLqz27; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="SaKLqz27"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EA3771F910;
	Tue, 27 Aug 2024 00:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724710546;
	bh=zBtsojYFH4Wzmrzc8IDjB4IBVgFVXnQLeP9tfDTKUiY=; h=From:To:Subject;
	b=SaKLqz275GKfGKz1jq0nqbw7rQRsndFOnstlHSSVI8aEV8Mpl0487Gwy1/fsDgx5U
	 sG9XqSzqo0BOpGkJDjo4LacaKlTtEqr0fU8kUce7OS5r+Gsej2E2nSHdAX+btq3nfI
	 PQmnHuLaZe3zpdWhzGm2vVcDLTFqXGa+zgpbOZcezZMe4+TzaD6vE5680b/hdXo7PU
	 Ga3Y94eqpSH4cW78fgzUJ6T7+n75/PNwfw8FDITcpgaYN0gwrZnM+483emzGTXGFBv
	 vUu53S2+RvI6ygr1Ry91DyeTOAek1n31YZbmacx274Y8/ufAb7uwgNug6kTMyIt5jw
	 wHY7r3iIWVJEw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] arm64: dts: imx8-apalis: Various improvements and additions
Date: Tue, 27 Aug 2024 00:15:36 +0200
Message-Id: <20240826221541.15669-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series improves Toradex Apalis iMX8Q support adding:
 - correct thermal zones
 - analogue audio
 - USB Host (Apalis USBH4 interface)

In addition to these it also removes the adma_pwm from the i.MX8QM SoC dtsi, as
this IP is not available on this specific SoC.

Andrejs Cainikovs (2):
  arm: dts: imx8qm: Remove adma pwm
  arm64: dts: imx8-apalis: Set thermal thresholds

Hiago De Franco (1):
  arm64: dts: imx8-apalis: Add nau8822 audio-codec to apalis eval v1.2

João Paulo Gonçalves (2):
  arm64: dts: imx8-apalis: Add audio support
  arm64: dts: imx8-apalis: Add usb4 host support

 .../dts/freescale/imx8-apalis-eval-v1.2.dtsi  |  69 +++++++++
 .../boot/dts/freescale/imx8-apalis-eval.dtsi  |  31 +++-
 .../dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  31 +++-
 .../dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  31 +++-
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 133 ++++++++++++++++--
 .../boot/dts/freescale/imx8qm-ss-dma.dtsi     |   3 +
 6 files changed, 272 insertions(+), 26 deletions(-)

-- 
2.39.2

