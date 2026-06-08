Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0EF3BFE2A
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912646; cv=none; b=Q2FteSXqCJu92blUrgV20/GrsEhHylBkRYHvlvbZC5PsEciOlMQpQGwhhkR5FykxWeQTm4zFKoI3pevyzC+nSOKDVTNPc+3lHHLaRz9fG0QzW+iNIZqsrLDBdAMMi/tuFKujp9PvPX/rLMcHyqIwQ1+8q47htFoOrIYnj1hMWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912646; c=relaxed/simple;
	bh=uZvT3uSWVgy43FuIUxyuAW3aJAQGYTUOjRY56ONMNac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZzFcoQNC++/gcaHqFm27bG2WX/iRnM8EZIRba6LzgUw3wgHESDI7bqNKU/zldxXTJ53dxWstjJoJMFzDZ2w+DVdZfH8HB6eainD/NygholZxgKrGXHc4l6qdFl3YxINM8N+yABQd3SVdC4PLr82oN4dpBbObbzc13WVfFADsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db8uJPd/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db8uJPd/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3695388f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912643; x=1781517443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=;
        b=db8uJPd/jGJA6XEunocXixEI/qY4bT7Tcm9lZxER7spHntuc+lTCpoWw6K2/28NzGu
         2O9GwVujcfuXsAaNPULAPTHdLjqqx4y+MujbkAuhfpE/omuKB3iF5hQeYaFRPkCSWnvJ
         friwJRjmGNFTzoiRBU3YEHueuJvMQk+qNpUSqluk9KgbH2tkTsIFAZhoibiT5bebdDvl
         smZbfF29hEnpJB7JmoImSvsRu+WIUtTf+urZwJOTxGYwO7hi6gqxB88At37uJP0Z36z8
         Y3q7HmUkfoACthr672y2vM+8rw7rPKVpWnEwmawL19vrh601Doy6T2ipITH2yUg+mXK3
         3tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912643; x=1781517443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=;
        b=JVBCY+UNm3w9LsevBFK/lvaOublL/Uc2md6yJPvvMUqIOg4dlFQCsjAQGGEvchqhx0
         T6TrAfp3AQh/sqMA3LU6wFpN6GJ+yVZJJnDUjLuHijcUTBUf+XyZvbezM9qUNi1Jc3vK
         ppMBlLUggCl8JGa9eYna/hRRz8ZC4lvzn69dUUIKW03w+66GZfP9tsKx24md3rhVQNI5
         AP015sKAnDsb/J6Dn5DFL2My8+ue8sT5niWqjPoetlk28mTwAjWhRW/j0yajwkfwBjXm
         oNXH75IgS3enFtdwRPNtr9xGnJeP6KF3eLJC2AH4FNBXyw7GeVTq3LOCbUW3Po7xYas7
         hmuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iwNIoSI5XttlKo45qa3Q6+GazhEDMFxO0ZU3OEwOVKhTFcUA09EHE0orjWIHLOCBp708=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdyr9rKBe4xCQbGz+HFOFolb80qjmcdMYMdj3ISv8OdGUq18GH
	VESzih0TNkn0KaeZ1xzV/lnolcFZjnjhT7sQGXAibohWku2SW4RW/UCE
X-Gm-Gg: Acq92OF5UCT53c69pb9z11jM9c7IdURv9MgF+aPqvuKRXoqKZnB0+27JdFdvPFpcWBD
	zze5b50B4Pe7U9pwArYwL8beT5bCzYBMVgPyBw4wW/QkHPZHwm/I0L963f+2xwC2qGePVsbzpva
	HpK23sOy1xkpuJz54yIubSA0cMCNPvc0bQDCWVrQ7Nb/FZL+VzuA6P6Tb3yUJaC+kixZzfGdnJ8
	0h3lOPUEbCfwaxO+Uq6C/rsAENrtr8GDky6VTFnmecLflG6M9XFNbhlJu6lSh/S5yW3lELTPz4v
	tBuTw+fDPSfiVunJ2TX2bJpzqxs4bsIzBGcRIoNudZ9bFKv58nkU2MXTqMY+f2O7+EARtgPULKl
	2EDGA1ZZbUJ1ZsjED31+7zVI0NEbFWhsbwdCBgSCWX6XnOOqoogWKvIz5YBw1mr1lMqhplE4hcH
	rCftHvs5x6siLfNQ7y5ZyQlvEyKcxIXRCTUqaJ6QH6b4uRTKLxwWykh/4S4s5mV8d4hU8CjyR+I
	NRgHB/vIBtJBIpVF/uemQvjSNJcvo+cZjo2qT4fIufUY4R1
X-Received: by 2002:a5d:5f44:0:b0:45e:651c:47bb with SMTP id ffacd0b85a97d-46030512855mr23767118f8f.28.1780912642817;
        Mon, 08 Jun 2026 02:57:22 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm52385020f8f.11.2026.06.08.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:57:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Mon,  8 Jun 2026 11:57:11 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912513.git.stefano.r@variscite.com>
References: <cover.1780912513.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

