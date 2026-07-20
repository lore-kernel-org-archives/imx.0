Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE583409629
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562053; cv=none; b=BEmIQ8Tx2eQaJC+ibpq8MuKmis5Oz9gAadqqH6C68KzZTb5iH2ydPK0vQenfLY9s5rt1jxL0g5cpd63ml1j25hMUKh/37dL3s0usRXx6tji9T6Tsm9b6bpIbgfUpYQzdY9cIeLOD8+hMCQ1fZC5Qr6xge+nuvsxcnwi0DRIgR7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562053; c=relaxed/simple;
	bh=mfEjaMH0TBdC/ZK8n1+F49JSV1pp/UfoGo41Uw6GS6s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XIMi5zd5XtYLoaxD9uCHeN2wzVPYBoxRYtE15o+lTcdyOH/CZLZ0ugY3tEbs2ScDGCPmyQNDP/Mr+gz0gXtFb5Myfa11eUyDtd2sgswkJ/ans+HCmDWJceRoCjuX/2m/MuYnF4kQQ9Clc2/DjGBn6E7QxNJzoi/FSNVKF5TzbRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdSW/q7m; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdSW/q7m"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so7942429f8f.2
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562046; x=1785166846; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+RhVkb1Ieh+bhF0gQzF1Ju+q7qk3GiWptVGwICJBljM=;
        b=FdSW/q7m6/PfRTeHPSoWQ/LAPaH+rsJfgC+xqd9BxAeFB7JHarscAXmDL9enmi+Myb
         /1a7tMGgruZV19HHuvFJmCvzGNvWHr3ptCDqPb76eSeSkjdZi5fJD6qRRiL8njdb8Ap0
         oWdG4sU2Z3UaP8505EThtcKY/mF3i75twmUJeclwJjwYOcHuHWLYqAgb4GGzdIHZ/mo8
         rXby1KCxrjiaIU8zTVzsILRQ/Yi0RlGnQXNvS0loGqAmO9irZr7FhiHESTiHZyhJTqfT
         gS0TsyK0acvunjIpw/HKNuJd+3tSj9qmvW+XEeosGVrYxIyfRMDganso333EWRJhre65
         llLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562046; x=1785166846;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+RhVkb1Ieh+bhF0gQzF1Ju+q7qk3GiWptVGwICJBljM=;
        b=WtLyCpGVnRnrsWD9FiWyHW/qvBkFtrbqqD7CeMxHDYjbx/StWYlvaiBzAFJV7zhATo
         QOgna54zo2GhFxuTrJfiFUHISZRkl9Z0YC+k1uOXmpOP3pRrlF2EkClH+AoAcw7811hh
         CL5AXBoNwufPrRk9UgJ/XUdiDNDJLqk+yneFt9vAUUiDDfrMMc4mcuBVxqvgm/yXm0bL
         ig+TkfJm4SGzSJaFFUhzYG+XMZ26+8i/m1mvsmU/49qlg2s2L9MXlJ8iE2ntEARfxw++
         mJ++vmybsXkv2jp0mLDSbYgsV43nd8x4JFWOLcJA+/t9zizfeThKXoqdqKesC87QKsJp
         XgjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Z7urY9pqYGHGaRBq1nSjobKeNxyNMcrAMviUkJCI5LM87m2oLQWFnUaVr55v00aYMbQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWWMaxsLlqLeVmzksPc6K/qSIaQ8D8Ui5cocPpEsDBDek0ttZD
	EeJAuEBLBCOVvu4xPPgCUxNFComswOCxXAGGy5xX5/F7oHvLvzZq+u28
X-Gm-Gg: AR+sD12aWHpQgxL6LjVIfrg7nPRcaMyw+lnWsButy9wqscADvG4goO4aM98/K1ASg9W
	RouRYWdqgcYuNGFV+IGIv6WM60N0Rpg4auK1h2XmKsQZlWdgeo9GBy//s4RM/fG0ec99fWIRhqP
	aoC0fcddHAwGRxXvwnThSthMBABKGAu8N2uKBmyynm5+T4VBe9H93QoygvpjuoZvpzUdGfIimgp
	CWQLMGz+7p81R5+MTZzhG/wV7Fkgz6ODeDvrTIX0hwP4hluf0Y5FBU+z3zOWaadSYzhqk70h1lO
	MOyjs8f4MpFgrHN0wuBF5/QStSEDAWazaHIAUeKIdL0qXWHD1HxnQXBF8tF+S6lJDAGciKkYJTB
	Jjgzatinp0IQwePDltZmk447INymi0fZ5wOOMLMdjC9PuOOV/FRQecCiK+UFltnaRYiQ9HtcIaw
	HgC2IufUAGPQ==
X-Received: by 2002:a05:6000:4310:b0:47e:b336:6385 with SMTP id ffacd0b85a97d-47f622d054fmr17529323f8f.0.1784562045728;
        Mon, 20 Jul 2026 08:40:45 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:45 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
Date: Mon, 20 Jul 2026 17:40:32 +0200
Message-Id: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFBXmoC/3WNyw6CMBBFf4V0bU2pysOV/2EIKdMBxtCWtNhoC
 P8uYFy6PMm958wsoCcM7JrMzGOkQM6uIA8Jg17ZDjnplZkUMhN5WnDtTR3IjAPWaMFp9DVZmrg
 WWanOAHlbNGx9jx5beu3me/Xl8GweCNOm2xY9hcn5956O6bb7Vcq/lZhywVVewEWUeBKZvHVG0
 XAEZ1i1LMsHAbIKNtAAAAA=
X-Change-ID: 20260718-drm_simple_encoder_init-d069a4cc7f8b
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

This series open-codes all remaining drm_simple_encoder_init() users by
calling drm_encoder_init() directly and providing driver-local
drm_encoder_funcs where needed. After the driver conversions, the helper
is removed and the completed DRM todo item is dropped.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Changes in v2:
- Change logging to consistently use drm_err()
- Link to v1: https://patch.msgid.link/20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com

To: Jingoo Han <jingoohan1@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Michal Simek <michal.simek@amd.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Stefan Agner <stefan@agner.ch>
To: Alison Wang <alison.wang@nxp.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: David Airlie <airlied@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
To: Chia-I Wu <olvaffe@gmail.com>
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Xinliang Liu <xinliang.liu@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Yongqin Liu <yongqin.liu@linaro.org>
To: John Stultz <jstultz@google.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: imx@lists.linux.dev
Cc: linux-mediatek@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-doc@vger.kernel.org

---
Diogo Silva (15):
      drm/exynos: remove dependency on DRM simple helpers
      drm/xlnx/zynqmp_dpsub: remove dependency on DRM simple helpers
      drm/tegra: remove dependency on DRM simple helpers
      drm/fsl-dcu: remove dependency on DRM simple helpers
      drm/kmb: remove dependency on DRM simple helpers
      drm/virtio: remove dependency on DRM simple helpers
      drm/tidss: remove dependency on DRM simple helpers
      drm/imx: remove dependency on DRM simple helpers
      drm/mediatek: remove dependency on DRM simple helpers
      drm/renesas/shmobile: remove dependency on DRM simple helpers
      drm/hisilicon/kirin: remove dependency on DRM simple helpers
      drm/arm/komeda: remove dependency on DRM simple helpers
      drm/meson: remove dependency on DRM simple helpers
      drm/drm_simple: remove deprecated drm_simple_encoder_init function
      Documentation/gpu: remove completed drm_simple_encoder_init() todo

 Documentation/gpu/todo.rst                        | 15 ---------------
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c  |  9 +++++++--
 drivers/gpu/drm/drm_simple_kms_helper.c           | 13 ++-----------
 drivers/gpu/drm/exynos/exynos_dp.c                | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c           | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c           | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c          | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 14 ++++++++++++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c         | 10 +++++++---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c      |  9 +++++++--
 drivers/gpu/drm/imx/dc/dc-kms.c                   |  8 ++++++--
 drivers/gpu/drm/kmb/kmb_dsi.c                     |  9 +++++++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c         | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 11 ++++++++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 drivers/gpu/drm/tegra/dsi.c                       | 16 +++++++++++++---
 drivers/gpu/drm/tegra/rgb.c                       | 15 +++++++++++++--
 drivers/gpu/drm/tidss/tidss_encoder.c             | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_display.c          | 12 ++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c                 | 14 ++++++++++++--
 include/drm/drm_simple_kms_helper.h               |  4 ----
 23 files changed, 183 insertions(+), 78 deletions(-)
---
base-commit: e1113c37ba4f166e37dec74a729e6dfd8cba1687
change-id: 20260718-drm_simple_encoder_init-d069a4cc7f8b

Best regards,
--  
Diogo Silva <diogompaissilva@gmail.com>

