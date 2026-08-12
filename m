Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34444503E5
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541410; cv=none; b=j99/X9gnADpnu2iAabINb6Tj6cnBPShPWN722wJA5NsZsJRdy15cwRY0TSPbvexmdXYhVcQLkWqxN43k5WBA1L926qWchpaTPCXEe4ypZwInCEQKUG2LPKskJVmEbn0SSv752xoieoUbU+Mrja2V7OKqtPBaC3PUyHL3j8D/qVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541410; c=relaxed/simple;
	bh=keUHjjvYqwkOwXtDzaoXYwFe0IqBYhmJuGmGk8hRA7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bT0+nCWXaq7eIrrLuro1GBQmnl7H1Y3TvItDe4qWSHXiz03rC3d0Uak70FIyc9r28bVwV/Qm6HbqITL/eKXYe92SlUemki+tMPHywCwXY3Dm6X2bLxSpIUpAVdSFWpQ4N3OIxS5m/FYmyNyhW3u6d6Aw1n7SPDczzHuJ3Jjb/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GDpOVXcx; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="GDpOVXcx"
Received: from francesco-nb.. (93-33-22-216.ip42.fastwebnet.it [93.33.22.216])
	by mail11.truemail.it (Postfix) with ESMTPA id 5EA0A1FE01;
	Wed, 12 Aug 2026 15:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786541405;
	bh=E/EkwIcEV7yYUvSJ/U5LITg3Qm4EwENafAbFHdMpYGQ=; h=From:To:Subject;
	b=GDpOVXcxLRZPMjQPjWbnZOBdmrk20LoHpn99KnFXAb1JZRdelHuVkqHQ3KsIbWv6x
	 P3XLJkdXz90DHyQBb7fgs4lX9XbHpA+oXSUG4iV54V1kPY/s9Ai5xuj3HZpameahVl
	 YGg8G+joTzslLOHjiFNj0JMl+F14oj3mWfSfAPR00QwtNzZrc87eZQgqiHsCfbjhIC
	 Z9xjK6traDD0cYNKkVkPE4PcKOM8oOMg09ACmrkF/DCkZRq2eoctA4rNr+gm5rkxUx
	 WAmaaY94qUVrhoUEZkvWaLLtgk9rBa+WcRaXHNcx5FM2Cpazi51dM7zk/PoEDkH4PB
	 TH6quSBhsZedA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Date: Wed, 12 Aug 2026 15:29:51 +0200
Message-ID: <20260812132954.148571-4-francesco@dolcini.it>
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

The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..1eb1cf2d7395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -229,6 +229,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

