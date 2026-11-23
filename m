Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424146;
	b=q8vpYlkHIIZ+/yBQHnmFn8UZXQjeBBQlQS37fL0Q4l9TMKSKZ6oikSFEA64V8H3447VG
	 bi/8ST1CXj/1C38u5HX2J7G7+2cHLaUPWV5/YdGJnlEwUssQ7Ura6VB4o8FgcqfSBOdAT
	 YjoQCgGqVdviVM53DtirXai7omsaxRM+e6TBZg5Y6V9U+hEQmZjuLi2X6mEEkBX/HpT1V
	 n4VZJdt5+NuzIBe2D06hZznBt/117TxgJc2oDp7pweK3xBpoiRoIZVQlI8vUq9DniH3hP
	 o8bJYxvo0NCY8Nzvcsgov10J/i4HRfRJhRFA4Kgkqm+26zzlE2ZP+vbg7rQHx8Cv6pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
	b=gM5+LerEOm/ASOTtoK0NPNZbrAkSEF/k3v23w4nxCvoszXYVD4fggRw5PYlMlSe7RM43
	 TXI3syJ8M+nqmQFfhARF/D4JgeLTmehRIT12e70IDPalkpXduQxwTKX/tNtWc8bWoolq7
	 UWOyJOHL9Oi7hHu8OoMlvsdwvIsLUoZwhApT0V9bVAMTajAcNQpyGwm2yaSJS3aPBUbPR
	 BatXkI+WcEj6JuMWnq297TTbqxqpdjyzR9Nl9UNxEwca9VUPd1/Z7xc6NRCG/2PNLMkqj
	 nEWBj6o6v3qaUKHFr/gVw98LTDkI6luJ3Tu6EjuGTjclpaTlMT3dCboFq533W1fRmlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Qgr5UGyP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA6606A332
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 08:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAA6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Qgr5UGyP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso22897955e9.0
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795424144; x=1796028944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
        b=Qgr5UGyPr/O3phDre33MSIsvVfIjePIQfXqyYKB0zGLwD1ZE143t1GNsxgw1B4961X
         AlgVyECpn9bHN5PQV3CpvMAZxSXHBw22PjbVqZsdLuRII3MCSLEfrQAKK+a4HejmgFht
         75nxOcS0aRsjKUI73qGCinjqEBrqAdlyYvbADHPPF0/VDS9vFxU+f/RTtjcB4jw0BK8o
         r81J+j/v6vcVaE+Dd4FTcjxVK+YgIXtRm5sxJKWbYN8bgHWZu75W77zIGL/CW2iseKfV
         aoI5218DG4DaxdQ2TxUU5HNMTMpFA79V9kqC87yxriCJta0XHFmBlzOxAFNcGqe6PbtW
         jEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424144; x=1796028944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
        b=Y0zL+N/tY74nWX6Ac302Nj3iMblF3/CDg/JaaL4fMHHdmPDA1776kZG01NrVW13vdA
         cbs+y8Q7tLChJ5VfQU1KgLh5g9R6RKiLnM23V72T9xPCl0O1ffdN/0f3qFriEIioUBTz
         aWd1RzUcOOHQubICdZX+sSzGzIQyH4zJnmAu0hxoEKFquB/itD/AX+Xm5RDbdNY0Wf2D
         q2NFPxWO/nZ1N8HvWfnwhreXtBQKBgyHpFiNE7DMo9B0oDWqjRgYziH+po0PBtrP2443
         nYBDN/fYd80XfWGXbb2dy7SR+WeMnmVbM4eQURYdiJrvmcQZTIACRXK0cW3zIby705u5
         1l1Q==
X-Gm-Message-State: APuU4Z9veJl2ktskt8A/g699qJw03Obh8rADtB35deoc6tY0xS6yk+pP
	sZ/khFh+v0QvV1v+kD6h4zO4p+VxlHV8wgcvVNpTaUdEJ8K7Oe9YA/AZmXwIL1yvlw4=
X-Gm-Gg: AZFdTZdaMLYa12qFfB1eEWYsw/N0VY593h3/Sb3SnCs5ymhGrPV1PWMERp/2DE6Ke6G
	ihetqdm1oBVghIRb5mc6wTODo2yUW2XKTiBRllhAX7dPRhMCP7i03FZo5wTvenEinpyPaFmXB2t
	mvTK5uVa0l+HNaMNyaUGRHHF5Ic5sz9K66bjl6l+GdznQ1T5bUCAeorJAFDVDPymBXHZHQCuHpK
	0+YBWPHDR1fTvwT7I8YCCiDSnuXaqLOMewsbm5wkqOHwLq0xF5Se4lxleqf4MMjOMGOBwgPI3l4
	K907ayyAGlDb4+tI1lLPEqI5ymlxlhROqnSDUWT+A8P9aNlygYceid+Pd7GS0rdnXZJda5pos1T
	88lhMdrIjIGh1iHYfE7AgPIhDuVaZjvEwWj7m2WCud292Q6CV/0yWvCj3vKRI7Qnu3Sa1ZvkNSh
	4XXyq+Bud/BjgHDUHXDhUdSESNrT4wnNkH8ZIFqggNdgyShZeB+oBacExW5G3n7v2Ai+Lgn78fN
	KUeWXCJW11vPN0KyEFa+nuUUvhQuRHg+aOE/prr8w91Qo6PTvoGQ+IdZl7NvQRvkmtemNfK0/u8
	dEt87Fc7H0We9KW/8f8uzr1Ep1WJSaxkYZjaCvfqRxob3r1b9R2ZugIGY8C6f43aDqGmlccfLIY
	kISnxgWpNbF0VUvF9
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr208644975e9.30.1795424143773;
        Mon, 23 Nov 2026 00:55:43 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6bc8ce06sm20503412f8f.47.2026.11.23.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:55:43 -0800 (PST)
Date: Mon, 23 Nov 2026 09:55:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Florian Fainelli <f.fainelli@gmail.com>, 
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
Message-ID: <awP9_l7UNqElhewY@monoceros>
References: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>
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
	protocol="application/pgp-signature"; boundary="fwfemldnzzy4vyl7"
Content-Disposition: inline
In-Reply-To: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>


--fwfemldnzzy4vyl7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
MIME-Version: 1.0

Hello,

On Sun, Nov 22, 2026 at 06:03:00PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 17:52:20 +0100
>=20
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
>=20
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function =E2=80=9Cmxc_w1_remove=E2=80=
=9D.
>=20
> * Delete the label =E2=80=9Cout_disable_clk=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Not a big issue, but for me the commit log is too detailed, most of the
things mentioned here are trivially visible from the patch. So I'd just
write:

	w1: mxc_w1: Simplify probe routine using devm_clk_get_enabled()

	devm_clk_get_enabled() combines the functionality of
	devm_clk_get() and clk_prepare_enable() with an automatic
	cleanup callback registered to disable the clock in the error
	paths and at unbind time.

	Simplify accordingly.

> ---
>  drivers/w1/masters/mxc_w1.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
> index 06be7bf0b715..f40ea120127c 100644
> --- a/drivers/w1/masters/mxc_w1.c
> +++ b/drivers/w1/masters/mxc_w1.c
> @@ -98,14 +98,10 @@ static int mxc_w1_probe(struct platform_device *pdev)
>  	if (!mdev)
>  		return -ENOMEM;
> =20
> -	mdev->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	mdev->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(mdev->clk))
>  		return PTR_ERR(mdev->clk);
> =20
> -	err =3D clk_prepare_enable(mdev->clk);
> -	if (err)
> -		return err;
> -
>  	clkrate =3D clk_get_rate(mdev->clk);
>  	if (clkrate < 10000000)
>  		dev_warn(&pdev->dev,
> @@ -118,10 +114,8 @@ static int mxc_w1_probe(struct platform_device *pdev)
>  			 "Incorrect time base frequency %lu Hz\n", clkrate);
> =20
>  	mdev->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mdev->regs)) {
> -		err =3D PTR_ERR(mdev->regs);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(mdev->regs))
> +		return PTR_ERR(mdev->regs);
> =20
>  	/* Software reset 1-Wire module */
>  	writeb(MXC_W1_RESET_RST, mdev->regs + MXC_W1_RESET);
> @@ -137,13 +131,9 @@ static int mxc_w1_probe(struct platform_device *pdev)
> =20
>  	err =3D w1_add_master_device(&mdev->bus_master);
>  	if (err)
> -		goto out_disable_clk;
> +		return err;
> =20
>  	return 0;

This can be shortend to

	return w1_add_master_device(....);

=2E Looking at w1_add_master_device() there are error paths that don't
emit an error message, not sure they are all -ENOMEM. dev_err_probe()
wouldn't hurt.

> -
> -out_disable_clk:
> -	clk_disable_unprepare(mdev->clk);
> -	return err;
>  }
> =20
>  /*

Best regards
Uwe

--fwfemldnzzy4vyl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsD/4sACgkQj4D7WH0S
/k77kgf9EmPcIEwAzVRo6kECyMEJc45Xjnn9AdThD7oC/Gx6VUMQQbPauzt2UPVq
EPGTRco9qjVrbKq5TD+9PnMqvp5YpyujTitlI/4Ot30bdC17egDfWuTjZJ3tkh0J
yXyV1jzLTy2HUKizAclwIdiVYb+ma7idz7GXO4uab/wsXytomYiuffn41vxTC6uN
EStMlztHN7uFwxmiiies0bPR9k2pMqP8HbFcHI5b+DYJc3AGTwfZ9RUBWNrux7tb
V3yWHM69SXZzWDVhDEQd/mxBjlxfXztMiI14uz2I1W2cLjNd+7shMWip4SQTGrxi
gcS1M6jY+9uF29+WuZSxazEv+bsT5A==
=o1fQ
-----END PGP SIGNATURE-----

--fwfemldnzzy4vyl7--
