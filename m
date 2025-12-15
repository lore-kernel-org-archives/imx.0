Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C28311C09
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809726; cv=none; b=gqEcbv1Wk6vu/k7f4iip0QAgxnEiN/ZzyyMgxEZNHyh+BcYLvYnVJ40aDHSIDr8aiF0Fh9RvzHARxnhQpEWQFciGutCiIHujE4In1Y+gdckbH8YEYPeurD3Lcc8oPbTLkkK4xG0dTY985bfUhuKU5eXp912JdDznFeXg83fMQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809726; c=relaxed/simple;
	bh=cob0Tfyv5UDCeaXp27/pjebA60syehUznwOe1AVD2+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX8akeUB9oFA+BNdrySr5zOK1mIOtDa//KMa6i1V5+7Db5CeTVRXZifUVctfMkSA+SohRShs1mJECyFXWVFK/gYpEK5ES2mGqhKyf8aZCLlTwvo4PmtAGrg60gdV9bdYrW/dcLJmPWLSBJi1oNOjkMaSpnxkKh/RVcPJrCj7IEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RT+UTozo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RT+UTozo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so27246765e9.2
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 06:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809722; x=1766414522; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjq9hqGMLWVJCvNIjz/5gdBLkm3Fm6/e56WlsVHAzOE=;
        b=RT+UTozoog0QLe7bPNBjdgfoRr4REPOvmWmkF9PR2c1NBuypKJm4r3af9l6nWxNF8D
         ELZ67b7naEdia1dF7jPlmVLRXkKiLoqMaurNRSFTQ4/wz+RnWxz2GYG8QSnAGHKNZl+9
         5XNuboCV6NBrlDWoGRRvIUyVJAWSJr5eJj0o7tsRaNg4sVbHF3Yr16KEYIs48mdRSxZE
         GncsGa5e734KkZ0XB14jtL6mhbr/WWdw79ksX4wo1WPEqD5h4MHbFeDS3vatq3ivHGnM
         a20fEEFprxeddAt3zKiR+GuA4p7F18sxlgHgXMrqP9mGyLJLSAfx9u/MGSp8yDbUt6ic
         HL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809722; x=1766414522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sjq9hqGMLWVJCvNIjz/5gdBLkm3Fm6/e56WlsVHAzOE=;
        b=wWth8Sf8Ld1JlJQvlZ76EJiu2PNJGL3hqQSFi7fWh9flAd06DNNWRf5SJ2Jwapw8Kr
         jM3w8+fsL/y91uTI/EGO8LU3MinP1hW2KlkuoB3iKpfvBc1NwGaJv/tqTfXTAHjbzbIR
         N1O32Ri7r9x2py0dFVbBw/n0sAWEpMESkiz0xMZ/xkEZhsWpI2+B2nnYNuLE3p4fxTTt
         TDFuNTSZrAawQALOjZAzPSTW2lhvUhLY/R/KWEWjPK8Ti8QC58dkk1oCX8pHzTHZQdZ/
         E/lccdv5YJn9DkUBYq1UFJbq+1pN/NEc1PF5VdA+n1+eeNcKoLEc844Lfp1b88OrFrin
         9P/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkrOJTT1eP0ZVCZsCP655kKA8c3ntwMbnn9WaKYQpllCNBFh2eGY0jFJ058Jh4hVwCBEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjTjZzjAr9RWnP5XIuUfjTPeUnz0qphIv2TG/iPgrCH7AQ+NnH
	fRG5yExwxRgsSnxSzLTJfBCMIN8zNSUgoKj5MKbcG5eZbhoMJfRctmvWMp5+Hm+HU2o=
X-Gm-Gg: AY/fxX4T1JfkK7PNfSLkOvjCDF8akTqgOSYL7sk8ZFpLklLQ1GcHCtRvMsac1VNd7vP
	5Gb3pQqDIyTC4sbKvfm8K0Dhm4oK5TTa9AxxrrpG3FhVimsQMChiwK14bR2MFZha8ceuIyaLN1r
	wxNy/am2ugwv0FiJz2mKFTpos4WiNPfqRdj9VgQXmbp2LZZ2aI2bqpArJY3uRs/a95oYk9Vfhu8
	Z7IpL04+SFzCaDvPPG2W4+AbokP28KJTYIWzhwx2KPsKFSMAj15MuOv/HRxaeSmxF8VK3R05Km+
	t992r3sFsGZRYWcSpfPPbjScMcb6EH8uSfDoLP0IzZ1KTbqXw0DU0TlZXHC+Ppy2mKP1FuVhJdU
	iUuAoHsV73DWIJ4afgkbwZMhjTr2H+kO6BuiDcofLmjWU/WWq4nzDcsZkdO4yvpf1tA0YWxCAhu
	VOhqUjMcNBt5o4LYrn
X-Google-Smtp-Source: AGHT+IEETRagjZzldJ2K5KE+XtO7ZZwocvLnhZyjVLVzDdY/uQUKFKQkatHg2aZmOJSsMWrpNNBzSA==
X-Received: by 2002:a05:600c:8286:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47a8f8ab861mr112263225e9.1.1765809721474;
        Mon, 15 Dec 2025 06:42:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb7118267sm22168335f8f.27.2025.12.15.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:42:00 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:57 +0300
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
	imx@lists.linux.dev, linaro-s32@linaro.org
Subject: [PATCH v2 3/4] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
Message-ID: <1ecafee4bd7dc3577adfc4ada8bcc50b5eb3e863.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>

The S32 chipsets have a GPR region which has a miscellaneous registers
including the GMAC_0_CTRL_STS register.  Originally, this code accessed
that register in a sort of ad-hoc way, but it's cleaner to use a
syscon interface to access these registers.

We still need to maintain the old method of accessing the GMAC register
but using a syscon will let us access other registers more cleanly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add the vendor prefix to the phandle
    Fix the documentation

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 2b8b74c5feec..a65036806d60 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -32,6 +32,15 @@ properties:
       - description: Main GMAC registers
       - description: GMAC PHY mode control register
 
+  nxp,phy-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description: phandle to the GPR syscon node
+      - description: offset of PHY selection register
+    description:
+      This is a phandle/offset pair.  The phandle points to the
+      GPR region and the offset is the GMAC_0_CTRL_STS register.
+
   interrupts:
     maxItems: 1
 
@@ -74,6 +83,7 @@ examples:
         compatible = "nxp,s32g2-dwmac";
         reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
               <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
+        nxp,phy-sel = <&gpr 0x4>;
         interrupt-parent = <&gic>;
         interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "macirq";
-- 
2.51.0

