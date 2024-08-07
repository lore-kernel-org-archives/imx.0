Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE30F80638
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041855; cv=none; b=JSd54tt2Z2v60Mh0ZdCESR9pBvMKoXzEjU2gmvTDN53ZyhkCX9PR0KTUVZCFh4oYW0Xmq9h69YzypSPuHbtkXUMpHTiTrADY9UGa9LxKURIkyBHoTXa0sT4VnE3o1HH+I+r8A/xS/ynszGFGG/SsjVVgUPkEh/ZLlPpLGOxTYiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041855; c=relaxed/simple;
	bh=NZcmwPI9cW0n0CJkJL/ps67EW4H3d9nTVit6EgK2L4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QnWvczhtN18WOrNZGjc06LkQNv+ujTt5h3iP31zKPpL7iLjzIXSl827/jnlPXre/1gsY7r1VTwaLFjdbo93Zgo6gkTre7QO5ZoDzv54r5VwYBThhq8SHhJQmA8oMnmRLnnZVzWonWrltG6t1Zm5C0G6ThA8bU41L8uz02RzQYPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Vi9R8B3U; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Vi9R8B3U"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 27A0821B05;
	Wed,  7 Aug 2024 16:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1723041842;
	bh=JzKokxW+QzlgsiYj68z1A8RZdfcJ1yv1U8asgBKtrxc=; h=From:To:Subject;
	b=Vi9R8B3UbF8LbSEA4ufwpoQyScIxMzdPlmTwar17ha2PUQREoBM5e4/0PVvMQLPVK
	 bt4U3IbmtK2jYp8lTfM1i985uQNrXOFntKLh5MR5eVRPuSkS7YKC1wR04qWQGnbHse
	 mkxmuctH1eWc74tZ0uBkv+LCYTLX37Tk5mUXVph2jOkDHkOsPAQNGcxb4jKplhzRoy
	 mSYkA/4NCg91+5H8/MAnlA6SVjzDgzfsVZzpXwb0s3qwOGhrDJvfJkFUS/YqG+FwIV
	 NIVMh9FHrhFtUDic7XIKeejgzPvP6IWkWYuPo4uBHiT551mctaxxcOBaU5LBW8kUbc
	 cTpFJCEwV0ovg==
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
Subject: [PATCH v1 1/4] dt-bindings: net: fec: add pps channel property
Date: Wed,  7 Aug 2024 16:43:46 +0200
Message-Id: <20240807144349.297342-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807144349.297342-1-francesco@dolcini.it>
References: <20240807144349.297342-1-francesco@dolcini.it>
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

