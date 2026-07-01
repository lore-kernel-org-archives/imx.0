Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E89C3B637F
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895818; cv=none; b=g5Nf8B1lj6QE+EztvkaOM0MtEHDkVAJg9qfsTt3PrL8Atej6g8MA82s2X6Rjwv581I5567w2WnOr3OFraSX4NLUZP116qewSqXdn7UNhKveUGjIX5XpHzviNBmjU+qLz6mxr98g/zpAHJa4ZSjJeX/gKcnLHv2gPd2mXf2zaAIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895818; c=relaxed/simple;
	bh=hHFBD6IAL9KyNgKAgN7lpNWUABAcsodkJiIi1NiV3O0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bJDKlrCDbBQhRdMu3b74TkO3Utb3m60wE8EOcgV6j0RugeoEoJ8f6JtdMl/VPaxLsP3EBAndssOtZhLtMlxCpQ7AmTweUJBYEQSxCx5PXWhQnslhinRoh3/aN+m5r1GB4GEii6fsZOy61rcWotXkk+61ctoBpZzo/rdFZDx3lzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1weqLE-00051f-8R; Wed, 01 Jul 2026 10:30:44 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v3 0/2] arm64: dts: imx8mp-skov: add new 7" variant
Date: Wed, 01 Jul 2026 10:30:21 +0200
Message-Id: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7QRGoC/5WOsW7CMBBAfwV57lXOOSENE4iFkYGtYiD2QQ6EH
 dmOlQrl32vC0KETy0l3enrvHiKQZwpitXgIT4kDO5sX9bEQujvZCwGbvAuUuJQKK0g1SIiuZw1
 8H7/uPYSbS2BigOsQ3aA7qNnmqUyr27KSJ9VokXW9pzOPc+pb7DeH7U4cX+cwtFfS8Zl5gh2H6
 PzP/FIqZvz9eioyWEisKoNqWapm3ZO9DNE7y+Onobmd8M9eYv2GHTNI2NbNWWOWF//s0zT9AtM
 8NMpcAQAA
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=hHFBD6IAL9KyNgKAgN7lpNWUABAcsodkJiIi1NiV3O0=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ5bLBeOqEwfeCAXoXRLdzyX7IPb5X+3s3xrvqt9c0ZexM
 j/OGnGjo5SFQYyLQVZMkUVlYQWfqMcHz8hpIlwwc1iZQIYwcHEKwESWPGVkmOD7xWJb6OuYrf3L
 9mx5U1QwK+7wBfPHYg9nl3yMmHpa7i7DX9nNrm4WxtuvXr4YnhNiFOvFnqmhukkwTHj1l/gjx18
 JMAAA
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
Steffen Trumtrar (2):
      dt-bindings: arm: fsl: add compatible for new Skov I.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 3 files changed, 81 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

