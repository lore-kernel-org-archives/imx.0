Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363758;
	b=YeVDwQKHD8QSInlQn42SZ2dmFB7qe+XlJeQqTrJHbSIXwncYzXbIk2mchXgPD7qcTuRh
	 zuSnSkI3fDbfQie9Hunlbq18tI44U8SHVTox9LwNHx5LXqsnDuudG50n1BF/DKFqHhFfy
	 MZIcaEGXV5Uu6tMxjwOBRbV8lFW+CVqQg/7FO+UKd/7jO6O7wZcCvjy7lXLSiU+bhP21j
	 4jpBVR25y7fnKdsu6BI6oKW2alLA7Twqcsf57r1AR37ruG+aHUFIdkAFunhcyAToAbYSX
	 KJc5tal4zCjw745IY60SnwvyZATd1BcsKOcS8P+sJEpjya7G/YBDbevs/ikueKUfbTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ptXAN+pDLbRscCpamzHbjZyA6UzhOjgaC+p8FfiOPZY=;
	b=bRXSUihyO8zcrolgWsPfoZzpooOBxDfsm81MZ/l3+bycubbzy3z/vZSwdOTNtciJ14uE
	 oyu+nQKO76yB2cGHALv38D3HYs7ciO8JO7C8POhxBmyX9sYvolVF5lyP9iXrlNNqOGexL
	 6/ralRHlnJWnyCumlxaVEnpCrLlgzyMl7LbNi40NTSJTwdwSX0Oe+jaw2VniK4DU7rzf2
	 /j206p+KLMFPJb3fDsQCBk9m+6dxPfe8Dn8wAKbZL/nzfIsZIyDnL9p+HDiDKNV3s7WUt
	 yzEeMekUIyiAaj98JqK/FaQDEa8cFjKG37WmrKxjMslkov7rjl10vjBl/2wMpCdtwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6mhu4vu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0C606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6mhu4vu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B271F000C4;
	Sun, 22 Nov 2026 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363757;
	bh=ptXAN+pDLbRscCpamzHbjZyA6UzhOjgaC+p8FfiOPZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6mhu4vu7aNekTKx28HxSLg6nkqgRoMO70K6GBJmWzhOwbVoi2OMENvVHhz1HwfiN
	 3gidpzWjB+jg56NjTGV3GES829hmbemsaMd7fulAqWNodYQgBdeyy+UChWvdyKHVtT
	 vqUiWOXcht45fm/XOrFemdA5YbNfKkLAqJR8KXHSlKgl2d8jwDocHoTax38vl4yBD/
	 yteVNsefwMJtSe7XEvM7RSoDUGSoSGDB4vvmXPZZZfvDdHXjMI0aEdjET3Mezn+oE3
	 z8f9aOW+26P44DNRtQj7Dv9kYZiZC857RW6wNFvpbJeKst8EaTSmTtqiBaxeqSZn8c
	 gEnU8OhEWlGGA==
Message-ID: <sashiko-outbox-228085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left
 on by the bootloader
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261122155514.10289-4-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
 <20261122155514.10289-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:09:13 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] pmdomain: imx8m-blk-ctrl: bus domain powered without notifier
  in probe()
--

commit f992fc5ceac2e326f3584945dd2bae1b81d7e7b6
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader

This patch reads the blk-ctrl registers during probe on i.MX8MN DISP
blk-ctrl to detect domains left on by the bootloader and registers them
as active with runtime PM and interconnect references held.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 7d6735728d8c6..99d75bfb69e9b 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c

[ ... ]

> @@ -250,6 +322,17 @@ static int imx8m_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  					     "failed to attach power domain \"bus\"\n");
>  	}
> =20
> +	if (bc_data->boot_state_readable) {
> +		/* Keep the bus domain on while the state is read */
> +		ret =3D pm_runtime_resume_and_get(bc->bus_power_dev);
> +		if (ret < 0) {
> +			dev_err_probe(dev, ret,
> +				      "failed to power up bus domain\n");
> +			dev_pm_domain_detach(bc->bus_power_dev, true);
> +			return ret;
> +		}
> +	}
> +

[ ... ]

> @@ -347,6 +444,9 @@ static int imx8m_blk_ctrl_probe(struct platform_devic=
e *pdev)
>  	if (ret)
>  		goto cleanup_notifier;
> =20
> +	if (bc_data->boot_state_readable)
> +		pm_runtime_put(bc->bus_power_dev);
> +
>  	return 0;
> =20
>  cleanup_notifier:
> @@ -356,9 +456,13 @@ static int imx8m_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  cleanup_pds:
>  	for (i--; i >=3D 0; i--) {
>  		pm_genpd_remove(&bc->domains[i].genpd);
> +		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
>  		dev_pm_domain_detach(bc->domains[i].power_dev, true);
>  	}
> =20
> +	if (bc_data->boot_state_readable)
> +		pm_runtime_put_sync(bc->bus_power_dev);
> +
>  	dev_pm_domain_detach(bc->bus_power_dev, true);
> =20
>  	return ret;

[Severity: High]
Does resuming bc->bus_power_dev here before dev_pm_genpd_add_notifier()
skip imx8mn_disp_power_notifier(GENPD_NOTIFY_ON) when the bootloader
leaves DISPMIX powered off?

When pgc_dispmix is initially off, powering up bc->bus_power_dev without
bc->power_nb registered leaves the DISPMIX bus clock (BLK_CLK_EN BIT(8))
gated and bus reset (BLK_SFT_RSTN BIT(8)) asserted for the GPC ADB400
power-up handshake.  Because the temporary reference is only dropped at
the end of imx8m_blk_ctrl_probe() via asynchronous pm_runtime_put(), any
consumer domain that powers on after of_genpd_add_provider_onecell() or
devm_of_platform_populate() while bc->bus_power_dev is still active will
not trigger GENPD_NOTIFY_ON either, leaving the display bus in reset.

Similarly, on the probe failure paths, bc->power_nb is either not yet
registered or already removed at cleanup_notifier before
imx8m_blk_ctrl_put_boot_on() and pm_runtime_put_sync(bc->bus_power_dev)
power down the bus domain, skipping GENPD_NOTIFY_PRE_OFF and causing the
GPC ADB400 power-down handshake to time out.

Could dev_pm_genpd_add_notifier() be registered before
pm_runtime_resume_and_get(bc->bus_power_dev) and removed after
pm_runtime_put_sync(bc->bus_power_dev) in the error path, matching
imx8m_blk_ctrl_remove()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122155514.1028=
9-1-dario.binacchi@amarulasolutions.com?part=3D3
