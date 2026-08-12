Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E19450418
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541411; cv=none; b=SgfHDyHX6DMhd+K0daHMsbaa+DtMkX/LKI2kVkb6HRt3RPMLehXbnvgkM+Y7Rfub62D5tTA2llW43Aa+clUAOm01VfR2L9JUb2XXRQHzbEKBrlsjlzyrcPnOzExbnWRooCj94SYAj9hTKWPPN49Ehah5h2AhTrEyEhgCuKxDK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541411; c=relaxed/simple;
	bh=eJ+DN3g78xuOcjepEGLo/zl9oKNVS+KWnzCvl141BUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0kMcVVUa/qOMXz7/O1xZHzXcNh//qkYHaqVxFQt+jTatFePDpWpRrq9mY+jXNzy6OR+kKinLRwpDZBh6IU2ZceXazR1DEqWZuWfDMpx/u8lzbkr8Sg8mvel6UNGhhxw2wSND3eivvdjImXy7N4pTz9H3ZKlkEbGMhoiF0ngwwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=qDuiVMWh; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="qDuiVMWh"
Received: from francesco-nb.. (93-33-22-216.ip42.fastwebnet.it [93.33.22.216])
	by mail11.truemail.it (Postfix) with ESMTPA id CC7371FE07;
	Wed, 12 Aug 2026 15:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786541407;
	bh=jVOkunoRXosC1p6vhKI/AuCkdMNvZR5OdAPkS17pMJ8=; h=From:To:Subject;
	b=qDuiVMWhztqZCF0H7ezmP870ZSCXfeKdv61mwFLsKxrrJorgtz0NywDME435F3ssP
	 x0wYA6TxS8msDrjHNZASpTI93a/QMUzvqRTFVS+tnFg8Tv/R7lFJ0Pas2wpmIa0dMT
	 xAzLnm4hgRa/mdJdpAJHFh0fDpHpk7wzWpOIet6P9ZaMCVsb8U+HwlNPphQQDS5jYD
	 HcJWGF0SaZspmbIWZEX7NusuKPJGEvBtHmSlExjYJOBacc7xwzvbWr2Q57BYeageTB
	 hMwikeJznLkM/c5CL+6POSHcMhJ/t/ixFyRZnKzIR5iPphN3EpAM+m9ka7e4FldduD
	 8d03oTbUQ6Erw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] ARM: dts: imx7-colibri: Set LCDIF bus-width
Date: Wed, 12 Aug 2026 15:29:52 +0200
Message-ID: <20260812132954.148571-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812132954.148571-1-francesco@dolcini.it>
References: <20260812132954.148571-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The lcd DPI interface on colibri imx7 uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..c4088d3c5ab1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -537,6 +537,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

