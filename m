Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03990288CC
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751336933; cv=none; b=cGy9OqoGSHWIIv5vpLSJuQpDRuGbzuS/U2tW5oOBAAZjURCSxK4e4swORx+QT3o4giJrfQGoPOwLOxW+AOZiEihGtY6KwettR5BygDDcVMrtZR0XAPuP5jF5IAolUcgjoLjhARkS1STt2NMPMoz+7Lxrn5bVaby+N8g8XVOgHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751336933; c=relaxed/simple;
	bh=Lrz0kz30AUWccq98T4dRyobo6MRF1NrxZ/Xylcz6Doc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooph//kz8M1Rv6RflukgpjXWwfGWwoTjqX7Kh5LcXpYEnqms85miEalxFu6sLaTtz+fndX88HSOWO9cQhHF6Ii7Q/5N4x7cRCJf53icZaZuKz2lbZBp3zkWuEFd0BCOCl5JhmUtWP6HmsVoe5qURBq44fW2CMjjTD4Gb9jKIvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCY7NoLw; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCY7NoLw"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86d013c5e79so233379339f.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 19:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751336931; x=1751941731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=;
        b=RCY7NoLwI/4CTwqHdY9X6Wgwn1fDp6pZ/a6Tw3rlyEBVrX7rPocDQRWV8eGLXpsIC7
         QG2q0w5D4Q0yjiXbSPwW2914rM5+Pb5NKOjXVPx6hnLaXBlvEq2BRpmBSIShb3hk561X
         uRz1DZEWGbifs3FcayAG7Jj7PUPX6dEyyrMMjCUvLxzobmlhyJHKH8E/SPL+oy1fCXWh
         nrREGSo97Z0UV0GD/3O08XeSpjlpvJ93784RakDKpjUHEg78/GinVrf/Iv1C8Hps/G5r
         6UYR01ag2e9D8c2v08wXF4Yjv4/J89nc8CYyruFhAHwGOiThR8kwavmh97ywHBs6TO59
         UepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336931; x=1751941731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=;
        b=eW/Ydm+s56hGor92janKbYpQhAtY8dttgC3jXtn5JCCZBjqab3gtjfFzXDsn4akLj3
         NOhR2e6FhCUC/z8jq2Nf0gfDxSInHPSC/hjbQLQi6+kKt8hfhvTMyy2jWhCj9x3scQ9s
         Xai4NTrtaxSK8iQRSKLHnuappKkjylPxXl9yDI83Kn0d4Wfwn1jiPS4AuPq2G40BmL+e
         T40hZmI9bMkl0pKNHsUSXKZ5QmA26MxNyVvtLIT+xSTVxjc9lYU34ReJiM4Mg2WVoxiJ
         C2P3yUR2crWHJXxAH8oAvQrjUo7v1j2ho9iu3iv+w9ivwlRCpirTh3DClyiCQOn5TutL
         UnDg==
X-Forwarded-Encrypted: i=1; AJvYcCVQiAYAOf5TgeSQk3U48LzEE/7EJ05cCwckEneoj2D2fZftK2fAjtt/sBas0YtFDvK56/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyL9mksVGvOOX7411bqwAn801vkq0jHhetcGWSoqMIqGpdagxEg
	nfTM1sH60PZGJCVGEijBVf7gMfBIHpeNgdZa6ZQsWJbUjZreWFuHGZADYpdC9SgXL2VX/GCQG7/
	byGpakU/TBukN3OZyXJ3CnCM3jbqKhPM=
X-Gm-Gg: ASbGncsTiMXtk5kZJVC/R4qbJ9t4YOwvD481WqN6kKNzCyfTTxwvuf/v++7xql2TLmp
	cjZyFkV4fvitiVgPVM3iR3LiYUTE5WDgwAQHuuR/RUdcSj10ZJm9HF7XtbaGic4oQJakxzapivF
	ZmmYHkR7ACZ173/YGEeydyd99pl/fNsAaHmlNe5wkER6Y=
X-Google-Smtp-Source: AGHT+IEaK+Oqxa1UESMKPoud+tU+k8pmCnsDP4v/QP35UzAfFMMddZZHfS6lrrDcwsfSXwaF4LiN3WkQsGFbM229xa4=
X-Received: by 2002:a05:6e02:1c23:b0:3df:49b0:9331 with SMTP id
 e9e14a558f8ab-3df4ab56743mr192074945ab.4.1751336931069; Mon, 30 Jun 2025
 19:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
In-Reply-To: <aGLBvXtSRlaKujqM@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Jul 2025 10:28:33 +0800
X-Gm-Features: Ac12FXwmhVBFMgE6Fak7mzjMWtYs4A9XOu6UqBu7aKxFpRZeBK5SE4ED-1Fjy5k
Message-ID: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > coredump, otherwise coredump will report an error "ELF class is not set=
".
> >
> > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 9b9cddb224b0..9e7efb77b6e5 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_ds=
p_rproc *priv)
> >               mem =3D rproc_mem_entry_init(dev, (void __force *)cpu_add=
r, (dma_addr_t)att->sa,
> >                                          att->size, da, NULL, NULL, "ds=
p_mem");
> >
> > -             if (mem)
> > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > -             else
> > +             if (!mem)
>
> Flag rproc->recovery_disabled is never set to true, meaning that since th=
is
> driver was introduced, some kind of recovery was available.

Actually since this driver was introduced, the recovery can't work.
We didn't test the recovery function before. sorry for the mistake.

>
> I worry that your work will introduce regression for other users.  Daniel=
 and
> Iuliana, once again have to ask you to look at this patchset.
>
> Thanks,
> Mathieu
>
> >                       return -ENOMEM;
> >
> >               rproc_add_carveout(rproc, mem);
> > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_de=
vice *pdev)
> >               goto err_detach_domains;
> >       }
> >
> > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > +
> >       pm_runtime_enable(dev);
> >
> >       return 0;
> > --
> > 2.34.1
> >
>
