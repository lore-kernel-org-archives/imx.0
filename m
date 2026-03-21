Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421154317D
	for <imx@lists.linux.dev>; Sat, 21 Mar 2026 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774114043; cv=none; b=lQLfOrV2YmNvztGYlp2K5G19iwMz9hBvfKFvto4z94HA3GsElbTuQzmVTN811JyAe1cJkWxbYzyj3PVyQPs7ENwpgNlGtwtTKW+xHjK/7S/V4nne3/PsWNkCZK7HP838Dt0NhGokHaO5Ukvse/OfnulJx0snQaRGyQrNDKN6Bm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774114043; c=relaxed/simple;
	bh=7lbuSXy266xvscn6Azstf5i7N7zEFerSJLOUbFcN/qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTfF4PhcO0C6v8lWPSD4ySJox5hM+9QuPIsd50sEjqAsUvYi6S6VO7oJ11o1qhS/SFsvTzI9YgxPegCrCUFlKZHvNbufg5tYfMw+mW32XMjGXr+65j0wjUEVe4uvoj5eQvYMedtWMOZroGV4CcCms/mGlYU8ZXL5h7wD4Y65Mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=26CFBfxA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="26CFBfxA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ab232cc803so6536105ad.3
        for <imx@lists.linux.dev>; Sat, 21 Mar 2026 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1774114041; x=1774718841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=26CFBfxATEZn38x9tkrz2cnNVLlIFR9i3pTux+Kt7ZFzsH0l9vx5/5ElkbY48l7irl
         HOh5nZsHeS2mbAaTfu/sytdlGSuBy22DqpymQhyrWWeP9q3e8KGzHeqYEjDvFOF1Jtxr
         IWp4GyoxJlJB3zJJQZML8cXQpNAIAcRlGxC5YFdNE7UyE9NB3mvNvRGhfpv7sig7Yba8
         iDiOl1Xp4OP0/XeT0/n/VHRIXa1WFxXa1UElKPF4Z5e01hniN/F7/QE2P0KHSjb7U+0C
         7DADK6sIk7DOtSjNzAGDcrWMRi6FTbYcjjCrR7Nxu9oCLNIVLTsMZZeFnuApyr76/fFe
         Yatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774114041; x=1774718841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=BF74RD8/TZsbXKxizWK2EJN9Er+SUx5tSe78acqlYa8Sen+yTfoC+sGH8XZQvxpt0f
         zjwccIlzxfKZEAkoRGtXapu5SpIc7NWEqo85k/6Iz2Jd0zSoQxJxxxVZ9rTJ8B5uYmtc
         QK8MU8Qdkipoq+f7md5K1GpnJIVCCq/VuhmIjEoubY/KDsEf1CXWx1FMgCawG/gPl8kd
         hgGldaafhpA68tuo2mxfigWYvtSKG5NflMZLQ/tswAJe5/gUMq1s5Rw7Nr6j17xMkQaj
         /+qojTbKEP1qhHlJglUTjn+oj/40nUP/gA7AwoYGDyVD3dgv9qwwoELFPrrWgIq87syt
         XEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW82CVNVsqjlVEmtvZyNGJVTcd9EezP0qmN44ZLv+STPE0fPMZP2b1TEwellxDAri5D9yY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUHhp/qrSzQWKPUSOhdv3cxCYOrEl8ous0Gwx1YkH9trcfjBkF
	MDoU/dgeABPXgbKDYiLRCC2rjpDCBu+1lBVSu+3ZNsoh68N3xqMubA0Qg7tKODLAkkCVqa+xuzd
	BInp3jdbiohCBYVM=
X-Gm-Gg: ATEYQzwb46UGlSx3mLyYIt7ni7QxIUBEYXJYwN8S8JUommiUbfhWgNxZQQ++enwGP+m
	rqC0cj56LpPtBJ1zNxBACer4YW72O4rgv6fUSwGHlxrQ+2qyhIje0eRadXQ7ybwAzN9It0kYWCz
	w485I0qo1p7/8qato5MNxkg0vj5xonwPlaulkwEZiwMsTpwMov9TFLaoQVPxJmCdkryCWhE3DgN
	AQqSJSfub4aSyZ6pFIJr1GniRLIi5xpSP+YIpJ1ptpmGOnLT5FkM20A2/SlZL6MX/9KqzO9JWT3
	pDmx5muO1RGKZhW7LzmdIFFqhiiP9CqLkip9AqwPEHcCgGQ8B6AfWncX1ARl/q481e5SL9Vqn/e
	sFtfrKK5KsjJqftg3nWMkSAvFm7ERGm6rKmA5bmd8vuIfdmeuydrjFNHlgFptcOBltslnLY1ij+
	HceshiM6icXlPKNlGYA/egDTcqw3iHJ2f48F0360Sptg42qujsSrsLCWS33L3F
X-Received: by 2002:a17:903:191:b0:2b0:60b2:4f8 with SMTP id d9443c01a7336-2b0827219a0mr70281855ad.15.1774114041335;
        Sat, 21 Mar 2026 10:27:21 -0700 (PDT)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368eb9asm74682915ad.69.2026.03.21.10.27.20
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 10:27:21 -0700 (PDT)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1271195d2a7so3287901c88.0
        for <imx@lists.linux.dev>; Sat, 21 Mar 2026 10:27:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXib7oknNF+9DvnFt2oqkXTO/axhn3zvpQ4K80/6BESXRSvMPKoFScAFOmmPDMhDEg1/YU=@lists.linux.dev
X-Received: by 2002:a05:6214:2503:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89c85a4415dmr120844646d6.31.1774113557567; Sat, 21 Mar 2026
 10:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 21 Mar 2026 18:19:06 +0100
X-Gmail-Original-Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
X-Gm-Features: AaiRm51EiMaDZyOBoTxsmzhD9LKdQqqk1TUMHYTLZEpIizj3O9FXdJaoYzmTmY0
Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
	Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ioana,

Looks like the userspace portion of the driver is closed source
(libNeutronDriver.so)?

https://github.com/nxp-imx/tflite-neutron-delegate/blob/lf-6.12.49_2.2.0/CM=
akeLists.txt

Regards,

Tomeu

On Fri, Mar 6, 2026 at 2:27=E2=80=AFPM Ioana Ciocoi-Radulescu
<ruxandra.radulescu@nxp.com> wrote:
>
> Introduce a new accel driver for the Neutron Neural Processing Unit
> (NPU), along with associated dt-bindings and DTS node.
>
> The first patch extends the GEM DMA helper APIs to allow bidirectional
> mapping of non-coherent DMA buffers. While not part of the Neutron
> driver, it's a prerequisite allowing us to use the GEM DMA helper.
>
> Neutron is a Neural Processing Unit from NXP, providing machine
> learning (ML) acceleration for edge AI applications. Neutron is
> integrated on NXP SoCs such as the i.MX95.
>
> The NPU consists of the following:
> - RISC-V core running a proprietary firmware
> - One or more Neutron cores, representing the main computation
>   engine performing ML operations
> - Dedicated fast memory (TCM)
> - DMA engine that handles data transfers between DDR and TCM
>
> The firmware is closed source and distributed as a binary here [1].
>
> The Neutron software stack also contains a userspace library [1] and
> a LiteRT custom delegate [2] that allow integration with standard
> LiteRT tools.
>
> [1] https://github.com/nxp-upstream/neutron/tree/upstream
> [2] https://github.com/nxp-imx/tflite-neutron-delegate
>
> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
> Changes in v2:
> - rebase on newer drm-misc-next
> - dt bindings: clock fixes and renames
> - update DTS to match new names
> - remove unnecessary fields from neutron_job structure
> - fix use of uninitialized variable
>
> - Link to v1: https://lore.kernel.org/r/20260226-neutron-v1-0-46eccb3bb50=
a@nxp.com
>
> ---
> Ioana Ciocoi-Radulescu (9):
>       drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM=
 DMA buffers
>       accel/neutron: Add documentation for NXP Neutron accelerator driver
>       dt-bindings: npu: Add NXP Neutron
>       accel/neutron: Add driver for NXP Neutron NPU
>       accel/neutron: Add GEM buffer object support
>       accel/neutron: Add mailbox support
>       accel/neutron: Add job submission IOCTL
>       accel/neutron: Add logging support
>       arm64: dts: imx95: Add Neutron node
>
>  Documentation/accel/index.rst                      |   1 +
>  Documentation/accel/neutron/index.rst              |  12 +
>  Documentation/accel/neutron/neutron.rst            | 131 ++++++++
>  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  96 ++++++
>  MAINTAINERS                                        |  10 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   3 +-
>  drivers/accel/neutron/Kconfig                      |  16 +
>  drivers/accel/neutron/Makefile                     |  12 +
>  drivers/accel/neutron/neutron_debugfs.c            |  34 ++
>  drivers/accel/neutron/neutron_debugfs.h            |  15 +
>  drivers/accel/neutron/neutron_device.c             | 239 +++++++++++++
>  drivers/accel/neutron/neutron_device.h             | 155 +++++++++
>  drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
>  drivers/accel/neutron/neutron_driver.h             |  16 +
>  drivers/accel/neutron/neutron_gem.c                | 116 +++++++
>  drivers/accel/neutron/neutron_gem.h                |  14 +
>  drivers/accel/neutron/neutron_job.c                | 372 +++++++++++++++=
++++++
>  drivers/accel/neutron/neutron_job.h                |  43 +++
>  drivers/accel/neutron/neutron_mailbox.c            |  47 +++
>  drivers/accel/neutron/neutron_mailbox.h            |  42 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
>  include/drm/drm_gem_dma_helper.h                   |   3 +
>  include/uapi/drm/neutron_accel.h                   | 130 +++++++
>  25 files changed, 1801 insertions(+), 3 deletions(-)
> ---
> base-commit: 6716101ae42949e98ad4b9e71eeba08c055be410
> change-id: 20260226-neutron-c435e39d167f
>
> Best regards,
> --
> Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
>
