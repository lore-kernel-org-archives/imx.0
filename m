Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D878F57
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828238; cv=none; b=g69EPnQOcSD6YY/7Y29UknWO1dHaHZyTKEUN9ZrRRVRuQNH2hehdkSM7YrySHQtvyWxe5Cyi8OSOYiXYKqWNTHqeiQOWJLpRPR+iU2hmEXRiQORJLQqDI5a+W7KkNRafBmoWSWuJDr6ZpCSheobET6s7ZnTfDaYNweL9shHzJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828238; c=relaxed/simple;
	bh=kAMlmXdMZNLuk3Hd0o85Nl1h1rX8fxVktadoMv00Pc4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g9xUaLXKtqpUSAmcZbDD+939FBoAHEsetrn7uUUC9EpvDed38z8BQv+aRw1q5hpN7hm7Fem4Cbbayy8B8z1yy0sEOhPapqhtIkOgSOCnvy7h8BUcivC2igRWzmdFRLDejtqhpupcNtQskpmQWOYq+St7FA6Xg/CsUGpZrvf1Nwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itXOpacP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itXOpacP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21649a7bcdcso20545945ad.1
        for <imx@lists.linux.dev>; Tue, 10 Dec 2024 02:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828236; x=1734433036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=;
        b=itXOpacPABDqlUoRmHzIzXiSnVzzeklZGdj8ys0l3tYtSafcUYFYghYLvRxI5vyKEt
         IzBxf4msqfxnp/84uEMmLdbCBJv8sT1djZ/6OsoLsthE+FrUTvGmbmBvZt3Djach2THJ
         91a2W4R/vwDR74k4lSU3R/o35DoDTNa5O/Bf7AhtPKNtUSnNbUffsLwX/Hfrih8SqHUX
         UuY8QL8H0CgaoWOnbyNMWmzPlTbLFk1BklfoOihJJVpu+x7X1Ksr81P/84xL8DrW20ZN
         wvagbSbmp2j9+t+2o7MMGy4t5xNE0TO4qMRnJhPoCRUtCtyrgbtFE8lYmsWDdTRcPJE4
         FTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828236; x=1734433036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=;
        b=xI58q+z+arEZKOzSqpTv+I7IjBtqu80xht7xb3D88fKFs+k0UCn67D+NVMqeE+TWJJ
         Omaclv4dMU5SrgW14a0WWcKG0uWBLRFoFgDjme7zj+OCCewtNG/vMOe/M1B1WoJ20UJO
         4KZfhGsaxztbgBmGAvGjCRnlltpgr6shhRSkvD5zJDLnX7JgbcVfa0L4KenJn7UJ4qdG
         CSnaM4oEH9TQ2YRGf1qEOnryy48r/SUHzbk+DGpPzqmvrmTkzyTzhmc1NQ6SPuUly1Ib
         P+SrYo+hUQKVl1Dpwpzuju69GYhRYdVJq7A51juyZszA1CPhT6+35982FNHoyG0y/JFr
         DL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWs9HB3B3qOlVcn5d1J8A42Fb8ao6jfVxBKNVoyOrFYeA84m/XUjAxPs6ncVlLs67yT6Do=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7fxlgdT7ra9/rSWQZYErCh7W/s2T4p3c7FRgXqXXuGwfgSq+l
	BH/CTFt3rhneFPTbPETfaQ375B/kG3U8+wIBNm0Z0NHgPU0RvT8p
X-Gm-Gg: ASbGnctWEbRGpJFZCO1SkmXLJFjBssfrPdG2Yt9xAa8PlVyqByl7T0PH4D5/b8ndidd
	398Y+WNuRXwr30syK75EQg07W6+sWzno+nfWULo9jBrL1YHtw7ho6PRtMSGTZ72yjgWDmZ7jYNf
	vEUB+UpGFtskNgjD4Vdufx3cP7rK1457AsnGbyAfwMm6ceZxyI7IJjRDiSnHCuchhnP5dTguwFk
	m8BaCanaz9XgeNqBkncwfSWK7g4eW+My5JUa7g7NDxEs+U1LYIuD6TpOI+kFiTR/pHj
X-Google-Smtp-Source: AGHT+IFZS+CwL6DlemunV0X7hNvE9zPcFuht9fokHFareRkZRku0/80LFiQQ4eLAdXdtO7akoWhD/A==
X-Received: by 2002:a17:902:e809:b0:215:8dd3:536a with SMTP id d9443c01a7336-21669f9985emr60165085ad.4.1733828236463;
        Tue, 10 Dec 2024 02:57:16 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:23ed:f795:ef82:746f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615b1e6d6sm71068955ad.104.2024.12.10.02.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:57:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
Date: Tue, 10 Dec 2024 07:57:04 -0300
Message-Id: <20241210105705.116116-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.

Add a compatible entry for this LVDS display model.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added devicetree@vger.kernel.org on Cc.

 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 5af2d6930075..fcb5834f799a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -42,6 +42,8 @@ properties:
           # Admatec 9904379 10.1" 1024x600 LVDS panel
           - admatec,9904379
           - auo,b101ew05
+          # AUO G084SN05 V9 8.4" 800x600 LVDS panel
+          - auo,g084sn05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
           # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
-- 
2.34.1

