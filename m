Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0D2ED86F
	for <imx@lists.linux.dev>; Wed, 24 Dec 2025 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766604003; cv=none; b=HhaliDs/pk6jIWQbkrJjzbQxOvCqKDhFAOcHpy39vaCiizNkklpxO2inyUI/Qm9cKrc+YjbbPdqhDTLi9VaDRwdTBEQ/H2924joJYy85bSTsjqtCVGF3jdbLJSPkJkfjUr2A172Ih1GCLX17ShZfFg/rzfbzF0nX9dosoSIiGUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766604003; c=relaxed/simple;
	bh=ErfgYdcVqeZdxFW+svquaJZWnpjVxPnFzRILn9Io9/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GFOzB1UgFK6jdxy0lzsIyK+m5bHXwXk4XBKdq/XxBrJSYWQ8oqzegMdYwpz2OZxG3B33FdBTnXDNaZErXg+QVDofYs0b9WyDkgHK6NEyd9T9zgvj+9RrJngwaZfd03qz2fNnHEBHkqC62asS9oU9Es2D00qWOGJcbMWRWAaK1tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=WrJ2LV/0; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="WrJ2LV/0"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a2ad13c24so58719706d6.1
        for <imx@lists.linux.dev>; Wed, 24 Dec 2025 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604000; x=1767208800; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=;
        b=WrJ2LV/0Akc0QnyhdOUwHYKZystAkRX2cNzxzvzElt2AWeUp/p/tapaG8PlcK+rpp4
         Sox9lbnhSu+axquljFAlPbsDLLE3GBMhjgcErYK7Ir7/hYkaCi8qT5GPUEpVgTKlJzEE
         Cg4wY2NO7Yk20qBR6i7KqEBr3lC9qnsFc3Mr8i/3IVsLXRQeLGNJ9qCMNLwhiBpewj16
         IwHgz+aNeeLkDXUjPk81xpXOMOBdVp74p2J2HybMACPc8C9kyT/UAO/HEWi0H3lklwiI
         dRB0Jtgoir3mP97hmrD52J4Drz8DJP+K4bDAqFdN4KWk2DE2evFf/ifqZlZAoSkwfFpQ
         ICCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604000; x=1767208800;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=;
        b=NYhBCUPQ9lkbKM0ewligkm7h2lbJy+XYd/wGMiJKCyQdcvtnVvCsKtJvOh7yXJ/683
         a5kfbcolSy6YWVjA2cYUHwl08hFV5ndmpdTgvycEWRwMg4qcw6/Fbsis/xtDrhYz1pSN
         mb5XWd6PLuKRyozUfg1kWvHO51UEMybhhmAQcJNmIo51peXwWMvKbq8a3XwUy4QRFMEZ
         Jr5F7orxZdc35/lMR1fwAj7HBhqjDrHl+oiKk+OtrN7UB+aZQneJhQkwwD2X/RKry6Wg
         +fpvNo6NbrJUKp12E4fangfPCmWteSvH/XsvvTUzhv6sIupDmnQagzyVoJ0VAXCWiBdc
         X6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIFudEdSfK77l+k5WJrv+r6uFpJWdH9fh2obdVY/t9XVhXxf96hq+8V1HxdxE/t/W39x0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRrPxD/8elFe4orycD5CB2gKAmK89yceuj3gZoseARWD6cwAkC
	UfpulvbTCWpexpY99W2DQaPrStWBWAOFeY1JYL4CDrTTnkepdsQfG4N+Tj0sPDP3Ht4=
X-Gm-Gg: AY/fxX6uNYAfS7b+WC9iHeFqrUhli36ar9GH7GYDgR1TzMZ+Bx1SKHChUD7b88wehep
	B2gC18fAPoj4v+XZ8868gtBFVRjY9eW0iqZOiwyR0bm/6ObY1qPkuQBf1Uvi28bmczZUAbDHu8F
	HmivG7e17HtU93xVgmGoy7dnJMR4UX+FxzdTvGPnavAfx3+tsXVT+pxJedPDeYx6o1FG2cTB/mM
	Vk+B5oSAEwUVvBCleNXLOICUaQtKGZsvC/sUlCLIu3OS3jcQXZnok9sz52SF7s/GBRd8vTk/clE
	5rrGpmedA700VKIWIO3oU3X45WUNczDytjEhnSy9ohmMH64CbQhQrMxh9XviVeL0jn9KqOgDr2z
	LoF1ZE1JBlV9oANsn3DCKXwE6eDodBhZEYuNoHoHUEn+bL1A4lfJBWcRzTb0kGPGVSMoExP2gCP
	1w22kmTNHrzVsgSI0htmqUFgNT71w=
X-Google-Smtp-Source: AGHT+IEeDZpPPu6YZwcQ8tx4vjP/alqKLZ2iCL81HE8OxCMqXyviVYCPm8KNV8TIbtaCK6+e47FNYg==
X-Received: by 2002:a05:6214:20a2:b0:880:5279:98eb with SMTP id 6a1803df08f44-88d86290d80mr291887636d6.44.1766604000085;
        Wed, 24 Dec 2025 11:20:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm131729676d6.47.2025.12.24.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:19:59 -0800 (PST)
Message-ID: <5500fa4f4ee321a451360a84cf5834781c1a9615.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/3] media: amphion: Clear last_buffer_dequeued flag
 for DEC_CMD_START
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:19:58 -0500
In-Reply-To: <20251217030227.1546-3-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-3-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TbnDfBH7kuP5a4j2UK4h"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-TbnDfBH7kuP5a4j2UK4h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The V4L2_DEC_CMD_START command may be used to handle the dynamic source
> change, which will triggers an implicit decoder drain.
> The last_buffer_dequeued flag is set in the implicit decoder drain,
> so driver need to clear it to continue the following decoding flow.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index c0d2aabb9e0e..f25dbcebdccf 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -724,6 +724,7 @@ static int vdec_decoder_cmd(struct file *file, void *=
fh, struct v4l2_decoder_cmd
> =C2=A0	switch (cmd->cmd) {
> =C2=A0	case V4L2_DEC_CMD_START:
> =C2=A0		vdec_cmd_start(inst);
> +		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
> =C2=A0		break;
> =C2=A0	case V4L2_DEC_CMD_STOP:
> =C2=A0		vdec_cmd_stop(inst);

--=-TbnDfBH7kuP5a4j2UK4h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw83gAKCRDZQZRRKWBy
9N4GAPsEStp+V8u3PcY6TUQYOCoH/OAkqDJ6OoG31fahIVD4IQEA+Bl3uh5sZQhc
KDFtxNYkj8x7KW7YxzN9h3vDdlSs3AM=
=bMEn
-----END PGP SIGNATURE-----

--=-TbnDfBH7kuP5a4j2UK4h--
