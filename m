Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7334939FCE
	for <imx@lists.linux.dev>; Wed, 26 Mar 2025 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028742; cv=none; b=BdwUHlYBaE2YU0malNB8TaXJlytk6jcQv0Aj7ylzrqC0g6gytODeeB24Ee6iP+8VIsxstY0ye2qbA3L+KTNHKyS6exwfoVv2r55XV2XNGytHz6F52R0vjU7IE7yKlbzxusdF/NbuUGSjr7x6u3sx/CmvAGwzQgMeE1WRrdpH48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028742; c=relaxed/simple;
	bh=mlEaBX9U88umeWt42naziyW6nVLrnt4dQkk77wbD1oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1R81XQUo46uR187IO3yAC69xxHySJRo0+dLxUrNw+DbRzaYjTw2JJP8dX04D7hcK5nImHaQL29RYo+RdpHXnafwaEvqHWqmay5AGPBBb1DkLUwmdPK2PJ5khZt6xYTCQByFeJJ8EX1FZlSoPFn8Ae/c9oHP89GlqKIEAoBbR10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Vg/TKEfy; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Vg/TKEfy"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 383CA102EB802;
	Wed, 26 Mar 2025 23:38:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743028737; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=JwViLCtqnXXrkg8ZqO8LKRpADuiS49lixDP4Qsj9lmc=;
	b=Vg/TKEfyytNm3CmeTjATXlonhJRXlTftZAsd4u+cxKWHMtLekI/zFDgVUOQ2vl2DBobd4m
	ut8qAlPythhuanpKfAVpMGXSatXvTcbPF4ECf6a88TFRSyy+sZPpnslFTkNA0D3llroiJ4
	ntZXS9R5vtGNpvjRhiydLqRi9re/WYeSGtHwRKIXOD1OS80CFu/hJAhHBryqLaGxQ8iBGe
	g35K6c9xzFsfokpeCbY+D0GcLcXkMgwsCEjA1n+OqaFQuczYs3R9Ky6QlIdd7W7AYBkZ9O
	g034cgSKtqDQdwhqQJFBw+X5JiEh/QZEKUeEUO6dcubQOTEWjBOaofQfI/X9Mw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Goncalves <joao.goncalves@toradex.com>,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin Evaluation Kit (EVK)
Date: Wed, 26 Mar 2025 23:38:15 +0100
Message-ID: <20250326223841.193234-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
used to be the Titan EVK.

Note that the SoM used in this EVK is a derivative SoM from Verdin
line of SoMs, an actual i.MX95 Verdin SoM is under development.

[1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Joao Goncalves <joao.goncalves@toradex.com>
Cc: Joao Goncalves <jpaulo.silvagoncalves@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Tim Harvey <tharvey@gateworks.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add AB from Rob, RB from Daniel and Francesco
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22..30dc200cc1561 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1352,6 +1352,7 @@ properties:
           - enum:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
+              - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
       - description: i.MXRT1050 based Boards
-- 
2.47.2

