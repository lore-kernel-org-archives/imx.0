Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53CE21ABB1
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765275490; cv=none; b=slXuwkZi2de9etKJGAgec/cQgm99eXacHdQNwzk8oGGjKisJD6K94IO+faY6vvUa0kt5xo8dVMWUPYIe0FPYrCrVU/ztt9clGG0NmRXSMEJ+RTPxLqpgM17yqeAwStj3aNIvhy9DL/KAlUNeFcGVekbLzFpLb+eBQriGxt5fJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765275490; c=relaxed/simple;
	bh=LspRMhoTuEdQUl2WfoGMpMaiR51ngYd4tC8jRrq7vwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHGoMqAeLmFHoTbgSygPH1grsi2Iot40LcuOH1+x6t6d4Ayw6paQpBTUvRgmVf6x33j77k6Zf3XLa/19wKY5iaJJKKrQPAFeDSV6ngyb3ZohOAC7uf8GxpeEDdxUzHTPcFWjebbB6ee6Us059xhGz47s3RL+4t8A4uI8k8MRnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=OpuzYQ6M; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="OpuzYQ6M"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 5742D22B2A;
	Tue,  9 Dec 2025 11:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275487;
	bh=+dxeERWmLPtcv4v6HQIjHDVzEq/iPpIZia0cA32K9L8=; h=From:To:Subject;
	b=OpuzYQ6MchrXobF5N7m8NlAb/Pk1SjMKzrNswtjtumjcOHt3p12rG0fQpVNFXcu23
	 jhV5kJu2qIuoiXkJnJ6gYqYEinXM3k5nPKa9T4kpZfEhlUiXqQGIH9x4Mm0EI3n7en
	 FflxU65uLIbJ1bb1nvybiASqrvDP2tjpEA1NXQWoSNIqknL2mx2Hz5XE5uLdKCHP52
	 fc3cjCFN4uDK2Ub+oN22+EnGjLhApENFXfu97laBY4WLudPn/FmOee6YqBcwbvXL76
	 lK8yxjLjMiuBZtl38rRmZ+NH6OzXELvUKhwja4XVYy9e6z13ahBLafLdE5Lja0Qm1e
	 EZVvRNspqXTFg==
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
Subject: [PATCH v1 3/3] arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device
Date: Tue,  9 Dec 2025 11:17:51 +0100
Message-ID: <20251209101754.54067-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209101754.54067-1-francesco@dolcini.it>
References: <20251209101754.54067-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Enable the hdmi_pai device on the Toradex SMARC iMX8M Plus Development
boards.

The hdmi_pai device, together with aud2htx module, hdmi_pai and hdmi
controller compose the HDMI audio pipeline.

See commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai
device") for the equivalent change on the NXP i.MX8MP EVK board.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 6f9dcd3a75c8..b31de307093c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -107,6 +107,10 @@ &gpio4 {
 	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_gpio6>;
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.47.3

