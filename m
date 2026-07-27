Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D364071DA
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157307; cv=none; b=BRddkrq0bAxzxTHX0zY5NpaUh67SykxiPhgkMuFoXucmHmzB2Wzr+Q9TA2aDFl7mPMJDaEytuuXfGE++tPv9ECt2qd+NG+UaMhsww6FehF/nx/gu3EvXV3zE3Q2tic9NfrALvH0FIANHVXqSCKiMnZh0XiP3QVgTd2+GjsUHHxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157307; c=relaxed/simple;
	bh=mcp+INGNBDLkWgM2/iP49q8NDg7gGzxEBDYnhPQkYlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYlCSbKWcJQ4LIMJfX2ih2csYg5Ica5jcDE2g/VI3NoO76Vqe/MF61wysW/OhScfprALSwIAv9NkRj+tgL/NMwJGgDdrJzxaAfRETdnXAEVpBmmESU1GBRkycVhFzM/RH6HIiEpCxdddKvTXBfbS/5UWHp9c5zgeH55qsQ5UDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=kIK0nAkP; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="kIK0nAkP"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gm0aoatWU+Wl/ya7xcS2AWp8FVs9XWr2vfrWP5FnHMk=;
	b=kIK0nAkPTGDGCqrInmM75+kYTtw+K7JeX7brOqW4b2FzHPerv8TE3i78hZDkej3iPMfF7M
	hWBUk/VA3JKUcyWaU2GDwV86yjej7YMYVnvL/E0MM6L6F8NEzcNAgFVjDHwuMKop6WrwQT
	0poefusAL4rSkpEzhFUxtdApbD2DB6HOdySEi5+iRFfiafzaz0qybVjqc7m0i6nt7AFDjL
	azNEvKD15QpmGeLgcdNxokOb7rqUIpR084vqVP1jP2sQXOYhw0rZ5p+MnXgtHDjotImANw
	FnJyMdNnlF7itoAcGosHzVjJXEVxZI//IoheXx4gqV2E/MybzfANhLbVozfbQw==
Date: Mon, 27 Jul 2026 15:00:44 +0200
Subject: [PATCH v4 01/11] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-1-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
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
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=JGw6dwECTdV/w8d4QCeQ5+KwHjivFvbkjonDtHxJ5Qg=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNXbqoeMvq/PL3WwW5T2psau2ln1/iVHVn/DdK/q3
 EfrJgt3lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATMTgJCPDw5pnhcd1na5u155d
 ej8p73lrhVehy8X48Cdvyl7W9Di/YfgrYF0VfsRo76srLh9LvOc9aSq96Hl4prGE+ZT3sr+fbnj
 PCgA=
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..f154856bcdec 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -17,10 +17,6 @@ description: |
   i.MX7D/S, i.MX7ULP, i.MX8MQ, i.MX8MM, i.MX8MN i.MX8MP, i.MX93, i.MX94,
   and i.MX95.
 
-allOf:
-  - $ref: nvmem.yaml#
-  - $ref: nvmem-deprecated-cells.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -56,12 +52,31 @@ properties:
   clocks:
     maxItems: 1
 
+  secure-enclave:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the secure enclave node for full access to
+                 the fuses through firmware API.
+
 required:
   - "#address-cells"
   - "#size-cells"
   - compatible
   - reg
 
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
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
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0

