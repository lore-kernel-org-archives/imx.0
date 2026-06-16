Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC243C04D
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610841; cv=none; b=G1nyMR0jgsi3XBs9RsHZSHoNFWAB81yZkTjdlDYuJ8nRjlRP9LI4fXj7mWc+R4b04fOweNsshvg8eZrMY1FbroXv+bi9JnrAij7I+eSJOdodzKmAoPI6HcFTMBN5ePY38XeBayr/U9AlUoMD5P2/vMufAgCievm+KRXXGPRc/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610841; c=relaxed/simple;
	bh=ZMEnSpVZGDO4LdMl3ZPXZTbyqR1nlN1yXSB75VPmTco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5G+mqq2Es4hLigdh54XabA4YTS3/4vMjXdRE3aE5vH8/ptIg1kmth9dBTKISVh04TX2/hfO0lCs/nazoQYgxNu+YJcv//2/aOysfelIiouqPnhyuTTmIk0nLU8WawcL0YA3tN8nXLSISP+IVhiehjb9mu4Zng02+Nu5mF36qYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=3X3MkwZY; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="3X3MkwZY"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CC4pQBR74mo53LWq+yitH7clGdozvjJ29YJSAet9JCI=;
	b=3X3MkwZYmEY3JDXqi91Ov31Yxx3tk6Y2gflCc/3A0XqIeUg69oEf5IRIo/O57dI+LStLVu
	+w9dK2Mtl2t4QksPbi8Gie/qYBGVAt8P52//iENHhH6mxeIgAnkGW1Q8rt0cEkMpOCuAq2
	ebZiCgnINDQzANBUBsAIaFdiTiy+Hl2FAZD3YK1QsozYLRyBrJM4yz+m1FcjJrKvS6zMIO
	9XVe+msJrnlkxtTUp4qJHZLA25ZzreUXK27+O+RHjpj3obXzLekzoj0UZKPiiVLzdNmIV8
	DCzqh8vlo/TBuHXAB+C3VC/ipDxlIMg1EKg8FyxVnvBsSRp7xWceU6V9hqWVZQ==
Date: Tue, 16 Jun 2026 13:52:16 +0200
Subject: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=QWE1SsXb2/HbH2oV2EUZBTZVKiDh9e7EbFlxADzOCVQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMmRS8H5Ble8enx50TKutvRaY3vvj154Mjb6XCnlCn
 yRSb3N2lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATMSigeE3+4qQw6Y7WZj3VjZ8
 k5teckRNq++CXt6E0B3TtgqVnJWNYvjvX3+V0XrTAZ83f1UPVr1fu/yMtMAGodLzj2p5wiNs5A+
 wAgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..14a6429f4a4c 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -53,6 +53,10 @@ properties:
   reg:
     maxItems: 1
 
+  secure-enclave:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the secure enclave node
+
   clocks:
     maxItems: 1
 

-- 
2.54.0

