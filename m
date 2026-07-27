Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C963F3299
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145389; cv=none; b=mWzqCMqy31/QtSxiNirRuIIgP9rrszevQYS/8a/JVed5IjhYthWiMqtyRu9rfei1mOYFN2Ycq1xrDWgfNrSV2/9UOwMd08cgR2BblPwOUkOgcp3cF5ssxvYzIemCGqmkCUY8QUMEOJE1dQBqsy2fvll3bTp4PfRlymGstRLS4ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145389; c=relaxed/simple;
	bh=XQYljDxfAQkQVhtutWJhgTayVtwm4DEbme6rGgycR3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R23K6UDLOzmAoQPphghImkHyUq8bZ++lCzj+ai8l0nfsCBID9qUBFglCeHDWJw2nULNsMnd/g0Ryg9vIX+nozEZANtR0fNtuctdQ8Bq/5URgFcIrH/hEfeXvUQBdBkxOEmhdXYSab6+kcn/U3yf36fmzItRxNrO53xsYYmn+vJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woHqv-00009N-Nv; Mon, 27 Jul 2026 11:42:29 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v5 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 27 Jul 2026 11:42:12 +0200
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPQnZ2oC/5XOsW7DIBAG4FeJmEsFBxg7U6suGTN0qzrEgGNSB
 SzAyFXkdy92h1RqFi8n3enX998NRROsiWi/u6Fgso3Wu7KIpx1S/cmdDba67AgIVISBwFligpM
 frML2OtXXAccvn7FOEV/G5EfVY2ldmUy3quWCnFijUOGGYDo7rVUf6Pj6/nZAn7/nOLYXo9JSs
 wR7G5MP3+tLma7x7e2ZliAlIIQGVnHWvAzGnccUvLPTszZrd4a7zkFu0KEEDbSy6RQUnD7U2V2
 XhG7QWQlqyTtpWFdDwx7q/K9ebdD5oneKqLoGqQj80+d5/gEwFE/+GAIAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=XQYljDxfAQkQVhtutWJhgTayVtwm4DEbme6rGgycR3c=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1a6BnOejmsr96vtbPsOPlaw/TrFQtmyuk+ey3rCSs6FF
 497vjTpKGVhEONikBVTZFFZWMEn6vHBM3KaCBfMHFYmkCEMXJwCMJHFfxgZOvSfafF3zxJZWPvn
 4K5r3dLrcndvV/8/h7X12YEzKs9F1zMy3P+w2mDzIYl9P9/bL3gjdz3mi8i0zOePzxRxphS81Zo
 xiQcA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v5:
- convert to overlays
- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

Changes in v4:
- fix Makefile sort order
- add touchscreen fallback compatible
- fix lvds_bridge comment
- Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de

Changes in v3:
- rebase to v7.2-rc1
- Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de

Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Søren Andersen <san@skov.dk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (5):
      arm64: dts: freescale: imx8mp: fix sort order
      dt-bindings: arm: fsl: add base compatible for Skov i.MX8MP revC
      arm64: dts: imx8mp-skov-revc: convert to overlays
      dt-bindings: arm: fsl: add compatible for new Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 11 +++++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 36 ++++++++++++++++++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 44 ++++++----------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 33 ++++------------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 41 ++++++++++++++++++++
 6 files changed, 108 insertions(+), 59 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

