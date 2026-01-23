Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C692BCF4A
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197882; cv=none; b=JQDcOCDvu2oIbXoC3D3+Dcm7SyL62KjwXUa5zT0Mbz88kAsBf2rQ4JsgQWP2qaHdBPhSeUH8rf6WIcVs3uXwvjEQu8CoV8KNoAjwG7KWsajxidTY/9fu3cL0XkZUVHwQx0kAWEwjmZhDqSAL9pDb1AcUdg2UvgH5KCZEAyioZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197882; c=relaxed/simple;
	bh=3FJVyYwjibioE8z0FaIQLQU4wiVDMFUqETc6LkpUfIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNP6bS7dkgAjtt93tiweAOylhMAhe2CuLYzGaiEDpHZw/Kdr9xeSIjOkL9cM7JJ5s9DSxz0IApq16MNodz98OYxMtwvx25JNSeY3cSuXiAG36Mho5NmBOiQQA9jvpn0Hh0fnVuki0M+EA6Aw3r/+3TW0VFrYfXjVD/Aa3KPLD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLTQ80cV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLTQ80cV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so14857785e9.2
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 11:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197880; x=1769802680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoxIu9OjLLVMlN1bgKytG1gii/pxvwu01d+fCwz2YnE=;
        b=lLTQ80cVW1phCXmouNz/R3TZNQ1y/OTexB0JdmWvH7G3ZwQqS9bO+kPDJ7EqNpQeov
         c3mh+xxIOMcB7x7hoSc65Xe9jCsB7lcSnapMRX35RKRk2gxuFg8B35fMp6gImsPvjDJz
         PIPcN9D/CwKj9oSrtg1oKjXrJPNPSQgI3nR6tmaUcvYXVQ12WmshoW/k2erxBE8eS8Qd
         bfE7oHbJ3NNERYJd8F+hzOWo6wbV/a6Joa3w/X1pXpfc2jCiGPj2BhhSMKSQfvabaV9p
         23AN4Dg8fxOKMK51D9a7cW70ozjZXr4BFr9YCQiBhnku9QiLORXmgXQIPm3Uu5El5loR
         ELqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197880; x=1769802680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoxIu9OjLLVMlN1bgKytG1gii/pxvwu01d+fCwz2YnE=;
        b=K6CaeomlQ0V7zUEk1fjhCMSvLloOUyb9CWOyzCM7HUe+KPuXipdio8Qf32APTxwksQ
         C7LmgEczJw3ZjYW19s4AsxerHbs9gyMz0IxTmCV8UDlVRAeKO7zKSC+GFceAM7tHXJ0j
         VcObgi2E4+MnkNl88ba0HHcGARK/iGCO9VYITvfLUP82yZCmb3CA7pTLpZaTkThYJhF3
         zmSTEUDegEmnl2prqAKSEeN2tk+UvFeun9K3liZ8Y3YqlnHRl0eeFkTw+bqMhNWzpNs5
         hgpoLwlCjLXcuQ51NkCQFWY47dZEnzrlayyJXt3sbxg/6AcZfyQsmAWbcGxGXbxa0lgE
         ApRA==
X-Forwarded-Encrypted: i=1; AJvYcCUffOgquA4PWwbcI7V1QrcrpMKAMd39Em0GfjBR2UuYfkFvt/KmEdc0LZcWRgddurTi940=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEN5Rpg05vvomuwrGTGIc7iL7AZZyI5xNXEzh82BGhduXklGdr
	EQGcaK/RrlA9/WafjQ9mz18PLn4cBNnF+Zlyx5pMcSRUShBLdzfzpsevB3lkBB2GSik=
X-Gm-Gg: AZuq6aIpGCLT/kaZg175/o/rSGIcNNyzFHrmYIIc4SIMDzGj5GTPtu0IxzTRCXj4TaO
	aiHDw9IUoW059svody0K3+e3rOln9hTcZwWxOG7jTsCy+3f7WuQo6K4kUCS38MsWlpz81u9G2fl
	WhoDtcna8lBH5xFUIMlEm0h6krxSu3eQJ2SK6dCodPKW5Lfmu6E0RQSVYVKHrKMr9a5W+uq/ZNa
	oVagnSPxKiBSRaiuDEVjL1XF4J/O3Yub0PAtp0EnGNUeRhK9Jc5vLImFJnIjW3GjsCrkJzVYaUu
	C8nYnbdk4n/X8W3j52HlVmE7Kbo4trWJmc4uJNMUikhhatEklAe2CI7xzvs1Hc+0M67GKhkmRxS
	NwkCzCL/zByTRLRhteA2Ee3bPRMseNCx1UXJj8h04PwS6qhlTaLu7FJbr2mI0Ll7x0s5JsXxWKv
	CkNilsZNTL6LCc+Dte
X-Received: by 2002:a05:600c:c10b:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-4804d65ebbcmr49706635e9.30.1769197879697;
        Fri, 23 Jan 2026 11:51:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470bfe88sm148591545e9.11.2026.01.23.11.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:19 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.li@nxp.com>, linaro-s32@linaro.org,
	imx@lists.linux.dev
Subject: [PATCH v4 2/3] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
Message-ID: <63369be0ec8a49294462f7ec061a7066b8ce9425.1769195864.git.dan.carpenter@linaro.org>
References: <cover.1769195864.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769195864.git.dan.carpenter@linaro.org>

The S32 chipsets have a GPR region which has a miscellaneous registers
including the GMAC_0_CTRL_STS register.  Originally, this code accessed
that register in a sort of ad-hoc way, but it's cleaner to use a
syscon interface to access these registers.

We still need to maintain the old method of accessing the GMAC register
but using a syscon will let us access other registers more cleanly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v4: Fix the formatting issue Rob pointed out
v3: Better documentation about what GMAC_0_CTRL_STS register does.
v2: Add the vendor prefix to the phandle
    Fix the documentation

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 2b8b74c5feec..65633b10e49e 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -32,6 +32,18 @@ properties:
       - description: Main GMAC registers
       - description: GMAC PHY mode control register
 
+  nxp,phy-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the GPR syscon node
+          - description: offset of PHY selection register
+    description:
+      This phandle points to the GMAC_0_CTRL_STS register which controls the
+      GMAC_0 configuration options.  The register lets you select the PHY
+      interface and the PHY mode.  It also controls if the FTM_0 or FTM_1
+      FlexTimer Modules connect to GMAC_O.
+
   interrupts:
     maxItems: 1
 
@@ -74,6 +86,7 @@ examples:
         compatible = "nxp,s32g2-dwmac";
         reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
               <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
+        nxp,phy-sel = <&gpr 0x4>;
         interrupt-parent = <&gic>;
         interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "macirq";
-- 
2.51.0

