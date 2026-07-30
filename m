Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CE372EEC
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378525; cv=none; b=NlLrdAGm62OEkHVN0AXqYL18OSn3AyWVv5kolSx+cURVctRfz9pkTdI0xQNJv/yCdUtkg+X+rTvM52A9m+GCpdjkELXfzrBmZdBDCnaP3E48zZS34Zp27FuByvYRwGfvXfqyFpNqgpsmPXCUhiumQpV6ITf8TFQJPREK8kbcWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378525; c=relaxed/simple;
	bh=6+Y139n67NIfvMvWWu3DUPqdcEIgsdAxYYYTB9QZ9s0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tvyx3DXMX9trfdYflRgpz+R/CBx5jUtREpW+BGqL4xHa6a8xVkVuvbclB56bhViLIEbKrs7UsAFifOfpivCv4mH4a97DB1UO9pE4QNikvlsWi32iTNfuUNZfbIg/oS7FWc5CEhYzz5EZj41GCXgBzV32NMDAfRdEF0pFEL982pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=rnTSlVb1; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="rnTSlVb1"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E646AC3433;
	Thu, 30 Jul 2026 05:22:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E646AC3433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785378144;
	bh=Q3Zb6u8DIfuxfJ+tb7Cxkkz4MhlqA5moKjdvwymOaMQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=rnTSlVb1ZYSrcby0b9KUQxm4EUMOpcrcafic1OUDVrgTeOcewyXz2EVyY3/Ac+VRX
	 o791+61c1G2NxZCGTij9F4l2Bq7aSlUFTdwmtbv0GHlazJfdLCaTTBK5JFTnldWoW+
	 kfMMc47QuoZGOZ6d+RCyacin1pbFs/zqnlXwqvYywdGGHXmAQfR6Rrp0azWO/ohLW7
	 5DML1WQRU4TqlZ3/ul+QpUMuek1+VdwLbiQjVEvJrrxL25a5KODpy/FSPsATNT6bGK
	 quRQe2eYKL2/3nF/TO2TzqzkKPrKSeQ/TWPGrBXBECHPYHFXP4t84mG/hdn28xUHvI
	 Gj372Y6pZwDQw==
Message-ID: <5ee0c572d017ca3ee3503c4e1901b8ac5d4f5966.camel@rendec.net>
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to
 devm_pm_runtime_enable()
From: Radu Rendec <radu@rendec.net>
To: Fabio Estevam <festevam@gmail.com>, tglx@kernel.org
Cc: Frank.Li@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 29 Jul 2026 22:22:21 -0400
In-Reply-To: <20260729221416.499781-1-festevam@gmail.com>
References: <20260729221416.499781-1-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-07-29 at 19:14 -0300, Fabio Estevam wrote:
> imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
> does not disable it.
>=20
> Consequently, runtime PM remains enabled after unbinding the device,
> and rebinding it triggers:
>=20
> Unbalanced pm_runtime_enable!
>=20
> Use devm_pm_runtime_enable() to automatically disable runtime PM when
> the device is removed.
>=20
> Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Use devm_pm_runtime_enable() (Frank)
>=20
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be3..ba1203d3edd4 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -263,7 +263,9 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0	platform_set_drvdata(pdev, data);
> =C2=A0
> =C2=A0	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		goto out;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0out:

Reviewed-by: Radu Rendec <radu@rendec.net>
