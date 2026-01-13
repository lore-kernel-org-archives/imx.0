Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57A393405
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313639; cv=none; b=DrDsk6N3KYBBQ27qUQYl9pm2Ac8POkVepJGg/A+zgol1POAh2SrYDotGCQ/Tl8VU2H61v5/MRmYDXJAdmOm6sdPjcSWnXIgIB9jLcnaNAIir1W0YU1jeLfa1WxeNNt1ylVBZCAS8fltbWA5R8szndRIrhwc3wODAXxuj/efuVxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313639; c=relaxed/simple;
	bh=CKKW/gznSDOPnlhwknSKAxHfsRLSGV4Nuag72DM6Dyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioSL7vKRj1buUaYZNKQZ8otXCNk0W/OnqAyq71UfNrAZg9/xEXqCcSphMbE2DUwarITAe3t+l2Hrmqg/uP409acZNskykiaJ+A7n/BsMi7juZhd/HqXlvjXnhFmR8tWiE77eCmI6kKaPyqM5K8qCEJ5b+VwCvJUk9g35yMrqPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZFINE1wB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZFINE1wB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430fbb6012bso6137027f8f.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 06:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768313634; x=1768918434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wIl4MJEHigyP1D4DG/B4IxRmiFqSM8hzu8VMWNA8Grc=;
        b=ZFINE1wByLJu7jCbnFev903sGe1yehwM2hzLPVyRKKKt4BRyvr9txubgnYJHflQHgK
         KKAzFKW34AgOwKwDPlQQeuw3bgACzkE7Tg0R1fB/F2+nO9udqfYyQBEjjnWfoWsMs0AS
         wBXhME8Gf1Nm9c9OS4sphecW95RAsaCWpVe6Ah2DgjDtRUd1LkNQhRYDa7mmYuW6Petb
         fMQY71QM+c37lgNjXlMyYG2rJbWxg0vMDd8i137GK3Zn8GmYaNzUM1eHmwgFJc6dp+vG
         fG/ujbBuzeUX8ASHDjNDVlAlx8a9yoZyLkOmHJzXBAUbWafjXEYlXZgj7km8QkLlgHnn
         PMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313634; x=1768918434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIl4MJEHigyP1D4DG/B4IxRmiFqSM8hzu8VMWNA8Grc=;
        b=bDAC/PBnH+yiwizuiWKoS0pbP7arU6p0/u1iNSXLro+odMbdbtYGLegQn0+xcnTrmW
         Y8rcwFgsdq6ZxtBDKzos+OpyhW+ULfQuyePytC09spmVFMVertuHdu+wKOkto4ttuMfq
         qQ1cK2/JLRJiMOcZg8DdXCfBZil9P6xDghYuzF+XLcPhGSgaoa5m0wSzm8bFSGuRGVok
         BanipM3I8ErtBuUkfl3FRtgKL3P4YTEvMDg9uyzLfAOqTLsh+zdHtqq1ku6o2rilh3bJ
         wkzFzFvdtoyGkx4KLmkqn3KVMxm8vhxMhkVis9I6ugAZTlGJm8t744xiiUIEskjiEAkt
         KcIw==
X-Forwarded-Encrypted: i=1; AJvYcCUWrd3WWkiiv44tZRCB/Rdtff8cfRDqMhSEpDEy7Yb750G8xBFuz/EyHUBPI/7GTV6euGU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaIe9BH9Occpq+H8xmb1kY2OCXe/kmamHi0Qsswmbzr2mcGv7t
	2by2sO9bV80X9XGiQYLN5knlbqn5ELQK6Htg3W5JE+N1cxdMiU+wwsxswNDVNqOYIdg=
X-Gm-Gg: AY/fxX7horWThmygdefmLo/nhTHeOwd8iorybNt5wWNijC/02yTLE6DjOJOCSM5xtD1
	XdJnwzGu2GJCh+q+0myGPg2twWHEnf1AhU9lndl7CLYdapnGaH9EqdYWG6SXok0zOQlA5rfuBNZ
	y0q0GEvHjZr5isNwpLYBs33Yj+0qrkm+4GkiV+H/+1/qi28CSDIqp/bomFtKjQ+NXXMTkOv+zbN
	nJ4U9fbytPLkUVTIhnPRHHNE625Pw0T2bowuAX+YDE2ck+yZ4yTTOoyby7IzhRMLTybiMWKXlbb
	MHA7IGuIGNTH2/triMoGhgVufZRwaeWk+e1vKrjOs65aeIqf7RPho1ddbzFQKEePL8kqVLGzSQ9
	gKw8n5JhElbnipxKEDfMzsWpdlaVPRpWwX5Ig8Uf/dDyEUyN25UpoWvZaDRuW4+7M6pIrncfkAU
	vjza/xDLlN9hV+TTHA
X-Google-Smtp-Source: AGHT+IHkyPQVUw8xs93KfcHsRE5T/d53G146wp+tXJe4SYI9ShWK2S78YZfw2MZQRgqiABbgN1Oeug==
X-Received: by 2002:a05:6000:3104:b0:432:7068:17d with SMTP id ffacd0b85a97d-432c3775aa7mr27685504f8f.20.1768313634216;
        Tue, 13 Jan 2026 06:13:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm44033372f8f.18.2026.01.13.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:53 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: [PATCH v3 2/3] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
Message-ID: <7662931f7cbafe29fc94c132afce07ba44b09116.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>

The S32 chipsets have a GPR region which has a miscellaneous registers
including the GMAC_0_CTRL_STS register.  Originally, this code accessed
that register in a sort of ad-hoc way, but it's cleaner to use a
syscon interface to access these registers.

We still need to maintain the old method of accessing the GMAC register
but using a syscon will let us access other registers more cleanly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Better documentation about what GMAC_0_CTRL_STS register does.
v2: Add the vendor prefix to the phandle
    Fix the documentation

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 2b8b74c5feec..cc0dd3941715 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -32,6 +32,17 @@ properties:
       - description: Main GMAC registers
       - description: GMAC PHY mode control register
 
+  nxp,phy-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description: phandle to the GPR syscon node
+      - description: offset of PHY selection register
+    description:
+      This phandle points to the GMAC_0_CTRL_STS register which controls the
+      GMAC_0 configuration options.  The register lets you select the PHY
+      interface and the PHY mode.  It also controls if the FTM_0 or FTM_1
+      FlexTimer Modules connect to GMAC_O.
+
   interrupts:
     maxItems: 1
 
@@ -74,6 +85,7 @@ examples:
         compatible = "nxp,s32g2-dwmac";
         reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
               <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
+        nxp,phy-sel = <&gpr 0x4>;
         interrupt-parent = <&gic>;
         interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "macirq";
-- 
2.51.0

