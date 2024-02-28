Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E913A878
	for <imx@lists.linux.dev>; Wed, 28 Feb 2024 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709120268; cv=none; b=fI0U7JEN5ODmRmnz3MEljVeVs0Yf/eKFwkmG4voDTDZi62gyZPZL7XUJya5wgvoxWK1UPy3Szn4tjFXWTKj03JgGgOrhUj29rXUeFxLtGx/X7m8C9blk2sg2XE6s96hKuY1dpNQjqrUdBUyHpCYx6YaPr/77XT1c5BUK5MZKz6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709120268; c=relaxed/simple;
	bh=WscMPhRz3gtDrK0zadY+NG7FINr3PhPGV9Yb7XNaQno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXKqDTKDUDM6fabHxKLo6b8ccHLFYNOb3YLIxHXdqoiTdtgyNnmgLnqIe02U2TNkU7SjKfCHMOg1BN+GkRquskLoGqGD1L1MXc8lucSoUNPl73dfNO7lWmGsGV3+qVi2jXdWo+xDqfBb9Zj1sb/LHLpNpnwlHBfXapAfqy/hLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCy4Ht69; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCy4Ht69"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7c403dbf3adso285128539f.1
        for <imx@lists.linux.dev>; Wed, 28 Feb 2024 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709120266; x=1709725066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFtrXUgWnMJ9NQ2PU+2dtB8bMmOfzlQTR6EQYNPIXm0=;
        b=RCy4Ht69upZDFYW0WLLT9TkscUrZeA3lNwSTIkbm0NuUrfOMm0epofVIgKA2gKxRJW
         ZT9VYgCsnkMNd4ZsfYSNbdh776kFRZw027IbsVsP2HbmSLumld5dNEKr+lWEISUvmL5b
         hYDQaIq7PPJsnfbUGdVDeq9oQu/r0faOflXeLzXeaLHGlPlT7zRDy3uO2HpvqVlQmrlq
         ByQzYAyAhcqqApA37ip3FFIcP4EocAIKuyvkBT2jFZmKv19up0SoXPlNvn9QyIRv4Vhz
         nMhidgxQcpX639/HQ1X3YXdR18nfSA1SFot9LeKcv6/EYxbSDwW2gA6ODX4h4IdG9tYn
         2IpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709120266; x=1709725066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFtrXUgWnMJ9NQ2PU+2dtB8bMmOfzlQTR6EQYNPIXm0=;
        b=Nkau7EtDNwMkB7GfHDE6GMGXRJ2y371nZIEq2EbSowg7K1dcNwabtczbT92ibcgJe2
         zq9DLdiswqPYVtdW5bq1+jUBdx+X9312Gy47qNnaleVxPe5Vo+vPnQ4z8evsDtw0Yx5i
         GRhFKuscqYhXLvldlsJPC0R+rpWByesH3POXL4QTAd78vB2tbADeO3cHJwa8hTtJpZOl
         Ss1s9gL25f7ucm7vz2DfIKMczI7Az7TbD/dZxaDsEAZHv/0EN6FF/hxn/z2F7McSG15N
         D53wy7auarqOC5eGT21wB20XwWRpSpJJWANDE9p+Y7VtUBBj1KMgplIawBlFv+jt2rg4
         nMjA==
X-Forwarded-Encrypted: i=1; AJvYcCVWLrtVJZDr62wKzLYnNd3rHXJ6710J3Qa3taBvSEwkGW6ZAwHpQPlFsX13UzQ01M3fkApW35q6vC9JWmsml+72n+XF
X-Gm-Message-State: AOJu0Yw4Qkx0JM7oT5+d2+Etr9yWDHYDHKO/QSTR2idrr57391Fq0SEI
	C2P+TRASRHiweG2eRmY8Emz8akM+1J6cC5cekoLHc5XHquXND20Z
X-Google-Smtp-Source: AGHT+IEwYOiAlwhhDwfp6MFMf8Kh9Xrgrs548zAUc51dykwi25IhwwwaKGbQtiBKAvrlGS0wowxSjQ==
X-Received: by 2002:a5e:8f01:0:b0:7c7:fc3e:6f1b with SMTP id c1-20020a5e8f01000000b007c7fc3e6f1bmr967586iok.7.1709120266374;
        Wed, 28 Feb 2024 03:37:46 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:abe6:89f4:1061:8343])
        by smtp.gmail.com with ESMTPSA id k6-20020a02c646000000b004747d876aefsm1833147jan.6.2024.02.28.03.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 03:37:45 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/bridge: adv7511:  Allow IRQ to share GPIO pins
Date: Wed, 28 Feb 2024 05:37:35 -0600
Message-ID: <20240228113737.43434-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ registration currently assumes that the GPIO is
dedicated to it, but that may not necessarily be the case.
If the board has another device sharing the IRQ, it won't be
registered and the hot-plug detect fails.  This is easily
fixed by add the IRQF_SHARED flag.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b5518ff97165..21f08b2ae265 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1318,7 +1318,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
 						adv7511_irq_handler,
-						IRQF_ONESHOT, dev_name(dev),
+						IRQF_ONESHOT | IRQF_SHARED,
+						dev_name(dev),
 						adv7511);
 		if (ret)
 			goto err_unregister_audio;
-- 
2.43.0

