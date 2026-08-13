Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F913C872C
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613333; cv=none; b=p43i1OEs1xFHlyr2J8eD4A3WkisdeDydcy9s0iK1xPvYeZeDRNPkHcNKmZA61Q04e2fOdjHgzYWR0l4fz5xao9X8ymRDgUe5V5w5TqkGoW3/KTyJmo6AWub2cnPNbFUaUIioxYnB3yYQCPnTlszCg1TtXFCi6qTnL3Lu7N4N5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613333; c=relaxed/simple;
	bh=FpXBcS4OVX6TDyrjl77dUxjgOX6peF7ZvCt7/xCCxsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+a3xpMnehjRq2yjA2lJ4AWZy4KuIY+7SD9ypcx2xp13zavCMaLZDIeIsKo0zKvqyAh3l34uOOGnG8svmkSg0uvdFWZMhaIFKmRVnZxx7RbSD8J2il89XGrcFKk6FyR0s+IzcEWfrnq4TAv8X5RCoAXeG4OKUeQJ8+xotPw2pyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=xweJDG9w; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="xweJDG9w"
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id A25FC22BB2;
	Thu, 13 Aug 2026 11:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786613329;
	bh=uMObuXg4XANbdtPQvTLG1yzUld/TUllacqUrLQ7NcZk=; h=From:To:Subject;
	b=xweJDG9w5XYkeRYl6GUrH/mg5AhHv664MD6H3sWNidHwOizM+yr3eZG1vwKOD50ck
	 yI4KwiERxH+E+MbHeZQV1AfLyG9VuofTHjAF3xFmRkn8eMmdjwQTUdpY690BZUx40z
	 DUdInTTAHdoH7DDGVGEcQXM7TAqDFU/nMiyGzBO0fQQv42vquG6yrCqZzbYnt31K7p
	 gLYU17eUImiiraU3xq/DlhIjK3XT2YuIhe473we6CDurgVmF5kDGMJBvWqMyT1fqmt
	 eBOsKtb/H8GJrEUKzQpizC1QrUq6DW5yg9D1S8SsdUHLa1+JefOj4aqHXp2ql2Gs1e
	 MrG2NSe0eNAgw==
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
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Date: Thu, 13 Aug 2026 11:28:33 +0200
Message-ID: <20260813092836.38367-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813092836.38367-1-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
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
v4: no changes
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

