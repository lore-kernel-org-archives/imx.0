Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E872C11E9
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507328; cv=none; b=iijWQmCEiFbRiJbAWaLgsmLIC5agFrP2F1yW5ZGuK34didtTbqIhQXF+hc1nD31kdZGOpGBRKZSedHmBnWC6OLlpBO4rgm2XVMt9s5rhrnLhwL5ryMyL3hoaAOCelbC4Z+wGYvVQ+kH5va9rRBQJiSTaAoIS5xv94CervWLrOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507328; c=relaxed/simple;
	bh=Kcmg0/g5tMcm5hh2EiCJlhHd0AxSh5rVXDzvvvfKceI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i09hY/HywsXhxLMINRyMXhr7eVT9+HloSuzzlBc8SX6obRmB941+NNQWUq/+TIgawAnDmzOV24MvXgBLgBDevq+i53GJX6HFd+QJBkauT62Dddd873W1yLYN1xXQLFCad3avubYoYc5HMmt4HhPC7d2tyiJXCiQhUBKP5EfBVsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=bfHWyYiz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="bfHWyYiz"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 65EF41FE01;
	Tue, 23 Dec 2025 17:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507321;
	bh=0qkh9NDueAgmjfZXlNcUqY3qLpWOOPfkCMJCmVRhSeM=; h=From:To:Subject;
	b=bfHWyYiz9scdm0bBe8fdoLg+M/oq84E/CM3Imf0YrJMTz7kgk2gmteOD7CWKp9vCR
	 MVurGEE8WeiY9s/oETwZhSAJz3fBS0tshVKuf+aq+rW1hziimo2uJLlg8IfciKcamg
	 3YDf9O3pfIoIgoNbvJdE3EdmHFwAfK2v1RSgDwfe7nhkO2fEVAKhC9J6RkwjnDGDdq
	 E/c5KIco0SBiGJ1q74jGLjS8B3DLZkLymRVyU9nwFZpBKuwfJz7Aga6W8q4LOM29zF
	 1l9mQxL9auwSVQDepKwk5S34GvtH4cGpcgDTwP9nxzG1kWaaPHQJi58SonUwmZpZhD
	 vg8CmYon6pPpg==
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
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4] arm64: dts: freescale: Add Apalis iMX8QP
Date: Tue, 23 Dec 2025 17:28:26 +0100
Message-ID: <20251223162833.138286-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for the NXP i.MX8QP SoC and for Apalis iMX8QP SoM mated with
Apalis Ixora and Apalis Evaluation board.

Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
A72 core instead of two.

The two Apalis SoMs variants share the same schematics and PCB, and the
iMX8QP variant exists only on revision V1.1 of board.

Link: https://www.nxp.com/products/i.MX8
Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8

Francesco Dolcini (4):
  dt-bindings: arm: fsl: Add Apalis iMX8QP
  arm64: dts: imx8qm: Add CPU cluster labels
  arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
  arm64: dts: freescale: Add Apalis iMX8QP

 .../devicetree/bindings/arm/fsl.yaml          |  6 +++--
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  4 +--
 .../imx8qp-apalis-v1.1-eval-v1.2.dts          | 26 +++++++++++++++++++
 .../dts/freescale/imx8qp-apalis-v1.1-eval.dts | 16 ++++++++++++
 .../imx8qp-apalis-v1.1-ixora-v1.1.dts         | 16 ++++++++++++
 .../imx8qp-apalis-v1.1-ixora-v1.2.dts         | 16 ++++++++++++
 .../dts/freescale/imx8qp-apalis-v1.1.dtsi     | 16 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8qp.dtsi     | 24 +++++++++++++++++
 9 files changed, 125 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp.dtsi

-- 
2.47.3

