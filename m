Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3F3403ED
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955091; cv=none; b=P9jdgpLjCk1+RIpQ1Hs8kJfk6+sh4XRi6cnVDu3NaCL0AlJvsI/Vdf9pVKF9AGJx5DR8K9X3JCUmBJtLuUAHOMWym/3W4en2HUktEk4H50go84mmDHRTQzHj4FUZ+9VW9Zfbl1Zm4iDcqSpfWx/SozTEI0XSag7dlGmpZMhz6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955091; c=relaxed/simple;
	bh=q7d5KK4Tkj9nN5q6BGakd8ongm8BNq/e1S/qiFgCVDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ascbdpYmVVQWF5+fLP/ZMQllhpO+y2jrCXcD9NpDwMZYpVbN0t/Scd32TRftHUW+p2IjhJefkLLppy9h/ROpRJo4gMMIwmacSmXpcLa5V9UZBjsgJxQ49RV9fXN2kz/iBMkbq1Bho/3ZSYtzYVD8MbAznLCT8z+BsR1S284uU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Vyk9s0tH; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Vyk9s0tH"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6iF9XDEbaIplAtmrsCBBxY1vgXUOaIijCD0bkF3jCo=;
	b=Vyk9s0tHAYfyOa2Kab+MzsLNfE6QrJDFb9FMln3P6l0Zc6yENjya9hATh2402sLf6FdDvo
	2ZFAVDAXSpXdtOrjCMI+cFoaHqmwg5SIGksTLanUUWhPGJ6sbhp2G/qcqtMWuDVD/xVvok
	r0Xdcw1SRslgZooDi1p6BfELyDqtzTXy76M7aQ2vcX2R0Rhk/3q8Wn4ZKsMZF8FiRSCxYK
	i+JdM68jbWHs7ysu1TytSlLsSc/13vdml8YPu+k0TrD9h26pGjRJCcas45f0da6mp/i5Qs
	SOUNqLfyK0gwL9JV7s4zCQk9wcfntx3cD/NEtKQF2H+s0sPNrNOrcqQftsPrvg==
Date: Mon, 13 Jul 2026 16:53:37 +0200
Subject: [PATCH v2 01/10] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-1-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Ll3DwEtNXqNyJE9cnd67/HZkEW9Unihh2hJcAMhBqO4=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT6B68qcTVm9497jpMDmUujy463Xx2Bypy3NNPn1es
 Mu3f1ZzRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETeHmJkWPd7z5ScL24bF3xY
 +UNx/7zti5Quryy603vR7KPvpOK8+WcY/ultO+i6xNu2xk99bYPwx7cbXtn8sDhcHfVtxeI/CyM
 F5jIAAA==
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
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..70901218871e 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -20,6 +20,16 @@ description: |
 allOf:
   - $ref: nvmem.yaml#
   - $ref: nvmem-deprecated-cells.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - fsl,imx93-ocotp
+    then:
+      properties:
+        secure-enclave:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: A phandle to the secure enclave node
 
 properties:
   compatible:

-- 
2.55.0

