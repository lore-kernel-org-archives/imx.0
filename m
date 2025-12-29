Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CF023ABBF
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767037553; cv=none; b=MgC36xlCNtbyhYqofVYTb3NITH2EBNnHi3BCAQraqjU576xLn9x1TAfQ4JwlNpwztUs8bvrgt6eQDlw1wUq9pF1L0Cg8q4wC6dY4wsa6s1WjL0MWO5tGvlpDfVH9TBQZcBThc2p+HwEvuzEmG19fGz/iAeHPCXnKFnBcV4YBMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767037553; c=relaxed/simple;
	bh=TxNRvKX4JH4588EW7T+76NCFYuHpZ6BErRBennwRbKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVflbLpygtXWyzVt+Oh3aMrJ9wD+lbvsOB3p9FUjH09o2+jIvgx80UM0thHs61JCEjwDKFmzLvwAHsc95lVqPCjvWVqnbbCWgzeZytI5XzVW+pmFaKC4UeseiCC2KqCnkWmxT2dQ4H7jl1cdlBseyX1fF7hXlkJmrPE8C1Af2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XdfwlXze; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XdfwlXze"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20AAA10CC98;
	Mon, 29 Dec 2025 20:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767037065; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MFiGSY8cOxIDdZFxqeVoqn31I86jZ/x1KTQLSNLEbPY=;
	b=XdfwlXzeuT8nz4u8Boq8RURMO32eTFkpJJeYHgb0bALgh2aUHxD+2QwaSc18PwYiEtSs+k
	VBoQ2c6uL2KeP7RQi5IdPNzrDny3TvQpwD8G3heoo+CWbU2RfgDO5uiUgx/I1WhLCWIhuh
	WAmWT9ChcyB8CjykkZoMkMnmAlb0n/X89ytZv30V47Pqhfv/HWaSCGYeTDtItCfolIKiYQ
	Nlwn/jdBSINDeahQVqMet4FXFN9gD1jOQPcH3unw0CCjJsKsJD94uRqJrfHYcgtqaUfmg2
	gCMXI13aR04/7D7+mDI8aWyV0PgkCaAhuhMDe2FXYSbakyK8Z6hOFLYva8XnBg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: imx8mn: Add SNVS LPGPR
Date: Mon, 29 Dec 2025 20:36:42 +0100
Message-ID: <20251229193706.73564-3-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251229193706.73564-1-marex@nabladev.com>
References: <20251229193706.73564-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add SNVS LPGPR bindings to MX8M Nano, the LPGPR is used to store
boot counter.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: New patch
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25a..3199bc0966b03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -628,6 +628,11 @@ snvs_pwrkey: snvs-powerkey {
 					wakeup-source;
 					status = "disabled";
 				};
+
+				snvs_lpgpr: snvs-lpgpr {
+					compatible = "fsl,imx8mn-snvs-lpgpr",
+						     "fsl,imx7d-snvs-lpgpr";
+				};
 			};
 
 			clk: clock-controller@30380000 {
-- 
2.51.0

