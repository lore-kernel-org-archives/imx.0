Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886104;
	b=FIbFcv03mnRQdj0q/aItR2jX780Ofd4dRac2ORgk/8EOpwn0DoWZe+X7RxdSP473u8rR
	 DZdLcFcfRtcxdSOdH0FMr/+gSQDoqHIhxAdk+/FbkCbX86mVuXmKwM9fTF//uRcmI8iuW
	 hIwhsE9sRMusrwkAAnaEN6KOmn3qEXZFlr3MuSoRmbp3VZVbhC62htNVSZvTr0OjtG3R8
	 xD8YPI8ffwSpZx09F6TW+/wTbVWNdVTzNxMpL74NtP3alGP7kG64kqwUUjFAdK2LHWlXe
	 JmdnnuLXESi/r11M4Um8E7o+6o+1UM0HzZQwb7cmiaTtSbqsD3kEMe16HqVIjyUGPZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
	b=mArQDHG+4D49lS/OMj5AMsEVUumyTtE5n86wavzkUvnps31xVKpAGVpvSYzGT6USPvf6
	 XdxJkFf6A6B1TsODt+3kzSftM4U6nRnrGFVnRdifMphWLpmC8XO9MNuFDD7tKydAAE1r0
	 zI0epsUcOQhzEZ3rByEuenahi5Xcmkv/bXBCC+XFP9qodxXJsHDKZnmfELT4XU80jRbI/
	 UQ4acjo4r04VEZOpwJVKRW2O+qABZFTxe9q0zbO0t20HJgLWDL5aQSA4Pp4HbsCxW71cK
	 bzd0vmscY6XCDYMu4pIyYUKt9DrO6tR3F4J8u46JizVNBo+Gt4S3xR+SZUu5kOOLuaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kNW4P8EW;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77961606A32D
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 13:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77961606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kNW4P8EW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so107769f8f.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793886102; x=1794490902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=kNW4P8EW+4+Mt8QgdagfzeoDIb5RLRLsThtk7h9EMKBeXSEA4TpXr2dfUYumNmzDyL
         hWqpXUB6jlBmkcwAHvgL23C0seboU4uVffCquGmevNDe3+/QVLN/WzzjuXI2S/lmIX1N
         o1Dvt8P7sdyGW7kMLMl6lsL1aLhuOGvbAJdunklhR3NJWvavVdjEb56LZ9FV3gCMAJbp
         ffVOwBL1yAgnfL5C3G31D9UOxSk2ybV2YWZ+c7zuZ4pwydiGNmXgGYR+HMmBh0RehYZz
         vLoZ7VFcUns8909WP8R2USIahmTpntmQUgeYaueZUd9Sten02XSb/7mVcgerLqMw/5Gg
         OJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886102; x=1794490902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=llHIGDq/hdRJ1905wWPJ3Ba7ZsyO/SrNVQ1P86VLa+/PxW9FdHLXN8yawVn5JOCfsQ
         1iFgQmcWJCdgsYNHupBV2GcSvL1fdDYOBHHg+cjQkDLJoAYyRk6/mvpnU0Wdtf4FG/Ou
         5atdEigPMUuD5EsUgvnRZ3YiBldJmOVrqmmPxjMiCHii9gzwFc/yoibCF0hu0Z37UT3a
         HlsbQqe74pXuejHu94wr16rBCK8QVGm0ocoW/ABhpofrNBwObQJX8BqJhT79tGldDVmP
         bFpM/O1WXowu1+9lrtwKX57sSCLmfSPWonDxsH8ho4qqK1+mT99KFVZANnuwbR+LLRiz
         82SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcRlYRjcvGvjZ0kHlalbPc78xKSwisHcZn8B5AzpTnmcrF4SLTkgoQhxsf1B55nvp+Qt4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/vbp0IEd/eHx6yN9Jy+HxTB3aA6Qx0nB6DD4elyEbLlEDune9k
	OH1/PQ7Sw3gPwZouhkuGtMjS8zq42fjznhdtKT6TYxiTm5alIXBx0z6GVTWT1sU8kSM=
X-Gm-Gg: AYBFou0cAtJZk3dVYwLxu8AXtMa430GSX22apV4ze7LO4cYbIWLXlWDU9iJYiRy9vc8
	xY/f4ZOOFCdOHikgsMmgXwaTE+MQwfkPqAAKn81RQ6Xt/Di+OsXKX6H4JfFIvt8ZogkCqIph5vD
	okUZ1VMuAPV6h/l+5UaXMJS9uGayLUwxDMIZ5/okYMMvZQ4w5IYLK+Re2nznVI4QFs2rWBrKKS0
	3p4WuGjtFlESBfhe9t4bcb9Hp1DwXsMFXPSIYe+/BJGq9uNRaF/ux1BOcYJGsS1D/E07FUOPega
	wLxsHScQwMoGNy+UneXTmDy6NvphQY0eE8/xP9ddMsF2F0H6IE2oBHD4hqEJo4Fh0/XtsQGTq7i
	Odp8+U9T7012oCMnil7f7bb9T24m7DANr2BvSnblSzNWai8x4VQOiNoefUrrajlHZiGpxjTtVAW
	knf0Qze4Qfy8yNh8+g04eMOxMfi6mQuahA2w4CiDwY5uwfyVWaI+1q8j7ODC55NJaTjxGUmGjMX
	v8LL4pb3paz/6cKf8JsGZsGUaMTVkLNbQlV58E2NiqWGwmcKp4NQIlg0ZvO48AbHKyqKk7v0lVx
	vP1KkheLeuHmwn2LdCO71TeyNyd+lcSOMj7qnahL2LMiocYm
X-Received: by 2002:a05:6000:25c3:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e6e5182bemr39618525f8f.51.1793886101892;
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fea1811c4sm10123361f8f.3.2026.11.05.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Date: Thu, 5 Nov 2026 14:41:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auyGiW91Ir0JcuxG@monoceros>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwyxkko7vmbusv5v"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-198999@kernel.org>


--cwyxkko7vmbusv5v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello,

On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 00019b1895e6e..e750a127cbc4a 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> >   * @detach:	detach from a device, leaving it powered up
> >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> >   * @da_to_va:	optional platform hook to perform address translations
> > + * @memcpy_tova:optional platform hook to copy data into remote memory=
 range
> >   * @parse_fw:	parse firmware to extract information (e.g. resource tab=
le)
> >   * @handle_rsc:	optional platform hook to handle vendor resources. Sho=
uld return
> >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > @@ -99,6 +100,9 @@ struct rproc_ops {
> >  	int (*detach)(struct rproc *rproc);
> >  	void (*kick)(struct rproc *rproc, int vqid);
> >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_=
iomem);
> > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > +			   size_t filesz, size_t memsz);
>=20
> [Severity: Low]
> This isn't a bug, but is memcpy_tova the best name for this callback in
> struct rproc_ops?
>=20
> Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> ops->da_to_va), da denotes a remote processor device address while va den=
otes
> a kernel virtual address. Since rproc_elf_load_segments() passes the
> untranslated device address da directly to this callback (including for
> devices where remote memory is not mapped into CPU virtual address space =
at
> all), calling it memcpy_tova seems somewhat misleading.
>=20
> In addition, when rproc->ops->memcpy_tova is provided,
> rproc_elf_load_segments() skips both the filesz copy and the trailing
> memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_to=
va in
> include/linux/remoteproc.h document that implementations must copy filesz
> bytes to da and zero-fill the remaining memsz - filesz bytes when
> memsz > filesz?

That's a valid concern. Maybe `populate_segment` would be a better name?
I considered being more verbose in the kdoc entry, but all the other
entries are very sparse, too, so didn't want to add a 5 line comment for
the new callback among all the one-liners. But I can if you tell me your
preferences.

Best regards
Uwe

--cwyxkko7vmbusv5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsh4YACgkQj4D7WH0S
/k4IJggAu4L1Wed3i0W4vuPU7pAQ2mQJvf3FezMAeGDQffUtpvt+zlonpWqYwV7r
HK8tL4z8k28POxQlGKhkCLJS0JLSFnZpN2S0YQ7Kh2gQyzfxq6sUkwUkHKGNtYSX
0kI4wqKgdURieKMj4hFmGKeX9o/yXSX3F9W+uF+FwTl78oOZAK6YWgoZLjSbiagt
M40PJrmpoCTPln1ZcWc66RLVoA9IBR8TELu2VNA536pV3RSAGaCbHHmECAQMrBMY
IfGrXrxhI7fCIhMC5OT/hBBRB140ekbyW0PC1kdVqu1iT4j1WI7f+2wMV3e5ba2D
Yl1Q7lDlQ/qxjmKRlfF1oyzKWeAl8Q==
=axH4
-----END PGP SIGNATURE-----

--cwyxkko7vmbusv5v--
