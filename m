Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D7E2D248D
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444476; cv=pass; b=M8R4+317gYkuPclUjRW6HgtKViaukQ6iIiPP64NfXtFd/UH8eCI7PxTbRgfL6Iu6SeDCxo5lAuC4lzuDi5u24Oucc+goAgriKRosiNBpDiys3ykezyi7CkJqHKJ3FwghE0LJP+tMsswCnxFBsVubqNStaWZHsj9RzgNEa0mSID0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444476; c=relaxed/simple;
	bh=TBJ1yrzYQ1NnCqjl7xWYSvAiw/tj2uso2ls5/23iYEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3sOuLgDhGTLbhTyG8jIcSU5I79RkBD0E4HmvLBv7fyuURsasa/+Ytw+p0ZTwi91vYgJ0/H3AAC+45mRoNDCCiVM6LyErRV72yndPjNGneQP8wVs4++E21rsWB2SE59SZaTUj01B1hB07ZUig629x0SaT6eRlPvfeQ5fzdq0kkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVortVfz; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVortVfz"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d4c307db9aso2660575a34.3
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 01:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772444473; cv=none;
        d=google.com; s=arc-20240605;
        b=YM6kuKSC3xJRiNHMqmtr9mWdn6jm8GucZTgTgtVwgvZKguobDUowKQZOUeWLXiz9Vw
         vCRnTamoHAM8ZvunyGZflZBhx6p8E30TRV65lZ6rJMsps3uXW/uIk827OzlW61QyZ6PD
         j6SVdiAJskSjzh6SbvJHFKQ1hj6N4WkfkwiDm9wrisOBAFvX/+eWDikTfm+EGMfc0wro
         tAepYPCZDYI/PLORiA7e9B2Oa1zLe0Ru/tCAD5F/qV7T5PtvKBpTTNGDIN0e7IjRRhl5
         I2PhpKds249RqGQPn1StpG6fzg3ULVLm9KyOAYT17Mve8l5DspPionbvuRJFK+fdp93K
         VLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        fh=T8e83SW7bsbWFSmscEoDhfvQVesVpgaya28dnS2WGmE=;
        b=OUAp1grejuGrG10Tvwuo/C/EvLE0Wua2U+6xCqw2TdlBVG4YR7Eoch8t06uyd8B4Fg
         Ti/qkqYMKEPaua/3saAwMNiaamm9x0OESx/eMEGERDGuAMj6NBhGz/aFtn+vp4QaYTYG
         JW5VB5uDaxctCZobXW6v1JkXDJkihMiTcc9YAdEdlZFJ0WqzrBiYGvWiTwZTi/tcNMpn
         9j1umAYFjaTK2PQQKgR3IQr0M8GCCg9mzJHHDbGe75ywQ94DbVJF5mM8zD9PHON6uiQE
         Hur9fBEDBOXBk2++P0CLqmFTt9XiDtDzcQdX/YR7RdidFL53vnzStES1MTOWJFwEJntg
         2eug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772444473; x=1773049273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        b=HVortVfzWo5jYKjjQahoNFY599X+nPmrDPNM6w4c59Z4daVgEAgNDDZfpy3WsVt9EO
         WpE8L9FtRRVhZ5ycYFPsOwOgGpGFpvpHdDFknul2o99oVKzXsxClzKmRJNxLSXCcVWaT
         CSVwmSLfy/0EUihRUahlQaAWYmYeLoUck8T+rs6XhDzCxlZlRPG8mmxNHlaraBOllaBC
         rK29dYA9v5c+ATUe9e21ax04v1+xvu+gfsjcZ24S+XEfGGtumfVS8gMsQ7rLCLGUJT3F
         8LYTVQzqNzcn4MnmkwnCDqyYLojkr/LyftV/nefiWa5JcyJUXdDjRmbSYNE8ZwD+y2b5
         DSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444473; x=1773049273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        b=axErJ3vaU0WDchLBzX9WcbJjfkkKiozor07OAr+/FzB4GJsuxK5z2BOa9fya9mYEJu
         xyF+zFP7eri6ojeYw5eFcKK3W6kjQYCyNkFFOuFPR2KhcHVDGkec0+daO67aLnG3YNzq
         stLXc0NJgI5shwWz3WhXwg0mBStNuJbLeU3/0PL7dT/i85cMmD4buBZTBycNBJW6ACx7
         9T6GPn68uODAm0oqPhNXbLXP28oNbQZd6N4efjbDPXkipwxmNeyD7gg5SGNR1pv7lTXT
         AzbBM5F/FxFSYsxJpUZYQyDUTINhtdjM8Pq8bD5c9evajGsL5dnWPfCnsKuWTZ6Celn0
         1ZFA==
X-Forwarded-Encrypted: i=1; AJvYcCUAB8+xjw5n3nb8CMh3wT8TFrtmUMsNoetnFlOzhlWosz/uCDwnH6FnEOJPZ9STG/aH8JM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3yp8Yx5OsyQAyoZHUM6STJGRCbrDnUHFJF54cTEvLjyLHLUTt
	b+COBl9jYkjiXZaMI21LJwS3iwXTGGfwQB/dG2HJ1yfVSyvZLbreAeB8Hm6ShkzUvq2FSJDdZsH
	3kHKT65ZKoMCAaYkZVp+zvJ80cE7MKCQ=
X-Gm-Gg: ATEYQzx7DhBB+mpr/qF0OnkARYgRgql0/jqrel1AzhYPgkBOTj1FwKMrTzk7gtp/5pb
	PuEEtOxKLB827dSw/AYJonvQrLHdd9StfBuJo33726hH5BkOyUfE02pU1KrHM4XsxPTdMxn5LRL
	8wFiKaaFGa2UJm2N+QXSBRtqAzFqv7KVoNWEO0IX9oWKS753IjC/ISxSreUll6eui8U7NZsZh1X
	nR3x6OMbBMqv+PWGM63d1CZcN7EVpRKsvl8LBkPnDtbrStWthhffCW1SJcB+KmPhxTES79nkmSv
	HxhwMbgTcxwHB8PTl1lQicWjC9WEVWmZWkRC5JmBh4jBxbLdbGEZ3yKYFPKsf47oZvA2/RTQJgo
	=
X-Received: by 2002:a05:6870:5ba3:b0:40e:e5c4:a4b2 with SMTP id
 586e51a60fabf-41626e7efd7mr6527665fac.14.1772444473484; Mon, 02 Mar 2026
 01:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 17:41:03 +0800
X-Gm-Features: AaiRm52ksdTFNUhtDCiLRoaU2IvMaCTzMMj20OxNJCH2RxR4-dFP_MGc6WdRh8I
Message-ID: <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 8:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Danilo Krummrich (3):
>   driver core: generalize driver_override in struct device
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure

Hi Danilo,

It looks like some usages of platform_device->driver_override were
missed. I found them here:
- drivers/bus/simple-pm-bus.c
- drivers/clk/imx/clk-scu.c
- drivers/slimbus/qcom-ngd-ctrl.c
- sound/soc/samsung/i2s.c

The good news is these can be easily updated to use the new APIs. This
is required to avoid breaking the build, since the field is removed
from struct platform_device. The previous build likely passed because
these weren't enabled. I will use allyesconfig for testing going
forward.

I scanned for similar cases and most fit the new APIs perfectly. One
exception is drivers/xen/xen-pciback/pci_stub.c. It does
strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
drv->name. We might want to change device_match_driver_override() to
take a const char * instead to handle this.

Besides axi-fan, I didn't find any other drivers that need to read
driver_override. This is great, as it means we hopefully won't need to
expose a read API at all.

Thanks.

>
>  arch/sh/drivers/platform_early.c |  6 ++-
>  drivers/base/core.c              |  2 +
>  drivers/base/dd.c                | 60 +++++++++++++++++++++++
>  drivers/base/platform.c          | 35 ++------------
>  drivers/bus/simple-pm-bus.c      |  4 +-
>  drivers/clk/imx/clk-scu.c        |  3 +-
>  drivers/hwmon/axi-fan-control.c  |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 +--
>  include/linux/device.h           | 81 ++++++++++++++++++++++++++++++++
>  include/linux/platform_device.h  |  5 --
>  sound/soc/samsung/i2s.c          |  6 +--
>  11 files changed, 161 insertions(+), 49 deletions(-)
>
>
> base-commit: 78437ab3b769f80526416570f60173c89858dd84
> --
> 2.53.0
>
