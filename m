Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6913E0255
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792243; cv=none; b=UkVXQ6Mu/1h/AYVj0vkU06wdJUPPT3cKUvGh6EU4q+ZnP5KmHFEEQCfFSoYY14yDj6FUC37yFMKbEdz52HPgnqlE3cEF4p4uBaeXJ3Xx/9bliyELzQAOlNmyOPZTMB4V/AA8jGrLhZJB00+ISOYUCTdhW6uT/iMBIY27Nh+/q5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792243; c=relaxed/simple;
	bh=BpaHoqJWuKtjcZIj/eDmPNfl+mV0bZnc2trJCNqaNbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkujipE5ddIF7gf5fnJ2NVxHJVCIXHjAdeF5fi3d7Rt9ExBIqGQV4jJKxf55/zRlIhdtwm4qBSr82orfaVUBiRyeOozpB6goDvW6nYCffp7clDC3zipV1Tv71OE0dI2G33LK0z3fsRs1Y3eAQMswfVHiJzQZ8hi8HYpFL4a/lyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=piJI+Bde; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="piJI+Bde"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgiwnRvqXQyohXJgGOI5oYCACH+C1E4pfz9+3bhuLq4=;
	b=piJI+BdeFoeti+kt/rTcEv166EZoBPGCprtdpfH3wvxZJ+1OfVV6ry10uVvXnlFhZMQuWz
	cpeRe2mH58+OdpH1VqzHOVbGXt2lqnSGh/ujjAceO+GT0zxMVndnycOCN+9SXsasj2zje0
	aXUPEqTtbZucBADUgTtxm0rjCYFCo9I5VDM7fl+zph7E6PwfTmT8QFG539fwdu9OJ/5IyN
	UBkHRGWjkisYhTNrAK+MNvheyE9GBHKEVl20O7wnHr6La+VdmIsXrQeWvrfMZYNqWNm1pN
	WWu7bGkMSikL1SVByaZklISfXr09iG7DIKjRFOU7v81S9j5t6EhOYxHMwVSulg==
Date: Thu, 23 Jul 2026 09:27:23 +0200
Subject: [PATCH v3 01/11] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-1-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=VFW8MO++U+kECJD4HNHkYMwrSbydVRwF5+pIElZnwEk=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0FaT69bGXAK/c761cQcedwxzflvZt/JP02rGMNkEt
 lWJX8Q6SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJpIVwsjQWP+nn5/DiCXUJ6sk
 5PLSWMXfvKtXJj474HguhW+Phvwjhv9+G+Y6ZdftzROY9F+DN/GGwmWuxZuWyLpwsuy4UTKp6Ak
 zAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The driver currently uses the limited MMIO (FSB) interface to access the
OTPs. The intention is to support the firmware interface alongside the
MMIO interface so the driver can pick the interface that is available
(firmware might not be loaded) and fallback to MMIO.

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..38fe451f808f 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -20,6 +20,16 @@ description: |
 allOf:
   - $ref: nvmem.yaml#
   - $ref: nvmem-deprecated-cells.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx93-ocotp
+    then:
+      properties:
+        secure-enclave: false
 
 properties:
   compatible:
@@ -56,6 +66,10 @@ properties:
   clocks:
     maxItems: 1
 
+  secure-enclave:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the secure enclave node
+
 required:
   - "#address-cells"
   - "#size-cells"

-- 
2.55.0

