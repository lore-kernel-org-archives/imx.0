Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E983A1DB
	for <imx@lists.linux.dev>; Sun, 12 Jul 2026 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783818254; cv=none; b=mAkgl4JwX/m7j9Pfjhg7CnDyA0MREKnonmkjSSsqBpoz3clMz1vA4mvmhamv8pWRlRh7PPKbhfyi9G3ckezkmrTfTG2ZF3B8a2SCaOl9thvmgHDH9BTyjBkZw7eLsw7xq+ui6lmvBYrHV6Fhx8NlcF+I4GVxkPnT1dDjhPUNPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783818254; c=relaxed/simple;
	bh=quWeediN60w1LhX9cWPFn0Dv7qd1bLLqDXDnujMdG1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMfJ2RCPjofKxgkW+Rv/IpOGGk7O5iq+Y0dgWTtBozS431vmoQ9gQB+yS/eZOvR3BMoW8VyUizug1KdqNhTpEuMs9Zkctvd0eG/ZEaaXVsuJXK6phuC7g+/0/NVQlXUWfk9P0mS9mVu9ZnlxUsR2S3XCOYcDjmbXVeTCfynXn5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOvKWlIK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOvKWlIK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b27c7451so37881575e9.0
        for <imx@lists.linux.dev>; Sat, 11 Jul 2026 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783818251; x=1784423051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IH/34IPpqm+flKepaUz3IWK/5zpVie015ZDy8bQoYCs=;
        b=gOvKWlIKJgjCcaZsh5PNHxldrNcB1/uPm98FfiTD5xfrzNuGSwtkBM6lDtxSs7vmiy
         AqRLEctI3daz1lX6q/Lz2dkrRFq37ydW+9hzn91kv6bxzloIPoGSHsXaoHbmMuEkFBqS
         zrtCBVl+qjOmnN6Y+x8Id6B4BJza/PJMiDsNLJxgpGOtCyMR4fbuAY/Hkeub6gZ1z0aF
         1gPoLbi8wM+dG/xN9ip/sEN5489pHTNSYOniqM5oTalp/LKfEzCswN8JYqm3jyNm9hKv
         3WFkkD4BrsJKFAUn2ZPUC6QLMOVZQHBSgTUnNI78rslzwz+Sss/rkPmlmkYj434jqYdC
         7/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783818251; x=1784423051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IH/34IPpqm+flKepaUz3IWK/5zpVie015ZDy8bQoYCs=;
        b=c2T+EeRMVB/KpQjUk3nwgfQvDCZpwbaFxPuEDR2861FiYqPe6EKmr+ySIhDOS5MFeO
         41ogyX4NdVa+GLR2FupelTsigL3I1iOoLCbKA3VclQSLDkMZMM5Hv9wP+l5+ctkHZ2FZ
         lIJTu6R9+5KncVRWlr5ezfs5L4EJpAnvyvqcaKM61J6UC1b35b2Z86vfztT9QnKiNe9u
         WEEjHN8+raQLnN75DAmJDHTDhaGmkklme3iXNsSODFtEoedOw+sBC2pClaHkjJdZqRe6
         JJ4xDvDQVkWlbXBZV+Z0nxiRYiUu7t6RHQiKmGvqvlLvDkvmRCPErjBRCebIfj8Bp6mT
         Hb2A==
X-Forwarded-Encrypted: i=1; AHgh+RpnNpmO0N7KfzvP7bLCnxb6GQQzDWLyw7uJw9tKSXmZ+NZVAOc+UKgH5v+uo0ukunG13dY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmAMc5GPCd8Jbe+YlHp5i2JYhmoRMuNzLFP844GCmoje8Ax1CF
	iPFTbfkJqQAdJFCuN33w5mp1yINlsv/X5x3MB9aGh/WBGzHawaPJjEgv
X-Gm-Gg: AfdE7cnoy+2jwpU689vV9OJ4ZmzgucGq55Qx+A8r531vqQzaLYhSJuFfanZQ76uE6RD
	tvD918GfqMMzNZtfbIfs+NTTIJRsseM1prqjyt+D5xymfbF+gE5HP/TwrMassThN0CJwS1OEXdB
	Yq1XQ2kxDZtkE3yIMBQO4mG8BwvdNj2LyTy/8rYks60kzMptGGjIXLJx3iIq2dMp2l3gRRUY/aI
	VaQYjR/eNiTB2sNL430k//FwVe6O+/FQC7mCvv0H9upkmsZ9SOyv6eg41ay1EbUY0kjDQ8DMo2t
	k5KokGCLhIECAiF6FvF4Sb04VSf8NC2IVz+3XT3ZBGGHrqJSMFzLbDyvlfgOMWZfiFAZikSAhQ0
	0Sv9ca5+S3EpSe+aMYxs+qwVKgw5SEHdJIqjrIQrIkoh5vntJKiqJGqtRbJktJ8M3ij9+T2OhVN
	ZavxDlSUv6wYAnWE1g6kjVOxtqujykCKuDzNos7ZrwxOC5UrN1OaTrGcm94nuArzVT4tjtg8dT4
	h/b
X-Received: by 2002:a05:600d:2398:b0:493:ecf5:89fd with SMTP id 5b1f17b1804b1-493f88d2f7cmr27656375e9.17.1783818250715;
        Sat, 11 Jul 2026 18:04:10 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm188580565e9.2.2026.07.11.18.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 18:04:10 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: arnd@arndb.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lumag@kernel.org,
	alexander.stein@ew.tq-group.com,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] drm/imx: fix unmet dependency for DRM_IMX_LDB
Date: Sun, 12 Jul 2026 02:04:07 +0100
Message-ID: <20260712010407.2387049-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, DRM_IMX_LDB selects DRM_BRIDGE_CONNECTOR without ensuring
DRM_DISPLAY_HELPER is enabled.

Other similar options select DRM_DISPLAY_HELPER so let's do the same
here.

This unmet dependency bug was found by kconfirm, a static analysis tool
for Kconfig.

Fixes: f673055a4678 ("drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 3ca237515e46..c54b176649f1 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -37,6 +37,7 @@ config DRM_IMX_LDB
 	depends on OF
 	select MFD_SYSCON
 	select DRM_BRIDGE
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
 	select DRM_OF_DISPLAY_MODE_BRIDGE
-- 
2.54.0

