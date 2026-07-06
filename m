Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE23EDE4A
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322311; cv=none; b=bL2TeNEyEqrTrm99TnxJFvZEf7098cNSqx4q7dSkgp3Kn+2dKj2ytI/As9nmX0zw7eR2vYH2tpDu7zfdkb2sUbJTAAHgypNzJx2sfdt4SYv0vyySqG8rH/ew7/6XQkPezYiPA9+6ZHrqqvXaSWQSzgnpXbmIvMvZSGmg6DfbEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322311; c=relaxed/simple;
	bh=sDeoUq1u/Am1yCm4MTDWcmJbLvqrCVZvES/IEZ4gWis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nmyMlbfCfeuXUr8fndiLmGNRHHYMb0GgTtxDLUU3x1gA0PsqV3OJN6RtoepfC1iGnXAuJXwNPTPmwGxVa+0AVNuik+ENwHA0AbbzMXvVBka9gKINQ/lAh8ewZN4ZBewXqzlsYzf6/oQ7ZZ4SqkTysBU2jPzqomxy9Ac8lsDH6Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wgdal-0002vc-QD; Mon, 06 Jul 2026 09:18:11 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v4 0/3] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 06 Jul 2026 09:17:54 +0200
Message-Id: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJWS2oC/5WOsW7DIBBAfyViLhU+cIgzteqSMUO3qkMM5/hSB
 SzAyFXkfy9xhwzt4uWkOz29dzcWMRBGtt/cWMBMkbwri3raMNOf3Bk52bIzELAVEmqeNRc8+YE
 Mp+u0uw48fvnMbYr8MiY/mp5rcmVK25pW1eIkG8OKbgjY0bSkPtjx9f3twD5/z3FsL2jSPXMHe
 4rJh+/lpVwt+Pp6rgpYCahrC3KrZPMyoDuPKXhH07PFpZ3hYVegV9ihgAitbjoDRV79a5cPuxb
 VCrssoNWq0yi7HTTyj32e5x9Cvdh0ugEAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=sDeoUq1u/Am1yCm4MTDWcmJbLvqrCVZvES/IEZ4gWis=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ5Z32FoWX2FfvYjO3d8Om2bqxtxL9l16dZfIgpS2D7WaB
 1SD95l0lLIwiHExyIopsqgsrOAT9fjgGTlNhAtmDisTyBAGLk4BmIjyPEaGo//b056mJ5+KbvFV
 uht45KL/2/9T0tqYS9USlotoTY7oYPgrd+VbxmOJ55EGe7w2uspsunWr6qT1g2bJ9ve5l0Ua/8/
 gAgA=
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
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (3):
      arm64: dts: freescale: imx8mp: fix sort order
      dt-bindings: arm: fsl: add compatible for new Skov I.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm64/boot/dts/freescale/Makefile             |  3 +-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 3 files changed, 82 insertions(+), 1 deletion(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

