Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7732201276
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731526599; cv=none; b=c2UQxO6Eh/NI9f9c+cRWo89pARzstr8E1DzwdABcoCvivGl27F1jLPSrGWlY3+zk0hPz3CAnzucq78vTDVtFU0M2Sdgydqyn3vaiBmCzDyFKL1maq3XAd/n+dcjHrm8UJ1oO5PeieNFrsYOTTnWicK7oOb8s5uP2WqIjGChYhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731526599; c=relaxed/simple;
	bh=tul411GCQKE41kaGVUPN76Dd9JbE0cKcs195gRd+9xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBYtZ+au85WmLDZTfo+PPnTwXq+Jpu2XbE3I0FuCEW5X33o9TiAiIemUqRHOi+b1FGe2BhEtoW/Lyb6W4euS1M+m7MGlj9StGnisD4dw/xFBTu0HX9fpT52FM5dYDR+fLmdX2xm3sXr1hs9nvtJKlJCobxrlYhTWOk2VSTKPkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCympjkr; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCympjkr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cbf340fccaso10155036d6.1
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731526596; x=1732131396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yPUIbOva92yuy+QEnGdpUmLYR+csAbyNvcDkxMU7mB8=;
        b=ZCympjkr3k9lW4XzLTHHiR34yChotzTdeNvm3owqfECfFX//Z6Dt8dMPcgsLZiv4mF
         qMD7aKGjEnqYzZxWTyaLvBghlbLD7GROmlwQi1jOs8p0WoVhqJmn3qQLUaoHn416J1ao
         o7N3Azoz33RlsNh25alWBct9O3TkdqV/qkdiPYjdbgIgSOZnt8PhcSbSYhXsmEEvbaSC
         GkAlRSDb/WaPlrmBbUZict0PA9vba7ijHUO2My6563zhGf7TL2+M3iQwdpfsELkZL3Sv
         1e7fBPMIf88dp4oeCWDWwGtHQHpjvMEqspP8r4e4oMKnVE0A7jwNIE8QGDvyQICy0J+S
         qkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731526596; x=1732131396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPUIbOva92yuy+QEnGdpUmLYR+csAbyNvcDkxMU7mB8=;
        b=ZFn6DU96jRZELRgdY6zikmczqm3xifjqDtVuaCyoIIFBoazgCrGsG9ykcOjBdBIC8y
         lxpo0n0Xx49eZNp82RG6t8N7nreM7OUfwbknN7SdadgFS4w2yiA1f59d79jPooOBRcl6
         I/53AXT8vzUmfqbWFp5nRlfS5R8iQFpmXscBOFIs9/06NPzYZ39lbY2mpzf6DuMZky7G
         L3ZV4UjSbPueCz3OQBmn6ZVPKJC4jgS1XthVJnqSkWa4dI8uAbadSVYm9LyYNm7jn4Et
         NEWxN83xutVY4EsebYAScT65OQhTg9eLdz5roxPaqM9bsFhc9XetAKH+hqRZXTky02M1
         1rTA==
X-Forwarded-Encrypted: i=1; AJvYcCX00ujuykqZLb3zjATK3qZnZG3G4qSRUzywcIgKi4+Syb1gYtSZ7hEeiWQIW7npIMwZjP8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHalm/Ww63SK1wYLJKBbhniwWK5/tbuU41FVemBGuau4e0F8P1
	0fvwQBTg2+WKUbgg13StGv98XkpiolMfb5CavcC7Y8EKR+0FHBMi
X-Google-Smtp-Source: AGHT+IEXIbvpmlTDbC2bSNCbht+Om4jIXJBqxIODGdhf7X9uH4GIqKJbkG4rhCTNXSRhGJ+I2f+eGQ==
X-Received: by 2002:a05:6214:3f84:b0:6d3:4453:6a48 with SMTP id 6a1803df08f44-6d3e90c5620mr10408276d6.13.1731526595643;
        Wed, 13 Nov 2024 11:36:35 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961defdasm88421796d6.24.2024.11.13.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:36:35 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <jesse@rivosinc.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>
Subject: [PATCH] ARM: dts: imxrt1050: Fix clocks for mmc
Date: Wed, 13 Nov 2024 14:36:34 -0500
Message-ID: <20241113193634.3487554-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <Mr.Bossman075@gmail.com>

One of the usdhc1 controller's clocks should be
IMXRT1050_CLK_AHB_PODF not IMXRT1050_CLK_OSC.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
index dd714d235d5f..b0bad0d1ba36 100644
--- a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
@@ -87,7 +87,7 @@ usdhc1: mmc@402c0000 {
 			reg = <0x402c0000 0x4000>;
 			interrupts = <110>;
 			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
-				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_AHB_PODF>,
 				<&clks IMXRT1050_CLK_USDHC1>;
 			clock-names = "ipg", "ahb", "per";
 			bus-width = <4>;
-- 
2.45.2

