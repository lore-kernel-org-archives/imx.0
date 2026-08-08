Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740FE145A1F
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 20:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786221161; cv=none; b=mZILft1pW2wuHJZZWWBkEnAxBsggTa/Kzm+g3CvBOtFceDp82Y74ZflwEY/6WlUSHCfIALugW89lWsLK5Paj0l2dje1lJij4wSpnaWwMVKikDHNY6RKajyoFPs0lqNeY5Ey9izZYpTyspCURryjzZ9pi3ZXRpMa+5LKqp+Bl/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786221161; c=relaxed/simple;
	bh=PKBKe2JHM8VZS4THu/7LbGHQYSPJuZuIiHZbqHgPPTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WaoAvRnSt/wK+bCUChgfFM/8mgrV6+FJQmW4ZiHc40g1AoBwZgW3M3KBrQYSIrCLVQqBfcVHtxZ/f2Aoyecq7/Z2IbYYp6VotsUYUnCinrtWY7A8t644kciVCVAYAKEsiLAHwmzIJvbwWecz/tvL5656fDZdF4tEPjAn1+tltjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE6eE68J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE6eE68J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58031F000E9;
	Sat,  8 Aug 2026 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786221160;
	bh=8tRDmk4vSKgCn4deVTbo1VoDtZxcEgDO0nSLyoogaj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HE6eE68JA6oQ2fLLVmVM5o5YxRcabedDWrOudFnKCPl0r+Nd76e0rs5uoHUB+ab24
	 vZMEZCGpkf3qIk2haN016ewuCZhencDEVQzZrXGN5Ln717NZso7d3KyPsudHntLO/q
	 R5NfVkVvAab1clzYvjNeJKzvUlcHlopedYb1Bt/x2ephRvs4ii50T6qouoCagM7Ls4
	 RGSXoRgn7RfT5yp1jFg0b8oJcMR3Wif7rHQ1JS711Y7rH+ZgopYG0EVCADcjb+p6K4
	 rbIj7TM9FkQ0Y2LiGQhlrmvilTLgVzI7ftr1lXvZBdfKypByBcpeemIqLqgblaB9ep
	 S/A0HvuVitIPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thermal/drivers/imx9: Constify struct
 thermal_zone_device_ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
References: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 20:32:39 +0000
Message-Id: <20260808203239.C58031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe asynchronous `pm_runtime_get()` used immediately prior to d=
evice register access.
--

--- Patch [1]: [PATCH] thermal/drivers/imx9: Constify struct thermal_zone_d=
evice_ops ---
commit a5aeff30f3e13d6747636801e7e678ac7b06d113
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

thermal/drivers/imx9: Constify struct thermal_zone_device_ops

Constify the thermal_zone_device_ops structure since it is not modified in
the driver. This moves the data to a read-only section, improving overall
security by protecting the function pointers.

> diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_ther=
mal.c
> index 25915bb702bea..892a25440e06e 100644
> --- a/drivers/thermal/imx91_thermal.c
> +++ b/drivers/thermal/imx91_thermal.c
> @@ -225,7 +225,7 @@ static int imx91_tmu_change_mode(struct thermal_zone_=
device *tz, enum thermal_de
>  	return 0;
>  }
> =20
> -static struct thermal_zone_device_ops tmu_tz_ops =3D {
> +static const struct thermal_zone_device_ops tmu_tz_ops =3D {
>  	.get_temp =3D imx91_tmu_get_temp,
>  	.change_mode =3D imx91_tmu_change_mode,

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem with the
imx91_tmu_change_mode function referenced here.

Can this result in a bus fault if the device clocks are not yet enabled?

Looking at imx91_tmu_change_mode(), it uses the asynchronous
pm_runtime_get():

drivers/thermal/imx91_thermal.c:imx91_tmu_change_mode() {
	if (mode =3D=3D THERMAL_DEVICE_ENABLED) {
		ret =3D pm_runtime_get(tmu->dev);
		if (ret < 0)
			return ret;

		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE | IMX91_TMU_CTRL0_THR1_MASK,
			       tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
...
}

Because pm_runtime_get() queues an asynchronous resume and returns
immediately, writel_relaxed() could access memory-mapped registers before
the PM workqueue has completed the resume and enabled the device's clocks.

Should this use pm_runtime_resume_and_get() instead to ensure the device
is synchronously resumed before register access?

>  	.set_trips =3D imx91_tmu_set_trips,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/5cce9ea713edcf2aa3c=
0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr?part=3D1
