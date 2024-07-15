Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5711836DE
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721025200; cv=none; b=t8lv3y9JW4URyd49R45GZcDCL7VeeQmn1v+R57TOe9nSqB/gkYUYOkAyG+pQtILLP4B0l8WOAYDYglAViloWs2Fh/4zhYBirQJDo74JgEVQ1379j1z2mEDPhpKCFGQ/cWHxC71K2PmEkYGcqIwJbNDToWUWDSrNoJFNvl/Q7jsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721025200; c=relaxed/simple;
	bh=ElUTEfRFQUeTMBsWyzbhEyDMF5jl1RThHLUf4PWNs3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWMiiXzCmwNe4viKAzSG0IGAF/bwLAOw/VFgg0TbrEhrHFpnjsMDUuINc/9AL2A5ZiaGn+r4XRgWIdxsZQI4+YYWora0nDpl2RRcyyX8G3jaWnSnxP3qcguOERRiYtHYCZo08Qjoz9g+hOx97XBLNW8ODQQeqeVYV3UWJLTj8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JyyqNP9x; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JyyqNP9x"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so6049001e87.3
        for <imx@lists.linux.dev>; Sun, 14 Jul 2024 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025196; x=1721629996; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hD96SukkfsNyjNTVedgkKQiaViidlloIggj4cO+Fh4=;
        b=JyyqNP9x/cZVdp13rKAc1y74wNvAqyTLQJuTe4Yg8oEQMnAugAJaqpolcBrr41tPbB
         G2MmA7OS/b0PyBo7yfAl2kgngBFnQ7flH6MgQHf7hsCNveeCw8CkD6aTpS/tttEJYNBZ
         thHzeoyLShfLIzgd7IUtuvm+hTaHM1HQ3v5xGCkeFXASjZFWzYOJPyAP0lJFC6gY1fvz
         KlHCKwtJwgbDoXjF9hsXzqCMXk6KTgjcNebpH5RWm1HQ/sjC6Q8iDcJX/ZUhpGLaavF9
         3T5gKMj9hg0O2Owb1FmWHb0pQIglPkBekXf83lGebR8EHWiG5+Ohy9kQ6dfTENp+f4mN
         s+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025196; x=1721629996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hD96SukkfsNyjNTVedgkKQiaViidlloIggj4cO+Fh4=;
        b=CtK947AT/rKht+uhJRPby6Ue27vQ2dN/Hl9ZgncKSRBjgviIPWo+ihSSoJjQrQm3za
         /abCqMef3WzEJ1HZRuY0gP77jwgb+kKwgOxNglqR62KGulrTLjjg6wkklt620QZyLqVa
         +u+u0q/kk8Fuy5D+arpYDhHrv8coPIFP/yYO6fKo+73kUHMhDqWqsyS+WDAy0U6y/3dl
         rIHtA3cD/sVyffnZbIBfdZ96FSiCuCpAKhlj5WHW5/Sxuy960KC734kxkZMmTnI5gYyf
         oVXS77P5c6J0dWBy7kX4p3notPu3Aoj7F3rrFdN7BMM0Fc/1IJmh7IhQzZ0KQjnN5i8d
         uoAw==
X-Forwarded-Encrypted: i=1; AJvYcCXMCybkw15/QZdrBLieZFE621o4qJm0rwWMsWgLo+EaAXFgA0h8cpK+ePfRZ0Osc6IXgUaa3gGm9jP/MOY6jPqclrGP
X-Gm-Message-State: AOJu0YyVeMndNdCtRMuTcWBxJFfCKghi6BOXLBdANkko+KM1AVTlRyrr
	L9Crh9zichMQ9xyEKprlXrCiWclWfwMFuJVBawCEYEGaHm2B3L4uMgyvc2qiGCM=
X-Google-Smtp-Source: AGHT+IFX0QH8GNKb6vSmUPAoENVWks4aXQTHoSfQhbwYfR/OvyXjXMYla/ZB9rPLdfgjOmPqGKpO/g==
X-Received: by 2002:ac2:5544:0:b0:52e:751a:a172 with SMTP id 2adb3069b0e04-52eb99d288dmr13038205e87.49.1721025196342;
        Sun, 14 Jul 2024 23:33:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:02 +0300
Subject: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ElUTEfRFQUeTMBsWyzbhEyDMF5jl1RThHLUf4PWNs3U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKovm5l+7A24sivlmJ0R0FXE9iAwNjDSrOKP
 WDSbfR6q0WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqAAKCRCLPIo+Aiko
 1e+8CACEJovL304bl9alKdbKAOnfEF/R08MCNCfeoeQl2+qtgfzhmRdNpjupcxELHKcsWM+QIMF
 y5SHMmA5MDdtTOnk1pk9JWqRfeB2hUSWYs3LYMmYEQy7Tz+BYPrK4ScYeUHR6+qj0oCHUZHBpWe
 jB29sogURM+xEeh1n0770SS5O7ZxzrOm+Hxi3UAo62YKLxcXGsWm6Lyx/3MtlyAPTJKZzM3T3ko
 biVZKcN3GeHZhA4YojTOl5G8riLQxBO1BmRwBev3679IUvrG/ciHfbmLdysd4FqK1H0pZF5YX4Y
 mYOPUHKTFUgJ8Z2ftC0dD6tj00ePMiHdUlm/pBEnIMFwUVaU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
that are immutable by definition - e.g. ranges with min == max or enums
with a single value. This matches the behaviour of the IGT tests, see
kms_properties.c / validate_range_prop(), validate_enum_prop(),
validate_bitmask_prop().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_property.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 082f29156b3e..d78ec42de42f 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -162,6 +162,9 @@ struct drm_property {
 	 *     userspace, e.g. the EDID, or the connector path property on DP
 	 *     MST sinks. Kernel can update the value of an immutable property
 	 *     by calling drm_object_property_set_value().
+	 *     This flag MUST be set for all properties that have only a
+	 *     single value (e.g. min == max or if enum has only a single
+	 *     value).
 	 */
 	uint32_t flags;
 

-- 
2.39.2

