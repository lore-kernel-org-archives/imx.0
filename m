Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189012E1ED
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425322; cv=none; b=V4ZPjRr6tS/CmkxY4AmzyWKhCfzSueAkEAkB1ySH4cm/644Z1baET2S6Q++/RK8Gl3QbWqzZ5MKi1ghkR/uFUMSiraC+UFa5JxA3QBwpITAekoNDRnNdqYUNX9iGvW7Xu4Adq+3VULcoLWTFgL7+ao1OrcPX21dhGn6kzaJ3x/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425322; c=relaxed/simple;
	bh=wMDWT/3j7lMlyJ0jn02Ql17O5sSjhWZh3eqo6ItihpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD7Sy36SG+8YI+WUM37fefyl16DBebXEALYanrdkn00nTtpvmu9GvDYOMo3tHKsC8NU/ve53h0jjh6OpdZ6lzYky5kPv01GBHYj2gPAjVaSArBNDDGR+RGLW1gwhdZ+MnltZn8UBxORJlGSDXmccX1O/ULfmM/0CRc6Aw0uz3DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFDJUaIC; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFDJUaIC"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57a342201ebso3422132a12.0
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717425318; x=1718030118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjiZy0A+IiOg0NID/3j9joaAnDhVLRbkPfAL2w/lRx8=;
        b=nFDJUaICuupsoG9W+xCljZy3vkbDsZASy2P/qkKqwig5gINy7Qgtw7J7Q2JKt68GuG
         JSRAzGisHONWRDec3kB7q11snN3FHlNGvcfZ4tEPbywHWonT9i/3izIIPs74ZTMhDD8m
         EQdSmu+daT3lWgoHx9t9gTP7E3LGIJ2tCpVjFYfSBbvj+9zc7E0f0SFA79i60ypw+NZ1
         dFYb3irBjAMua/gO4EdERClfk2xygao25PcrNy48vnMwU4Bnxau+fFD3ErDJRO0nFqo4
         BX3G4haWMtPeG7Ncv+UnBkl8uq553wxvWGs4+Xv299C0edy+adClevpQxY0d1RjidDKh
         Qvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717425318; x=1718030118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjiZy0A+IiOg0NID/3j9joaAnDhVLRbkPfAL2w/lRx8=;
        b=ooSyyfOysIooPEmThmeZeB+9+b8/YAJiTvXL62tPaxbNFa4HSq+ZAj6O30iQVs0lQv
         2yir0adVTJP3GaF1Yt/HXZ3Am1nIROzajGYkSuRFpNS1XXcMmOFYpIJflLSrzlKkdf5T
         lH4kThNSKlFutnf9/G0FympKOGP8i1HbKMT0aXJcuOUq1Tx0Y+1lJBnhiRkEAU503mbb
         fT4ABYDcsxXsAd55tX93p0nJevEe/tp4YkUfPHto5ANwo5YTIfNOBWA0z3DLPIy2g5SC
         YVWXmbTZaqYRIYtFSwdeHpWEcnlkfEFPI171ym1alvsPfbwCCttj190E0tWHmsLQY6lu
         x2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM2i39s6ufzzrHLowObNGwUb3MLwOgCX9/8SMk78BuzOa4o/EcDudzAwwKErkw/b9GXmgZ5nK0nUmr5ABy64x2XFfF
X-Gm-Message-State: AOJu0Yw9Ct9BeHCvY8o/SmHClV+VY0DbH0gBuy2WErwZMt/L4EDKI9pG
	ulAbWLvQLKajcJa8qnr1EeMYXtvKoDDy+dfweHoJdwiaOAJsg8QHK/1dFs+t68Qg90MiE5ktmg2
	kOuYVrJI2mu2p85fya/WpRtOBB/4=
X-Google-Smtp-Source: AGHT+IEIGX63vWeSUePEEOMqz83AeDn2dYDIwBDPg554yoYAyS7l6TvEu4gk8wRL60IRlOIma/nsoc48LqIb6U3NYYU=
X-Received: by 2002:a17:906:7c8d:b0:a61:4224:c998 with SMTP id
 a640c23a62f3a-a6821d64674mr683493366b.54.1717425317733; Mon, 03 Jun 2024
 07:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
 <CAFXsbZo3miDMQ7SDktRP_DOzMy2JTFz4AsuMp78jLQGauTNsmA@mail.gmail.com> <qcbh6pltjsetikped3ioihwmiow5ngstimgebplnl6ckqkkl63@z5xd64qbsbga>
In-Reply-To: <qcbh6pltjsetikped3ioihwmiow5ngstimgebplnl6ckqkkl63@z5xd64qbsbga>
From: Chris Healy <cphealy@gmail.com>
Date: Mon, 3 Jun 2024 07:35:05 -0700
Message-ID: <CAFXsbZqdna4S6t7UgRDacSb3WcC_21KDkh5pDyD4LCHgYsPang@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 3:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, Jun 02, 2024 at 08:25:39PM -0700, Chris Healy wrote:
> > On an i.MX53 QSB with HDMI daughter board, this patch series is:
> >
> > Tested-by: Chris Healy <cphealy@gmail.com>
>
> Thank you! I assume this is imx53-qsrb-hdmi ?

Yes
>
> >
> > HDMI output still works correctly and the bridges file reflects the cha=
nges:
> >
> > Before:
> >
> > root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
> > bridge[0]: 0xc0fa76d8
> >         type: [0] Unknown
> >         ops: [0x0]
> > bridge[1]: 0xc0fba03c
> >         type: [0] Unknown
> >         OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
> >         ops: [0x7] detect edid hpd
> >
> >
> > After:
> >
> > root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
> > bridge[0]: 0xc0fa76d8
> >         type: [0] Unknown
> >         ops: [0x0]
> > bridge[1]: 0xc0fb9f5c
> >         type: [0] Unknown
> >         OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
> >         ops: [0x7] detect edid hpd
> > bridge[2]: 0xc0fb9794
> >         type: [11] HDMI-A
> >         OF: /connector-hdmi:hdmi-connector
> >         ops: [0x0]
> >
> > On Sun, Jun 2, 2024 at 5:04=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The IPUv3 DRM i.MX driver contains several codepaths for different
> > > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > > panel and the legacy display-timings DT node on their own.
> > >
> > > Drop unused ddc-i2c-bus and edid handling (none of the DT files merge=
d
> > > upstream ever used these features), switch to panel-bridge driver,
> > > removing the need to handle drm_panel codepaths separately and finall=
y
> > > switch to drm_bridge_connector, removing requirement for the downstre=
am
> > > bridges to create drm_connector on their own.
> > >
> > > This has been tested on the iMX53 with the DPI panel attached to LDB =
via
> > > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > > linked directly to LDB node and the display-timings node).
> > >
> > > To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2=
]
> > >
> > > [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nx=
p.com/
> > > [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-7=
1a6c382b422@linaro.org/
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v3:
> > > - Notice (soft) dependencies in the cover letter (Chris)
> > > - Select DRM_BRIDGE instead of depending on it (Philipp)
> > > - Dropped unused selection of DRM_PANEL (Philipp)
> > > - Added missing include of <drm/bridge/imx.h> to parallel-display.c
> > >   (Philipp)
> > > - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0=
-d81c1d1c1026@linaro.org
> > >
> > > Changes in v2:
> > > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0=
-e104f05caa51@linaro.org
> > >
> > > ---
> > > Dmitry Baryshkov (12):
> > >       dt-bindings: display: fsl-imx-drm: drop edid property support
> > >       dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
> > >       drm/imx: cleanup the imx-drm header
> > >       drm/imx: parallel-display: drop edid override support
> > >       drm/imx: ldb: drop custom EDID support
> > >       drm/imx: ldb: drop custom DDC bus support
> > >       drm/imx: ldb: switch to drm_panel_bridge
> > >       drm/imx: parallel-display: switch to drm_panel_bridge
> > >       drm/imx: add internal bridge handling display-timings DT node
> > >       drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connecto=
r
> > >       drm/imx: parallel-display: switch to imx_legacy_bridge / drm_br=
idge_connector
> > >       drm/imx: move imx_drm_connector_destroy to imx-tve
> > >
> > >  .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
> > >  .../devicetree/bindings/display/imx/ldb.txt        |   1 -
> > >  drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
> > >  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
> > >  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  85 +++++++++
> > >  drivers/gpu/drm/imx/ipuv3/Kconfig                  |  10 +-
> > >  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
> > >  drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 --
> > >  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++++------=
----------
> > >  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
> > >  drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 +++--------=
---
> > >  include/drm/bridge/imx.h                           |  13 ++
> > >  12 files changed, 187 insertions(+), 306 deletions(-)
> > > ---
> > > base-commit: 850ca533e572247b6f71dafcbf7feb0359350963
> > > change-id: 20240310-drm-imx-cleanup-10746a9b71f5
> > >
> > > Best regards,
> > > --
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
>
> --
> With best wishes
> Dmitry
