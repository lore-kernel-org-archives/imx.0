Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7493EC81B
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367249; cv=none; b=XPhV8pSnphHW0aGQTLJc6WB/hUrmYBbmcVRRUJ9OKOpjsS1xDQj7sgKEa81Kes2vGdU/DdsphnTb5E60jyISMRqouvtCmBL2O+N3HAhl9H6pL6sBNL6aFMbNoY1rqhbNbUeCOwKkS/fBiow0u64CiMbx/KD6AFkf3q/n8a/rTyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367249; c=relaxed/simple;
	bh=0Nwv4s4/hIy4cO+gH+zF9N68vC54tjNGcpL7ml0eADM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cnDiB9+4Cyqdh4EEjzp79aRGi++c/za5E7jyFXK4TTkvOVHwVkOr/x1BE3ZEXgIq81McADkhMFHxwoUHmz2tzxaMvanfdBJPcgePbyA4LuqPSzGe4j1dxRrhW6TgZQBohyLiW0/FmyGcRSw32TZzSZDf667vJ0HEffC6AwznjHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWPxdso8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWPxdso8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AB51F000E9;
	Mon, 10 Aug 2026 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367248;
	bh=9HKVTMwB02LPLH5UYUNXw06eSuivZCsA6iVnQvCMKkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWPxdso8vahz8yM3hwS9y8Bqfk47QDNJqt5wRuUNEQw2BO57qysQmnlueJqy2UrGz
	 Wsqs02fQX/W5DMji6FKOSzeySZVKOkABKc0r/jrbTZusKYt+TCMkZYLZnhKaxVYBrs
	 AO+3xboVzdUPINX+0a8PCEwPiTTD5CepSxHqD18tqWX8F57dmBXh0dRsJq/uqHz0BB
	 0a0XUndStkmN6Gpoa60UhJbCpsNGCCo7WpcHV129zxo+8rkmhBLkegUKsxPDqqDS4W
	 sBMD/fLhAfSZOZzqUSgIK2RdHR4xhiB/2lC7a9x3QZuEpCLl3PmtPmtFRPxC5OtyM6
	 rzwfGdpFQXTIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] usb: gadget: tegra-xudc: avoid direct
 dereference of phy->dev.of_node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260810125614.441667-4-vladimir.oltean@nxp.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
 <20260810125614.441667-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 13:07:27 +0000
Message-Id: <20260810130727.D1AB51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing error code assignment when `of_property_match_string()` fa=
ils, causing a silent initialization failure.
- [Low] Malformed error message format string splits log across two lines.
--

--- Patch [3]: [PATCH v9 3/3] usb: gadget: tegra-xudc: avoid direct derefer=
ence of phy->dev.of_node ---
commit 5dbf80ca5d539781ed1dcc83abb9ad4e29628462
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

usb: gadget: tegra-xudc: avoid direct dereference of phy->dev.of_node

This patch reworks the PHY lookup in the Tegra XUDC driver to avoid directly
dereferencing phy->dev.of_node. It introduces a parallel OF node lookup path
based on the "phys" phandle and the #phy-cells of the padctl provider.

> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
[ ... ]
> @@ -3525,22 +3529,39 @@ static int tegra_xudc_phy_get(struct tegra_xudc *=
xudc)
[ ... ]
>  		} else if (!xudc->utmi_phy[i]) {
>  			/* if utmi phy is not available, ignore USB3 phy get */
>  			continue;
>  		}
> =20
> +		index =3D of_property_match_string(np, "phy-names", phy_name);
> +		if (index < 0) {
> +			dev_err(xudc->dev,
> +				"no \"phy-names\" entry for \"%s\": %pe\n",
> +				phy_name, ERR_PTR(index));
> +			goto clean_up;
> +		}

[Severity: High]
If this fails, we jump to clean_up without updating the err variable. Since=
 err
was initialized to 0, would this cause the driver probe to falsely report
success without having acquired the PHYs?

Could we assign err =3D index before the goto?

> +
> +		err =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
> +						 index, &args);
> +		if (err) {
> +			dev_err(xudc->dev,
> +				"failed to follow \"%s\" reference\n: %pe\n",
> +				phy_name, ERR_PTR(err));

[Severity: Low]
This isn't a bug, but there is an extraneous newline before the colon in the
format string which will split the log message across two lines.

> +			goto clean_up;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810125614.4416=
67-1-vladimir.oltean@nxp.com?part=3D3
