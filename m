Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D373AA182
	for <imx@lists.linux.dev>; Fri, 29 May 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040434; cv=pass; b=s1RLezqTXCAEdAqkLJT6bUZRLjpR/MeZp6wEwCiuNC2T7Bnr3t56dZ7Ypgmb6f2e5R0M7bWzy0dcTXPo+KlvUCKz6m2dA/omVETnFxJo7ikZ6F6CiTO5+Jr+qyFzkgH/cyl87GVbKjRv24uWxYiCKrt2IJJTdI7LkgRAMV1rZs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040434; c=relaxed/simple;
	bh=duOkskhLGyc1cCefsxmlm+EPu3FCiGb4lyASp/B1ezw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4ug7DLhrCLStZeXFGqFwKLdlIR8O3wI16Wk/TWSqt0KWOwLgYYct+ILxV1wbDr98/pofsPr6ebSFCDY6hzgzItDXfDUMKAXzB9feNAbBJ+bImRgc78/GBCRfaUM4inwEt6NLuOSGZbwygzWS1nlCnruI9cNDOTiVWxVB76yXT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7mG2ZQ6; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7mG2ZQ6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa4b131940so2927845e87.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 00:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780040432; cv=none;
        d=google.com; s=arc-20240605;
        b=S/Sk+cHWqSXSRPpCG7Wu49Xe8mROM2PHpmDrgnAsFKeZlIg2vbJGoLnXQMvraHLsI/
         wi4Gqw3lACEp8kAggG+os5QvJrXD29778NKz32yVCI2onLZxySIXFc9Qkn+fZEH45Lo7
         RKZ4d2TuySJ7wG2Zxip3BiUvIoODGjrPLkIuakrIUzTyzOCdFYN36WyJbbtnIX4A9yem
         VBonKTBRTvaeJDIhgjV1K/TMOXuXCszUOb/2rpe9V3AuINByOtyZhm7KaAzm1ST2qSxn
         ne0wt4t/ffivYeYPg1s81PBBV5YppvSHgCWglcf8xv0I7yBQ+fNz3uyimUQRuaTG1aM7
         EmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=;
        fh=tmjMSfoCBEuP9tPIqBzDNOOs3fQT+oy2MTKXlxFIQTI=;
        b=JZvEj4uBmvAVNrHoBAOMwCMJHpAeKvOOduironaCEFl74vcQZ/L3k0FP66CIMxu4yp
         /j7azsLlFosQAaU8a+Rpw5R8NX2XBx5zHMJb4pQbaAMlBCqm4oXYZ+j55N2v0LEq2kjq
         InpQ9XJrwQ+Mu3CPC3wXUVfB3p7AKdYPxdrU0HuqohnM3QHWMMCE9tkZZFk+rqAXbEtm
         CLudf2ZvOMJjnEL9C6qTrUEAST96MdVb1JF3Fs5GLye1Zh4qj3Kno+ic7J1XYlFPCIko
         YjlX0JxH5EB9v0+eXnJJ3UuJrqYPTj5J5lPflFQdd6/kwgpN6y1ChUHfSPmAAim9QnAE
         YZ9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780040432; x=1780645232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=;
        b=F7mG2ZQ6U0ziuZ2M8OhpgWXoXIIOGnnGTFcfcUGfwyqRmOrSVXzwIQ9oeJQhNjCqmE
         gPbq7IAm3UBl85O1tG3hN76/pvBot4opnJkCATaXKYgtIFJ66bTLSYXtEuvH1MaXF8IN
         VjaZ6NpAzQuT7gFiW6Jusoq+HrqlDQgQlREjOh5xH5D4AKINjZJq9eNdxTyUj9wFBvrB
         8HfJLs38OSubrYyuTD3kx1k/EiraxjXM/Fgp0xweCmhD0M5zvFQPMbNg4qraR+Kpm83A
         7sMBLZYhq0/DGTSgsXT7cwXY4hkg77aPsiejcaSP1r/PdyP3HnHiSzXFrdbEILJ1WgzD
         P8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040432; x=1780645232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=;
        b=niT5dr/H2Qkmo8sES1kAb7DFoe/l7OsfNQwG4LFbdsNcgKNuoNjRXWlX2vS3oQIRG5
         f6sdzTpWH+5+n8MvCi0tmUDTt73Bo8JoBY7fLbkfDD/92yT6OPhInWGdjXkdo1mifTW7
         XA8npWJt6e7M6yTzmc+7oB0qitQSN9ejcRNapTQp2bsOWbblmB8sIYROQBQ0ivI17vbL
         paiKyU4hX5DeYwXWT2HsuLCC/xZ30AI0llN+LOqlxo7obhIWQwgXsdtkMxArtPogdSEq
         YiKpaKw/hQ7DOboPGs35qcoghg1EXi57fzth47nacSQ21ciFGDGU/+gJR96Vr+qyz8il
         0law==
X-Forwarded-Encrypted: i=1; AFNElJ82zWeXVsleQuhrMRlDDMlflDXypBbA4gWKh+7QEWSFcNe4eKM+L9fGPIgPiFe0+xfPKik=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFNmHXahWM1HxXoLNSKu9zPRZJKdA4D5NeIKV63WSEoBiBu2CP
	edDFg8eXe6kwElBOwbbVaAdFZ8P/wuwc4v7qab8xrLgsC0/IttR3VoTYouSBD5jM34lu4HNdJfB
	VG4t/ojqVlYg/wlN9UXmcq3w63GbpT/A=
X-Gm-Gg: Acq92OEOylt+ilRsFBXnITacLfg6979ynn7DsrG1j8YB83EpiaKwh8nvq+Hr0RLtdUz
	+uSMgUeZVWWyYf6bM7LAi4F0lLQIm8FQqZCKND62vSCxSUse7gEHs50pIKRU6tIzzRla1cBAIEI
	vq0xXuP71w8B4hX8a2AST69j+KZONkguMFNOYyCoi+MuGzR4nU/wucKEyHbwHAIFbKz0hNYJD1b
	KjYUpi/UOtd8kKbQrN+Sie3KS86hdtnQ20HtBApLu9HzXSq3iTzW8FcZFjwf3Nz64Q76eiAbUJD
	cMCWN1UEm8k4FlILd7JHvl6YQ6b7ZnxJ96yZQLGCNqwsn+gLOfFNYO2RxHgvAyYifnrXakhKpKr
	kT8rnK0VzVqiR2j2+/33OCBvmNkkPFQdLEh2v0QLoB3Ce6k3eQRHxj4A1mMkuD/euZNTT
X-Received: by 2002:a05:6512:401d:b0:5a8:9986:8490 with SMTP id
 2adb3069b0e04-5aa5948ef29mr474317e87.20.1780040431328; Fri, 29 May 2026
 00:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528203011.137338-1-rosenp@gmail.com> <038ae6be-03f7-4e6a-8c1e-70cbcf8424cb@kernel.org>
In-Reply-To: <038ae6be-03f7-4e6a-8c1e-70cbcf8424cb@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 00:40:19 -0700
X-Gm-Features: AVHnY4LCY9FWvT2VC_UvRSAi9rf7pxOk0uNbrtkA8fVCsHKkI-e-ZKd_4cJZWfM
Message-ID: <CAKxU2N8jaG-WHeEpJs_NPKLdB9LP+cxDMhZN_bzX1gnBAhGUzw@mail.gmail.com>
Subject: Re: [PATCH] serial: mxs-auart: fix 64-bit cast in probe
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:37=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> =
wrote:
>
> On 28. 05. 26, 22:30, Rosen Penev wrote:
> > of_device_get_match_data() returns a pointer. Casting it directly to
> > enum truncates on 64-bit platforms. Cast to unsigned long instead.
>
> This is a misleading commit log. It still truncates during the assignment=
.
>
> > Fixes compilation with W=3D1.
>
> Fixes a warning, not compilation, right?
compilation. I believe -Werror is passed.
>
> > Assisted-by: Opencode:Big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/tty/serial/mxs-auart.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-au=
art.c
> > index 697318dbb146..de97c0f74e7d 100644
> > --- a/drivers/tty/serial/mxs-auart.c
> > +++ b/drivers/tty/serial/mxs-auart.c
> > @@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
> >               return -EINVAL;
> >       }
> >
> > -     s->devtype =3D (enum mxs_auart_type)of_device_get_match_data(&pde=
v->dev);
> > +     s->devtype =3D (unsigned long)of_device_get_match_data(&pdev->dev=
);
> >
> >       ret =3D mxs_get_clks(s, pdev);
> >       if (ret)
> > --
> > 2.54.0
> >
>
>
> --
> js
> suse labs
