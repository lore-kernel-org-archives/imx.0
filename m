Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99483331EB9;
	Sun, 27 Sep 2026 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521606; cv=none; b=co6DGDVq8ca+Qvi0Y6MDvnDsEY5++vVSBLLWz37z7w1yorvHCXeH2ExUSEEUVUltRoxw+tAp1dcNTZMlBubak/YnPLvs3yNFLNTSckUq56X8pL9go/aBUVFrcC51mn4OwQuR9ScwHq5vz78TRvQ8MKWCwCNve0PRUyZWL7z5K0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521606; c=relaxed/simple;
	bh=xaIvBVMfsmSt9asnOfz6P8Mr2aTmlAU1GjqQl+6mpY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZAfSG8Kqr/NOral+Ih79226xfh9q3ZkI2kdowvGFWiGt16OMyPZex74tJFrgBQ5t+W2ioEAFm8jiq3SIS/47WMwfwcCjASNwjLXX/68sWzvdrepYgGxFr06ZGIZyi+nEicXCpdC2r4V0qMQiuUXvDzou9fT3QUvuR8AW5AyawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZxAvyVq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZxAvyVq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65E21F000FF;
	Sun, 27 Sep 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790521605;
	bh=1VvCMUObEM+J7A8tDNVaIAaqxzSCAlvELO5nZQjZnPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZxAvyVq2XLqlaRDZAYhsOQdKPVZV8P9hCMPORi8IFuKlvO8ziVO4hhLB+HpRigy9
	 wFzep0u08RCxqzJcb+zha8QyOuF4KTpwV06wpLHhCgiNBjO38dWd/Tq8IjTqrmImHM
	 pR0nc8b2GYRu2dcFEFYS7VmFdMrYdMrRpr189D/5203Jd9nZRVF8HheqoU9EkBVOn+
	 JMaCtbBWe0uOxoukaCo8bJ8R0a4u989fi71RpyLDT4JZSFSMUU0+j4lvbCxbjiFXf6
	 yhTmPz6x4hGVTNGeKn6HEdpPXcGRpqBmEr9GBx7fUuFUlM0nTkQCUbaPEKTFpFUDHa
	 Ah2rhmR0QLNOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] power: supply: bq25890: Add input voltage limit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260927145538.233548-4-vincent.cloutier@icloud.com>
References: <20260927145538.233548-1-vincent.cloutier@icloud.com>
 <20260927145538.233548-4-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:06:44 +0000
Message-Id: <20260927150644.D65E21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] power/supply: transient VINDPM limit due to write sequence
--

commit 3c4a08cfdbd118c7f60e9223379cfa47c0168057
Author: Vincent Cloutier <vincent@cloutier.co>

power: supply: bq25890: Add input voltage limit

The BQ25890 family supports an absolute input voltage dynamic power
management threshold. Read input-voltage-limit-microvolt from firmware,
enable absolute VINDPM, and then program the requested threshold.

> diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/suppl=
y/bq25890_charger.c
> index 741a45cc5f35d..71d6cf1796674 100644
> --- a/drivers/power/supply/bq25890_charger.c
> +++ b/drivers/power/supply/bq25890_charger.c

[ ... ]

> @@ -814,18 +818,67 @@ static int bq25890_get_chip_state(struct bq25890_de=
vice *bq,
>  	return 0;
>  }
> =20
> +static int bq25890_set_vindpm(struct bq25890_device *bq)
> +{
> +	int ret;
> +
> +	if (!bq->init_data.force_vindpm)
> +		return 0;
> +
> +	ret =3D bq25890_field_write(bq, F_FORCE_VINDPM, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return bq25890_field_write(bq, F_VINDPM, bq->init_data.vindpm);
> +}

[Severity: Medium]
Does writing F_FORCE_VINDPM before F_VINDPM create a transient VINDPM limit?

Because these fields are written via separate read-modify-write I2C
transactions, enabling F_FORCE_VINDPM before setting the actual F_VINDPM
threshold creates a brief window where the charger explicitly enforces
whatever stale limit was previously in the register.

If this stale limit is too high for the current input source, could it
cause momentary input current throttling during device initialization,
resume, or cable insertion?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927145538.2335=
48-1-vincent.cloutier@icloud.com?part=3D3
