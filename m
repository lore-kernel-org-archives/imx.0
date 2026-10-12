Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C428416856
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801213; cv=pass; b=VZsSoGSUy3bwtdGMN1KFL8OtvosCJ7zavMR787qGzSW8oU0CFQKiEJVQjsX+XKw/mgFNcqPZVy79/iGBr7TvnXPduR8ZDeJa5TEaJ7Hz+05JifUkDL8fdqfs2Uj4ce8WzOGfjanqfppmq18EdDZ0Uo86WmvKdrIfQxOZVEnbF3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801213; c=relaxed/simple;
	bh=K58spMtUXSSstSD13s5KRjPSopvKSNrgFnbERIc/EfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov9mtHtv3Mkl2S+mMCIX/dIgd40rG/jB39unQLwbQmYv1lOApne3M3KVPli46duTXQ/aw0mTQf8hFaFmlFjeY6F+TPXqNZ9vY65XnLBcyI0UpGgw+YPXmC1MfG4HWWARYmQ4reeXW72rCoSj5JNZbCm8ChZZdlF1hwcXNQekVPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVn9zLs2; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVn9zLs2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c31a34de844so257381966b.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 03:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801204; cv=none;
        d=google.com; s=arc-20260327;
        b=dH57f33A1X0k8YdAsA++RbH5m0nBzxX0kAOyOSxntf4VDPCvMMaRxb8VnwFzgfPk6D
         NO8f+EymHAzuK16Xtc1hE81S0gvp1ixrBEkV9+mDG5BD2v8JzFhdRZCMqsJYiin01fqM
         tJG2MXt4fl8gD9enqKGsDgA1Gb/eSb2GIR8fiMHmr2m6y7k4cTUe+LElGWqDKjwGZ7Gw
         IXO0nfz2KnL10OWjom4rFoVbJD3e2xRcm3o6TwfLQnHWDDxXoSvWvuQYrNosmAQ7a2PD
         z6RjzQueKNMraWHeUFGprWfcE00EX4C6ZATzo85AwPrSLWuxFNX49SuVKSD6m9Pak41Q
         /27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        fh=Ju/OpY0YmXK9tXjw35NcSSRxHwTKKcYh4F0/I4dxHLI=;
        b=PKNvefaz7UieiBP83GhmFc3tfGtiUoJTXo45xFVXvwqBC4K48BtF6y7hoViNF1uTbI
         Hl8cDwaQUvHrzQY7OI/Q5heW0GUvV9gx5oOWYMc3XBdieQLBbjDC5uAnNIhpwfGLUps1
         2fMStEBefb6E5Tcn47sgFCzibASSE3+eiZt0P9Rf0iK8ADDIbzwtJoTORYHjRAyrf2/M
         sKzI0vuB1BprAQiWGrFIyTWJwF/lQ4gQq31R7lMLj7eufTR91IFJGbZI0GsYlvBd247x
         svEu85xnXNKElhEs5ZpNzt3A7bM6GyYC6qoB6GTFB6cH2Ok3MLyJp8m/4TfcDdh9nzgl
         pBBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801204; x=1792406004; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        b=MVn9zLs2UmNHme1bxgp0yjiAwaxQMJaBlAgG7I9aLVU8MXvrX2x0dt7qxRooHa1oyG
         xCD/9RK5MIAlmloXPPECbvEDPz7xbtB75Ej8iQrwr/CaXOVFOpoRRdhs2YZPL1AZT7OV
         OFHnYJmsdGxMe4S33cV0qeIv2F7fmpYkqtw7VRO541k5X7LppzfMS0MhZIW11cja0imf
         Q5is8nqYbSyjE0jigNgbjF2A4SLJD82qhH02RxL3jLFnYy1ROI9mgVY8ElwuQ1ueWUri
         Osnx3PY2nLRkhFmyb6/L8x3G5p1yOmd7hWMp2h9lEXkH070APj2FgoKZQwSpNrLHZDn+
         vOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801204; x=1792406004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        b=r1wM79U/NBdW7CHq6Uy3G9X7IPYAmeMU6uGGHVz7VrVCFCFjsrsrAN5l86coRLcgze
         JGIZeuXkVBq3zzcZk0YT4J9rQ39U0wMtyg13M+6DFYRbqa3VtjAfbPcX2xtbKDlziwyA
         nQ6iErf/DndfzQJe4myvplOA1CslAndel5ntYesU/6McIK3G67rdKRumxqSJIdLG03ov
         YNiTeHD12z30NmKwA2eST9XVakZoU58IdCddHyKU6A8SoRzKNdVksxMAY2OhNnTUfkBE
         rL8MNCA2mr9C4Lf6HyUd/Wt8vIjCkLNKONEZqbgLHtzGdoT+26LX5D77nJnsJ8BOlmFD
         g9OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwngbim8Kr1NKjLQJvRs4ENNqR4N0JDS8ZakDHhm25M/W3YqX1q7ioUK45FnuMk1aWMpxI=@lists.linux.dev
X-Gm-Message-State: AFq9FYK5G46EC5ewpYLi4bi82zY9MQDyhkA/ZIXYtD892IlXtVbEoo29
	QpOC1NEQDdM64fjOhASvdzdHzxfTnREXods93LLMRDM4EZOn9cmlXY4Rfx+F2DKs4p9vF+HGNC8
	nCUOp8DK394Jx84R0XKD4w78El6LiceI=
X-Gm-Gg: AYBFou0weUKkwromQqbc9dcR2V4m9xfiFpnj6Dhss8Yq+zvBVanpWXfkdZ085o5BD8Y
	4CEatR7h2ljoU1xNM8bKaiIuuWFyGT2Ekn1DwFv6QML/jiQi/IvaKcalY8HIpch3McqpvbN0yaa
	DXLc7E8+s20U/IJx2WOxBvPmsWUmq9oYWB1eSzuHbe2d8mlnLIwqXl3bInhqYoNTubhxcCBpL49
	g+PriGX/OLvq0PVj4jDYKZjZ8vzgrvwijTCSde7O+9q+a7Cegheg6hdRg139/jy2N2A2EcWLKAf
	icPpGxbhS00xxfIJHQZstp+2/QodxuG0G/68g43hywKfvHVZyVtcXKJU+vjL8Vg2LC2jSFIzD8H
	OduqnPi/qrrPZwqqKHriE7BPlxLuApMaMb6Qz7ZzQ1bb5h6s4jKGikmgYY9skzaYbCo8PSP18PQ
	HIgCZQmE524Fc1DSBuAzJPOIxrp7A8/6rz8WYs8ub0
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id
 a640c23a62f3a-c31aa0d2286mr787580766b.46.1791801204012; Mon, 12 Oct 2026
 03:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com> <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
 <asyvcJxbM5aD8pzE@shlinux89>
In-Reply-To: <asyvcJxbM5aD8pzE@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:32:47 +0300
X-Gm-Features: AclHuK8bE2RNRViMXGduuI7Gu1WFvoqdAJYcBik89ymBcvSwk0SX4J83VWey8Go
Message-ID: <CAHp75Vfi8xqFU7nUjE1ktYKWgXGYy3XQKnz4nAJZeR2_o3ywkA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:54=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:25:41PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>  struct mxc_gpio_hwdata {
> >>         unsigned dr_reg;
> >
> >>         unsigned high_level;
> >>         unsigned rise_edge;
> >>         unsigned fall_edge;
> >> +       unsigned int flags;
> >
> >Obviously you need another precursor patch to move from 'unsigned' to
> >'unsigned int' in the whole driver.
>
> Could we keep as it is? I try to avoid adding more changes if not critica=
l.

No, be consistent. You can add a new member with just 'unsigned' type,
but it's discouraged, sooner or later you should provide such a change
anyway.

> >>  };

...

> >> +#define MXC_GPIO_HW_DATA_COMMON        \
> >> +       .dr_reg         =3D 0x00, \
> >> +       .gdir_reg       =3D 0x04, \
> >> +       .psr_reg        =3D 0x08, \
> >> +       .icr1_reg       =3D 0x0c, \
> >> +       .icr2_reg       =3D 0x10, \
> >> +       .imr_reg        =3D 0x14, \
> >> +       .isr_reg        =3D 0x18, \
> >> +       .edge_sel_reg   =3D 0x1c, \
> >> +       .low_level      =3D 0x00, \
> >> +       .high_level     =3D 0x01, \
> >> +       .rise_edge      =3D 0x02, \
> >> +       .fall_edge      =3D 0x03
> >
> >Why?! Just to save a few lines? This makes it harder to follow the data =
part.
>
> If I expand the macro the imx7d, imx8qm, imx8qxp hwdata, 24 lines will be
> duplicated. I would keep as it is.
>
> The current hwdata as below:
> static struct mxc_gpio_hwdata imx7d_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_HAS_POWER_OFF,
> };
>
> static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> };
>
> static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> };

Yes, I saw it in the next patch(es) and commented there that what
should be done is split of the common part to another data structure
(or be wrapped into one with a .flags member).

--=20
With Best Regards,
Andy Shevchenko
