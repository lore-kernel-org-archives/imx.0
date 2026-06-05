Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4501D4D90AC
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659010; cv=none; b=T3AmKEQjCS10zOz1I9GUfcIkMA4SctsycFMqaGPmCMkPjJRpTF98ZrjY19YbBun6OlKT5rJ4ZWQe6n7VynR20v0j6yBvrgFe+9/TEtY1kz+LIecpQ+vLyp4V9+VK01afc0D7l+RWhvCLylCZJZ3v+vOVL5lO7izcC7XvAD1nqWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659010; c=relaxed/simple;
	bh=wKDplRPe4SLIY1KSPPQUVoHnT9U+jBgg+MHfrpVBe0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTks24j1MDf+hoP5lvIc+AO7nQKyszX6IFL3IGSbqBf9hv40nqkkJ9Kn9/GOa0ihPbc5FuvrUvJrSJIvBhK4AKsOPm8g9sL44mfMZnIg05bPZfQWD3lpPv9NkAmzkPZnoGFmtnwzDAVaTRCdFVLbaSJU6Q5/o19pqSQr2s2MWz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCRzlRXz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCRzlRXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312FA1F00898;
	Fri,  5 Jun 2026 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780659006;
	bh=HVS7bYQbBAyFEAmBeqgw5R2BF8bSq76ygeTaJIAuS3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jCRzlRXz83wG5PVVV0wfjIyuzy1UqQiTP+dwJqdfIczRdjvkGTNt7cIYvpooqFYiP
	 lbAVU4BcsOl/ls+7ygskB4l2nh3T6QSDDoYAIfKybeUgB03j/dl/38bLR/Gn8//i3+
	 C6lhSMsp6jMIQBWQAlwuvpxvnpgSkptG/pKAqoMjBKvvreKOFYXq2HFPcYoBQQ7CKs
	 2ALKHR2npGyrZdXqCsGn+TfDHkuf3EdDZ7N+GQETB3zQG3NTc7R3NHDhQ0qR3eBuHn
	 014AimLin86iyAyibdQOWb9glEeclDk2DGR7ljTxyaqM9P+ZF6udyAYxo+9RJSiMVr
	 kPXITZa39dggw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, Frank.Li@kernel.org, olteanv@gmail.com
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-2-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-2-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:30:05 +0000
Message-Id: <20260605113006.312FA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The PHY device is marked as wakeup capable, but the driver lacks=
 the necessary PM callbacks and interrupt handling to actually implement wa=
keup functionality, rendering the exposed sysfs entry non-functional.
--

commit 8736c5d3dc323070e318c02e401cc5a5d6dd083d
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: set usb phy to be wakeup capable

This commit marks the i.MX8MQ USB PHY device as wakeup capable. This
advertises the capability to the PM core and exposes a power/wakeup sysfs
entry to userspace.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 88b804b2c982b..591ddf3460618 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_devic=
e *pdev)
>  					"failed to get tca\n");
> =20
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	device_set_wakeup_capable(dev, true);

[Severity: Medium]
Does this regression expose a non-functional sysfs node to userspace?

The commit message notes that the PHY supports remote wakeup, but the
driver itself does not appear to implement any PM callbacks or interrupt
handling to actually process the wakeup or check device_may_wakeup(dev).

Because actual USB remote wakeup is typically managed by the parent USB
controller and its glue layer, which have their own functional wakeup
sysfs nodes, could this create a dead toggle in sysfs where userspace can
enable wakeup on the PHY device without any actual effect?

> =20
>  	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-imx8mp-usb=
-phy-improvement-v4-0-b2ddf2f3862c@nxp.com?part=3D2
