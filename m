Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6243164B4
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147061; cv=none; b=WPoKPVpOfNEYj+lpgpGB6ZmkB8cwmr9cUs4q6ZXMvWalju/+47eD6C4nK9qFTAnti7kVKQaNwN1ikdLAyG/vnKGNYCJAGh87jwqShDsVJmCdKGmIwdwdOuUQF1FjVX7TRsubtQL7X4ubrVSUPzA51GTmrEQw9yNTuJQOBK9SKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147061; c=relaxed/simple;
	bh=PV3SdmjKgU9osMjyVt+kzQAAWhraTomsCDZ/1HpAZu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q+7X0v0faSb7dU1baGMuJkWXZaiCq4YePDkfHHAPmIkc/yRUTgx6pZhiBFC226xn0Q9VnaSrNJdsISOhyteEIZqbXs2h4hSjifGPZIhn+XThQPZUp85lyXyQYdvsRyNYKbHcaNcIEsCqlsiWGgoo45+6kNFzYqYClu25QLdo2FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woIIK-000792-8G; Mon, 27 Jul 2026 12:10:48 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v6 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 27 Jul 2026 12:10:42 +0200
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKIuZ2oC/5XQsW7DIBAG4FeJmEuFDzB2p1ZdOnboVnWw4YhJF
 WMZjFxFfvdid0ikZvGCdOjX95/uQgKODgN5OlzIiMkF5/s8lA8HorumPyJ1Js8EGJSMg6RJUUa
 jH5ym7jxX54GGb5+oiYGepugn3VHl+vxy0+pWSNbwWpPMDSNaN29Vn+T95eP1jXz9fYepPaGOa
 80a7FyIfvzZVkrFFt/fnoocLBhIaYCXgtfPA/bHKY6+d/Ojwa07wVUXoHbokIMIraqthowXd3V
 +1RUrdug8B40SViG3FdT8ri5u9XKHLlbdaqarCpRmcFeXN/quy8gcLJVtGonIWlv+05dl+QV9h
 XyYdgIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=PV3SdmjKgU9osMjyVt+kzQAAWhraTomsCDZ/1HpAZu4=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1a63rKMGtZ84bmNCtXex25cfBwZIvW34KzvBK4svcjyq
 c//it/oKGVhEONikBVTZFFZWMEn6vHBM3KaCBfMHFYmkCEMXJwCMJF0HkaG5qPXjPaG3zTcKmCY
 WSia07SLo+tAwIoEyzUmbZIClx13MzK0f3B7wXGv3XDDms2/D6icWZ0zLWy2yu89gj12k9e2bKl
 hBgA=
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
Changes in v6:
- address sashikos rightful feedback
- Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de

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
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 39 +++++++++++++++++++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 44 ++++++---------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 42 ++++++--------------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 45 ++++++++++++++++++++++
 6 files changed, 119 insertions(+), 64 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

