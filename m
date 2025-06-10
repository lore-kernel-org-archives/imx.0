Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBADC28B4EE;
	Tue, 10 Jun 2025 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548581; cv=none; b=ZAf34XBMdKEyyBeZUcx17JBJkKIFKahOGn3hf9i3svUvHeDpv4ZvdvHm0iJbLWeFK8jPg8qKQ8dsXf7mG2gp6vrbkUMqLddbX03WqNve5VcjV1qsbbC9crLKKy3Uh9a9zHwkhhkIpQyB7mBZXl8vftZhS4ps8ez6bzT1508ZJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548581; c=relaxed/simple;
	bh=tyKr67fYhAjWFX35wOMg10PP3CbAB1AknXTB7vztMAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV0avA52irIby8Oqv9Pxb/APkXHiPa0CFNMRbSr5VXNYtTqj9LBafhSkM8T5tSqEXV8HzRGyBoyAMNuoRUEoy9+J/y1j+mfMD2TGbdMangZWh2IHlvmjo022aVOynQsiM6q0OJysc+hbqR670Ye4F+IXkqwO4DOsgrxMuTpHLgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4WzxtwJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4WzxtwJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3114517f8f.0;
        Tue, 10 Jun 2025 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548578; x=1750153378; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
        b=R4WzxtwJT/U6Afl+VRBRFtxjP4sALaVvRsK/Q7DvBYJiaz+nNEO6/ukZ+j8iBzUo5a
         OQBKwZ0zMfGtKsvUnBalMIMMMCqtKnN8QZxCYjFRByce2PKSUCUf0nttOIsZLhh3TpFr
         0wnkXKgNuBq+nKhHqKmAdQixCZKZobyrr7aG/eXzRyniDVIYC+JhZXSTyTrbon/6E5Jq
         uLKIJ6qLrLiwPEUVIHccS3UTSJ7XkdWoDjWn2wHaceumtdinTgV7SZRIFg+W4B9xDcr/
         Yha2MXU2M/Gy2AHRP16+1zMKq0bxJZ8CHNy1QLV8/gSxAP3HpxGTeGcjQHPG6xvOgypu
         n2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548578; x=1750153378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
        b=Nqcwvx/v0x04MU5AEfJARNVKU7/xENLqt/B1SXcPolbCNl5mAVz3nqCe569RFD9jwy
         qluJayCy7YVRPCp6eqgOKZfzMref1vpTgY0cCPn06z9A3kQq1zpZdJrGIWqMmJjLssEi
         qhVFUMRisKbuDP+9eD0d5OjPaX079t1EA4etWdpENb6SQef/67BdTQNaUw+nI20FAQTX
         dER7+Fl+Tkkn6iKukQU0/SJBwyuqbR/2Gcg2To9lfiHGf/hQKTQKYq88NaMNdKkibQfD
         NxBk3dZHwKx9BEY6wnH0ox4iNMzVFDCUbCAbQVs17TNDHPUcgUwuHxk4oimxsSiLQnrM
         X69A==
X-Forwarded-Encrypted: i=1; AJvYcCVFtdXn0q3w6x5rQuVpDEwjoalT2PJ1rJNIvll5L+iJ77GHuWYwGmUqns6O4SGhltnctMs=@lists.linux.dev, AJvYcCVVYaI6KcY/UFzh65q49nE/hOGOPsYP+s70cRvnk1A+bEgxSB0FDRL2Ugy0YyVO35gwE3MJKOTsvck=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBlCmSANKAezPEy5s9Vo1v3x9KVPzaYGuxPV+QrxeaAEL9TQV8
	ndfvDIWy0Zhhp0qrIsBLFFBXh24eMV7+5+sgR2DaAJpuEm1Cx/klbZJC
X-Gm-Gg: ASbGnctmG+NFWY/kLNQPgh/oA68m4mG2a5s6ID/3htL4oiMjEpjRA4t9BYYUz6kHHC6
	b5JwJbXvrKV9esxhWDIhj++k7xllovLBDMuFoSM0h8nB9fxi9YReb35r7GavTy3l2FtArIdlPVT
	Je/d9iGvS37LcFRmSnn27/TqUwK9+QQOHZSgD297daf3ydKW1oNxX8wWnovwsqjI3MO80up9LfB
	6qphJTxWzmMLOjn9dhfIpzvZNtXHIPJoql7uqzfRsLy22q9C+5kJv+csQ7BQ3fgY0mTqiJfpgE0
	mV2MX/etGup+bIR+YN2/UEMy6vjygroFfkSpaJwzfFKPquaOFrDwKq/5i/Xco71wSTMygt7tk4Z
	sdJkee8Wkzr7wxB7H5IslwlVEjDaJuUZqq2x6TxwckR+mUbBj
X-Google-Smtp-Source: AGHT+IExWHAWVGdsU8NZWtNNaxdbfHHyFINoY6jGqsgVAuuDRCnCkj/k/dAfVKD2bDGIuerocgV4wQ==
X-Received: by 2002:a05:6000:1a88:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3a531caa458mr12387967f8f.18.1749548577777;
        Tue, 10 Jun 2025 02:42:57 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm11546484f8f.43.2025.06.10.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:42:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:42:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, Ben Dooks <ben-linux@fluff.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Michal Simek <michal.simek@amd.com>, 
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	Aubin Constans <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Hu Ziji <huziji@marvell.com>
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
Message-ID: <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebq3qw5vudglyq6u"
Content-Disposition: inline
In-Reply-To: <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>


--ebq3qw5vudglyq6u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
MIME-Version: 1.0

On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
> Use new function devm_mmc_alloc_host() to simplify the code.
>=20
> Although sdhci_free_host() is no longer needed, to avoid drivers that sti=
ll
> use this function from failing to compile, sdhci_free_host() is temporari=
ly
> set to empty. Finally, it will be removed when there are no more callers.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mmc/host/sdhci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 32fa0b2bb912..ee5a5ae4db31 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct device *=
dev,
> =20
>  	WARN_ON(dev =3D=3D NULL);
> =20
> -	mmc =3D mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
> +	mmc =3D devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_size);
>  	if (!mmc)
>  		return ERR_PTR(-ENOMEM);
> =20
> @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
> =20
>  void sdhci_free_host(struct sdhci_host *host)
>  {
> -	mmc_free_host(host->mmc);
>  }

Is there any point in keeping the sdhci_free_host() function around now?
I only see patches 1 and 31, so not sure if anything happens in between.

Thierry

--ebq3qw5vudglyq6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH/h0ACgkQ3SOs138+
s6Ed0Q/8DpTJQXo20TdxekQF0hnrIFHjlPauJ5ZtKpB7NF/fe3sNtEeoyrxts1E+
6CikEMpo4L/9bzrdo8rcGjuzMgcpss6NFQPLN31d61YD04Ue/ib1QRzc9s8WeRhm
d2h52zCebC+C0o89UyR09Z9yAMPLBo3dFbY4ibo7x+QETIAVk1ylMTTHxsna2lbA
rD8sWJHCrQSEVKJpRPHCF+GD693iCP/q8Dgm47QSRtgpXWKoP4sWMdhMnELuTc1C
49SbTj2Q6FJc4T7jMesthftnLrwTnk4RQCgGzty0EbXAX/FXgdBpBTn2TqYASH/e
qDjx7z9K2S8VESBxTes5vkv5Z0AT8qv7Vzm/2zHTGjo237lZL5oa1b7HsTmj7mby
VLmkcfGVct/6SmGGGEEbH+Eyvsi7CMjv6Xls6fUs9nQOMzUmx3T+mfs9Ue4G/HlY
h30GPSXXwUAmq99Q30qXxH53S8JE0GnfuusLlKdR3T09CmgxIFlV8Tx0MOr76Jvi
RolNAGHx546QFtJsQfxIA2OUBGMqeXr/wOtRb5hJNfHfvM2QpmlKklVesiuaexvk
CJ8iC9/tiE5asSU69f++Wmzl8Z7+k/PefX4vWbYQCv30JQUqqxorXZ8NApulKlen
/uPDSM0UyLzvefatJZYZIolhaRuG+4CpstVYXqzMfvA3Ci4F2FE=
=J2Mb
-----END PGP SIGNATURE-----

--ebq3qw5vudglyq6u--
