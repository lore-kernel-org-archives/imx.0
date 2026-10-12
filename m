Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8381D4570D1
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797181; cv=pass; b=Xq3riU95xOBnthfFjAke9pgFkwNhkttqVGUxuSzuobdweWjhoVtDBpgdbPGY0VHX/McuPNCdBpIus58WS3EdfgTQArbsLHUvO1nIRZnPVQcpRXkZNyzMcSUpNECPrJRzPuLCnWX5bpjL/KUE5LUPlfaZdhIennVAPimlmBVtHls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797181; c=relaxed/simple;
	bh=DK3zBs5Q5Ki8kuPnph8eZ24Oy0HqvpqhIG3ePWhuHBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGFSxdpulp2flpgkJwDUtAcy1/pDHmRfkD1kODfxpZLiO5x9JY+ZV8EZchG9e9XJe2msC9o7hJnoXN+jPO8fixOm86J1cGzDe8eQatnIQnhwILcoUf6abr/pFhH6eC82dt9pd6RbMi0BBY/ywgim28b+Qm+zOAcaM755J4JJybo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVIUOcgk; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVIUOcgk"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso12229361fa.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797178; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVFIrUQUa2NZHWAuSY+fquvgmVZwKc0nAyCqHuY4CX/h+GfFY0J8ggQhT7r9Clg5Ob
         opd8CzWBQL5w4zdJsT3lok6KZUE27JZBLKBCy0L0b/83hq68qw5CuR1tI7qkfzgtXvyI
         5A3Sbf/oZNrIDOsa+o+c7J8o0w69fMHZrVNKJoGA5olXd6Sdiw4W0kAu2SQssR7l7buI
         gYUWOi1Tc7rT7tDtY2Ngw+J4IYdrpbU2rV+5h79MlXdyIOfEWJBSfpedTBRXSxp29PeP
         +6Q6QfqjNOKhGrL8N1s3tB87NXyMrfzdy0T0calAJmS8JY0VOJzBy/wvcoZSuOVbOJz9
         aeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        fh=HDZsqg1nYgKJoq5iKdXutRX+o/BMMfenuxjfMlWvbYY=;
        b=XcVaQMlZ81xR4W0BzH2tdH2oc0SHJ+ewJXmK6g3HJoL7t5VgCVSUVzxCQ4j27ayUo1
         wkJD4mLe1TlzuSZ7WyZgJEf9drHY9lwn8IIp7MIoih6K6csCBvc0p8mAsg1D3QHO6d5J
         14SXPeBM0u75uJOm3gMhkhgnZHnhPCj5ULrkGoJgFwmTLSATVqgvo0rZtz+lW7Da40Vc
         i4JaQ2fB/Dt5Tzi6/tHLGjHEotJWO3EtX1yhGGGRzWIsvXaot6+wpixWaVylMU7AtJcP
         3EAcWpDjZqYf1DqgOU4jdHGPzzrLur2DChl4GzRslc7XDeXt7e0QpVxqmCayHc6AccmS
         e7XQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797178; x=1792401978; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=PVIUOcgkBpTE+zISE8BKo/anGmxArYqUv61UfmSzGt0ZYsn0bZBG3Syja0hsAwGLau
         x+RKDRZQFAJeZ4crMvYjUiTWWlJ84Y+3gfWySghKe89VsHNHIbynMaW7fOrAFei8c7Rk
         CiaspL9xEGaK2ggrSkcHMA3omf9CbrlB0KCHM8AcHn2PCfBUlRWn/lKaM7YvySFGRijb
         Iapwwz2vvDYrctBz5dDVTz4t6qZ5JZprO8Cxr3B6Yyh1ht5meoO3F3oJfs2N6zV/fEts
         TNoKKPJlzCo5DEwqgpCcsCfAsE/b5btUYUFLkEAlTpl0QekPB7YUS6d+xAuHvgPTCtpL
         iG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797178; x=1792401978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=1V+IdkybNrpFs2coDmHZ3OOkpRiVbGbGtqcIyffOo4+Lzmq3XzVxCS+KD3oAt3w0p4
         HxJUq1VB/AWlNEymqwRGj72ieabAMWkGufWNmF2I//8liPC+31GdFvisN909fMndkhmC
         crGRUtez0+RYuK5LmpUTpFYhNX57EgEWk3YZKF426B9uKicgke03wLG+UeybIbWQVCwt
         9v3+MFupjI6eExOsrnyRNrccq3MAMupBNHieX/RPoB86Ca7tMLoON8PurPC6HfvRx5ZZ
         SaNtEDSXhwEIInH+NbZrUFy3q7x/eDYzo1u66hWnZauDU0Bl0X8V82pzayOTuC6xCcRo
         M0Gg==
X-Forwarded-Encrypted: i=1; AKwUvBz1fwpzU+GGNnkTvpMTXElZi/9PROjZ4Kj8yRYxqF6hxz00FSynjTOFM6hlephM6ULaDK8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIO1hhEjBHWH6YT3BVZBGw6gt3ekm53n+gIcD4bwv2XcIldDt5Z
	qjyZrIckg9/YdowmY8Kp0DsVDUBKMevxTDp8VTNq6l5e2b2nEUclv5ALscXVwgIOK0iOdJdmPwm
	ijciTb2+Ak9SehfrLH0bAdIcXrOunwS0=
X-Gm-Gg: AYBFou2IBwzqciIm3PjUzVbWtsk9KwPL85IYnOb0je3onQaKDANCe1PgDEe6NGehO5V
	fnObuJkqFUXxwb5SN1IoNpqlvA3acP86VbuPPs9QD/y6mOu6O8tydUsUDtg05VqQNN3rY+twjW7
	xEKGFXImQqj0qva0P9Wl1h5UT/OJKXOW85Hc8YcJu5LADlHGcEFya+Oyyx5HeOtQxDPzXU+9ErK
	itlk+V6h9i5hlRzH8GaBrkDWOHFsfMOlXEHRhmeqPGPlf+SK6RfGVpXLKRfQzLMQqcpDdNXjerc
	6pHRWCflJigg2SAnI84FyjmVE3goGPAVkyNTedYKLoLnP+xmctXBvzVu+ptsBR1vpqYnLbKwu/H
	xlhT4hLgrUi/d3UtiP2zQSzwHHpcd/hMPc52c92UBRFu+I5E8oPUUV9RdwjxKPGTSzRRd9vzCZS
	o7zlATbS0hx2NbnIoCbeooz95xB2O53gEkcInI4ZPW
X-Received: by 2002:a2e:b888:0:b0:3a9:9b74:b035 with SMTP id
 38308e7fff4ca-3a9c5352a7dmr19646981fa.10.1791797178338; Mon, 12 Oct 2026
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:25:41 +0300
X-Gm-Features: AclHuK9GwblMnTPQvaiV3jDrr3vRaqwQVyHQB-cZx-ew8f4fHdAz2Ca3vyaKuZQ
Message-ID: <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>
> Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
> with a flags field in mxc_gpio_hwdata to move the power-off capability
> from a per-instance bool populated at probe time to static per-compatible
> data.
>
> Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
> instance that carries it, along with a mxc_gpio_has_power_off() helper
> that replaces every former port->power_off test.
>
> While at it, factor the register offsets shared by imx35 and imx7d into
> a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
> initializers.

...

>  struct mxc_gpio_hwdata {
>         unsigned dr_reg;

>         unsigned high_level;
>         unsigned rise_edge;
>         unsigned fall_edge;
> +       unsigned int flags;

Obviously you need another precursor patch to move from 'unsigned' to
'unsigned int' in the whole driver.

>  };

...

> +#define MXC_GPIO_HW_DATA_COMMON        \
> +       .dr_reg         =3D 0x00, \
> +       .gdir_reg       =3D 0x04, \
> +       .psr_reg        =3D 0x08, \
> +       .icr1_reg       =3D 0x0c, \
> +       .icr2_reg       =3D 0x10, \
> +       .imr_reg        =3D 0x14, \
> +       .isr_reg        =3D 0x18, \
> +       .edge_sel_reg   =3D 0x1c, \
> +       .low_level      =3D 0x00, \
> +       .high_level     =3D 0x01, \
> +       .rise_edge      =3D 0x02, \
> +       .fall_edge      =3D 0x03

Why?! Just to save a few lines? This makes it harder to follow the data par=
t.

--=20
With Best Regards,
Andy Shevchenko
