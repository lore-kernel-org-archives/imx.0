Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D145271471;
	Tue, 12 May 2026 03:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556942; cv=none; b=LkLW+hD87kL5Mi/cBrcYhXrmmDsVn8ZkNY0ziYIpVjcC8kr3wbnYF6WLHV5mxHwjSTpYRnOxBswwpns/39yrJGa+hn3+Wxz0tijx+CaG8XbvsIocQsb8Cj1lFhLsspjnxoR5Dxp0lWEINZc2YEk1aes+GU4O9LWAR9vo/d7oD4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556942; c=relaxed/simple;
	bh=24giURlup5Rw9r3TcXRMBOBfwhI0bS0J4TuA+SIIe90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lShm480xScF9u9oj7I3XUcjbL6v8HH7otyFR1HsmI/WgA8qI3GcgwbaMIZwgqzfhg4Yam41wRulkqEC0SXp4b7l3P+MCSsi9V7UScs7AAlvi8tCF/SPgWSA89xPl5kGpBJcmrn75LIFp4mej3oOLW71iK9v6wDfjFNyWu002IqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMh71eVx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMh71eVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AB5C2BCB0;
	Tue, 12 May 2026 03:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556942;
	bh=24giURlup5Rw9r3TcXRMBOBfwhI0bS0J4TuA+SIIe90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YMh71eVxUyQKewxTJYARP5bY7xMfWc4O2UHq+NZ06aTCRp6AkSe+v5DJQySyhVZwM
	 RRvlI1IEkGusVMvPHFapTCT3r37P5H5VKJv1p8kKfh1+L5zKB7N/zJqwm6RbTl4dyD
	 Sy7XRtZ6U9oCNfEdZHG+4tgxfKbMh76x94Pslo6I+0OeVIXbht9B+nXTwXb25UgQyQ
	 c7bcVahAHMZtzTPMk+gaoUqjTV1bD4yUX9O6KdNqRSP1SGitNM5hT4SFKpNvSDG7i2
	 dEKRLWVUjwMFO/H/3SERGfngvfdf4RK9fd1Xdph9gaKqlyVhQNQjyAHo0EwxdWO546
	 IEbyNhZMtJjWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/21] drm: bridge: dw_hdmi: Add common suspend
 helper
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev
In-Reply-To: <20260510124111.1226584-16-jonas@kwiboo.se>
References: <20260510124111.1226584-16-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:35:41 +0000
Message-Id: <20260512033542.41AB5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] NULL pointer dereference in dw_hdmi_rockchip_suspend if system sus=
pends before component bind.
--

commit abc5ed0537352dd111abc436d5fc9ba8787addd8
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Add common suspend helper

This commit adds a dw_hdmi_suspend() helper as the suspend-side counterpart
to dw_hdmi_resume() and calls it from the i.MX8MP, Amlogic and Rockchip
platform PM suspend callbacks. This routes suspend handling through common
dw-hdmi code.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/dr=
m/rockchip/dw_hdmi-rockchip.c
> index 0dc1eb5d2ae39..9677424075eba 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -651,6 +651,15 @@ static void dw_hdmi_rockchip_remove(struct platform_=
device *pdev)
>  	component_del(&pdev->dev, &dw_hdmi_rockchip_ops);
>  }
> =20
> +static int __maybe_unused dw_hdmi_rockchip_suspend(struct device *dev)
> +{
> +	struct rockchip_hdmi *hdmi =3D dev_get_drvdata(dev);
> +
> +	dw_hdmi_suspend(hdmi->hdmi);

Could hdmi be NULL here if the system suspends before the component is boun=
d?

In dw_hdmi-rockchip.c, the probe function calls component_add(), so the
platform device is registered before the driver's private data is allocated
and set via platform_set_drvdata() during the bind callback.

If a system suspend occurs after probe but before bind (e.g., if the DRM
master is deferred waiting on other components), dev_get_drvdata(dev) will
return NULL. Accessing hdmi->hdmi would then cause a NULL pointer
dereference.

Although the pre-existing dw_hdmi_rockchip_resume() function suffers from t=
he
same missing check, this patch introduces the issue into the newly added
suspend path.

Should an explicit check for !hdmi be added here, similar to how it is
handled in meson_dw_hdmi_pm_suspend()?

> +
> +	return 0;
> +}
> +
>  static int __maybe_unused dw_hdmi_rockchip_resume(struct device *dev)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D15
