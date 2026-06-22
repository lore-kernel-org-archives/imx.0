Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17639B4A2
	for <imx@lists.linux.dev>; Mon, 22 Jun 2026 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120928; cv=none; b=N17ZQ0yk/dHoie5OucrcOCJattac0Qs2BxJD+AldJvd5ylQNkKUWw9Fl4kq2FrM4WQgPx6VFTRbAyzO5cOegL5xyMY7/E0KdZLeWA4sC5FkjjzK3aarGtwD822JVd1TOro5ECcnwfzX88nYvzYS+GqwJvEELMj5ZJEzoSOOht8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120928; c=relaxed/simple;
	bh=ZIo82ep7GovsrR8A2jpkssVrywg877Z3OT53FyuTn0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m62x0krtYN+MdwSiyGfQ1j6hNbFkVPhZnMB2TRycGFCqc1uf3LnLdDHQi5OBBb4svNq/Wz1RR1i/VnoN5OWJe+E8Ie92RTmIGhbUYDHDDMAuhb2ROhaV9LwkOProW4+FB/Em4sEOMwpgjF212y+htMwZ9OA9Wx+SZUfim/khQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=lMpDLwRt; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="lMpDLwRt"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B0C2E1FE54;
	Mon, 22 Jun 2026 11:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782120916;
	bh=QDh8cyCuG0BvRFs/KskkYUXoHG61lWt4Q8mGTanX63I=; h=From:To:Subject;
	b=lMpDLwRto8FVTIVQFZ5qHScNPQEX4h6jcz7YL6kReq40+Yahq+8YmrBihWAQfbc0X
	 Y0kUQZAI29s7i3gqQkWUGmtfxMcryYE2MLUpykI20cHVAAQTwdXq5+Tx4QQYTuyRr0
	 DTv2yvV2l+kIYdonILIpiw8j6GLKURnHalAXJ34PAmF+omiLK9cnLR1PrKYYXvLp6/
	 kKvjlNzYSq2dloEwDUkh68UVzuLPUS2n9e/E5ypjgvzyUwMCyUvv3uGPhT9MQmxntg
	 zD6kYYtK7s0aP1JoRasSuqZ+G6aYel95NNNycys5atONlV8L88uQeDpTyCbKR9W7Vm
	 UJhZYA0tdBdLQ==
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
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
Date: Mon, 22 Jun 2026 11:35:06 +0200
Message-ID: <20260622093507.44132-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add alias for lpuart5 so the UART gets a stable line number.
Without this alias, the lpuart driver fails:

  fsl-lpuart 42590000.serial: failed to get alias id, errno -19

This prevents the Bluetooth controller connected to this UART from
working.

Fixes: 104a391bb6ff ("arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7d760470201f..a6c5398a81e3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -24,6 +24,7 @@ aliases {
 		serial1 = &lpuart1;
 		serial2 = &lpuart6;
 		serial3 = &lpuart3;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
-- 
2.47.3

