Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35B3CAA5F
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979070; cv=none; b=aaISQr/Rtc7xQFXf7/XaFWR7dahuK0E42mIE8Rg7VSCnNiXOG8+okzNn7/Re105WW4csYVgsNxP7AVLM/RJ44hdzTC0QJFxKRF24KGxIfmxPqScLcmNUwW68qMBz6eg+cGBoEYkI2VzdoIk2tWjlGskJhCxEO8sObe5LtQAvlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979070; c=relaxed/simple;
	bh=SoznX48Lc5tjiNftEh/MMwDC3M+9GjVZvEsdN5LRwEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dI5d/f2zFDYd5Q5Xo/ArCMy8e7wphCL6NDIVs7Sbb5P3OM7f752JnYpvKdbhXCa4jfF0g6IMmcEg/2+58M7Mn2AL3EdFrebzBkV/6teKGHxbFBvIfsPNu2/f3otpwQewdBJ4nkufBEx2s7zE69Qihyf7XuMMi1OBgXIjIdp366I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=la1yQKc3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="la1yQKc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DCC1F000E9;
	Thu,  2 Jul 2026 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979069;
	bh=qjyrfAtAAMMFMspjYcRPMZAeVxutGpCc3ymu9bwJ6/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=la1yQKc3ih+/Lvl3wQPgNZ3Wj0/xm/sbWcesu424arHLDMwzh+s4c/usbzQNrMzwm
	 DVqlb5g0s5RM3ZAxngqr9loejzU4tfI2IZoHj/PpP1W4sc7UqKACKcJeJlWdkoDQtv
	 /1ixyCdbc+3HgBU9JMcyR/wYnnah7giUA1dezaB80j0bKVEwO9kXfrwT+RnYlHYskE
	 v3JOZo1/wEEhM17jhdKXV17tDijr2XDQfDdG33M/vYCA03olbhfUFaQWhLzSLBzVzX
	 VeZbN3XCFaAMalDJFXdRhNjcOUoVDhkZxTbEmpn3wXYDTYwsaaebQCb8o9YaWMjkqB
	 0rI0PZ2wBXonQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: phy: motorcomm: read EEE abilities in
 yt8521_get_features()
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaoning.wang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260701075730.133707-1-xiaoning.wang@oss.nxp.com>
References: <20260701075730.133707-1-xiaoning.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:57:48 +0000
Message-Id: <20260702075749.16DCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing early return on the error path allows execution to fall thr=
ough, causing unnecessary MDIO reads during a failure state.
--

commit 4dca8ceeaa7210baaf997bd7af025147319f1c9b
Author: Clark Wang <xiaoning.wang@nxp.com>

net: phy: motorcomm: read EEE abilities in yt8521_get_features()

This patch updates yt8521_get_features() to call
genphy_c45_read_eee_abilities() so that EEE abilities are correctly
populated for YT8521/YT8531S devices.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 5071605a1a117..e69c453af574b 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -2490,6 +2490,9 @@ static int yt8521_get_features(struct phy_device *p=
hydev)
>  		/* add fiber's features to phydev->supported */
>  		yt8521_prepare_fiber_features(phydev, phydev->supported);
>  	}
> +
> +	genphy_c45_read_eee_abilities(phydev);

[Severity: Low]
If yt8521_get_features_paged() fails in the first branch of this function:

	if (priv->reg_page !=3D YT8521_RSSR_TO_BE_ARBITRATED) {
		ret =3D yt8521_get_features_paged(phydev, priv->reg_page);
	} else {

ret will contain an error code, but there is no early return check before
falling through to this new call.

Could this cause genphy_c45_read_eee_abilities() to perform unnecessary
MDIO reads during a failure state?

> +
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701075730.1337=
07-1-xiaoning.wang@oss.nxp.com?part=3D1
