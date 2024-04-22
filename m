Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C67F14430B
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782046; cv=none; b=pdCQvBYhZoPowINaeF+v8T7NHuutpNX9dgvNqz6Tn2TbZSWNnV58kSUwrKIPrxOsVhzZdgbZvsmV2UkMpIBVA9+eoNiInIPmNwqovGk4PRm+cC7fWa3Rfji3rNYtvAgW5XOZtlM4Y/uJOTWyLMHQMc0JoeTp/F3BahYiDOaPmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782046; c=relaxed/simple;
	bh=WvN+syKKSt2vFL7wcl7mnQ7c3aROHF7WyjkN1r8GiVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jzrrOsgUeBorLe7e2qr9J01uomEJc94hbOocX4vIHtKESjf5F7sCyTrvtPbS97yGR7NXVcrM9rGq1pd3ABW2fU7FR4L2SRwzzJtVW37ZLPV2PQK0UsalPV/M7HCZffVlNW64LsMU2m/HNCRX2ci5d6IUSukxWwYS+3Fmy4kzWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Egowb85C; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egowb85C"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-699320fcbc1so25213836d6.3
        for <imx@lists.linux.dev>; Mon, 22 Apr 2024 03:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713782042; x=1714386842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9RmIVhJTPtd/M32KO0T9Rps1ocUTTvulsyIxVAq4hw=;
        b=Egowb85COCcxzHtY1yfFlLWay4vF8er1UHBUa/9exS2exHdXT9/s7u/tq5KOP1LSFp
         nZ8H+SoFhZPn/lnAuwEPwN/PpsJktBpNsc+XePgmwdS5gdJ+lAEHPiVIPwfXvkOH+XRC
         XlWBws5RFfVYeFGD3rCJfjItY/YR0w7h1zAzCCOYIQ1j/rBc+OgjrhSQicIBpSg/R8l8
         0bwPUTLFFU57lf6obbFCjar7sKSrJ6WllYv5WjsCp5vtFHqPCkCjX1rZslg8bLACNBvF
         tUFkAIhR7KnOQkPgX0Gqa/L2RgbkJ/+9XpbJx+D7WSl65V1rz3e3buoxjrbggB3QJVMr
         kqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782042; x=1714386842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9RmIVhJTPtd/M32KO0T9Rps1ocUTTvulsyIxVAq4hw=;
        b=QXrPxLIDL6iSojzK3vsXpPPr+R670scoCQ/tujhD+hFHx4BnQWO9BJz3xu0RthuV2R
         zdvgNp+bCoDSkx4YchMAHDI/8dI5VYpGAthKZNvs1vwhAL6Epe25pMD2h1RyCy9jUN0R
         FDAYBPPCaIa3/Y+9gYQCI9Nq2uxMI5J01ILk6EIW9zbMcNxjmKDXjJ6M0zZJB48p2nxh
         yDwc3n5DZ9wLMyageFbYPu1OcwZtgqcSP4PSo9yfdzYoAyi4KVhyRBYw2EgxrpARb2Vn
         isXepiAKByvJq/1BuPXCxtswGQpuvZUGkHRN59DWZHVPZtxYGpTWVjLseD3GL9JVaW9Z
         YBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOyXvMkGTXcIQw91sFZU9sIIjHJNuDw1H1dbq+/MzXaGVg43Lf08ygsFCEkZL8+v8Qd9fyapHR98kHUWPVLnRGo8Sk
X-Gm-Message-State: AOJu0YyB5Ca/pKu8OFwOB3O+ALAS/NXLYkfjRaKFMpmZ6MOAuw3so++D
	rXk5qv5JoHuFGhssiweSldFowcnxR+zafJcpDvsHcfbpjL2jLrdb
X-Google-Smtp-Source: AGHT+IF7xU0CrgrENRN5M6s9mj5930yB33guQy8rgide/y00R328+7Mcpm1moYpBa6a7xF4eToPrig==
X-Received: by 2002:ad4:41c1:0:b0:6a0:7f0f:5856 with SMTP id a1-20020ad441c1000000b006a07f0f5856mr3428302qvq.0.1713782042309;
        Mon, 22 Apr 2024 03:34:02 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:21d2:385e:2c2e:5178])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b21f13c52sm4170919qvd.113.2024.04.22.03.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:34:01 -0700 (PDT)
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
Subject: [PATCH V2] drm/bridge: imx: Fix unmet depenency for PHY_FSL_SAMSUNG_HDMI_PHY
Date: Mon, 22 Apr 2024 05:33:52 -0500
Message-ID: <20240422103352.8886-1-aford173@gmail.com>
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

To prevent this from happening with the DRM_IMX8MP_HDMI_PVI, also
imply it instead of selecting it.

Fixes: 1f36d634670d ("drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp@intel.com/
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change DRM_IMX8MP_HDMI_PVI at the same time since it was affected
     from the same commit.

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 7687ed652df5..13142a6b8590 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -8,8 +8,8 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on COMMON_CLK
 	depends on DRM_DW_HDMI
 	depends on OF
-	select DRM_IMX8MP_HDMI_PVI
-	select PHY_FSL_SAMSUNG_HDMI_PHY
+	imply DRM_IMX8MP_HDMI_PVI
+	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
-- 
2.43.0

