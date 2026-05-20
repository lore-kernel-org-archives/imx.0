Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4C3DCD8E
	for <imx@lists.linux.dev>; Wed, 20 May 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276650; cv=none; b=sknLXByghre+WtTPgAIjHYek6WCu4MKRCxX34KenZ0UFuo8nOYmyAb8VwXBjmZn0gSPNRyMfutLcRUbVqb5EtZ6W3rD1IY2AppSksDPbH07moCgNEAaITrMsDRcGv+d1A/HKL30hg0WWDwrWwMwCOeX85oNUcesLuHFTRJdyxsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276650; c=relaxed/simple;
	bh=i7HpBJxWuy7OvuFde1Y45lZUPdSPRXHTDZiEPypnKuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p40pTxOJlNPvNA5Q2/imrp2kuyaTuM9EU7y/+//19XiRMbqlA9zinVb+NpPfCtVj4CA0dRqvGz6JDuyX8xq30scBtXYUOWtyiCfN+1YJvoh5esuMwR+BQd4zXofPjXrV3mcTYg7f/62ao5N5PiysCGJc5Oc952tGU8cEnoDaKeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFf7mleX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFf7mleX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso57153495e9.0
        for <imx@lists.linux.dev>; Wed, 20 May 2026 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276647; x=1779881447; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/ucc97rappAXfofoT6AtjICBO6VsnKvFYY8oOP6sCw=;
        b=CFf7mleXsRTUOlMqXhn3MOaL1qd2WIlaygP3EBxeeR/IaTThDTy4OZuJt3FCmMkvtD
         NEpEyc/gPSTCvAACvwd5hU7n4BoUri1hpHkDeE6pmbcGI8yX2Y5Ia4TiCao0j6WYJ3uO
         yAOaEhfwnoE+SJUQqKuHQ1griV0xUm/S9LzICMbPbs9ripE9y9VD0pd7qwBL3iIR4k90
         0F/0MsuSTNzCULXumD5epkntXY3wE7k8USWX1unItZIr0BaCMo5YVvfRZ5YOURufZbwd
         Wm029wmbe3h9VfCM69XS+L4J6q4a9b44vP0D3yFPNgBZsr8YnxNIjdE5SLuojv89ZdA2
         SrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276647; x=1779881447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m/ucc97rappAXfofoT6AtjICBO6VsnKvFYY8oOP6sCw=;
        b=XVk/Wfk1Be0UMYqRNSRLTVTeoBDdUSNUFiZ4ToCp6EmCYpQ+KbaYod8qZS25DoSLur
         6z+5JLjzgOK+JsdZmPmEm2JeFJdjvbIL/1XcHbLxbro1TEqlWaWAvnrU77Z6uuMTWTek
         Rro321YXI4bM1evrb2cb2LCRjZ9CY0d0q94CvD00DeG8jU0kwe4KNWHCBet2FC2qi8ns
         OTubZj/u0CN+eYEOewK3UAql8Z3r95xyRLuDkc4qpvpPxXitPC0s5YnV031ikAB3waUr
         4Fvvhdqn6fxXpn6vHtZAtVIDKPK7MEMT7TL/djhMBuKUYNRMyfPy4zJ1xQv/amZ+j6kN
         kpRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8385L04WG8/jLrYx93xk3Nq4FfoULXj+Nula/KYql0VrMZt0X615HzweBF0MWnJbIUj6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPzhoCesuX0oObUirljqrwmoI+kAHeHBpTDliuXQNZQsQEsACw
	YbmhhxQ0fR1zPzT6kgFtTLLzVeiWqI5pZnZ/P95G5KnZaB0cmQTYG9+E
X-Gm-Gg: Acq92OHy0E0oupRIcJCMHRbI9+yOPOuuyk9q+msXd0XO3riwiU+6H+dCXwwu4en7Cpe
	6wh1uAEbjPXhI8on1Cg1UhfC8DkO1DBaG7AAMJ13yGpZLFecsKg6S6ZQ3cFib3DM7JOq8bg4Vcy
	EdwzlG3jLQEKSEXoWTg/ZJzGaorq6xTza0gn3bDT5RxpV0PLX43n3jQvFo33EHwzeE04wgARNyZ
	oWjsIKLvOx02ryGL2WMhE0HNmGEAPBWWePMYPKXPv1QpvXGdc7Vtu+uBGntVSPsxvJRCFGVx7gc
	1fqCXMGsvRDb7dEXBp6FicbZ91coG26h1S+r5NQh+OkVs+YU9FnMbefB61yDDijxS5vprf0bLzw
	igX46QWDLHOYIgqQBBYeTXlQ2PUocJ6nt6uN/qisezwvz1ummWCiaB56KHUiiy6nA0i5NKxas+R
	hX66tdV/Df57XVhe1joW0Ht0l08DWvZNsLmjPLZ4odIlI6ZbL+eSstiqFYwA2P3kMDhViImLk/B
	fpJ8tB5K4jIzDGtK2Btl51oGYz00xnST1fHKLaukFZReVj/lTWKt5yr0gPhRTmZT+Su1Dv/Lxpd
	2Q==
X-Received: by 2002:a05:600c:a11c:b0:48f:81ea:ebbb with SMTP id 5b1f17b1804b1-48fe60e4ddfmr269535155e9.6.1779276646522;
        Wed, 20 May 2026 04:30:46 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:46 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 20 May 2026 13:30:32 +0200
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add-aquila-imx95-v2-1-06424a51e33a@toradex.com>
References: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
In-Reply-To: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
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

