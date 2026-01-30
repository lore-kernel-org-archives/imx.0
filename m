Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FDB29B8E8
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779194; cv=none; b=e8MArx+h3wEqYQCk/ruhge/ePIYcc6lMsuCJ5fL0ZLpWYJ6FZZejSc/2M88Avg5Z7NLZoP5krzFvULySxt/NV4yK72Ry8jZ2vOadH9sYIyrMD1B7yD2MTWsW936yLN83ySZPiWGiCRknphgEt19e5IQKIEPvdciKt6fTxkLOjmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779194; c=relaxed/simple;
	bh=Or5gzlK0oOcwy1+ave3d9/8tpz5OWkqv6GdelcKgrIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpMHWcqslGAr0y0Kb6azO06VYARoyAewaVUiiw9Xrg7qjyPEjLparjkMBoYRkn2N91EmBB7g1x3GhuTp6q9vC60jx96mCm/UFyShkJrn16s0NWUqJM3cnyJXJpl7FT2OK9D0/vBLIqP9nTObjNTrQ1BkcHMu7Olzjy8QniwbDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYpbRWT2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYpbRWT2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso18851715e9.1
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 05:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779191; x=1770383991; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj8w1B+8x/las144X+RSjad0uTQtR49s9DyI1HP6ogk=;
        b=yYpbRWT27ay4m0cIJ8TBJ3jIBOofs/KaWv4NDmcVoCT+qryb4+bJmccv72iGisI7KB
         4A8Rkv/IoX978Lj4Gf7k3C9HZI7ZSodMYMoskpKjQPS+bz5Sc+zOUAJOhLs5/MdJJDMl
         JlSTwKiRLjciWLXBPC5POAeLSvztPfrw9T1cMz2JGJ23TyCXYD4D241RHl1Q/e4pba11
         NdlJ9wa9CWltAfqTcER0iJNfYOh8hb0pfKn3LYp4hSdYIb1JNMVP266CXN4ozHlopRoC
         QUHuOTjomJXR6UiveGhSwowWHT07N2vr5Q5AX7iaL8xbNDTxfFWsBFJbLmJZrW16xJ1a
         E2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779191; x=1770383991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj8w1B+8x/las144X+RSjad0uTQtR49s9DyI1HP6ogk=;
        b=aiNMQQk0l9OUMPtaELSmBQdCyrOwr++msA8+wFM87Nq62tXPW9idvK1eNzIrrd9Twj
         KKBuZ/on9GQ5XjNzp7OGp5evm7frgj9/tkK7RSSSZB/qYPv9gfm0zCndijhRkFmdZmfc
         Vp99xD4v+MrzAHcqsNdFcHO3UATNi/bl5HGwlUG9dlR1K6low8Pjx20Frg5x3ZO41qLA
         uzYOlongjXlbHq7T7pZOQF6u/wF4oaTT77NwZIPlcvsDQBya1xvHKGi23CubiOtt/RIy
         80AkI1ZnHe/aRW+sLX8mhhIbuown/8UluqUaC90hkGEzv97d3wP/CIWsVUyO77s5LGDY
         hvWw==
X-Forwarded-Encrypted: i=1; AJvYcCXFyelvtzsZiIib3jcuoXSut8VVRe0SxBzlPgTrQslXmzaO/dLptPRlh6LBNSR3/s9FSig=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxmTNmXeS12jQche0PStL4tWPzQlkM42FN7uO9vb/ecM8kMXhv
	acnvo8HPVtVccf1vEHJx2vVjq6UYv3zJhMpABluIKL/mGpXjdldqd8LvyVYagjVP2VY=
X-Gm-Gg: AZuq6aLevNJC3WcwoJmj52P28KmuS4cqdzXZ1BTfgpRXXMuQlKolxKkDfYcZnqBc1G9
	wQPxApObNDKD+NGNJUvL3k8KI6HHHuH7gJDUgr04lTwiKAWlI43gwBKojLdB36+AfmJMwTPiWyc
	V975AdWxodoGu020U+NKOKhnIjy6ZNKupYd4Y21q7rKqyFdnmtKnw43+WUzj4PkL+W7qc9SVWnz
	DY5SJdHDw8wVcGtWOe8tFTy7kuh/4gUnDKzbKsZ7FeTTkXa3kJfl4J8PJqFlMMfuvZyS9RhbZz/
	udbXKkkelsBr+6UIY+VlhzDWGZd2wNaCMzJO6acGr8uMDnVts7xlPPw2G795wbatgoXly+ocrnY
	eNozK7FhQn80fjM2V89oYQKG9vVrYSPdhxISdSw/++CnwLGxsnFzljlrzAVR0O95YNfjpRGv7tH
	CH7GwkPzci80oCh6kI
X-Received: by 2002:a05:600c:64cd:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-482db476c24mr37269605e9.10.1769779190983;
        Fri, 30 Jan 2026 05:19:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm281408035e9.9.2026.01.30.05.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:50 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:47 +0300
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
Subject: [PATCH v6 2/3] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
Message-ID: <3b75e950b2f8faecd1a9fa757e7eb7b42ace838f.1769764941.git.dan.carpenter@linaro.org>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>

The S32 chipsets have a GPR region which has a miscellaneous registers
including the GMAC_0_CTRL_STS register.  Originally, this code accessed
that register in a sort of ad-hoc way, but it's cleaner to use a
syscon interface to access these registers.

We still need to maintain the old method of accessing the GMAC register
but using a syscon will let us access other registers more cleanly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v6: Fix O vs 0 typo in GMAC_0
v5: Add Rob's R-b tag
v4: Fix the formatting issue Rob pointed out
v3: Better documentation about what GMAC_0_CTRL_STS register does.
v2: Add the vendor prefix to the phandle
    Fix the documentation

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 2b8b74c5feec..1b2934f3c87c 100644
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
+      FlexTimer Modules connect to GMAC_0.
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

