Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E03CF678;
	Thu, 19 Mar 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924626; cv=none; b=nK2y9NpQXbZ3DORWOVQvxl7EBaV7vD2n53aV3sl9jpeJApq49DYqXVmU3YV26CDVMEf9WsMmD1o2iG7zjvXGbezhlP1sf010dQZEJ1qAefqtVKRh1vHoyNr4yo1L4sEIZeHLBs1XH1VumW74OPyxS4srbL9vVlRc8mT86eEi/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924626; c=relaxed/simple;
	bh=RtuqjL7hrCBCaiZrPFZ/NW1qn4+rEfhrXhnk91TIbhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1kbj9Qjdn4yqVrSiigBM63KREUsNcpmXUBudp2M4hefxJtCzxs2GU4yyEifC9rySYBdMlsZ0W/nImrLUadpYgQ/UOAUxESIMYur3EyylkdBSAnGrneNypr0zBio0sQa9CXyIK7UF1cQ21WxTlV6M6YsWg0g9CLrxNBkI5cWh+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Y0b1u9mT; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Y0b1u9mT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7Q8qsvt1bZoH/VIKZxsYOsSv+bdgpuhRY775z6O30ec=; b=Y0b1u9mT9N6f5eWbpiyteHqhQF
	sMqJunQZB7NIb/23Kwuyb+/apFhetS2eLHflJtOhJ773lcFHK46tnoF57cIajbhZLg5LkoplQ5wTK
	RqN7394namhnjRE1c1xWXTBqqrou1Oz4+Y3DnhArSMOyVRsREu0O8BhXE7FNVULb+32wXv0EOljOR
	lIhhTGtr/6O3YGatC7WAUMmBh3r10e+58/t/lqJRMWgoZ/s/2howZ6kc2SxyPd5dyWlZkZU7y2jf2
	oCrUs0395fdIrp+hov+SRyC8cVBHgTGenBJuGot3zRVCk0ZTbnxNrM4pRM9XjshXI0QYxHF+arQ7W
	udEMlEaA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3CpQ-0009xA-21;
	Thu, 19 Mar 2026 13:50:20 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3CpP-000MiA-2c;
	Thu, 19 Mar 2026 13:50:20 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add MBa93xxLA-MINI
Date: Thu, 19 Mar 2026 13:50:08 +0100
Message-ID: <20260319125013.2421621-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
References: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

Adds support for the MBa93xxLA-MINI SBC.
https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v2:
* Collected Daniel's R-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f641..2c86d2381d95a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1558,11 +1558,14 @@ properties:
           soldered on an adapter board or for the connector variant
           MBa93xxLA mainboard is a single board computer using the solderable
           SOM variant
+          MBa93xxLA-MINI mainboard is a single board computer using the solderable
+          SOM variant
         items:
           - enum:
               - tq,imx93-tqma9352-mba91xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa91xxCA
               - tq,imx93-tqma9352-mba93xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa93xxCA
               - tq,imx93-tqma9352-mba93xxla # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA SBC
+              - tq,imx93-tqma9352-mba93xxla-mini # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA-MINI SBC
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
           - const: fsl,imx93
 
-- 
2.43.0

