Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF2171C9
	for <imx@lists.linux.dev>; Sun,  9 Nov 2025 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762724728; cv=none; b=Yz6YkNT1uCZPcHzz/vafy02TSR6Sm9aUIKVgiwehAfoG+fllKi3qxC94X0p6ibnNIORohV/g3Uvb9BqBhn5mJi18avXxPXOc9U7r6/qzB+YmdUF3gTTD5fAiYKwA0u96HQijJyxhLA8qVYASdE3bnApBLeaIzIWAG3GgNjnx9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762724728; c=relaxed/simple;
	bh=BOO+Je3XVBfibXUXhjtM+aF6u3UgCUzTUQdElwKy0ck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fEgpFMIkGnW1nvCCfXb/8jdI98lnhu1j3CCbzcYMPN28tgX2jKh/XJiPOQmsvS+Jo+tMAXXX1nIAnS6WHtgQ70vqLGWUKmBy74+gHN2piK0Gwt5IZYzN0uK7gbmevpjggtn0jN579/8Haila2oaYD0w4ZSXVqhLkmphtYdlL+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mghOrmBO; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mghOrmBO"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4edb7c8232aso7551391cf.3
        for <imx@lists.linux.dev>; Sun, 09 Nov 2025 13:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762724724; x=1763329524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UkvAHMxncU2Y5mr7DiOlJe0jQHZALyUcA7OKmpGVgc=;
        b=mghOrmBObZ8qoMUZqZD3nABk5Krl+4RV0hvNOBnH5rhzOcaajTrDm8fl74lUdqbAZc
         2rtyIS2VgKrdTKHzW9HfX1P8qhMVG4wi9APF1/+zdrQCSJZKljOwmtNRkKswGpObOiRE
         QEPB4fdC1cCu2PZ5TrzIqg2Wy8sbW3WRUr3r0DfMlhrskVDnhizpRYQNK9M0lFTtn8xr
         dK0Bj1H7vklsSHWwv1zPSahjN4XIh8rs6IeCbB+cO/k55/1Zd9Ppd5m26+2CL/TkThI6
         mYX94CiGyD/N0pU5IMgG6p9QpWSS3JqlJ09E6bEg3rAvX3kWrnlTfEaPf4n3YQNUmivd
         rHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762724724; x=1763329524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UkvAHMxncU2Y5mr7DiOlJe0jQHZALyUcA7OKmpGVgc=;
        b=iQBSGqTPOHaXiE4vRcm+pqpDSJiH1QnE9JOYDA+49EwNtTQiCL6Pajf7jJlDO1aOWq
         2rVX8leUab8xDKnry5MLVE/XN9b4N/km4er6yKxGDndZ7ItxtZv9DZ9vXNItLoGBLUya
         ogvecDpjXjGIjP4IlKwvp2Alp5EqIYutacQKwnDDNym1X7wSlnPmIRxU+3Pwb422WwIA
         gM4s+RS7s3NP8sS4zsFXPgyx+SWWBPOZKFjqtj+svANuMDlwtPvpkISNFobY+aAiZooq
         YD+erl/t57N/C2CjTU1s7AnaUrb0uMPABX6eLsY8pfcmRyQwVl3osCUvn459m1GhsXjR
         JkAA==
X-Forwarded-Encrypted: i=1; AJvYcCUh1g8xKSSQ6AlkMfX5FLUvTdfYpfL3wSe0ZrEXA6MO0ZUCf+9ctN/CCJiw5UvRXkTOcY4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmJSo8Z/BmOKbcc2MK4N9qGegRTduIvbnMLwh5C3ThPUXm7G5X
	+AF8zQM92M381Ju4ik7FTsd3+R2090mIZL+nJKU2Pc/KL+M3mpJV/kCB
X-Gm-Gg: ASbGncsYB0AjlhyNai5TCoQc8oPrWFz5tFQB6AJQRND+XjN6LMlKheXGdU12Ju1vZYX
	Sy578UqiSrRwbEflcYwWVrpYIIGsNxhd8IfleXe3hk7sJxvTleSgk+OXH88lVzs89THm8bUus2f
	x97Xsb6vTrFaZgWmNVsh1cKTaOhIJHBmLNnNrO41KEo93r3u26o59s2N+XsYNhL+DUx2wLVW5Ir
	PqmlZ2QBGno+Dwpr3RJPS5msqC2iiEpwmlCNjzV71WQB/IGck9tio37nqEQGuVqeeDy+nzPp3le
	2paS8B5cIYBRYn3r/QGwBw/y514Q4EGQx2wbzU2AgBlv2Xuozx9doss6whkkBwoZn9/g/pbZRig
	9G+HtjKxz11ZIAdIM1tQM4KMXIegiJErj4+Bb+LyYTrn9tuwjjOn1G0ZrkmcvoUWLcKdXPquMMr
	mJtP6HVFQlzeCH/DPPhA==
X-Google-Smtp-Source: AGHT+IEO6aQCuJCW62+UaVaTjY+QCSjAHhvbQVmQh7V/364o7l0RIj5zQd8SK9Ou2X+RfANIrJ+c9Q==
X-Received: by 2002:a05:622a:198f:b0:4ed:bbca:fded with SMTP id d75a77b69052e-4edbbcb0857mr21223051cf.17.1762724724459;
        Sun, 09 Nov 2025 13:45:24 -0800 (PST)
Received: from rogerio-laptop.home ([142.188.15.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda578532csm34422821cf.19.2025.11.09.13.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 13:45:24 -0800 (PST)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sun,  9 Nov 2025 16:45:14 -0500
Message-Id: <20251109214515.121742-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

No changes in v4

No changes in v3

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 21b7168d61f5..f46cf6d1f502 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1

