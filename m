Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110493;
	b=BVmkxyVXfNTJ5IrsCXu62Fv2HDLrRtR2+Tej5uL9J5fRloE+W+ikvQfnMSPm6qL2MuRR
	 cSQUXcxf1geM369Ma1ldAEO7cbBVYVFfysipjMpll5yW7a9eeU6Fl7qWVvVJ432eW2xWt
	 EIFW9mCWKZqCRmLMuAWu4fxZ9YZy/FwdHG69/5PsV55IgcqTTgmynF6gL5J53MJq3oVUT
	 7xgLUhkPOHFYTUjYSiNFyj5X7zPgP1FyoNAFKe8YudZ7aF2gfbT9DNrS270P6qw3VWPT8
	 fk2UVfRbcHo1OWmvZ3xl67kfyUa0IuloFxLzshJnvQ7HhQh9UTAGJNg+yN1ZbqIKkVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110493;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GaS9DIAzMYp6Tb26jgRNliWQoK7YtOPDgti3i8/xKo0=;
	b=tMYQF/7B6KEOhByYuTh1b7El5O2gLP7xtfOOoQzE9547Y8y00C7cHIS7Pp/1H2Mf5bpZ
	 bKrwlicKTvl9vzqrdLu92kqUpz+aqpjL9Kwc3awe6EtygcTHuYXrk6uAZHbBB5sDdvfVD
	 0eEpJ9WyL+IE3iJsxgdDDEy8mzfn/DfVK7PHUI+/0dBYEsTG1GDgSdIh2+K4IepVrPIhW
	 kFPiY9+AbWMtEJRCQaNIZwqdKGmIThNqmuHxek4Jf0hR4ZiNW6mEe4zd4ke1Pw/a/+NAZ
	 EdtvwNfYlRFiCtk2Y9Efq4BPk7n8YmD5CbPM9y2I5TsSZb+lV8rxtMaZ8jOhz/JRg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VexdIKwR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35892606A31F
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VexdIKwR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61E51F01395
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110492;
	bh=GaS9DIAzMYp6Tb26jgRNliWQoK7YtOPDgti3i8/xKo0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VexdIKwRzOvQEEgvmO8caE4nbf6xorObDq11NXYDvDa2mjeHckRll+Nx4EKxJD8ht
	 W4KblFOO6y2af+SJ9nHUVFfDbKNeYcztIFgJWMAPsIy9N1QOvtFFKP0BwXuQ+Pz1Oq
	 PU638njjn8Fyn5tTjko7v2pOLaNRMNrq1KUOtcwLu54gCfmwSIJkMaA3Tt4mtBszUY
	 jK4rZKNgVSfkDM6vYqEpQDMMbEruHEMg4wX16UMopLSeUCvdYbUshewmZdxFr4vMsQ
	 k2dDIfevo2EjeDJmoMRMUFEBreWAsQ6h7m2er3IkNb2RpM4W6NQJkmSB+FLbqt353i
	 k7gwr/P6ceULQ==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4877837890fso2093301fac.2
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 07:14:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzV2hGBQ2Qd2cjcyk1e128LfB/RdGwbsKO32A8HvRRaDH76p7IB6BVVKqmhrcv1mfNbxh4=@lists.linux.dev
X-Gm-Message-State: AFq9FYImStYeCQXUD/Uqmaa1pHdySWKP2z5ujAVgxuw+tzYH5QQVEWzL
	+2vqsbxXMlYnQFhhXCGHuYwzBxpmn+pzDRlos6/lGaHuT9qLntsfWPtphDKuG+etbDv2UXb0Uwy
	ZDN6GTYR9z+ngJnDEV+rggLc481UbPjY=
X-Received: by 2002:a05:6870:2189:b0:4a7:5508:c526 with SMTP id
 586e51a60fabf-4a83f42f572mr6040267fac.21.1793110491448; Tue, 27 Oct 2026
 07:14:51 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:14:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmuXaoKDLyCsPzUBYohOxqjVGVndz0047vmhZFgvvo6A@mail.gmail.com>
X-Gm-Features: AclHuK9bjg1W8yVOv6xb18mY_G1euLOiDqjDsy95KUm0kaVExInNMT0MB46F2ok
Message-ID: <CAD++jLnmuXaoKDLyCsPzUBYohOxqjVGVndz0047vmhZFgvvo6A@mail.gmail.com>
Subject: Re: [PATCH 10/35] drm/pl111: use drm_panel_bridge_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 12:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> The connector type passed to drm_panel_bridge_add_typed() has been
> ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> every drm_panel"), the bridge always has the type of the panel.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
