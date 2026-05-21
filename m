Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89583D6688
	for <imx@lists.linux.dev>; Thu, 21 May 2026 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383474; cv=none; b=ViY9cRGIc3mr7WzToCK/LiB++NKLEWncsZ7thRyfO2dLjZFH96M8FddJ0A9/uRtpnMpGr8YJjR0TV1+R1Kh3QxoWEPcaInqy3Fe4BCaqnARmlsJcBb9AUqd06DEBx317qXGpFvg+ZoUSaQLUctk0ZqpBtxr891LrR7Bc8eLfxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383474; c=relaxed/simple;
	bh=nrTpwWDzLnTkunP9cIp4DZH4zeNYymR48XaZSitFxI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcIgCe3v5g7ohXY+CSHBbQGt2t5A/KCBhWMSe7zHvMMt3Iu6tvEcEV3oUdfgT2rHjP0yxbxJOLXt//E64KsnInyQVs7lhwK7reYHd4+v3YrUVcEmeU5f35S8V1iolqF/T/eHuuHF+EPc9KO405ocj85jrHLR8Ay4zWm4OYhN3oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqaFXRPV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqaFXRPV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so2871782f8f.1
        for <imx@lists.linux.dev>; Thu, 21 May 2026 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383471; x=1779988271; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=;
        b=IqaFXRPVeO/7FMc0ddEikjtETHjmcQ0jjJtmWCsvgjZuUmIpl/OvLC6o5afbPNsWkv
         LtxtUOwIAaxQVmSeHAQ67qE74Xm2/0F1gFYrekMK7B8wktiVC5CmcWN991SRbfclH4vV
         4L5GidPJoKp4c+COVJlgmcZhf8I92WqJkGG0kOrw8iqoXGuUghdT6z3/gJgIZK4KagTe
         J259DjOoW92WMosKgu1fCGwiHO3qP6AsQeSZok3hQFE8I1iTeqnIMWYhTHOdmFsb+rqm
         jU6lIgqH3UH/U5uMKRPZREiwYEhIF+nb0W1ix+I7nPTcX2C2rKiZIeuUJqyV5gl2+s2J
         q2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383471; x=1779988271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=;
        b=VTxRjsh2d/QPgACRoWyyHJBwnTJWBVMN3zvMZErwwMgXS+InDe8lffhtpx7hWX3X7s
         QPI0b1XnusrHU/o3/RUI9vyHf5nq1HvBkJ5kePAtw4eJPeyhKOqUisVaLv6hFGfBBZ9j
         JpS8s7445VJhG+X/W1wOqgys6P/PqRTYMDFSjlxtnFhOED+NVAQiuNkGxPqHgc+Ur4P4
         p8CVaQbapvjIdo4WRlH+YuJtvFtiM7K7mgr07rFCN09qkw7BMxiMNRoKxceu2zECX4TL
         EQkk1w3plpT/fQPCb5dVC7ngg5odK5LpvsWJQFCh88Ypu4p0xnY1HAkrtO9+8s9RTRRY
         f+Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9zcIdfKIepoBdO2cRV+6JaLlwt5vsZWxNZEonvK+ZXVwi8b3/GfRnvbnGa0p74baRzZhI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+l+hkkMUj7ugP5SpFOqC3oCJVo1+jTMep/Wb/+gU5rCLfrs/1
	NGBmsCWllSnKuX9K1/HyfiHrqb6YHsit1bUXxzV0zJWVQcOpxOaNDVNI
X-Gm-Gg: Acq92OGAVoc2ojN2lHRPfnOA9FA4cj/obEclIWDkU+KZn9aI8/mPkpU4Fl3dCF1qVjT
	O0cgvCKucHCqAJZ3EeLrbkIb+YatHpDDDWxb8/5YJzZuC2v6y1cicR3wAuKHinYx3EaI8vRUmgi
	/mn/V4Ta7qhFnkBw9rCN4PTVsNArNDPim5cqOg6q2WKLzgXxGnPycIZSDUOMSewT8Df5L2Zlpl4
	faGlqcHwJWMOzTzcRT4o8nVBl5Z8XNGjmvQ36tM96csCRxp8D4Lx8T9HkwE+0r3RSF1unuQdUdu
	vk1aGBiyBsOflDhdV4BKcr9sTwAuqVgDAbYH5uTL9b7cdeEuDG64hIL3m+pxVTWUKlUrKDxmEpH
	ukOpZx7aDgkXloEJdxyzpXFWhK4hFS/lE2ln0hqYg0lsFTyq8kQAe7W0h8lfEI80VzCCuaYLv3/
	/xd7vOB2bbPv9i6K4YikNsxxyntWyVIhM5U8tEXwgFKi16K9wbAixPqijy3gPMERtWmaqd/MuQj
	H1yqmTBsA5LXnYAemiLNmheO3ywb6n8X/c3YJHmA8fRcExqK2pGpR7YFF9dFwrTBvZaHfzXzFR1
	sw==
X-Received: by 2002:a05:6000:22c9:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-45ea3bf0b1amr6276246f8f.34.1779383471016;
        Thu, 21 May 2026 10:11:11 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm6046116f8f.6.2026.05.21.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:11:10 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 19:11:04 +0200
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v4-1-5a7f86c824f5@toradex.com>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v4: No changes
v3: No changes
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0

