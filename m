Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C823B34D391
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594055; cv=none; b=Lh7XnhJb0/PXwdEggvyd5PeMDJU4vw06+2wFJuLDY+IQQFmlYlv+3ATHYouHXEqbNMu7xxTX7kYBt2Ua9Nq81Im70TkmvkLymOc6IaMDUqU5aXo8UOpEhqD5q0wXEpXqnIPhoYhueohlVwv/cBZkIOpzLnFjHAIHLpcFkbhYvqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594055; c=relaxed/simple;
	bh=sDkMjLbL7aCDVYJJrKBs5NYrhqwGriqYfTTJkhobZGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lSeJvVGpWqyATvAmGey5m9ga5t0iHcAESMkTs/GDhangEk5zWhO2FSMZU7mlDdw+JFogHbKK7HVGQFTk/8nXJYN095EkSLSjhkxwB8JTBxdWrONMvcT9fy5UaJLAbawqOfKYRsvfhGWjs1tly+TnQTUzrPNzaHUXZhqmKwR3D/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wrecnnga; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wrecnnga"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so74975605e9.1
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 01:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594052; x=1770198852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3m7FAnijbp9arjCJzyAV5hHlJTCfqdJrtfHXLh9EXis=;
        b=WrecnngaVqZamf/oL8nE8OjcggIaeeCHaKRgw0Czf9hIw/GbGFjMDQ31lHjtn/h5SZ
         OkBhm3IEGe54O7lmrPS4N21dq7/U7ckwR6CmufpKWebdylMQKPQQZVa5fgWXALPQEl3w
         x3LNDGJeT6jY4aefhI5ueyp/xN9Qx7qblGKgXlaeDT4VwGiLNNlw+zyQiFTOdVmb9YSa
         aZFDWQ2FMp/gKye5ZWaqBaExxCJbjK31pXj5IWBWIhUfIzoznF60aSf+jZKE1KgDDFrp
         W6PclWl+0gj1/wWrycRVEeWv1QbitgyTwIfWLuYG1zBvmawjYZXAq5wvtKE6twqFM5e9
         wCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594052; x=1770198852;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m7FAnijbp9arjCJzyAV5hHlJTCfqdJrtfHXLh9EXis=;
        b=nguxNwywIvABUlb2/9RXjRQL7X1nPtQk70KcCGKOiG66iE9GI4szLoN07A5DbhRam6
         MA6VpsIR59EZ43YiVDnAKuphNZutGY1sCpd9nvKPNIPStut/6bY486Q+pLdTD0lizGHh
         dhVqfeAe4AuOhDcnSs+hhOqatFovGflPTohmNAbso2iRW6ceyDyGlv6mmKMDOMWIRjb0
         DPCTu5/9qzPdy2MIdq73oIqeTcoT5adZ2QLV7TKaSkQCmHQl016exo6neOcnO8MWkE0s
         lHG4tcZyGeCBP/phVSG22FQjFXU+AKxs46Gg5lGoFYKuByCIF/B8mLzTpjsVmKjlrY3T
         OS1g==
X-Forwarded-Encrypted: i=1; AJvYcCXjsxaD8uJd6P+zAC15SCpgPZcKh1OcoV4ydLl6lHe3o9I+vICcPrE1Uezg6aHX2tku9jI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGLwnilw+Ah/HR8f1e3cvMKwTgGi2Ziv2z2Us4d7eQtCCUEWNa
	drovPD/h7/aSrqi5ZfncumIRyapuM/aEd2eD/Pm934HTmmEPEzbRUxbAli7HkH2Bt70=
X-Gm-Gg: AZuq6aJl2LpGRkXkAMyMKMZkQIFz7hZulWfEb8DEhol2vlg9H/u92HslyC8DAyU8RRA
	R8hDFna3fRkcu535mPM7tff7AEPvS4HVQ5tLs/DnZGiG/UUSvkSm8dFvzquYHruujZar2EmMEZ4
	BpRvzpvmPKory9FYvzZgtdz8ZRjt8ynniMYzdBVCabtYqb50NOvfAWZqMgNQHFdiUzO2crGl2DR
	65AnNOwNVWTg8yhL6kPTMWbaA9I/hhiHsz0qJDLxuXHhGoYIGu2S1E+lLw2wr6qIGtx4UStpIZJ
	nLyDdAs2IQnlEPKY1Y9jW6a5IzxDptrszUtfYVI5pMqwj9tG+HFadnvsHX6fTz4i0FPmcTToPe5
	rDA9I1oLjgXQUHYucIHeqvxJjfXqJzW0M2yFjsWFxoViWxgYM8ieIMuYVQJ2sjCqKtscq6gpF76
	xT4CFlgtwHDVxoMHE3
X-Received: by 2002:a05:600c:83ca:b0:480:4b59:932e with SMTP id 5b1f17b1804b1-48069c1c2e2mr57580235e9.11.1769594052081;
        Wed, 28 Jan 2026 01:54:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm53423355e9.3.2026.01.28.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:54:11 -0800 (PST)
Date: Wed, 28 Jan 2026 12:54:08 +0300
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
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: [PATCH v5 2/3] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
Message-ID: <939fdaf94038613486bdbba510a92a1e57e18c71.1769592679.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769592679.git.dan.carpenter@linaro.org>

The S32 chipsets have a GPR region which has a miscellaneous registers
including the GMAC_0_CTRL_STS register.  Originally, this code accessed
that register in a sort of ad-hoc way, but it's cleaner to use a
syscon interface to access these registers.

We still need to maintain the old method of accessing the GMAC register
but using a syscon will let us access other registers more cleanly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v5: Add Rob's R-b tag
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

