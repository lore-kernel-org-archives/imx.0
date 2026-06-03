Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248113074A1
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456124; cv=none; b=svY1i1M7xL/ZfW/Ipk7FYSgXtwEU7akC7TPe6NDHEH3XniGAszDBwwyOtsKGC62IP2PYoW9XhCq32NJCRFnihh3oxporbqYHezdA3wGit3wUSIKB/B5MN5suG1dZEgJZkuGH/HDx2hJHp15Xmqme0NDwirG1+HQ7XCsSTS/1WOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456124; c=relaxed/simple;
	bh=mU9sZ8BzCzetjkloS22nt3tdYPVDwzXdNW8pdcpDfKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L7FdP/OPDfxVWhs0coMtKM0n40QaptpyUA/PTRleQRIlO0mKg+iyx1iv/PAD2WPVEZGU15acBBLI6bRYb3U26vjQjcp7Ff4fJ5mN7g1zApUXv4UnMteBdVBEPGXBSeY4Nk1GJ+HjgD63Qr/GOW6loJigtUDdRigeoqmuyXxt5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/BrmDsH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/BrmDsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929931F00893;
	Wed,  3 Jun 2026 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780456122;
	bh=8/zq/vy2Mc8T9DVf3kBOr25Ulj5rR4oY42c0q1+nziM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R/BrmDsHNyfYTAfoDdR1O48qiMruQNhrVz6PUd8YiBX62IKEg6iN7QReARlnrJML1
	 qQz3zStJNZLBARaMGBaA2uzd+hUtzCYAyPWDk1EPNrbobYQmoYWD3pwY5UAmoQ1zCt
	 UV+H/zxlCT/bWV0jwGfm5Bi/K4/rb51VXMCeLvACY7Al50hU3KCXXPljXWwsquWkbD
	 HhKOSzn43Orpp9pV1cfXpc0ndvnlhr59goX4aq8XULbec62808JCAakP+BBWBCcjwE
	 YdFW17naN7qMMb5lw/xn8Wknsyg5IMysvT0U3wWWDRBn5UGOxwvRoCm1PVCUHSfSNj
	 sYTDXjZHU9EPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] serial: mxs-auart: rework clock handling in
 mxs_get_clks and probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603025857.287148-2-rosenp@gmail.com>
References: <20260603025857.287148-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 03:08:42 +0000
Message-Id: <20260603030842.929931F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional execution of `clk_prepare_enable(s->clk)` in `prob=
e()` causes a clock enable leak and power regression for non-ASM9260 device=
s. Note: I found the fix later in the series in patch "serial: mxs-auart: f=
ix IRQ registration ordering and manage console clock".
--

commit 6dcd08fa908a611decc8b93570ddfa7ca65af26c
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: rework clock handling in mxs_get_clks and probe

This commit reworks clock handling by moving the mod clock enable into probe
to avoid CLK_SET_RATE_GATE failures and uses devm_clk_get_enabled for the
AHB clock.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..8d050ceb72d2f 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
[ ... ]
> @@ -1604,17 +1592,21 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D clk_prepare_enable(s->clk);
> +	if (ret)
> +		return ret;
> +
[ ... ]
> @@ -1697,10 +1686,8 @@ static void mxs_auart_remove(struct platform_devic=
e *pdev)
>  	auart_port[pdev->id] =3D NULL;
>  	mxs_auart_free_gpio_irq(s);
>  	iounmap(s->port.membase);
> -	if (is_asm9260_auart(s)) {
> +	if (is_asm9260_auart(s))
>  		clk_disable_unprepare(s->clk);
> -		clk_disable_unprepare(s->clk_ahb);
> -	}
>  }

[Severity: Medium]
Since clk_prepare_enable(s->clk) is now called unconditionally in probe for
all device variants, does keeping the is_asm9260_auart(s) check here cause
a clock enable reference leak for non-ASM9260 hardware when the device is
removed?

I noted that this is fixed later in the series by the patch "serial:
mxs-auart: fix IRQ registration ordering and manage console clock", but
would this intermediate step break bisectability by introducing a temporary
leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603025857.2871=
48-1-rosenp@gmail.com?part=3D1
