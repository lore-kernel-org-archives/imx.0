Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FCB3932D3
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179239; cv=none; b=jkj6jnfjNv7LQUQ4XPZr+Um5v2U56Z8ZckiEJiXCEs4YjcLi2xol96KI8svQqVP4Ls850nvsKtRKS9KCl/4r2UQcyuwpn7+aTLIW6BSC6UOR7x5rb5QdpyaeuvOaTjNIMAivGFAdFAnM9W+J1ULxELQNWOJv6OaSdW8ZPZacaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179239; c=relaxed/simple;
	bh=I08s8osMgtyWLzcg4Hk+kKm/7wWLucO+lYPf18RaB3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYoV1S1qN05PV64w6qbtX2Yi3/nRzqoUMqv2NSkx1mZVZBCKCJrLlHYm4SjvXBTmJ7oGiV0moxfi2WmrXXsICLwL6gbunxV1p2KpISKiBBAzrd0bXeYhMrkVm6BvzkPZqAAHB+yDeIDu8GhcXfrvgEF8OGzKFNL4IjFJQQ9yEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=KmKcW7WI; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="KmKcW7WI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 531F1105B53;
	Fri, 16 Oct 2026 21:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792179231; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=eA1Bhd/Xb+LpW3/jwkYBUSYVO6nQGoBeNGE5Gx0OvK4=;
	b=KmKcW7WITYcPBPo+5Ad0ac9Hr1oGhvkv+4Prnn2AViB/jsyv5tQoBYAMilSusmNF8EGh1x
	XpWhMKEo4DVJahSJOf8RAFwUs7gLxwQ+m9Qzis3k+Lpay5fsM6Zx5kJ8Mfy8O8SR1bId68
	hcpxTOc7BirR0r/ss7gC/BCxWEFeFpXDSylpY++tJqnNKtuNXjm6Ic11f/Xy/P42iLbgCU
	uE3SWYtbagPWfUwlYaZXVkWyJhRzpcKn7WE/xrnskoiTlFccsYyphGujXgqPDbXVH6APY1
	e1NLMUHMpXEvmKy1ZzRAZY+8FRHCs/lPMyg5jf3K202WClN6RB2Z1aonL6oVAw==
From: Marek Vasut <marex@nabladev.com>
To: netdev@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [net-next,PATCH 1/2] dt-bindings: net: enetc-mdio: Document optional MDC clock
Date: Fri, 16 Oct 2026 21:32:00 +0200
Message-ID: <20261016193344.115518-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document clock from which the MDIO MDC clock are derived from.
While those clock are always present in every SoC, they are not
described in legacy DTs, make them optional. The clock-frequency
DT property is not described here, it is already part of mdio.yaml .

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Clark Wang <xiaoning.wang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh@kernel.org>
Cc: UNGLinuxDriver@microchip.com
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: netdev@vger.kernel.org
---
 Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml b/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml
index 71c43ece82954..708d410187baa 100644
--- a/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml
@@ -31,6 +31,11 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: A reference to the input clock of the controller
+          from which the MDC frequency is derived.
+
 required:
   - compatible
   - reg
-- 
2.53.0

