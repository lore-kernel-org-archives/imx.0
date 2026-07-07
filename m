Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A234404F;
	Tue,  7 Jul 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433504; cv=none; b=crvAigkBRVyNP8F8liQ3aSk+4Ot8jrBLB7iyM/Z68oOaq0RrkmH4DitGgTRMG0iJLVr7a2o21o8mWh54vxwjMZioPZIdeoZcO2j+OSw6kCUEmF6tcGPkQ8LlLBeyDJELOesPHD6wPum853rdv/frlK7weySCowWyhLuNucS/Hh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433504; c=relaxed/simple;
	bh=tLKpu6iMm9AbICbbBjq+D5Jx5mXRs6tTz1gGq3C0PBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LbFLj5DgHAvqvNc+EmLb+l/5ObdJVKjMzK2unxUBXAeMShbskQJ8M2xwWH8HdKUl/emAoJHHw0XWU4CWBrnY/bqJOHPgjGz+R87XzFN0QoVeCWTuoNKNWA5Tsot5I+b/8hYvP9+jDhSUgwiByXs5gEkv6Wy2xWmRT9j0W2uiIc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIIAVhQL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIIAVhQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76F61F00A3E;
	Tue,  7 Jul 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433500;
	bh=maxRYiGuvp3sk94iMBSr3HRC125ilQL8m9e/yyGjfeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIIAVhQLOJ7397SssCcXiHVSdL6tx/XNqk3SbED8xhv7Fc1VjuLrnhouLp3XXV63p
	 KErkYVtjVOR5dY+3HhKDViWREHeWvXIh6tzxRnb3cKY0J4+z+dM8BcW4Te0Q+kGPbM
	 S4jCtA1gd6wXNACIDHuHPQIQtRfM7sCvevsBu2fYaxZVTm0jZhQyJUaULnKZbCLNh2
	 k3XmeitDRWlG5smdkZWxv5aX4aNip/ba1V3E3XBwg74uDWjumVRZY3AWbW8omlaNws
	 8TByuiPPRwCLpECyxqz4Q5Fr/Lop1UqIiFMLk3Cl0hTqO9tlfWl40SZWW7z+T7HUOK
	 G/DM2QIyc0L6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:11:38 +0000
Message-Id: <20260707141138.D76F61F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling phy_set_mode_ext() with statically cached ethqos->phy_mode=
 ignores dynamic phylink interface changes, leading to incorrect PHY perfor=
mance state.
--

commit 1aa35b54e2c1e3097800bf61ac8665f69589631f
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: stmmac: qcom-ethqos: set serdes mode before powerup

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is done ahead of adding support for the
firmware-managed EMAC on Qualcomm sa8255p.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_de=
vice *ndev, void *priv)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +			       ethqos->phy_mode);

[Severity: High]
Does this ignore dynamic phylink interface changes by always using the
statically cached ethqos->phy_mode?

At probe, ethqos->phy_mode is statically assigned from the device tree.
On interface up, stmmac_open() calls qcom_ethqos_serdes_powerup(), which
calls phy_set_mode_ext() and then phy_power_on().

Later, when phylink resolves the link and dynamically switches the interfac=
e,
it calls ethqos_mac_finish_serdes() which calls phy_set_mode_ext() with the
new dynamically negotiated interface mode. However, because the PHY is alre=
ady
powered on, the SCMI PHY driver caches the new performance state but never
applies it to the hardware.

If the user subsequently toggles the interface (ip link set eth0 down/up),
qcom_ethqos_serdes_powerup() is called again. Will this pass the stale, sta=
tic
ethqos->phy_mode instead of the current phylink mode, thereby reverting the=
 PHY
to the wrong configuration and applying the wrong performance state?

> +	if (ret)
> +		goto err_out;
> +
>  	ret =3D phy_power_on(ethqos->serdes_phy);
>  	if (ret)
> -		phy_exit(ethqos->serdes_phy);
> +		goto err_out;
> =20
> +	return 0;
> +
> +err_out:
> +	phy_exit(ethqos->serdes_phy);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-qcom-sa825=
5p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com?part=3D4
