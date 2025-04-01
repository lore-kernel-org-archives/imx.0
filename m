Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9EB20C48C
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522362; cv=none; b=NQpXPMMjW6bA79eqYDbcD7GH/aJm8EJMGRcFa90bvtXOPRINMg00jXM/igWAGWiJHoMPX72aCgzC8cr5eWDfioBmNOXjsyh1BrNML9/JkeIC4uXQwaMUYscx0mKKJF0azpRUj9eokrkYxf1MhXgLXLUqsMirHzFvQL/jX237EIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522362; c=relaxed/simple;
	bh=VA93hrjQWlyzZwcWjEvqD+4aWl10GXJ9Bc0D9Dx2kBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VNQjv6mYnJyhmXhDRsWNTbSC54hPquLqpZ1Ub9aCNiEtyWHZ8vi5K+jGlb9TzekdQVgggAPncRLxxcR93OMdQmMV5W9OnIPP80FEtgLz5E7OGJXfpOlYInHgJVeKMZmJXDZBDLzFeYDxkNwVYNOjxBBSXRSl9Y5C5KtMFixTuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhoFGmgC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhoFGmgC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0618746bso40154665e9.2
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522359; x=1744127159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=;
        b=hhoFGmgCgAiF+9Zwhfbbc0bJQrQ7mr3judUHzqtugCn0ori9+fwjhGfzMRrfGhX4WN
         ZptXhmkuT2JJW4O6IpFS2Gdow0EliA3MadcLuH5THzuRF8/ZY3csJXBgRlMx3NEUt5Lg
         Mc6hDS9FwboSwozUCdy+e/ikofxuT1HbLFBMcDubFkqenJ4e7p92QLP/RBuH8503Wvri
         1Dskq60XcbyJi0M+KcW68165Pmsr9lOhlpJDSitoqdA3k1g8HLBdeaw4kCFLTVnpVTFp
         Qw1jeJNQbejNBThotAe8h2kVTn3btnEXprv6xgekNBbfFKT5+fhP+uGuiJrjAukyiOw/
         dBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522359; x=1744127159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=;
        b=npHVXlqhP9ss20XVpd1BJ99v/2gMisPG/R93A9K66cOj7zZcrV12pdkrhW+dH5vW2M
         ZzeZF0tYrzBEDuxhQqIeZ/i0gmAowsDmGOGqV6bgLfubZWkmbYRkNRKu6qbMDr8g3Kl/
         j07AMRjW5BXGpR8D+gj7fTdaQQB6ubQIiKccgscaLATw6mu+osaZEcq1CqUS9Oz6x+jA
         2s2UKcJhBnQXcm8h5MnHWDQk6n4SvH0/93suBHK8J0llSOOQgPaK6KABCJQYqLu2DiQ8
         txikZPJmzm5I2NPL9A14wCMCvCZP9vndhHhPdh74Ni3ss+Y4t32Kj0rEKAs1OIwouzUv
         KjOg==
X-Forwarded-Encrypted: i=1; AJvYcCXG/HtAWh0H+5J80p7siVzghHRikJOspE1SrBNDdiZn1T0Yz1jjw39lfit5AtJB2fjZJZY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj8/knvsZL1SU3JON9wjI6clhOdZ6Lr1Bq0B6m5nHVLYf54WWQ
	5bTlAI/t19sCmY7qab62g/VfrMoOAJCfTaEqMBtDDUqH3NcPKTxY
X-Gm-Gg: ASbGncv5RQMrQU6zDiWbXHOyQUH6fkrfpVymYuODWSfj+riLkDDNqLDzqnv9sLwQisW
	Ch2Y7yPLtdt6+KY6IVRATQ+KKeN5M5qf2otB4JBXJUMtYgAR/F8OSufylX6c+xICgIyd2mOY+2+
	Ot1Odj7Z4RPBiA1Oq8dzueAtZIgfT0IiKZnQG5VObz7DoWkyxe6LnaiW5Y1xH2qb84dPU4hPzYD
	SC71OxBkzZKgjTMtaQLkt9CkD17uUrUT9GMSgNPwStdhrCLcjTYNiYwEZf1esmM02bSn2lUNlpj
	D0FWPlg6vcyZ5Ey0M88TPzyXmeJN+wv2OO8eEUnmiuR4OHUK43QIa8sAv8odi2/WosAG7leyjlf
	nTd7vRVEJiG2A3nnnIA==
X-Google-Smtp-Source: AGHT+IGKhtb6fsJZMzdARBi+gb1FIGOla8Dmwwf9ptz7h3kdFPWq1TAOfA22Dh/s0xKKlSvTPmHHiQ==
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39c1f0a0f69mr5198566f8f.2.1743522359440;
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  1 Apr 2025 11:44:04 -0400
Message-Id: <20250401154404.45932-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..f0f0ff5edea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

