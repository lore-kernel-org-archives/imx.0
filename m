Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA515B552
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727372217; cv=none; b=tcN2wkatPWRCeCeII5t/V2KNWownEojQrUWs55gmr0liKY2Fx0gZIgz6qmrzRe9Ud7ujjwbsFCcpurLNqRlPLTLdp9ageEWMTqckmH3o/nI0KNYMayqYYZYj68ql2v6bXAGNTjCPtb5j/Gnor9oDD1WuLfirnkQCqJBFyR7v5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727372217; c=relaxed/simple;
	bh=gZ/DZtOFtotCg2ZJqvPPQrBo5e4ZN34v/Lvt1y7BlBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnyRTAlBoQJr5ORgZJNqa19aVZzVNyw0X2obExUkg0/WBo0N4QDArjotUTdQMiCHQNfqHhID5hB8WdT8ZNexPl9T7eHYIWdD2bKZON3SyMvWtdjU15fMflVPyte9ZZ+w+fl/KFAxoV3ePFvA/ayumZUmsSRcfjopE/ASzcbji9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4jK+n0A5; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4jK+n0A5"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db4c1a54easo771039a12.1
        for <imx@lists.linux.dev>; Thu, 26 Sep 2024 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727372215; x=1727977015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIlWLLARj2D0f2/wbtG4ZzKXxUsNafh4f+v/Gl8dtfg=;
        b=4jK+n0A5pkIg5rgrniWZmChW4HzIlayvyjWpN0W9Ej12rdAc0nzN4RK/heFy+hnHdS
         wig81ZHs3uumptadtwuB9upZ1y9348NOVBYYCw+NOZdzRfuZ2/vRXeKWndbEQjYbc1Jv
         WvDuZcbT2TlXoTpxsDA3zQ9MOsNJIVkJMYpgUvqgoBGzotEBhUCUFiLcDunpXIAoQssF
         ow2wfgJG3uw4XnlZzsphp0cDcIlnJ3ECW7wJoxDzrrUVET/+zdVvE+OHp/WW0Py5c3KK
         YOrCNu7URzFSGTALoXYUfkN9PEqwa6L9QyuRouZ1xBcunbBiG4ztptontoTzOG+Te739
         4dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727372215; x=1727977015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIlWLLARj2D0f2/wbtG4ZzKXxUsNafh4f+v/Gl8dtfg=;
        b=iIErAGg/b1Z9MIyzYi7udHT2vOD7FVq+TqobnESl/wVNghrMIuQBhuONZseicLNMyh
         7HiMDJGSX/WVLNt7LuuZBozmUm9V7GHjL8JQBtY0W9HWMXhDT7K1eZyAksD1GRang0U1
         N3005vX/CBUXOqYOdWgeSB+2Ggn9BmptuDYP73S6VS44WIuC5rFl06ZM8/sop8omVFwg
         JR17jSwacs5YAZdt3pdQ4iKSSaDU5i/3Gy6co2qov2SRtojd1POkOy2d/DNcYuFlzq0q
         Y1DHlIWwbyrfVsy9PiMgs73ac67xK3h8/adyuMbx4VxW48TQ4eB7a6oVbpuEA68fN3Rx
         qUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWrqE6/lwDPqj15TiSAwWIzkSuLd4iRXKlRB+5CL5Bc7x52l1b+vzewLTl2a9ej7dJTEo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3uFc72yMad4knXnQT9O3c81YMHl2GkjTr4Hbr9A8YCoinj0+f
	g5nJ6ltIWc+zuTtM8dK3zwkN5CDxxfeLFpJkskRxGB4Jm7ZFPBwuToymBrs+TDzgdNnh1Y9bDcy
	SgCLgqcQ92CWcCxH93yi3Aoz50cFqvTvRdGrR
X-Google-Smtp-Source: AGHT+IFyoM14p1xkZjGDkib3ISbqBw/ob1Vg+aQY6MCOB0meJl2EfUTPQX5rZCw3U6NYwXQhw75iHjrBgwnKb1Dc4o4=
X-Received: by 2002:a05:6a20:c6c2:b0:1cf:1251:9a47 with SMTP id
 adf61e73a8af0-1d4fa78fd0amr609270637.31.1727372214561; Thu, 26 Sep 2024
 10:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925220552.149551-1-marex@denx.de> <a9967a8c-8e03-44c2-8f79-14c6dd5d74af@app.fastmail.com>
In-Reply-To: <a9967a8c-8e03-44c2-8f79-14c6dd5d74af@app.fastmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 26 Sep 2024 10:36:16 -0700
Message-ID: <CAGETcx8opbQ=+dBkSWwfCoqGsvUBftJm7VaGULZhC5DNyuktJQ@mail.gmail.com>
Subject: Re: [PATCH v2] soc: imx8m: Probe the SoC driver as platform driver
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, 
	kernel@dh-electronics.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabio Estevam <festevam@gmail.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:28=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Sep 25, 2024, at 22:04, Marek Vasut wrote:
> > With driver_async_probe=3D* on kernel command line, the following trace=
 is
> > produced because on i.MX8M Plus hardware because the soc-imx8m.c driver
> > calls of_clk_get_by_name() which returns -EPROBE_DEFER because the cloc=
k
> > driver is not yet probed. This was not detected during regular testing
> > without driver_async_probe.
> >
> > Convert the SoC code to platform driver and instantiate a platform devi=
ce
> > in its current device_initcall() to probe the platform driver. Rework
> > .soc_revision callback to always return valid error code and return SoC
> > revision via parameter. This way, if anything in the .soc_revision call=
back
> > return -EPROBE_DEFER, it gets propagated to .probe and the .probe will =
get
> > retried later.
>
> Thanks for the new version, that was quick!
>
> > +static struct platform_driver imx8m_soc_driver =3D {
> > +     .probe =3D imx8m_soc_probe,
> > +     .driver =3D {
> > +             .name =3D "imx8m-soc",
> > +     },
> > +};
> > +module_platform_driver(imx8m_soc_driver);
> > +
> > +static int __init imx8_soc_init(void)
> > +{
> > +     struct platform_device *pdev;
> > +
> > +     pdev =3D platform_device_register_simple("imx8m-soc", -1, NULL, 0=
);
> > +
> > +     return IS_ERR(pdev) ? PTR_ERR(pdev) : 0;
> > +}
> >  device_initcall(imx8_soc_init);
>
> Did you run into problems with the method I suggested first?
>
> I don't like the way that this version still registers both the
> device and driver regardless of the hardware it runs on, I'd
> prefer to leave the platform check in the initcall and
> only register them if we are actually on an imx8 machine.
>
> Having two initcalls also makes it impossible to build this
> as a loadable module, which is why I suggested
> platform_create_bundle().

That particular helper doesn't seem to like probe deferral because it
allows for some of the code to be in init sections. So, it gets
dropped after module load is complete. So, Marek will still have to
register the device and driver separately. But I agree that it might
be better to NOT register the device and driver if the basic
conditions aren't met.

-Saravana

> I think you can keep the
> of_device_id lookup and pass the imx8_soc_data pointer
> as the platform_data to platform_create_bundle.
>
>     Arnd
