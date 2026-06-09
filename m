Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9A3B14CC
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998690; cv=none; b=Ok7gSDBu7HgOa+2EnFRRkX7yyIE6AUd+5szy6WjcNVLDaV79CYmyEv7X7VKHcihX3nMRM62KSylSB2ItuDreBHKWTHf4Y/E/BgSQHJ4z5kSSIkyiFbyg+30Qi5Whhp7dbPkcBuvNYMceUXaZ1ndbr2gcj8fK+uLneWXyObR9+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998690; c=relaxed/simple;
	bh=32mmXQW5mN6FX7eUOhQr0LzR09q9PhnKOpOCWTiEo10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=km5EoRWle89jNbHcu3Kzyy5hJonyQLNuaahDkAXIfpQDOXfogXbapotmlucrsKw28b2Kx4cx/kkeFQeTUtSyLVs8ulGcHD51HGiyzh+WRVjySiCQsIcXHNpzi2QMx5mfw6mL0cqi5Cqh1yjVvPrSeX5LfjDWA8Yxw+apHVdaS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i051ucXU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i051ucXU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490af320e2aso58338265e9.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998687; x=1781603487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=;
        b=i051ucXUWhAe2XEpqcIO5zMTIA1dIYGli7WsWeGKDpvQ9K+f3d12hrvm0u4izEge9i
         k2lHKA3yHxvNONx6+Rz0aZNtFLokP54R4PhDuLYbNpfyIBWKYhE+KkmaLwrLgXOBcC1x
         Wvbz+TvXfm6gfQCosH9EwbBssnILDpBFB88LI+9Crjv36jjs4IsibzQTpcKP/fe+Pv8k
         eDfhPzsyVP+7c4AUtiL7QXXBxV+RBHat9BLo0He/np1PL/F6MrBQ3FCxvQ5SpK2YtSE5
         +MYwZppRAM3z/sLuchsdhjn773MsSS1zF4p73u/wLVxfZ6j0h+9mlFCzjzh2ffQHUogb
         aEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998687; x=1781603487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=;
        b=T+YwFa5E+46OKagaw9QT7AF5EvPYm0L2sEqEvN6jB2hlAkv5+sbOk59mqutuwRjSQn
         46cxYyJdr7wA+Ppf2vTRY1Gz0yG96qeuQ2hj5GtykRMDO7uOucK35rBK81Ek4e6sOBEf
         ydVHWGcciEmylAqAv8NPkOxngRRRt5qvd+BGm5Mt4iczsMPK++UW1q4cbJT1TFAs+yaG
         vFBpn4TL5X6mSe7HPtZhuLI533SzOYsPZPQbs9+eEWdCpDxIFMs4jvyqd1oYzSthVn6m
         ljqiQ2Ikd7wjQd28vb2uMaGl9k6td9s2zn5dqB/+hjDbFVFodS1SXETMRU3TUcrJctU0
         YpiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XXZjXrlW1DmP0tvg3gGOpJNV1HPU0FY6XFCNRzBzwG8Y4G/I5DcRISlz9u7UBhF7Exks=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBrwtv0ooU/cpy+xKKX93HLfuVdnIojhRHJvo6nKvRF3FvzkbT
	dqAsPz0STDYafYvFywjWfc+MCSq+W2dFji243vRPux8OOYwkTHJtp/JP
X-Gm-Gg: Acq92OHHn7wDxyHydCtqN4X70NsJ3SoLNiAXIhsqzlzHEgLAekaHFfik+lZCGUcOBFX
	JnxLAuQc33aNbNrYXh9AIcXx2S+vAB+5fwCi6Jy+dZ1fKnQX93l21xCxuHYDSO3gNmr6P8IOyUi
	o+y1luSulSbnPorQMSckMy4mrk+Kuecs06Ek51IR5p7u0u1GAzS5XPfWcH41t14ZB7igdItvHnF
	RltjQiKkEfVMJyTDcE5+fkjna8sp8Sn8arGHGcHH5ulI4iX3bHx5ekKkZxAT2wmlwlR9T8GjPsQ
	KN76HRMXNonQvKw/T57BdAgGbjEUFa6KWThrpKVbCfdTfxGu4pIYk7MSZkvnx1C9aF4DlmKk6ZG
	XKjylDYevgSF4HpHZPz0jFWQaySHzqiU0x5SlcqCtPBAdiNyjBmUio4436qOjmgMlaE5ROTkXn8
	uZKkxwJSLil1nnXEBzcdoz4USLZ0VU+X+T3pPipWWQruDzFDVFyTAqsFXXLAUOwERHSwlgiW0rz
	SCGefky5Hufytz5uJEjX26wUf5H+MWbQ24InEUF+fg8x5I=
X-Received: by 2002:a05:600c:83c3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490c25a21a9mr347442605e9.9.1780998686731;
        Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm471043955e9.15.2026.06.09.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 11:51:18 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780998600.git.stefano.r@variscite.com>
References: <cover.1780998600.git.stefano.r@variscite.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

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

