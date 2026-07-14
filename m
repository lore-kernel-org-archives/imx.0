Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA047ECD3;
	Tue, 14 Jul 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043746; cv=none; b=XdLVAQUOoUmklk+6ApkSSF67PdofukQZD2Y/z5ul3l/H2izhJtjdAuyFlY7rpFwMBw1Hn75USnLXiEnZxar3XoRelVCCRcbfnMHQ7uJMQthvNs5ZFtZSKVc3vsl6Y9d8IJmDepkJBRjC+LW2RyowSXO8KPS9rI4Rz2E1coYj34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043746; c=relaxed/simple;
	bh=SDdmhjnO0kyL/ssdOPX3zHy+MIkB04Z6EPQa9rU4jYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EPFLB0rOv8hrlS1EVebWv6DMCSgHOzLte57ZHrmT//yFQ8aokgU3ClD0JD4deCdz4K7ZPSdw1lTECRmdyeLsEusVAs7d0OuR2ozyiu6rU0Q1KpgIVa9XGvBRkVFJ1mJQbOSsLlvhqcG/y8mXaeJkYTzHuVtVEmBgqI0LGFSN/eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8RTxB2S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8RTxB2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BCA1F00A3A;
	Tue, 14 Jul 2026 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043745;
	bh=oo7FF33HGvM0uQdGUTkwrzcFjJf9/6hKdsBWusFY6yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8RTxB2SRElnUcvuV6QpzErYLyxNviVq7+zBy+f8OSOIYZ19aWJM5LybY+wcIxk1/
	 bJPjL4zMWEF3HXJ91t+7NNrbq11PncbqOr6MROzuJBXiaX8RE93SoywDTofrNCHmKw
	 XAK1ShZxR8CHlpFzCIOAHThvOrUEFFgMu++eJBUNuNugoDutDztYuWicl2Uw8mxvrM
	 7YyukQXr8W1MbqDRa7jRQwa+y2344paxJ3lrPy/t2/+/VesQ+yWJHTv+kRnSOaPT5i
	 KRo8DfxJrtdqoTra9KXsNnag+zbWU2DF89MBw5tvlKpT82ctouOTh37NBJwme9bbbI
	 QEelLzIkXmaIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 15:42:24 +0000
Message-Id: <20260714154224.E7BCA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Updating `ethqos->phy_mode` before clearing the SGMII loopback cau=
ses the loopback to remain erroneously enabled when switching away from 250=
0BASE-X.
--

--- Patch [6]: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update =
phy_mode to the resolved interface in mac_finish() ---
commit 3dfd6663f759c10c24659b5275b88ff5f976b420
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_=
finish()

This commit updates the driver to overwrite ethqos->phy_mode with the
resolved phylink interface during the mac_finish() callback. This ensures
the stored mode matches runtime changes instead of being permanently stuck
at the device tree default.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 47b70b5e706f2..9d19203ae4bd7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -632,6 +632,12 @@ static int ethqos_mac_finish_serdes(struct net_devic=
e *ndev, void *priv,
>  	struct qcom_ethqos *ethqos =3D priv;
>  	int ret =3D 0;
> =20
> +	/* The interface mode is only known once phylink has resolved it and
> +	 * may change at runtime, so keep it in sync for later
> +	 * serdes_powerup()/serdes_powerdown() calls.
> +	 */
> +	ethqos->phy_mode =3D interface;
> +
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);

[Severity: High]
Does updating ethqos->phy_mode here prevent the loopback from being disable=
d?

If the link negotiates from 2500BASE-X down to SGMII, this update changes
ethqos->phy_mode to SGMII before the loopback is disabled.

Looking at qcom_ethqos_set_sgmii_loopback(), it checks the current mode to
determine if it needs to act:

qcom_ethqos_set_sgmii_loopback() {
    if (!ethqos->needs_sgmii_loopback ||
        ethqos->phy_mode !=3D PHY_INTERFACE_MODE_2500BASEX)
            return;
    ...
}

Will this cause the function to return early without clearing the loopback
when switching away from 2500BASE-X, leaving outgoing packets reflected
internally instead of transmitting to the wire?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-qcom-sa825=
5p-emac-v13-0-119f8699ef8e@oss.qualcomm.com?part=3D6
