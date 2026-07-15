Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F4332ED6
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115847; cv=none; b=dTa53wW8/zTn0HK5z/dLi/p3W84JYBynrCEkqFfNKwXpnSkh2+TEFSROV6RDTafXpxIHSdDPB/7nkqLLtewnHdzx8627L4PZVvmpMfwgqWpE7cZHXeqG800pMpw6FY/qkXrzq9Tw//hQ2t1WsYnEyWoQFVXbiDFLnTKkELeAjOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115847; c=relaxed/simple;
	bh=FZoewq6gZuI9zAp/nRm/iF6Uuq8Ct5gCHbn8v298jBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TDjdjeOkhxdMsqxiZHEwaJiJ1rZ7OfotyNSmIxXrNMiV/39gp64bEDSWIFAeuuh7psbRu6diw3YoHrdfks3zujzW932yj7ChFUmTbF+LWQGGKdq105y0xioQ36e6vyECvP8qN7hFuATjiBuIT0UEbQF1GcdbEUF1NuE60Y6lvZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H73eGrOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H73eGrOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA621F000E9;
	Wed, 15 Jul 2026 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115846;
	bh=r+/6qQC6HLRiLXIPUgApYTcI4qIN+f3MQWNzB9RdFOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H73eGrODA4mU6vuc/JaRiPfIR3+5OVbE+r4y/QOfFIG3XJjUSaGNZFMKovX7fzGv0
	 mp2VUydPN5xw83e94q6a/Qis/Bs9viTjGB88xqZC8Ek+/CmU77y8zGExxSXRh+vE63
	 YFvEF2hNgiyQjFZRqgBm0j/wr9IyAVQ2DmQ50No4cRjMln1t5yuD68+hDZa0Q57J+P
	 Aw/5txnHbu9H15yI63381id4QpeCTuW1mUm0DxdeCCiuw9t+vK8R8I57PQ4tCfamxc
	 4ij8Ce93yzirnqgIBHrDwcOmq7UDWAA5Cn8lmgcU45F/0SJy/H7i80RLJ4Z20yKXpz
	 RAIFPh1keCoMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: olteanv@gmail.com, vkoul@kernel.org, Frank.Li@kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-6-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-6-00d95e270e4c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:44:05 +0000
Message-Id: <20260715114405.CEA621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver unconditionally fails probe if dev_pm_genpd_rpm_always_=
on() returns an error. This breaks backward compatibility on configurations=
 without generic power domains or when the device tree lacks a power-domain=
s property.
--

--- Patch [6]: [PATCH v6 6/6] phy: fsl-imx8mq-usb: keep PHY power domain ru=
ntime always-on for i.MX8MP ---
commit 14514f8e33060037a734acad2199e7febc56def8
Author: Xu Yang <xu.yang_2@nxp.com>
Subject: phy: fsl-imx8mq-usb: keep PHY power domain runtime always-on for i=
.MX8MP

This commit marks the PHY power domain as runtime always-on for the i.MX8MP
platform to prevent it from being powered off during runtime suspend. This =
is
intended to preserve USB wakeup functionality on i.MX8MP.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c

[ ... ]

> @@ -739,6 +742,12 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (!phy_data)
>  		return -EINVAL;
> =20
> +	if (phy_data->need_genpd_rpm_on) {
> +		ret =3D dev_pm_genpd_rpm_always_on(dev, true);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to set genpd rpm always on\n");

[Severity: High]
Does this code cause probe to fail unnecessarily when generic power domains
are disabled or not configured in the device tree?

If the kernel is compiled without CONFIG_PM_GENERIC_DOMAINS,
dev_pm_genpd_rpm_always_on() will return -EOPNOTSUPP. Similarly, if the
device tree lacks a 'power-domains' property for the PHY node, it may return
-ENODEV.

Since the power domain won't be runtime-suspended by the generic power doma=
in
framework in these cases, the wakeup issue this patch intends to fix doesn't
exist.

Should this check ignore non-fatal errors like -EOPNOTSUPP and -ENODEV to
preserve backward compatibility with older device trees and minimal kernel
configurations?

> +	}
> +
>  	imx_phy->phy =3D devm_phy_create(dev, NULL, phy_data->ops);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx8mp-usb=
-phy-improvement-v6-0-00d95e270e4c@nxp.com?part=3D6
