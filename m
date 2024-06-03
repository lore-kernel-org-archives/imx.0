Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A431280039
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409570; cv=none; b=h9jTFHsikebAoAoKreHOyY81bFJtfxSFb2ldAFWxYVY2U9lrTiI1yiNrgiSesbFGdhDUmraF1VODsle11e6/cpMFLchxzcMknoC+7tLqHzYWvwTN2tJVXlRwrsbv5PGEzcL+/wtcgbcSvHoPq6/G1jI7jYS7Bgj8aJh6BddROlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409570; c=relaxed/simple;
	bh=mFbCETMq62xq9puR3Nzjw2I8uzI0rG4N1YtiK1zuiq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsIpljKOoqDaWOyIwb9eDbCXAdb9alnW40+zzT9GXu9NXqJFOdufehyFGrCUA6liGKYaoYyG30urdCuWdYI3hJSqTY3X+WaemryoPgXmTTkW6a7GhkcTisngkkAekxy+Wo8T/DD2t8I+gH1fWPkDGGLmG6zq+fMjZ0Cj9TG8+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SrLOsrm+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SrLOsrm+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b90038cf7so2466179e87.0
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717409567; x=1718014367; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BplKJjDXRXs7XXTpBdwnu/IkEVLGY0pP0flPQPkrbkQ=;
        b=SrLOsrm+b2rVY832iZFhrG1gO3NC/Rjde8uQiY3G0Zap5zwLVEYXLdQ9D4BWr4EUt3
         eyWkasQlf1cYkeA09BTytOpmm5WXJwLMqeGNmBFMNO0YjVGPiD04Zb02cm3vcDm3wxJb
         cJ+uAcOtrKC0WzhhuPJ2c1U5BSQUiP0jLvqhKmbtRVn3xI+i+8Z8wP6xq1/4J1JMC6zj
         MitV93+1DmaWOvogqoHOa55LhgvPgGToTxfL7a4DrE45u0pQnLlhB/j+/BEIkoNJfzxk
         f0H5OUK30Lej2/StsUTtfS0jaDvOLcqNbFWKJrfXxL4xUtYP3F9NDV7P5CtSdQb7q+jL
         ieBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717409567; x=1718014367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BplKJjDXRXs7XXTpBdwnu/IkEVLGY0pP0flPQPkrbkQ=;
        b=mlb9VGxNphgTnzO03LchNYr1yw896LjsPwAkR/Y5oepwyZUUDJLKPsBEaw5V7N/JBC
         SPiXiiY6pPMid45h91Md4JXiiieqjXfTSLvwJLIYWgVWSYpiEaOziaY8ySn+WqtgR9I6
         MhlhrqH7FIdX8b+9gdJwfkKY+D5LtMGUsoMN0sGrsu5JOBhSef5HVuFQMmqpWpF9I65T
         f8SCfuagq1NJZhK2w3KIiUeFGOOPkojEGG/X+CV4cEQEuHmvF84hbP267pAfIbRK8FGE
         pncv9R6TLi2v4KuaBWCHXHBzvGCScWOoBSVSFwm5on/l3TcxMl+/3sJLHGX7FhEsVzjX
         5PAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXopJf4HKVRSIHfG6M8kMPaI9xYlfu+PYHfagEiS1OqCrUWG0NMM0/MzIHeFzdmr/u4ZhunE6jAH1Cd11XTGOe/vnKu
X-Gm-Message-State: AOJu0YxhoU/Ne9x0E+F7jToy0gUjwEm+IwzKKOnDo2JOmkRxsHttvZgL
	GM4D0/vDe5VF+eqjPU9LTMsRHGxNY4cd9knydChWProQcPGd3tXZcADaLz+64T0=
X-Google-Smtp-Source: AGHT+IGuA0HoldCdeHkBfZZPB8luy0sGIPdxQUddKpghBgp2oPZCJBHLfXvHqZw7CVJaWvEsW958uw==
X-Received: by 2002:ac2:46f1:0:b0:52b:8255:71ce with SMTP id 2adb3069b0e04-52b896c15b0mr4571321e87.43.1717409566720;
        Mon, 03 Jun 2024 03:12:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d764c6sm1185135e87.123.2024.06.03.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:12:46 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:12:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chris Healy <cphealy@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <qcbh6pltjsetikped3ioihwmiow5ngstimgebplnl6ckqkkl63@z5xd64qbsbga>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
 <CAFXsbZo3miDMQ7SDktRP_DOzMy2JTFz4AsuMp78jLQGauTNsmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFXsbZo3miDMQ7SDktRP_DOzMy2JTFz4AsuMp78jLQGauTNsmA@mail.gmail.com>

On Sun, Jun 02, 2024 at 08:25:39PM -0700, Chris Healy wrote:
> On an i.MX53 QSB with HDMI daughter board, this patch series is:
> 
> Tested-by: Chris Healy <cphealy@gmail.com>

Thank you! I assume this is imx53-qsrb-hdmi ?

> 
> HDMI output still works correctly and the bridges file reflects the changes:
> 
> Before:
> 
> root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
> bridge[0]: 0xc0fa76d8
>         type: [0] Unknown
>         ops: [0x0]
> bridge[1]: 0xc0fba03c
>         type: [0] Unknown
>         OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
>         ops: [0x7] detect edid hpd
> 
> 
> After:
> 
> root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
> bridge[0]: 0xc0fa76d8
>         type: [0] Unknown
>         ops: [0x0]
> bridge[1]: 0xc0fb9f5c
>         type: [0] Unknown
>         OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
>         ops: [0x7] detect edid hpd
> bridge[2]: 0xc0fb9794
>         type: [11] HDMI-A
>         OF: /connector-hdmi:hdmi-connector
>         ops: [0x0]
> 
> On Sun, Jun 2, 2024 at 5:04 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The IPUv3 DRM i.MX driver contains several codepaths for different
> > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > panel and the legacy display-timings DT node on their own.
> >
> > Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> > upstream ever used these features), switch to panel-bridge driver,
> > removing the need to handle drm_panel codepaths separately and finally
> > switch to drm_bridge_connector, removing requirement for the downstream
> > bridges to create drm_connector on their own.
> >
> > This has been tested on the iMX53 with the DPI panel attached to LDB via
> > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > linked directly to LDB node and the display-timings node).
> >
> > To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
> >
> > [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.com/
> > [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org/
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Notice (soft) dependencies in the cover letter (Chris)
> > - Select DRM_BRIDGE instead of depending on it (Philipp)
> > - Dropped unused selection of DRM_PANEL (Philipp)
> > - Added missing include of <drm/bridge/imx.h> to parallel-display.c
> >   (Philipp)
> > - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org
> >
> > Changes in v2:
> > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org
> >
> > ---
> > Dmitry Baryshkov (12):
> >       dt-bindings: display: fsl-imx-drm: drop edid property support
> >       dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
> >       drm/imx: cleanup the imx-drm header
> >       drm/imx: parallel-display: drop edid override support
> >       drm/imx: ldb: drop custom EDID support
> >       drm/imx: ldb: drop custom DDC bus support
> >       drm/imx: ldb: switch to drm_panel_bridge
> >       drm/imx: parallel-display: switch to drm_panel_bridge
> >       drm/imx: add internal bridge handling display-timings DT node
> >       drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
> >       drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector
> >       drm/imx: move imx_drm_connector_destroy to imx-tve
> >
> >  .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
> >  .../devicetree/bindings/display/imx/ldb.txt        |   1 -
> >  drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
> >  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
> >  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  85 +++++++++
> >  drivers/gpu/drm/imx/ipuv3/Kconfig                  |  10 +-
> >  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
> >  drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 --
> >  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++++----------------
> >  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
> >  drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 +++-----------
> >  include/drm/bridge/imx.h                           |  13 ++
> >  12 files changed, 187 insertions(+), 306 deletions(-)
> > ---
> > base-commit: 850ca533e572247b6f71dafcbf7feb0359350963
> > change-id: 20240310-drm-imx-cleanup-10746a9b71f5
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >

-- 
With best wishes
Dmitry
