Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C55841D4CE;
	Tue,  7 Jul 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430700; cv=none; b=KytSLhMQrUJQNxnjfu69GM/Zo5WJEvca0iP4Lsq+IoLdodCBCYS24FO/J+X2Rj9BD5OmcOvAJYB4X0nWxRB/jom5M9TJY16r2kTgFONCQyFJIT1MG6hRBmzJlsT6ZGz4qsBxvWeBNkHhoahOjHkJX/GH1XYaDnYavy6NkzgxPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430700; c=relaxed/simple;
	bh=5EPcOSTxkPPps31qw4biGKFPyKCI6ua5x/f63EjEOE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bz/1iomr9PcBQUua2yf+O0xUow3FBN6Zgvcb53jLuWKMnjvHHxTTV7t3/HHCMT7sMnTkWr8oO8o+hNNCKobHzQHMIepEBTDC27t3clAohdQN22WSY5je1rFsNhsvDfTGd67nLnkAfd8bVR+DQ7JT8PY1uxnpdwYrt3Ich2PYC14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ian6Kg+T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ian6Kg+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7371F00A3D;
	Tue,  7 Jul 2026 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430699;
	bh=9J/5kdUzNZ4A1zvWuu+ZIn5vyFjeG5mMP6m9LXXbf/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ian6Kg+T8E9rhyk0z8vcxmm3rnQUFwc35apDM5FVYpdlp8ppMxaGfYzPgIDJe9Kg7
	 UZSj5hu2X7TsVh4pOOfzwXohO8A7nlwCTADd193u3lWOwRooM/t13uMEyodkm9MNO3
	 /wCtJfL3U8JJwFeFhIs0mveSGyeDiw/yFVBTzUR7wyztE+xzhaej5IQpFYzGb1rxOG
	 tvhUFxUAKtu4hx86lB4J+mOlS5EYaKvjCL7xrNicq3ypSjGWJLLqRyaAhk+MrUq9nS
	 xJVdC1jqhHztxM9Ko81X20dTzTYKCWApoa55VgK3YSBK4IPao77GIX0gKLCEVGKnal
	 gRPW3MyfpBhNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/20] pmdomain: imx: use
 platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:58 +0000
Message-Id: <20260707132458.9E7371F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Child platform devices dynamically added during probe are not unre=
gistered on probe error paths or during driver removal.
- [High] The i.MX GPC power domain driver initializes domains as powered on=
 but does not set GENPD_FLAG_NO_STAY_ON or provide a sync_state callback, c=
ausing domains to stay on indefinitely.
--

commit 183445e8048cfd412f98719fae14416614f14176
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

pmdomain: imx: use platform_device_set_of_node()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9f..abca5f449a226 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
>  			domain->ipg_rate_mhz =3D ipg_rate_mhz;
> =20
>  			pd_pdev->dev.parent =3D &pdev->dev;
> -			pd_pdev->dev.of_node =3D of_node_get(np);
> -			pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +			platform_device_set_of_node(pd_pdev, np);
> =20
>  			ret =3D platform_device_add(pd_pdev);
>  			if (ret) {

[Severity: High]
This isn't a bug introduced by this patch, but I noticed that child platform
devices added in previous loop iterations are not unregistered on this error
path.

If platform_device_add() fails, or if platform_device_alloc() fails earlier
in the loop, imx_gpc_probe() returns immediately. Any successfully added
"imx-pgc-power-domain" devices from previous iterations are left orphaned.

Because these orphaned child devices hold references to the parent's
devm-managed regmap, does this create a use-after-free when the parent's
devres cleanup runs?

The same unregistering step appears to be missing in imx_gpc_remove(), which
skips the cleanup of these dynamically added platform devices entirely when
pgc_node is present.

[Severity: High]
This is also a pre-existing issue, but I noticed a potential problem with h=
ow
these domains are initialized.

In imx_pgc_power_domain_probe(), the domains are initialized as powered on
via pm_genpd_init(&domain->base, NULL, false). For OF-based genpd providers,
this sets genpd->stay_on =3D true.

However, neither imx_gpc_driver nor imx_pgc_power_domain_driver registers a
.sync_state callback, and the domains do not have GENPD_FLAG_NO_STAY_ON set.

Since the stay_on flag is never cleared, will this cause the domains to
remain powered on indefinitely? If regulator_late_cleanup() later disables
the underlying regulators while the domains are still active, could this
lead to hardware malfunctions?

>  				platform_device_put(pd_pdev);
>  				return ret;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D11
