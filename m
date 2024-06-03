Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6833B18E3F
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 03:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717385155; cv=none; b=Je/NYADwlfOwEVkOYJ4fwkDd7hx5vtp5piFrDvl13Hrpv0PjUGjk1iq7kqWxQohOn/jOlbKq1wMGXxzqerHbgg2qDuWw5diLYXSFl4IuHL5v/9gJou26GVk2a6NCF1K/URgM/cjVHUuwDE2dxKn9c6M5AsBWKA+2D/hvpIZt2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717385155; c=relaxed/simple;
	bh=7psbjz/050e5GpHnO0rvAexu3PAbhO3mMI4PEs9xD70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjalNGH0uPsuGhlGlFxPh/t0Ipaw8RTSug7BSZMlONu1IZ1IIchjaoAno+mSRWjJJLlHQoKzIygDyRz0AKaliUthVZmGn2Dl2Fq28y9BONy6kVQf+Sa9vfJUXSyTutE6SVe8H2Y/m1OGwhPm9e6qTnqQfNOsP0wdDIL9GckAC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl/kxaei; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl/kxaei"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso4025887f8f.1
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 20:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717385152; x=1717989952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+v70MlxPx26RmqrAm4uPG5jCKQlv/XwKZGoTtit7GE=;
        b=Hl/kxaeioyW2sPeRUwllet7Ch1uLk51D/HbemPS0cICzSYTzbO+5/cN0xn5PCbmHO3
         jX2YahIxg7vyXd16iBf/+Gj83d1I8ZAqlIrxRi/pWUxsOrHAZ+y7VimP4NKSHPJ3KRI5
         aCxNOGo4O1JyNFoRvvAzNu2K/ur+Nr3IhknPYB7DW5psfwkdnqtKjXjxUswf67b+vhJT
         DzQA8rSerXRTH5wT7dzAVDaP3ZkyWG2jkjRxb9LdIf+45sSJCCF32oqgOWL8Y58rQAnC
         aQHTcHuS3y9Qtvh55ijgfaCZLF8h/06ntQJM0hGwodLwoNuxT9RZCHbcWgoV4Rschkba
         MKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717385152; x=1717989952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+v70MlxPx26RmqrAm4uPG5jCKQlv/XwKZGoTtit7GE=;
        b=WN3aVPMqMiaqTSmR/Vj1++kmQtAqJRJG5bJb96+yneGhEd9kb7zOHmXA7ixdR5ZVfH
         /oiy1Ul6ZCx/tnbdHgKTDP02c+fEf5zYZ4IDn2bIpBwBlaBO/Mt7kgXPl6j4QG2N2UbF
         1O2wJuKqQ9KeXequFt7fOYtPjfUVRUh+9JE2pAiK6hlmyw/HRKI3KdTXwo5/DKJ6dBsy
         MX1vTKpfMkyvcE+SS+DoKH/mKonYozJ8RDlNLjNTGteSc8U7ukZu7wZX1zPOWYfN8mfm
         100S326eq1M8e7DQ25HqIEG+1ywgAsWfw5528+lf6vGPswISQM1aTFcYctw969ZsBtbk
         nyTg==
X-Forwarded-Encrypted: i=1; AJvYcCUL8ki4UK0pH3fHmxfmBR3ZjqB0Cd9fY9nMvG6zw7XERcTpsS/ozCxDIioglpccluUETu5a0ElZZ3i4KJN4SGyHcEM3
X-Gm-Message-State: AOJu0YzUjCuSpme24gngTB5z+toMz28eQUr8wcuIens9WhwO4Emp7qN5
	Po94blQWWok7HHsqXQf0FUXxKYBvvCAsQmoaFiTmC0+eACJU5iR0UZdrI/v3k0fGumU5iF4CKEB
	hOnPVcwcqn0UuBkNQyL8OhxTSMPA=
X-Google-Smtp-Source: AGHT+IEZOMMK26fX+knYHoHceWWilwaB/46tXNfYgD7aKzJmhSx5uf/igZymrM/R6chuBlOLL1Du475O+oQnjqyHyYM=
X-Received: by 2002:adf:eb11:0:b0:35e:f0e:1ba0 with SMTP id
 ffacd0b85a97d-35e0f268722mr6796950f8f.19.1717385151461; Sun, 02 Jun 2024
 20:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 2 Jun 2024 20:25:39 -0700
Message-ID: <CAFXsbZo3miDMQ7SDktRP_DOzMy2JTFz4AsuMp78jLQGauTNsmA@mail.gmail.com>
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

On an i.MX53 QSB with HDMI daughter board, this patch series is:

Tested-by: Chris Healy <cphealy@gmail.com>

HDMI output still works correctly and the bridges file reflects the changes=
:

Before:

root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
bridge[0]: 0xc0fa76d8
        type: [0] Unknown
        ops: [0x0]
bridge[1]: 0xc0fba03c
        type: [0] Unknown
        OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
        ops: [0x7] detect edid hpd


After:

root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
bridge[0]: 0xc0fa76d8
        type: [0] Unknown
        ops: [0x0]
bridge[1]: 0xc0fb9f5c
        type: [0] Unknown
        OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
        ops: [0x7] detect edid hpd
bridge[2]: 0xc0fb9794
        type: [11] HDMI-A
        OF: /connector-hdmi:hdmi-connector
        ops: [0x0]

On Sun, Jun 2, 2024 at 5:04=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The IPUv3 DRM i.MX driver contains several codepaths for different
> usescases: both LDB and paralllel-display drivers handle next-bridge,
> panel and the legacy display-timings DT node on their own.
>
> Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> upstream ever used these features), switch to panel-bridge driver,
> removing the need to handle drm_panel codepaths separately and finally
> switch to drm_bridge_connector, removing requirement for the downstream
> bridges to create drm_connector on their own.
>
> This has been tested on the iMX53 with the DPI panel attached to LDB via
> LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> linked directly to LDB node and the display-timings node).
>
> To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
>
> [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.co=
m/
> [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a6c=
382b422@linaro.org/
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Notice (soft) dependencies in the cover letter (Chris)
> - Select DRM_BRIDGE instead of depending on it (Philipp)
> - Dropped unused selection of DRM_PANEL (Philipp)
> - Added missing include of <drm/bridge/imx.h> to parallel-display.c
>   (Philipp)
> - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d81=
c1d1c1026@linaro.org
>
> Changes in v2:
> - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> - Moved the legacy bridge to drivers/gpu/drm/bridge
> - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e10=
4f05caa51@linaro.org
>
> ---
> Dmitry Baryshkov (12):
>       dt-bindings: display: fsl-imx-drm: drop edid property support
>       dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
>       drm/imx: cleanup the imx-drm header
>       drm/imx: parallel-display: drop edid override support
>       drm/imx: ldb: drop custom EDID support
>       drm/imx: ldb: drop custom DDC bus support
>       drm/imx: ldb: switch to drm_panel_bridge
>       drm/imx: parallel-display: switch to drm_panel_bridge
>       drm/imx: add internal bridge handling display-timings DT node
>       drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
>       drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge=
_connector
>       drm/imx: move imx_drm_connector_destroy to imx-tve
>
>  .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
>  .../devicetree/bindings/display/imx/ldb.txt        |   1 -
>  drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
>  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  85 +++++++++
>  drivers/gpu/drm/imx/ipuv3/Kconfig                  |  10 +-
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
>  drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 --
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++++----------=
------
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 +++-----------
>  include/drm/bridge/imx.h                           |  13 ++
>  12 files changed, 187 insertions(+), 306 deletions(-)
> ---
> base-commit: 850ca533e572247b6f71dafcbf7feb0359350963
> change-id: 20240310-drm-imx-cleanup-10746a9b71f5
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
