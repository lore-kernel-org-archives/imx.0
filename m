Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFDC422523
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552990; cv=none; b=qmrdPOjTPy9HBYXfroKcqCXZqzfo2qLhyhM1PpXKqiHrDASlE7AV8I09OKIMvmGW5pQV2mRQX72zoeOWAGQXy7yTotnjW012hpPigGgeQN8fZ1/zk7A0XM6cCB9H4/JxqldmCVvUsA9kD1hhZiThNDBtheIp9tfndFxiR/fKLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552990; c=relaxed/simple;
	bh=NibdtCwpxrzNYlWG3qc/r04EtocLChhxPuanrYhvQf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fW2kcJJ0831RP+Cga29jdzBEzHamslhtsSq0wIajK6NOMRnt7RRCalcGeNxxVvTSYCGhAy3F98v2nr8H6a4vUqlj49cpu7rwHo6lElrt4lPux1FVBqqKkX6mDeOWhrOmzwCb9Rdr3MKHEHGYjM+rMG7ppAB9uc158j8bPcbTDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gG8G3HVi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gG8G3HVi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47640541585so5074893f8f.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552987; x=1785157787; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8mYPhXUmZpNbn2oVo3k+YKafzsgCsS1GE9LMv7AFBw=;
        b=gG8G3HViOnrAYvYD3UpUiF9ZlysFPha1I2GI9X/70ftGcLBzvci67M2rGhLGh3DLZp
         rj08/Oeo6EZ0eHfzR/Zw7XhC7k4wxEV9bZgoJPhwvVTTOnx/iuj+7tSVBeVyrtT8kHiG
         tRzVgcdQzrk2hKyqqQukl8qpZWGI985SaH8LxHCx6q8oU51NbiGCf5RWiO3cpQZwGRfI
         cCY6PHQ1FIdQ9z7rLIQcaM2EvQrUdULohN8tc1x9LQF7WqBmlZS3Jks90Va1etqU2S/5
         FKQOkXPCriSEM4HiEZvw/U7BsqUldw5aEv+hyMJ+umIFxV+LAt0uZ2mQL5tIckLcrbD6
         /8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552987; x=1785157787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8mYPhXUmZpNbn2oVo3k+YKafzsgCsS1GE9LMv7AFBw=;
        b=aMnZmOZc6Ve+5foPkpwUNyCsS2iqPk3K9goK6E0i8iKQlhK4juOkyOjnroU135gGrG
         A+zDbpCjKxyxbzPX5T/eTs++F3w+RzsiM/4epMTm4yFyvKinuM9+yW7fanGz3i29S4KL
         ZDkOUO4mqUW8J+mlqs9Ws05cN+tqJBRD/zSIeXChftYVDhoRrD1sY4aO3l0fdcBnoooo
         TEOcDBwsgm8JDZ3Qsc0nGg9si/IeUQKQL0LeF0aCt11bVp49WCdjJtqW9W4lp8xNI+DF
         Qxk7Qg1O+gIPA3lZ9+FUc4tK5eEBgfd5/3LnM1mZucX14XIRJSOCKI1f/B/Ms8kNlKwL
         O+1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp93Fbu+2P69r0w2MkLRf102tbLohdb5cM3kOMXlRyg0qeDJ6YZUiktV/xVLkKZ4Llvm7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCFLmXi72HZwrcc3YCXSnNChV8SkaVfBGK7ixGRRZaSUCeP205
	qvSIZXO7jtoIaOiWCJSkBEy2ZIO8Dil6Pg15fxodPKESQTikxYPrZpfG8LjHwPHTE08=
X-Gm-Gg: AR+sD10FCUB8MBxFIjvje/7ftEvdHh8sbgtX6IyKc8iwcloAEQ9uK6m5OotXXMnXBRt
	IrufyM2W5GEpsHCzwYIlLSwY3+esbLFCXJ7SpeCBKzo7r2rcoR7xoD/sKcpVen1qTFXB5wSoFQm
	2U/j9oazL94HrM5dU6t5ol8iwy79wPCJ3wy1F/01MeV8woN390geCb0l7Gk8oigU1bK+iQHi8Kn
	mrZP21IYVsllLBpIRcJ12ZvjxezugjRRTKRVGrGzG7nOYQ1hCfzq0aWVwNhg+AQzvnPwIJnxVMM
	gjIe8xbb1iTKm3p7Zupz5GaGVm7QzKN+VUC3UfB7mw0pNXaQNCzmiCKe6Zg5FyE8HLJc/ph3nz/
	KrLPJeV2WTCCOO3C9ovcYyEfKRVP/f50rrd+elmmPArDW4/WQ5EWfD9F53U2zxHXlRfdj906+/j
	qofPZ3pcwHbWQvVLD+7rRnkLg=
X-Received: by 2002:a05:6000:25fe:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47f62316b85mr16082343f8f.24.1784552986541;
        Mon, 20 Jul 2026 06:09:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm30767434f8f.24.2026.07.20.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:09:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linusw@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Jingoo Han <jingoohan1@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alison Wang <alison.wang@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Albert Esteve <aesteve@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm/panel: refcounting panel lookups and references
Date: Mon, 20 Jul 2026 15:09:38 +0200
Message-Id: <178455228150.789946.15332957012612566281.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 17 Jul 2026 16:02:03 +0200, Albert Esteve wrote:
> The drm_panel subsystem provides kref-based reference counting [1]
> (drm_panel_get/put) but almost nothing in the tree actually uses it.
> This results in a systemic use-after-free pattern throughout the codebase.
> 
> This series aims to close all those issues.
> 
> Patches 1-2: fix the infrastructure. drm_panel_add/remove now keep
> a counted reference for the list entry. drm_panel_bridge_add_typed()
> now holds a counted reference for the lifetime of the panel_bridge.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: have drm_panel_add/remove manage a list reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b619d9d2af33db01ea237e3546e9d55595e94ea0
[2/4] drm/bridge/panel: hold a reference to the wrapped panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/34069e04d338a333561b64a2da055bd16bfba39b
[3/4] drm/panel: of_drm_find_panel() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/738ff709f7cf82a41cbd9f6b8f9b1f236ce26610
[4/4] drm/panel: find_panel_by_fwnode() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d857b8ce04a7ed4b36a11db16968ab1652ed702a

-- 
Neil
