Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332F2D6E44
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270677; cv=none; b=YAVUEoI8W7R68x96QWKz038iLjEDO/g8O7HPvvrB2yVRDQfCoJirPo8vU4GrOmWeJVjRFlHPFtUZuAR7qnMU7TiXnJoob9ch0VNmXd9OQec8y9cLf7vRmP01wSBU5mACR256FTaFJUmDFzBqwXYUKbX+mCqzBkm4loCgZrH7Bv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270677; c=relaxed/simple;
	bh=jc0xZG1ao3WGJ9fwbICCd/WyXrcvuCLFP7ufvZgmT/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbhyq4BZyU3l1UsbqJG7C5+dR6fslg8sH3+ukfjYl49rMiJyWnf0/GHjcbT0RbOw88g1XfPoVPVfxSjbgGxZHQSaEwyHBiZs5wBioLKfxSHSItITpMYOsBuP1zhMG70vnTOJrVTMtOXmhuZ/04qCtykHpt7/tvYlSnKGL56S3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=nzL5fq2N; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="nzL5fq2N"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 5F7F91FD2A;
	Tue,  9 Dec 2025 09:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765270672;
	bh=NqyhWdtOKMTjo3D66DgZuH8PnsU6W6516xPtdN0UaOs=; h=From:To:Subject;
	b=nzL5fq2NfqqpVsdB7AxEa4oX+jLYUFf/jvxlFWTnhvuaisFNXeDHCJjIJGKhSze6x
	 AsTM4prYesQNBY8cjJHy+vVovD3oSDbgMmqvgwG5+tfCik3EwNl1uN1ySGDEIJl7K4
	 G4shyT2K3aXeomV3uV7Hmlp1W64bpVR+JDZtIJxvgiDWyHv2lBfdiE1SkuVqRQ2CjP
	 JWow4GI7Kgls7FbtjnRB9yXGbJtJI2ps5o6uZoJi6xys/wPcehAc2qEZ2IuD7Sxp5S
	 yLilIaSnZxzQrb9XdM+1rCC7+U0ExvWVJNqCfM8ZY2yFuwVvHGDkf3k0SYfSKW8yiV
	 sDO1t0R4ETL0A==
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
Subject: [PATCH v1] arm64: dts: freescale: imx8-apalis: Add ethernet alias
Date: Tue,  9 Dec 2025 09:57:46 +0100
Message-ID: <20251209085747.39009-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add alias for the apalis first ethernet interface, this ensures
consistent interface naming (e.g. `end0`) and this is used by the
firmware to correctly set the MAC address.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 9153dddfd3b8..6fc82b5eb58c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -6,6 +6,10 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
-- 
2.47.3

