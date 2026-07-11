Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6265D495E5
	for <imx@lists.linux.dev>; Sat, 11 Jul 2026 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756839; cv=none; b=PSS9qpZ6kf4HdoLkK4PuzGwOQ62uEMAI/b3HuyiUX/NaqJrJSVWOnOldY/I7zMGSUvOpuAsSHhzOZg1I5skVbLDbyEVuZz167/seGPhGcVUp/M1wCjMq7DHKZIgRSJAAqdd6Ab5bc528Nv1aD1l/cENbvUVID6IvdBI0b/06w3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756839; c=relaxed/simple;
	bh=xRHCFWDEJYFPNj1oQTIPlixrTq4elXtsIKzf0rAUXlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJylL9bGLxDOYnIF7uqWBHbfue8PfUsiR2eyWrAo3nbTbJjUpzD6hcHsfkiOwDsdU1zptG03RbhhZuj82OM2LEEIabo6ruZn53V+aTvNbL4wZyXVyQ9jrHsjojAfBFDhj+0kxL2k9w5cVZYI+hlDI6Bqx8ttJM9pG/h0siIRook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB+DsTC8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB+DsTC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E7D1F000E9;
	Sat, 11 Jul 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783756837;
	bh=FpES4+E7CilGCoTvnpZ42KcA3UC0dK+d8Uu2ukALZ7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VB+DsTC8z2gR7GlaYtKTHaMkDjbybvYwmGmwN3B03HzT/anvXE4/g3RkquhNc65oJ
	 3Fg5ovHvOS+fRs8kkOPb3sUzBATUt4uGoXWP66Lhq4dbbweEwJ6qHGDm1ryMV3zWWa
	 +Z5/qoVUKZpUZ3MLXXrsb+N1PWSPS990eHStiQ/Wb6Aa/RIkno9cewBlrXxuRlWtDS
	 q3h+obJkFXIHjtXP5ulGPYyE69Ke7cTfo7Qt5ycI1WZFIyCKKjt+LvCCnCeY6abxgR
	 Oz70cr/24ft9maQiuB3izRZI7F5SH739O3fyp14W4aGKV6UJzIPd3Ok31/2Md0B12o
	 EiLkefq5gUkeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net V2] net: phy: motorcomm: read EEE abilities in
 yt8521_get_features()
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaoning.wang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260710080018.1070789-1-xiaoning.wang@oss.nxp.com>
References: <20260710080018.1070789-1-xiaoning.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 08:00:37 +0000
Message-Id: <20260711080037.A0E7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The call to `genphy_c45_read_eee_abilities()` accesses MMD registe=
rs without ensuring the PHY is in the UTP register space, potentially execu=
ting accesses on the FIBER space.
--

--- Patch [1]: [PATCH net V2] net: phy: motorcomm: read EEE abilities in yt=
8521_get_features() ---
commit c7203820fd5ed8cfc23d1995e9a795cf1f8d31b3
Author: Clark Wang <xiaoning.wang@nxp.com>

net: phy: motorcomm: read EEE abilities in yt8521_get_features()

This commit calls genphy_c45_read_eee_abilities() at the end of
yt8521_get_features() to populate supported_eee for the YT8521/YT8531S PHYs.
Drivers implementing .get_features are responsible for reading EEE abilities
themselves.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 5071605a1a117..818098a78d23d 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -2490,7 +2490,8 @@ static int yt8521_get_features(struct phy_device *p=
hydev)
>  		/* add fiber's features to phydev->supported */
>  		yt8521_prepare_fiber_features(phydev, phydev->supported);
>  	}
> -	return ret;
> +
> +	return ret ? ret : genphy_c45_read_eee_abilities(phydev);
>  }

[Severity: High]
Does this code call genphy_c45_read_eee_abilities() while the PHY is
potentially left in the FIBER register space?

When yt8521_get_features() calls yt8521_get_features_paged(), that function
temporarily switches to the requested page (e.g. UTP) but restores the old
hardware page before returning. If the PHY was previously operating on a
fiber link, the restored page will be the FIBER space.

genphy_c45_read_eee_abilities() performs MMD indirect accesses using MII
registers 13 and 14.

If the PHY is currently in the FIBER page, won't these MMD accesses hit the
FIBER space instead of the UTP space where the MMD registers actually resid=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710080018.1070=
789-1-xiaoning.wang@oss.nxp.com?part=3D1
