Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27393DEAD2
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367326; cv=none; b=qvErNt9SqHoCTnS9IgIqQmF098BuewQiBeDc0331+Ec3HNR5SPEP5CZ+7uxo3LPN9W7FA8OIBbEjt0LFWNBZOFKl0ZueyWxm3iksjSbQE30W+6Vuo7p+z0MFpwLnO27W8bR5TGc/3sZuipfR2FUWUW8/gTQgjSc/LoNJVe1L3C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367326; c=relaxed/simple;
	bh=d+ym4nECucHFA9nDpmUWj2zPosWSB3cOenoRnZsTBSo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xl4z9R5HGB7czYibtP2Ycp5kUJtfbYTyzACo3Otjodop7Y8+R5LP+unVZQ0bjNVw9l4aMNw+0efuV6JvdE+OjSxAn7/L8R9SCLkNjHcbaurpDk7Her+OJQiU1oWfUD3Pj+ogEZFzmBP1expUAsEIGW0FUFMrLUGWcVOr6J/h1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CumdG6r+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CumdG6r+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5437E1F000E9;
	Mon, 10 Aug 2026 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367324;
	bh=gZMQ7KIbiOwuQ3AIIfabc6IHdQbwsyeleXWXIrx1sB0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CumdG6r+TQ3PN6vua1BDBiyTqnJ5hAsj480ay9fHjosZKZgrGN5WM8zowHgkLy2+L
	 nvhSXMVsv1y8pWhtPsaRhGbYUhVjreCxgHHLyLxU2Ro2DY7DgkIY5wT3wfX7QWLuY0
	 LrKwVQbAV9JDpF7f6G+tX9e2ZiR5I8+QVZT7VKHFFENbJgMO+tlqgFKPra4ZLvbanM
	 zPCS6vaq6T2xQ2wVTQWTNFQauqx0gt3EQueJmqJ8x3QLhw3QbQGq93fdWuJRzmQGHd
	 Y1mZoQb/r8GeFO/BZEnj8Px5bqp8bCGACOwuOEHbamQqLdzq4s6GM1h8Nwg0wpWCqV
	 TM6O7pGZOd8AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] usb: host: tegra: avoid direct dereference of
 phy->dev.of_node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260810125614.441667-3-vladimir.oltean@nxp.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
 <20260810125614.441667-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 13:08:43 +0000
Message-Id: <20260810130844.5437E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reusing a single `struct notifier_block` (`tegra->id_nb`) across m=
ultiple independent USB PHYs corrupts their atomic notifier chains.
- [High] Delayed work can be scheduled after driver removal due to devres-b=
ased notifier unregistration.
--

--- Patch [2]: [PATCH v9 2/3] usb: host: tegra: avoid direct dereference of=
 phy->dev.of_node ---
commit 5072858d37310d2ff0794e119a072f8de6f28872
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

usb: host: tegra: avoid direct dereference of phy->dev.of_node

This commit removes direct access to phy->dev.of_node from the Tegra USB
host driver. It implements a parallel lookup path using the 'phys' phandle
to retrieve the OF node. The remote wake debug print is also updated to use
the PHY index instead.

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1515,23 +1516,34 @@ static int tegra_xusb_init_usb_phy(struct tegra_x=
usb *tegra)
>  	tegra->otg_usb3_port =3D -EINVAL;
> =20
>  	for (i =3D 0; i < tegra->num_usb_phys; i++) {
> -		struct phy *phy =3D tegra_xusb_get_phy(tegra, "usb2", i);
[ ... ]
> +		err =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
> +						 index, &args);
> +		if (err)
> +			continue;
> +
> +		usbphy =3D devm_usb_get_phy_by_node(tegra->dev, args.np,
> +						  &tegra->id_nb);

[Severity: High]
This is a pre-existing issue, but does reusing a single struct notifier_blo=
ck
(tegra->id_nb) across multiple independent USB PHYs corrupt their atomic
notifier chains?

Since tegra_xusb_init_usb_phy() loops over all available usb2 PHYs, it pass=
es
the exact same &tegra->id_nb notifier block to devm_usb_get_phy_by_node().
usb_register_notifier() then links this same block into each PHY's independ=
ent
atomic_notifier_head, which overwrites its next pointer.

Could this lead to missed events or infinite loops when the lists are
traversed?

[Severity: High]
This isn't a bug introduced by this patch, but does the devres lifecycle
for this notifier create a use-after-free risk during driver removal?

In tegra_xusb_remove(), cancel_work_sync(&tegra->id_work) is called to
stop pending work, but the notifier remains registered until the devres
release phase via devm_usb_phy_release2().

If a USB PHY event fires in this window, tegra_xhci_id_notify() calls
schedule_work(). Devres then unregisters the notifier and frees the
tegra_xusb structure, causing the workqueue to dereference the freed
structure when it executes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810125614.4416=
67-1-vladimir.oltean@nxp.com?part=3D2
