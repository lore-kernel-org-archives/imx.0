Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031519A2A3
	for <imx@lists.linux.dev>; Sat,  1 Aug 2026 19:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610931; cv=none; b=Kw12ULp7Tci137+5Z0MLFt7edOaGAcfyqVO/R2ghhPi+t3uQ6G0pTFS4MS0BdYxjh7Nr+Q5DAxZKQ49dKhiG4LrlJ1BVwJHwrXrEBmHmhsiYhYH+U4ssDxupoZb3znEVQttVoIXyYbBI5jiPKZvzQwhvL2pfALWSveOM16EIpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610931; c=relaxed/simple;
	bh=kT9fF6kOTKoc7tuu1pS58ocx9q7oiC0dHO91QBbQQJI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YlALwzoHl2FvTaUAaGb3HdkGaV/64SUjfgnT3J/ByAx4u+xSn27fZ3UwzqgxDa1bnECiVGMW14iFB4d8+VjqoAkCYJKiJGDtaL9Zs2uOUWYHsKlUkVpZH4MRUTSjap3qEHGH1z5ZYWMGr22xa0vqcXXPNiBiq+CBw6/tDhashNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=S2CJh3Lx; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="S2CJh3Lx"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 99898CC485;
	Sat,  1 Aug 2026 21:54:31 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 99898CC485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785610472;
	bh=uYuXtkDXJdV/OPqkwZ15Jtxi29IHOn2PUcYM+AOSBg4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=S2CJh3Lx9TwY+C99qJ84kurYFh5l0YsC9qy8i10Tv2/MqeoFeyvW34dCjAXvpsUtY
	 nZxsKO/TE8bEE1DQ7smTnExsUDDilFV7/bn28FOYthvFJmNPSyhErt3Iu5iS69dls6
	 er+krblFaocO5amHpimQgzc2UvZqjupNTQAuesAy2hb0nhfawQIU2SlIEp2Q459ozY
	 oK5EZicAHQvTdWvRIFc956DwPPrfmIJcqbj1us8poDsjJdFBit6CRqvKTUKFcplTZx
	 6tXnaAdhloTKjzs3t84ALb5L2edsGalLmAg7xNPiZqcq2eRZA/ulsZocp1ez8VvwTT
	 /oAyAtdUPiL8g==
Message-ID: <f124515c087a5e7259c2ecc90a0f6e47a7619f4c.camel@rendec.net>
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to
 devm_pm_runtime_enable()
From: Radu Rendec <radu@rendec.net>
To: Fabio Estevam <festevam@gmail.com>, tglx@kernel.org
Cc: Frank.Li@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 01 Aug 2026 14:54:29 -0400
In-Reply-To: <5ee0c572d017ca3ee3503c4e1901b8ac5d4f5966.camel@rendec.net>
References: <20260729221416.499781-1-festevam@gmail.com>
	 <5ee0c572d017ca3ee3503c4e1901b8ac5d4f5966.camel@rendec.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-07-29 at 22:22 -0400, Radu Rendec wrote:
> On Wed, 2026-07-29 at 19:14 -0300, Fabio Estevam wrote:
> > imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
> > does not disable it.
> >=20
> > Consequently, runtime PM remains enabled after unbinding the device,
> > and rebinding it triggers:
> >=20
> > Unbalanced pm_runtime_enable!
> >=20
> > Use devm_pm_runtime_enable() to automatically disable runtime PM when
> > the device is removed.
> >=20
> > Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> > Changes since v1:
> > - Use devm_pm_runtime_enable() (Frank)
> >=20
> > =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 4 +++-
> > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-i=
mx-irqsteer.c
> > index 87b07f517be3..ba1203d3edd4 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -263,7 +263,9 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
> > =C2=A0	platform_set_drvdata(pdev, data);
> > =C2=A0
> > =C2=A0	pm_runtime_set_active(&pdev->dev);
> > -	pm_runtime_enable(&pdev->dev);
> > +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> > +	if (ret)
> > +		goto out;
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0out:
>=20
> Reviewed-by: Radu Rendec <radu@rendec.net>

I take that back. At a closer look, I think both issues identified by
Sashiko are valid. While the second issue is marked as "pre-existing",
the proposed patch introduces a new path where the issue can occur
(leaking the irq domain).

While at it, I would also fix the existing issue that the bot
identified, where the domain is leaked on this path:

        if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
                ret =3D -EINVAL;
                goto out;
        }
