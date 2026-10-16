Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E003BBA0B
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 23:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193300; cv=none; b=AIGHG+YynGOgRaI4u2PU5z+ruYTqzgvZCFqnuUGYowN3G/0bOoV4v2pJeXkOmsd9r7l/Y6q6/LkrV32w5fKmpbhFtBOBpaKmhrn+fZTnJootRVhFK1S3xigrtyWfN0DxvbvXo+ulaRBN79Fuop4MD8CyP803Z8CQk6lHq9jDcSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193300; c=relaxed/simple;
	bh=o6kdkAZEToRtv0bcStkT85Ju116In3ipVIQYN1vFQ+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKS2gVu2O/cz/y05FS7TI6KWLhUWb7+1u65Hqh17NvsFuWJk7LGqTWXPju53D6uDe+0x1VLcFeUGVkaDlTZIC5ltXnKDCYuj3GRwbDDbOL1YB7tk/5VQ7iNn6pGt8O1rKRHaAl8FJCXfiYDSYltyD0WTOqq/ZtOLO0z9xh14XNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fju6SRvq; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fju6SRvq"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5d8e5624261so154301e0c.0
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 16:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792193298; x=1792798098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=;
        b=fju6SRvqJ0Vyo8wTx7dXEMgpKXVxXwVtMm5Mos92SwiAs0+XNIk+ZGNwtEAlNM5UX8
         k5YkyqsLr2XtED/D7Qh7I2lzXBqNqglGGUYN9mRmA8aEykzUBsA7kE7WUbfccedM7Clr
         fz806dkgtUJwxy8SYoOt6GIEj8fTpIZ767NV1kEmNURZK3aHFO+CSr0fp91vt1cTAdMz
         nX9EzOidZ5cKxUu/roc9gJdkA0tTZvb5cXEjBkquA8buLrlc9kX0GdEKNUA/Xtxz6BbG
         UkwbxNPVCgHu7hGhqePjQGgPiIS0CGUkw6097bFS+/QUxj1OKhy90dQwAB/oCpwtiGEl
         EdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792193298; x=1792798098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=;
        b=0M0FQh4pq61rwJIgQ+2O3dnAUR2875UxloAr4YO3pYgw+7oqM/3CRTfxrqAHuoDoQ4
         9snJl2gTcKHUxn1K6uRyv0QQKcFedvu8eD2rn894I2ND8HXYjoJUq9qLtylCiZpSnk6r
         fCA+9/q3MBc5kv2OrLCz/H0hzt39jf3u2ICoyFp3b8HaBruPd9Fn22HRmodzDhCuvzg/
         hDyJHqb7GkpFQFzIOfpibKBnH/L9xGO2GlOqOK2fmyM8M7hXfS6WDC6mNkscFUAP43MS
         OUbluanl0Vzh7PXgLCftoMphmMmGzbFzxUT5TCQ36px2smHtONYMRSvG8Rg2ts/F0tMm
         BkwQ==
X-Forwarded-Encrypted: i=1; AKwUvBznA1sYjix6yKpOnLwdDykdgH/tnqKJDnZ5uXqz3dC+7MzkhJMxRnx0PnU33g9d1D1Nr/I=@lists.linux.dev
X-Gm-Message-State: AFq9FYIKQgaVSAvt2UliMHq2vP+I2KSWswpqn0/ijQ7wrvwIkSniNnFz
	anptAZY0a/nQU+J5s9fTFUI2GQRxA5KnfWG4NYlEbtL/SpbqgKZ0Bcks
X-Gm-Gg: AYBFou3cOp4y6lQq8OwMBhEqUsdlAbCCUKkfqv3kn2A86chdwJDlOhMRtc4QIV1aS/u
	3hEv89fFCnK64Dmc8cJ4yNe5uuHHHomrR60dCACzXfKkbjbUmvRzJJPdna+KJQg+PQ8cvts58tl
	kOj4gZdSyNAeONCsozCUqMdpWgJ1SeWXbXqLJXE3A/DJ3/vtEbhBE1DGb89vpMV6atUpx5rzaPD
	eKo2kWf48SJow9rX36Tr5Uz+6f4Y2G9buHbq2/XMZjpwsEfA0YKDQWToP2qc98Kkkrcg3ZZhOLt
	3pRsipA8IrrAVf6DzxrBC/jkgoFI/vRcnEoeGEShjSD+B3PyQhdhW63zjrKb1oR8ivPTzv1iqjr
	Y4KTWJGveUaDqpgVPwNWCUrSyVetHP/6Xzsu/uzoH2Xi23jm4xe21hTOysD17BX3YmlnofMnQmP
	ECl2xp3Kj+pgMO+VYENrzov71XKjptfIhbEPw+pW/MGMWTiBk39Hr9Xf1bbfpTacdFu3giFHAwz
	DvYA9okHDrDDQPKdOWQV8NEV55RqhxAkUWVm7NSa/zrb+TycklHgLooFA==
X-Received: by 2002:ac5:c007:0:20b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5eaaa61b5e1mr428147e0c.13.1792193297779;
        Fri, 16 Oct 2026 16:28:17 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4f58bbsm2804299e0c.10.2026.10.16.16.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:28:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: imx5: Restore IIM syscon fallback
Date: Fri, 16 Oct 2026 20:28:00 -0300
Message-ID: <20261016232800.536654-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016232800.536654-1-festevam@gmail.com>
References: <20261016232800.536654-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
removed all IIM fallback compatibles because the binding only accepted one
compatible. The i.MX51 and i.MX53 SoC device code still looks up the IIM
with syscon_regmap_lookup_by_compatible(), though. Without the syscon
fallback, syscon_node_to_regmap() cannot instantiate the regmap and boot
reports:

  imx_soc_device_init: failed to find fsl,imx53-iim regmap!

Restore the syscon fallback on i.MX51 and i.MX53.

Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
Cc: stable@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index c8698a9af1a7..e0494aa30a6b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -476,7 +476,7 @@ aipstz2: bridge@83f00000 {
 			};
 
 			iim: efuse@83f98000 {
-				compatible = "fsl,imx51-iim";
+				compatible = "fsl,imx51-iim", "syscon";
 				reg = <0x83f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 93225a56896f..13550d12f694 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -668,7 +668,7 @@ aipstz2: bridge@63f00000 {
 			};
 
 			iim: efuse@63f98000 {
-				compatible = "fsl,imx53-iim";
+				compatible = "fsl,imx53-iim", "syscon";
 				reg = <0x63f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.43.0

