Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF581BCA1C
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763748461; cv=none; b=tfJ+FtZDVp5ic/j0G9vnEgrvP8t5PMVluRhNsBVVVY+ifUXn4p8Aat6agTGO+REx/HCE0eHvM/szSdAgDU/8YKKyoP5hPBz1D7bQ5eLFk9onJ15ZWNaq+eWypwB7mnk9hRG09rkd/w2Mpb4rvsM/T9fi0b+PGPNSfueuNJIAgbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763748461; c=relaxed/simple;
	bh=Q1ZwELVabso4EkyDG2xMjJ4EyeFlxuL65Prpg3ujMaw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Okbg93Wzm2JpYGecc/hU+YJFAnq2nrVGJ0k/G5dxdwFXd3t46zON3gWYEFeVDvQW5c18GkmTQevHEKe3cPWq1SzyKx4KI8y5QXWgkyMBSgOprMLKvdDBsA9bRepXhWV4o/I+lIzvLGXYYmRikslE9JZY1tXfcTDtgK4e1yxyWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=UjVVqPmL; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="UjVVqPmL"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8824ce9812cso25428816d6.0
        for <imx@lists.linux.dev>; Fri, 21 Nov 2025 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1763748458; x=1764353258; darn=lists.linux.dev;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=;
        b=UjVVqPmL/3HdRoSClZak+9qAe8UwP36JmZzJz2oCYjjrF1PkrK9MZ0rFvknyLyo6Ln
         gpBr8/VE6rns2kBBMyB5LL9Prkl8Q9QjdbosrWLGF4mH8+lVZLPk/x7XN/fcYoTs3P+X
         qYEreVTou9O6SzGYtkRZTl370b3n4bf8t8DhV4r4VgwiCU2qaXlAsEJf9F6B2daAU0xM
         ItilLBPR0HLG5yp60NsD88QMXgaGHAExuChJ4wNns082OKXLFAW7TCnXx1yGIhNqAQGA
         Ff6Rc+xMZ+ENdYV/iErLdGkPD/zJ/1ZPDNi1jYv59q295e3WAsfZXPykhdW62EF2g+A6
         vc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763748458; x=1764353258;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=;
        b=TWaE65GlT2+enAwMfZV/M/o71y1H3PGkn8ZqxCbZfMjrp7n39+uaftUEIyYC9uSmgP
         0pf8M61hPvMr07uq2zf238MMdBOSwGnGX4XW4+w90GHEDpON9zI2cXaFnjHsPNTrdJQp
         PwUT2IpZUPqDhAprgUMjqWSBuWDKFA5IoKJ0xM4mc9tbT8VGpY3AikaGCVCoI/kqeg2J
         Q0EI4iq3Emiod5hgsjV2OIeevoUoczl5vRsuo9ih4jxbyDaDtNIlz0Vul4h3yvs3E+tP
         JmR0jiTjDvvtNHJJslf70/8UuxRzZruccWdrSKr+UWwQeMMH0fOucsFYeUMHlNjNkW6z
         i6zA==
X-Forwarded-Encrypted: i=1; AJvYcCU+2/3Jsf3JCnLddCCkUp6Wrl9VzKFnrVWppicXJ1tEWjPrtroURpLuM6r3IPcs9+khO8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyE/yIcG1EyLNkFVyW8Xy7xZ+83q+3VbXv1/+8QCzogdS4I3Bod
	IGYnlH29WQ3oNqgek7cGQjWLUXE7W5ZI+8oWZ+NBMeO0azySg7nluR5DigkC3OAOIbQ=
X-Gm-Gg: ASbGncvWvbRuP2abBJOl2BdpqK+2X9o3EfVcD6LtC/RmjwJQj68DNA49SyV+PdK+rBl
	+CYECBNE+AjdnexrlMwOCTNEH99BP4DuDb008Hg35yaxb7Upaz/15cBk5tpFvL8EeNkzGvvF9xc
	eEtmzznwVGa/GjoUccfLew0KIuq3Rf7CSKy4Ba6GirYkxu0QlYJC6ix6X8kXXloe7T+j0WASh27
	8PF86Y4rZQhuAxJSxiAqxkW9MaF1vFLzcKVt0dTzneSk+oAlZUUB2Hl522jnpxljzzRTXvvrb9i
	+S4Odoe4IOIis/ts2ArHgoKQYjRlvUMW1J+KVnKWq25Sptic2MXSpX3tu6DwLdi5CcoUyLfMea5
	4u1MyR0UYhmZEmhzqdGP3oCO9T8H8cIITRppNUdbAPlPXHWI/nRw/NTbLwYrI+1+jYOwCF1bmHI
	5hrzlNtMcabOfwgyk6
X-Google-Smtp-Source: AGHT+IGSn6lWVFdXMF2O7+16BxyboE+vLKmTO8u+vsDg8rBpHj7vHOjDlUdUHZhhn3mvBIHkM4SR0A==
X-Received: by 2002:a05:6214:f01:b0:882:4987:367 with SMTP id 6a1803df08f44-8847c546402mr35659826d6.65.1763748458256;
        Fri, 21 Nov 2025 10:07:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e599ac9sm44053446d6.49.2025.11.21.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:07:37 -0800 (PST)
Message-ID: <11354064b251d01f8a0f8974c451c91d515be1a4.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] pmdomain: imx8m-blk-ctrl: Remove separate rst and
 clk mask for 8mq vpu
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 peng.fan@nxp.com, eagle.zhou@nxp.com, 	imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 21 Nov 2025 13:07:35 -0500
In-Reply-To: <20251121081911.1682-1-ming.qian@oss.nxp.com>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CGluF/KiYEHV7bilRPFN"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-CGluF/KiYEHV7bilRPFN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks a lot for working on this.

Le vendredi 21 novembre 2025 =C3=A0 16:19 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The ADB in the VPUMIX domain has no separate reset and clock
> enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>=20
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 ----
> =C2=A01 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 5c83e5599f1e..1f07ff041295 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -852,16 +852,12 @@ static const struct imx8m_blk_ctrl_domain_data imx8=
mq_vpu_blk_ctl_domain_data[]
> =C2=A0		.clk_names =3D (const char *[]){ "g1", },
> =C2=A0		.num_clks =3D 1,
> =C2=A0		.gpc_name =3D "g1",
> -		.rst_mask =3D BIT(1),
> -		.clk_mask =3D BIT(1),
> =C2=A0	},
> =C2=A0	[IMX8MQ_VPUBLK_PD_G2] =3D {
> =C2=A0		.name =3D "vpublk-g2",
> =C2=A0		.clk_names =3D (const char *[]){ "g2", },
> =C2=A0		.num_clks =3D 1,
> =C2=A0		.gpc_name =3D "g2",
> -		.rst_mask =3D BIT(0),
> -		.clk_mask =3D BIT(0),
> =C2=A0	},

That was also our impression, but we could not get information about this H=
W.
One question here, how do we ensure that we don't reset twice on power on ?

Nicolas

> =C2=A0};
> =C2=A0

--=-CGluF/KiYEHV7bilRPFN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSCqZwAKCRDZQZRRKWBy
9A6ZAP90EgdxFgS1MNEpip8ViNpAOQ1t5ODnf13yvBhSJ87yTwD/W2WHO1JhMsym
rs/FdLqAmGCaIVG4rntDh6YMtk3p6gc=
=VrGj
-----END PGP SIGNATURE-----

--=-CGluF/KiYEHV7bilRPFN--
