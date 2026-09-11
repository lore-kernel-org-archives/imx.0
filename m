Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D8455186
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160136; cv=none; b=h9+UpO3AjUIP28XVxLFy843V2KUg/Tzw1YEEXRSlb/qmfxjrRSbacka1U/g4x4oD1GwZY0EQYFCbbYc6tXsswb8k7XjW+XWv9NuyWH2W5ZnGnLrhbNqXti6RMPRTB4iu7QU8D1kvxcR6Q70bokgsDnRkKlAwO5KMlLFcVxV4qJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160136; c=relaxed/simple;
	bh=m2SXyiRanY+lYGtVT0Eoyz/ez3VLPbfdHEIOHwxfbD0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f6jRNXWgX/Ec/QzbhdF8XPObivdUiETBUs1pCLNvJgOzea0NMBgMjEdGqHphdPyJRzLwJMikwBe77DSI7x5EwcZR8xUHIwOY9JTgKLDu6kwi8hVwcnoorFbtf5zEXTmgmbcAtlf3L0PluuD6XWnXZ2hg7edfaE7uMsoD1an25Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIcRwgsN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIcRwgsN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so14998215e9.1
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160133; x=1789764933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gMonAExe1+8sA/MtVTtiNlRpTj5I89UKSQ+s0kX1ltM=;
        b=JIcRwgsNzjG261J0f6X2AuoVwdEobFnYSiZFjxMIC90edEyd0WedhzmjYQ9LVGU96K
         BFY6OqWlZDOjXS1zzL8pWRE/KFGH9zyb0MKFDTbVEQMyRci+P40qnzKFA9qcZNB4ylC1
         Pma1uClOy7urmNsFSXC8WVr29VYJ+TOHdAr6IN9BdV9wq+NaTnAo2gErcrKXKxR/075D
         feKNnpiXvGx2OBaRi8LSpCcn4i3EmDVBpjN+p5vdiGuC0ofTaxyNOs54FoAnOrU/FVME
         bOOoyQGBJkV+Cg7joSC8WXJUzSLbWnFYlzJfBMv1EEtCNFF/bdozPoLPIoItCsAhVqhk
         gFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160133; x=1789764933;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMonAExe1+8sA/MtVTtiNlRpTj5I89UKSQ+s0kX1ltM=;
        b=PUh+psAMgL9EjUaR+EVjCXt/GLw347nFb2uIX8behhXzxNTWrjktWZrUVVWKucvaOv
         9TFCcF2HGAbSwIIBVIVwrajW3TVLm36/sLNhZAGje1kuUjc9CT69gL9R6HUHPe5lWMhw
         K5H2/oF8RIPp/3ONeE6VMu2IHZ6/arBAuZMToRGEMcBZJ7pRLUJN45xb8zdiWL0+TNTd
         SIux0YLc9TtTPI8t6CZuSffye4OHo4D/4pTmQHT1NIaTGuJpuNQgYycu8BOdv/K3dEIY
         zv/UmlwRjWdXCM1Q1hpG6Eq976AnSawHTsnXqwkz1ComFNSiRB9ULnY1PI3RxPUF3Ml1
         yW/g==
X-Forwarded-Encrypted: i=1; AKwUvBy1Tdtg3eSs907/rngOdourgceDr6QY5jW6d5ZJBqa1Jug5CuQByTC/5FKJGUhl/sf2iYo=@lists.linux.dev
X-Gm-Message-State: AFuF++nPAh5Ft4rDIrRtsLgdA5kewe588gj2Edfkzgunpntp1WaynBT8
	IWwDZ8uoJ73LBor6U+Xb6rpbki26kniLLwKbBmm+Twqx+8hfIZI4PEMI
X-Gm-Gg: AYBFou0e7Pv/y/luf97/OQo81XSyB7JIuYaqEARiiw80ZUBEWhf9Tu40PjCvPY+lga+
	lLjhozqrZ35YlRlwFHYh620QyGfU6btGKy+MAtbTvJ90eIEw9JJa9zDBYh/t5TiBAEoyWoQeHpi
	UkJVnjLxNYJ+6DZJloTWIYQJCZmzUFslEwkTN4bVJq3zbxDCd/IDSqdoFSvWb8hIMiAyz6sU1PE
	cl9hACoruKiwWYOoxWCCbkSu3fMz34/Soq8kEj0Q3nilCZAjKKeFs+ui90cVBRdzg8cF/NGY1hc
	cGpr+cDhYTI36Wyg96aUeLZ/PJduVXzWNAU39zI3I2kS+LeWGU5oOrSmroHFCByAsoXlw6Nu92A
	Ye86dewP97z5+1FFxD+DOKj8J/sEAnDj67AgO5CzDVnudPamEmUGud4NMSSDx6NoW0rGkS0gjYt
	2jJbml5Ni6eyUEtJhCd4rSlCiiJ4gC/rTerWXSySq6vQVs/Lpa8SZHwBWoe05I0xLs6tyKHAnGz
	2gI8abUqSyO0nc7f+gI+ltfa8DIsIwCku0p7sRcnhCEPmGTeE/ikOxEQ4ITib4/mlvd5cLYfRkQ
	B5V+LgJhKBe8beuziubzBg68zhnaQJjWAQ==
X-Received: by 2002:a05:600c:3513:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49e619d479emr67841455e9.29.1789160132668;
        Fri, 11 Sep 2026 13:55:32 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:7f00:ac37:967b:87e:e5c3? (p200300ea8f487f00ac37967b087ee5c3.dip0.t-ipconnect.de. [2003:ea:8f48:7f00:ac37:967b:87e:e5c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm176876975e9.2.2026.09.11.13.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 13:55:31 -0700 (PDT)
Message-ID: <3cec5f38-e0d6-4d12-88d4-74cb0000a2f2@gmail.com>
Date: Fri, 11 Sep 2026 22:55:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Stefano Babic <sbabic@nabladev.com>, "NXP i.MX U-Boot Team"
 <uboot-imx@nxp.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ARM: imx6q: remove unused header includes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

After 8392af7be78d ("ARM: imx6q: remove KSZ9021 PHY fixup") there's
no user of phy.h and micrel_phy.h left.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/mach-imx/mach-imx6q.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
index 58f53fba2..00ac52cf2 100644
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@ -8,9 +8,7 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
-#include <linux/phy.h>
 #include <linux/regmap.h>
-#include <linux/micrel_phy.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <asm/mach/arch.h>
-- 
2.55.0

