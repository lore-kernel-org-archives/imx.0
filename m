Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D723A1A2
	for <imx@lists.linux.dev>; Sat, 20 Apr 2024 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713612525; cv=none; b=VOpQYdoKizioQFgzoAGL93dqF5SENIyCiVgVaVAujX9wDWvYg/0WLfmuTSzbFpltlkTwZxRUzMU3dEUW9j+hm160OoooH8sl8vPNdNbdE6jp1hSS5l9Hk2YDKWnKNn4C+5b92/PD/PeBksRyx1MhpYeGMMsy6Hotr+2iNLRZFJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713612525; c=relaxed/simple;
	bh=7iB/bJ0bKrmQie3dCvMHhIn659Q3FHBBBPaml/y6ZH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2IfC6X41guLfkYydQpmvdrsIvbpFTaCPI+PzC1cTni+LAqD65h3UypBfcCypZcyfhL87utZleWmjxpyyrzWt56NQ3BIJAO+sN3pJJcc6erHiFSwd/0875ftRj/QkNA7qbyRG/9r7fKjXELMwd7BxNuUqI7yDscM4+NZumE9E5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKDHcOFH; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKDHcOFH"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78f03917484so185032285a.3
        for <imx@lists.linux.dev>; Sat, 20 Apr 2024 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713612523; x=1714217323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tKoATs+ZIoHNDyy8oxy4Gs6SKIXsj2sSrJmnOyn8fCY=;
        b=EKDHcOFHFZPWQBaMDmyv6rJNNx9HZH2h3LFMhQ/RTqZLLJDhtngAAn8fDrnDDskYzT
         aHmrxgDk3TXMSDSIR6BICVSv3oyLnVnJLz9SVR/3pW44b+UIYtuWLo2184v4pZDbbmdD
         k4dvyjAFVNOO5C3ehBuURmYLsxrdL7BONvrY9adqxNgUl68AjGRH08Jd2CGLt5oPh23b
         LRNUc0ZuHv1P4ovfLGEFUStTUruiHLcHFjEPWOygiGoF68XK0H6/JpImeQnMlh56bxBc
         VaOmzJxW+agzwjMNC/J5AaLOJkZP9HNBc2lU3zgJ/WlPBkG8YeKtiOAg8hkmRckVrvQp
         5gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713612523; x=1714217323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKoATs+ZIoHNDyy8oxy4Gs6SKIXsj2sSrJmnOyn8fCY=;
        b=YrmVMBKf3hNHHORh0Gcl0jPbiNfHtWmVo6OOV7Y9ZpeeXK47M9W+zgAMfaJrSk+Pgm
         25IM7PT/9ElXTE2ViF0w4bKbt4niY4AE67JMpH46NFrAt/9NDvhlgrjUlTsQ5bItNiPt
         cU269Bz/qYVkApAUq/xR3uNbWR5qGalQbh2m0znmNR04VoR4zV4c3F6lh3Ppdt2bD9Op
         odEeXWQkflDKrm/sVlbPgDjWaK6mlWsNudkic5YHJ/bFQ4fZX79TlDOm3V9F/bTkBEpB
         EFLvmng17Z0ycUl/CJ57GvzjGXt+q4g9/42Ma3K4kKC5sbi4b6u0KimrdTXGOah7/oiD
         e4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2VSMonnITeg8dSzsHkJFT46PqTooXNYAQOT4Si8uxMljPNFqE/O+Ih0EuUqIKEFCfDpnPs0VohIpFGCqEJutFWe3C
X-Gm-Message-State: AOJu0YzSmSt+DVhQ3PTJmgdKz4xxvkoe3ODGMdOlwoHNdsy7qrbmJxWd
	XUNZiW38Lb+o3SwW6QvVuX+tedYdX0//hb0TUCNoqa8tckbfAhm+
X-Google-Smtp-Source: AGHT+IHUv7Gq5Bx5h+ndQV7V3ptdOzZY46MxtRUHLR0evtc/5NlIjWXFLv7Vys6xP0NpfUZZlbibsw==
X-Received: by 2002:a05:620a:2987:b0:790:676d:b7c6 with SMTP id r7-20020a05620a298700b00790676db7c6mr532426qkp.67.1713612522545;
        Sat, 20 Apr 2024 04:28:42 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:8379:f9d5:1d94:be66])
        by smtp.gmail.com with ESMTPSA id o15-20020a05620a0d4f00b0078ee090baa3sm2422559qkl.10.2024.04.20.04.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 04:28:41 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Liu Ying <victor.liu@nxp.com>,
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
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx: Fix unmet depenency for PHY_FSL_SAMSUNG_HDMI_PHY
Date: Sat, 20 Apr 2024 06:28:31 -0500
Message-ID: <20240420112831.5942-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enabling i.MX8MP DWC HDMI driver, it automatically selects
PHY_FSL_SAMSUNG_HDMI_PHY, since it wont' work without the phy.
This may cause some Kconfig warnings during various build tests.
Fix this by implying the phy instead of selecting the phy.

Fixes: 1f36d634670d ("drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp@intel.com/
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 7687ed652df5..8f125c75050d 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -9,7 +9,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on DRM_DW_HDMI
 	depends on OF
 	select DRM_IMX8MP_HDMI_PVI
-	select PHY_FSL_SAMSUNG_HDMI_PHY
+	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
-- 
2.43.0

