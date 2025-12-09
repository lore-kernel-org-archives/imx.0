Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996AD2BF3F4
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765275490; cv=none; b=Yz9mjD4vgrDXi6uKcUJZL0xntnZjsN/q4d8wZvLxMMC49ep87gBDy0B5otoxae7sPq8GwfRuNQtytVmIQdYFcQ1ODe9a0JOf3wmWz6SUiGO4zSuBqlsHn1dLw/IVy8jq5qSiGDuMDJy6bRVSHxbsu37rQvROOCiZq+zFIhAi2EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765275490; c=relaxed/simple;
	bh=Ly4ebRb0gpH42d0rQ1S1dP3dwaRnDOIOsd6a5mGyoyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOF5jGFTizjcDcYagred09/Ovgdf3qldRQcLFF8Rx998TAHPLhEJPwffTdHmIWYWhkTxf042vFz+epsr70nw0bCBsMu3JqxMCugEQV1TduW4qOmBh6eZ7u4T9CkN/r5MbXiI25vqmeq3GIcG7Wft0AODQJGEgwmHmGrXTF00Ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=syUtrLsx; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="syUtrLsx"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id D18A022B27;
	Tue,  9 Dec 2025 11:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275485;
	bh=yvVppEk9o0CVKtieqGiuVEXEx/i7i+V7SNIMSZ5JJcM=; h=From:To:Subject;
	b=syUtrLsxp40MGO90w7xb4X58JcgsDYiDccbDvTHFautNN0wON3UlEmWEcCHXsZwXn
	 ExUJhNQ73HNZB5W7tOE91JJXvSbJ7tIgFepXKDh15+k/e4K9ScUIy30hCgMFNsHEmj
	 ljYnSQZa+toxdSNPOOKFHAPTlyR2laucFmMuxw6eoKrS3pB8yOYsWQzX4gSztr6IDl
	 7RVx/8Ej/VCKKo9QrJGCjPzgw48KmAaNtYKN41hGBMHBW+f5p+/Oted1LNbC3elkf2
	 L6x69oPe295WUsfIvsUH+MC/Fj8zP26xY+zQZDMhBCP25HwZdmYYGiazaVOLqdYitT
	 bCG6DEStTmJsw==
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
Subject: [PATCH v1 1/3] arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
Date: Tue,  9 Dec 2025 11:17:49 +0100
Message-ID: <20251209101754.54067-2-francesco@dolcini.it>
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

Remove obsolete TODO comments, I2S interface is supported since Linux v6.6.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d43ba0087126..d31f8082394f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -832,10 +832,6 @@ &pwm3 {
 	#pwm-cells = <3>;
 };
 
-/* TODO: Verdin I2S_1 */
-
-/* TODO: Verdin I2S_2 */
-
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

