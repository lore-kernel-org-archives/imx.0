Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6AD187346
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173481; cv=none; b=boobfBJ4ix7QnpJr4OLpwBF6pB+98vRLAdyUxaoCoUl6HZaZIA8P4qaH7gF7IQibAQHCUN4CbspS3pEDU4RAri/Xspecm64h9cVMyP6um+FsU7GIdlrAsl0H5cDjpxKCIMBrqgEVkv7KVi46/7nePoRbDih3Oy3c98GsntbuaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173481; c=relaxed/simple;
	bh=IOdVwCGpHURAxEFNbq3+rF/5Sm3cTKnDoNdRAap04qk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WntcfQxWKxivLrwlg3K3fah/F0uHTFS84ueCB2hAaHm065wyBc1hQUa6L3lQyKKtderJiBxDz5QwYuAIT/bqgO9ulX/DZaA+d0UAxU9idEiQ0JlXAWJ9QGAp29ZJQzfvfuCEhfaesAOZhDMFn3G0BTOwGfnwWIkkxMsCqOZCc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F0F4320226F;
	Mon, 27 Jul 2026 19:31:08 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woPAS-001aZh-2m;
	Mon, 27 Jul 2026 19:31:08 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v7 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 27 Jul 2026 19:31:03 +0200
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANiVZ2oC/53Qu07DMBQG4FepPGPkHN+STiAWRgY2xJD40rioc
 RQ7VlCVd8cJQyuRJSyWjvXr+318RcEMzgR0PFzRYJILznd5kA8HpNq6OxnsdJ4REBCEAsdJYoK
 j753C7jKVlx6HL5+wjgGfx+hH1WLpunxS3aiGcVLTSqHM9YOxblqrPtDb8/vLK/r8vQ5jczYqL
 jVLsHUh+uF7fVIq1vj+9lTkYEGAcw1UMFo99aY7jXHwnZsetVm7E9x0BnKHDjlooJGVVZDxYlO
 nN12SYodOc1BLZqWhtoSKbursXhc7dLboVhFVliAVgU2d3+m7fobnoJC2rrkxpLFiUxf/1UUO2
 rq0ssgbcGH/6PM8/wCGrFqc1AIAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=IOdVwCGpHURAxEFNbq3+rF/5Sm3cTKnDoNdRAap04qk=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1b61Nvvqp6cauyf/FFObC9TwD9bto3aXTuXqrBoVBt/4
 vuStGldRykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIn0pzD8d9m0v0rJUF/pg0jX
 JI6vX/98d804Gn9wp+rSNY8yD0y6acrIcONrnIzT4o77i48Wiqem3PzH7e98L9R4okAD5+Xnd5i
 ceAE=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v7:
- address more of sashikos rightful feedback
- Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de

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
 arch/arm64/boot/dts/freescale/Makefile             | 11 ++++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 53 ++++++++++++++++++++++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 44 +++++-------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 42 +++++------------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 45 ++++++++++++++++++
 6 files changed, 133 insertions(+), 64 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

