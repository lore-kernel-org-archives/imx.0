Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110455;
	b=vfY9Wm3fVXJNXG1o29JgOW+B1FOjTf8Rjwha0mIqqz1GivQtS8nEs3O85GQoE/dtUb1U
	 MUtDoHcy5Ueha5dTM/qhUq8ORMrgynHyRJ5gYXHs4WrsvSqNCz0OVO19Qn41R1iUz+tV4
	 iVfVKigg3SCnoHhrBbLmZM8MP0/2HsVVdlQp3b3fRNqCsZZRqZbxAasaoOw5uig6EIGhn
	 qnGI+S+mqlfavs2I8h/XvTwlnkAG3GWJU3ryoGSDLW4P2vECt+qr0xlpjKEiHFmrIdlyj
	 fkafDltEGC0yGdw6xwzUyH+aQF/VntwJlRS9ppFbbi/6MPGutIaSrk30l4A/fXSwJ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110455;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ULtd9LbkaeiBjJrJ74ty1dyVfksSuVPpssfCtnxbGQs=;
	b=jMvwnSEuyDzEtoXY0C63XAoazvXs/1KQ2tYNav9GlQHuyFYSrd0tUxHrTEJyw/do8s1C
	 YbRtLaZJ8wTTDMarHxkaE3eCIgKSOMTt/1LtvMLjIwZritFt7DHi+gKr0KlCF1m1NsC/j
	 oPWndJUUsKy3Vst0uwWcUGcDMlbVDeDEe9USFfBwcVCZy/kgEH87f5d+WPusUKJ0PwIxe
	 LLVmSM/HkrAFuW6L+SGPpVc+lMWvvz1roNrwOiGc3UqKMVsb6WlqRTdBbo0ytspXzJGV+
	 zagKNTSMa9d/V/scMvwymJxHKueTjf0S1XWQGTXPxCvvmoRy5hjiUqUdthYM6k0IZJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOHXFD9i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7398606A327
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOHXFD9i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07621F031EC
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110454;
	bh=ULtd9LbkaeiBjJrJ74ty1dyVfksSuVPpssfCtnxbGQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nOHXFD9io0Ru2PaYz+V6smtGs0WntNANVygH/FG21ay5l6eXVd/Fv0/Tv/05f5lHN
	 ro4iu7gr3151Nom7znD+w9DtyJZyWfUd1ugqFnU4sroYLuBrr059kaYzOqg3LHyBNE
	 Nq5slenfftrhf+jQMKg2z4tHzFnbsIy48BStIJ4xgz9ShxnCKOCF83cSRLUB1U0tDm
	 g3peUTLWKcVDShNXN+mUP1xR1HMK/LuErofPe2xUAZAdWO0fFLSPuWwNBeF/MoBv5J
	 AbW/DgyYr644yxz8kE3Ve5Rjs1Wa91W5XlLBIEfFPMWntO1C6QOqcmg7216oQhQAET
	 L21vjkzNFgP8A==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48e94879f02so1305213fac.0
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 07:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4hKEAhR1vIj4X+ms11pInkECImD6TvuLYfYW03ssksUm5MqQ8z2u0FwFsCSByCDFQZVE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIT0WyGDg7HFwNPh5VGLyWmMweTqNhmzH8PHwYuBFSBKHnPatDN
	QHF/59ZGrbxuWlLY/8DzfMUKT+DSmA0Qlg1ttLmeWBOjofG+iw0CpcmdHRMcEvKIn+msEUTEY/t
	LUp7+BkDoeyVoU+JKonmKThcE1yWMV/w=
X-Received: by 2002:a05:6870:c69e:b0:49d:c8ab:967b with SMTP id
 586e51a60fabf-4a83f542697mr5910295fac.47.1793110453054; Tue, 27 Oct 2026
 07:14:13 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:13:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=2zsU8xOQWURD7HFOiCYwCNwW9ece1=PoVci2qNM8Ykw@mail.gmail.com>
X-Gm-Features: AclHuK8ruqZCGkf4O-7fY-Pys0rgaueWTZBuD-NGSUOyqWUpd7La4hdhioD434w
Message-ID: <CAD++jL=2zsU8xOQWURD7HFOiCYwCNwW9ece1=PoVci2qNM8Ykw@mail.gmail.com>
Subject: Re: [PATCH 09/35] drm/mcde: use drm_panel_bridge_add()
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

Thanks for driving this patch series Dmitry!

Yours,
Linus Walleij
