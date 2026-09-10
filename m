Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476554A0EF6
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053627; cv=none; b=ToH+ZTbhxw03xTUL7/IVmUkwe6gjz9fp3Q5vbn6j9cSPUpZoHBIKoD0OATTbz6vlv+wP/trecMtmigTKPpa83KrQVa+dIVQWpXULl0NPfnQXaq2g5CF+mSLmuFrd2XgETn4KUNehrj2epoXFvCSGnbDtsmkpX9uToHQO85wvAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053627; c=relaxed/simple;
	bh=qJ1KOlYqyReFhz3PyQxMQmeYRQtoislvlFfnL2dz6jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEruMfQtFqP0kNOyjfR/3XwGT4lHZVD4EB/B+/pYr989+a3hvTBCFeIomrXRFSHoSgzaQxDL5DoEOXYCALxtWJGQ/vBT1ticZbRXuJBeoePwDe9CvrMQRKuGmwnWSLxQ6thyAIbQQ6K8X4WzSQehbw786dnRvtS9j0s1TLkm0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=1KJKbJIx; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="1KJKbJIx"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789053610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HK1J9Nil9WfDBB1j8vImy3/8qI+WNh2teR0R09fa4mk=;
	b=1KJKbJIxDdlKr+gfesvs+1Ram4tWnJ1YmbYMBsbAUClnjd8c7T2mgd7Imvg6MDclwkCSPv
	MEUOYNdosC9L3PVVLvTCd7rNM1sqPa41c52o3txHagdmBZTvkbzWGzJdNyOMLDxZuPaiWf
	5ziBbvlHRsOlNY4PrAbVcOpkgSCALW/v1lraYdGdYfuwxQTDj76v+cIhJdjmB89l/tI1ZC
	t3VwB0167W12TNZjZ9XHofziGmpb4e/To2v2JXciCtgflP3pWLtVoV6o0yzkpV3XsCOAiq
	oP+IwH+h1JByOnITQVzTeO7RflJwKJ5JyBoP8exP9CqRGD2z+UAYmLOwlY2wnQ==
Date: Thu, 10 Sep 2026 17:19:06 +0200
Subject: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Xsy//X4zl+YEYJ0inyZ0UE0JWD9JAJYSxtqGVvBlRgA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWvRqZXvts+VkvKS5Q+e93BPve3uS40ShoEtz6XnqaUfv
 TQzXCato5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCITehn+8JQaqQYpL3D5u847
 Vu3yQ8fAvvKEA3eMtHRmnu44t6GQkZGhR/NtK+eu6uc5Ltd31PvPrv034eecwwu7TaPZ/X5eX1X
 JDgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>

Add the 350 MHz frequency support that can be used for display with
pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
i.MX93. It is also usable for parallel output.

Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 4048c16c0578..4d83907553c4 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -89,6 +89,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(350000000U, 175, 0, 1, 0, 12),
 	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),

-- 
2.55.0

