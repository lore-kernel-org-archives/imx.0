Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62219E7CF
	for <imx@lists.linux.dev>; Fri,  9 Aug 2024 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723196893; cv=none; b=X8THjpQVjXFScicg0UrzghaFPA1Q+vw6pRy7WCD4KFUPRuD+w8mQQ3xRho4RJjX5bOjLFTobr/yt5sCUqj1xXAD8eaX+uOrMsl92kzNlyfI304wvpIcxqyXyvRgRCn2MBkf2trlfkZHVazawkeLrgy42H1e/ZiKGJMrd+jjDxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723196893; c=relaxed/simple;
	bh=Mj5q6Ht7ONsEOZwQLKFqH9Xko3VJLFvaLqH9flrU40Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fttfzh/op5p7cVEj3XCNgAydlYFGXY3M6n4BVzWuXAvxSAnESVvAN6ViMwiAVrEh7DSMtl6UZBcfdPd08KhkmCTyVOpOxbFJjG1s/fHqEZ/cd8NWNPR+xBNCUdLo7gOeNIeSnnWJXJF1Th94fLvphoxgCjSmopxF6bnxzJURmTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dshUde9K; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dshUde9K"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2A5AA22256;
	Fri,  9 Aug 2024 11:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1723196889;
	bh=wLgmakV2uu/fLVMKr1LfemMNcltofndRm6TxgbbFq54=; h=From:To:Subject;
	b=dshUde9K8Kam8eADtB2Av8RW6blSQaC/hs5vmkeU4D8Wn4pB/LxelgstlbLklNJgE
	 H1faKHcjz12m4wKTyBTObO0yxFEatdH9piOpRC5w7yi7mzIH38dfZsBlz1x3l5YxKU
	 fugg/PI7Bw1A+6TIhyKgHNorO6OYcdEQb9eSZcncRMlcnFDjqWYMVr5FWFcZ8+ZCSx
	 k8Ao21yoJuH+nyVE6tAoBRsFAnlxxOESm10Ulu6rxoK25aH+xdN49LcYm6RC15mkLu
	 JI6ztXn01eaJSth2Y8M/q6tRKFrSYzu5JvvvSGMCYTR+gxKdidFDZ6UpYpRu16/ryg
	 osAJZAr60dD4Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Team <linux-imx@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/3] dt-bindings: net: fec: add pps channel property
Date: Fri,  9 Aug 2024 11:48:02 +0200
Message-Id: <20240809094804.391441-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809094804.391441-1-francesco@dolcini.it>
References: <20240809094804.391441-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add fsl,pps-channel property to specify to which timer instance the PPS
channel is connected to.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3: added net-next subject prefix
v2: no changes
---
 Documentation/devicetree/bindings/net/fsl,fec.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl,fec.yaml b/Documentation/devicetree/bindings/net/fsl,fec.yaml
index 5536c06139ca..24e863fdbdab 100644
--- a/Documentation/devicetree/bindings/net/fsl,fec.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,fec.yaml
@@ -183,6 +183,13 @@ properties:
     description:
       Register bits of stop mode control, the format is <&gpr req_gpr req_bit>.
 
+  fsl,pps-channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      Specifies to which timer instance the PPS signal is routed.
+    enum: [0, 1, 2, 3]
+
   mdio:
     $ref: mdio.yaml#
     unevaluatedProperties: false
-- 
2.39.2

