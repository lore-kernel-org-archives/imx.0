Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8A1D3648
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110830; cv=none; b=gmES2SpzhKhOf9EJt24LooFh+6Prm8vyuopzHgNwCGDCjMlj85TXzZgnlQrwM/C1pXE+V1GqOYlrn/+KbXbJXAeUAaj8VN8kE35DjGgMqQaI84tTOfRMBqCTXYcgOvDzXcB4lkiHMK3a/r5t38M2ayP5bANYg8n+f3TD2zp4rlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110830; c=relaxed/simple;
	bh=+AkYyoEAKkcOYov4gBkoQW10ALBeuyvqIJK5nNUYO8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mB5SigKYwLikJ9mZOHdP7psw1+E02vPCAovm+FGoWhCWfJsWN9NOOqGdow93QZied8hDCqirzNsfQoFGvIKFPGVR8nLBsK/s1/+ol9WJcb7U/r5CVbg8wP+hsNpzMTt30tJwIYnWdcz7qXjX2xOgC9sO90lxM0zzoa3Em0eWbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wupTvVoj; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wupTvVoj"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e35bf59cf6so48486727b3.0
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730110826; x=1730715626; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=;
        b=wupTvVojep7AL5TRVaJxG1kV+6MHMHdlMYklxyx1e9xqRVTxDIew4uD0EYp8IjNxhC
         kC88XbFPTr1MkX/AAbIrB6t6AqLNMhIFmt2TpUkVfSH8X/hxIA+xXgFZDl7pq5LSyM+r
         vr+YMAXUpidpl24hZ92U1nYoczC1pyTjaW5bI8nrgoNN0FS3z0b+ULzAXNNP3Gs9SVPC
         YAND0AH+kKAcd2ldz8M1KudHhGzoX6G3JD7rWSei1CZPXjRK/9x8JncZje0rHxb8w6GN
         RCZ0SI87QBwU8dIejp7h6kupT7PkEYOwFIOwYpqXGS/DAmCu8AHZPZ4mH67OuzJqaF8M
         02bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110826; x=1730715626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=;
        b=JoquvbdagPfsLsrpfXJj2wBC+amOjesl/wFd6nHG+PhM2CVQltLz99PVy+/Gvwlbdw
         uEen8RLd3zQ/qovH78NegZo1sx71+w4vOvEyrTk3UKOQsqoaXSx7gRvvoEvzSv0a8A4X
         jWzP5S84XllCojVeaQre79+BXOOhI90w1sFAiKV69d9P4Wb6fvZSSEnVR0pzsfd1ZKPf
         82ISaOFZNaglIpYNn7JtiQa4kvzl5Qwz3XNjSSguWzxjZR+GKIJHuWujIAJGANgxt7AO
         6oWvm9K9kVxH8uWFuxU7yH2GMVdBcL32Uwc6LjciGQZdQCIL1mvtsU4x/fmjaFenWjHJ
         bF4w==
X-Forwarded-Encrypted: i=1; AJvYcCWkQpGlCvhqTyY5qbtPm/HaKL1BV4nOLoPNSV886OGUk4Dr85RRWMQ0wjMJbsJQZtsX7zg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQR57fIg5sImepHhuPPaTX19awhaMYDY/C0axqWKA44H599lLr
	+Z7ykBQ3sPK8q7hU1CxwKGAyq8u1O80nwnR8xNPLW2F2//mH1u0mRNsijctV2XJEpaa6VL9wY3M
	flX3OOic8OgN4/OwCAR8Qp7SENLngNwSN2Simiw==
X-Google-Smtp-Source: AGHT+IHKdCACUXqx7Rdwg/Prh7fz9WsgaRfTmIR4UCFC4hi7xMX8hmTZVx47XtOQhuApr5txecXLMxKkQJeYoI3DfdM=
X-Received: by 2002:a05:690c:6303:b0:6e3:c92c:1d57 with SMTP id
 00721157ae682-6e842f91cf4mr107258157b3.2.1730110826498; Mon, 28 Oct 2024
 03:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com>
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 12:19:50 +0200
Message-ID: <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, 
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
>
> Hi,
>
> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> function.  IT6263 product link can be found at [1].
>
> Patch 1 is a preparation patch to allow display mode of an existing
> panel to pass the added mode validation logic in patch 3.
>
> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> the next non-panel bridge, that is the IT6263 in this case.
>
> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver against
> "ldb" clock so that it can filter out unsupported display modes read
> from EDID.
>
> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as they
> are supported by IT6263(with LVDS data bit reversed order).
>
> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
>
> Patch 6 supports getting dual-link LVDS pixel order for the sink side as
> needed by IT6263 driver.
>
> Patch 7 documents jeida-30 and vesa-30 data mappings in lvds-data-mapping.yaml,
> as needed by IT6263 DT binding.
>
> Patch 8 extracts common dual-link LVDS display properties into new
> lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
>
> Patch 9 adds DT binding for IT6263.
>
> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
>
> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with IT6263
> populated.
>
> Patch 12 enables the IT6263 bridge driver in defconfig.
>
> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.

This has pretty complicated structure from the merging point of view.

I propose we take patches 6, 8, 9 (without 30-bit formats, they can be
dropped while applying), 11, 12 (?) and 13 through drm-misc in one
batch (once DT maintainers review the binding parts). This looks like
a minimal set, having no extra dependencies.

The second set might be 4, 5 + new patch, re-adding 30-bit formats to
IT6263 binding (no driver changes are necessary). This can go in
separately, after an Ack from media maintainers.

Of course both sets can go together if linux-media maintainers reacts
quickly and ack merging media-formats patch through drm-misc tree.

The rest of the patches don't have such strong dependencies and go in
once ready / reviewed.

WDYT?

-- 
With best wishes
Dmitry
