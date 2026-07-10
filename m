Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED23A63EF;
	Fri, 10 Jul 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672659; cv=none; b=fBOhL0u7/2r7KqrdndpPi+Tbj6+ssSX5BCnITIqZaqDHvqn8p+l1zLipuapTU1FVJtZOFXeie7kgme5vm3OXBz7SsY10XNHJKwRUdbg+JwyHLwxMpW2tsOKXBf532nndMZWaJKLMQ3PM81vRmByArS2/a8oFZMVgFYe23TpIsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672659; c=relaxed/simple;
	bh=NWAlUNHbNdxAmVW1GD1fI7FsllHCdwn5ym4wQCmc3Og=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O1QR2cqTvtT6CXM8xFv6oZPaUseYrU4TOG/Y68FnMy6C9dXy34fTVNbNGW4lsYb4DgyVfJ5gVb5XMhqLLLsN2ecVKk7a4kXbLPRCAk5cFkMZDTHcyiV3XW2FuaFMidskyB/Myq7OQ2K1aIgEho3Ok3MP+LYZIm01p66WtoyXFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW+5z7z+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW+5z7z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1CB1F000E9;
	Fri, 10 Jul 2026 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783672658;
	bh=lA9Z16hJ38ZHTm5yh17D3L9U6TZvuj8iQ329kHZ2sgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bW+5z7z+/eSCCNuHz5Jn6HcwS/ZxrxJ/TKI26cUgsnkR+R2odHwYaG34krwn5lDHN
	 F/nCutW3f8JBumV5sP86ijl0i+Ray0WzrGZa/7ZzvvR9NRS6OE+nVo7kSCYYszdzoC
	 jBVTh+kgL8Kd2AEbL3VOICnh07OQAaJlO+iOBk5l9iuaAC0hTkmjzTkxUVVSLX+Jc/
	 A84N+BQdj00G3caj1/JwDTOYhBdseFqPEAEyqU5gsesSdP6EgseE4y8tVsTbvR0OH+
	 mEvoZ+ldQALqlN57vmwnZA2gTYXvLgBWbItkngdl7MN0QmgMfyNfmSQFaCYOtxB2Bd
	 55dclk5oMvblQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/bridge: ti-sn65dsi83: Add reversed lvds
 lanes support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260710082630.394040-3-wojciech.dubowik@mt.com>
References: <20260710082630.394040-1-wojciech.dubowik@mt.com>
 <20260710082630.394040-3-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 08:37:37 +0000
Message-Id: <20260710083737.BD1CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Probe definitively fails on valid legacy 3-lane or 0-indexed devic=
e trees due to rigid array bounds.
--

--- Patch [1]: [PATCH v3 1/2] drm/bridge: ti-sn65dsi83: Add reversed lvds l=
anes support ---
commit 47fc41c5744e78e6f8072b1226e9548c69361da5
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

drm/bridge: ti-sn65dsi83: Add reversed lvds lanes support

The chip supports output lvds lanes in two orders, default <1 2 3 4>
and <4 3 2 1>. Add parsing of an optional output lvds data-lanes
property so we can inform chip that the lanes have been reversed.

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
[ ... ]
> @@ -854,6 +873,37 @@ static int sn65dsi83_parse_lvds_endpoint(struct sn65=
dsi83 *ctx, int channel)
>  		goto exit;
>  	}
> =20
> +	ret_data =3D of_property_read_u32_array(endpoint, "data-lanes", data_la=
nes,
> +			ARRAY_SIZE(data_lanes));
> +	if (ret_data !=3D 0 && ret_data !=3D -EINVAL) {

[Severity: High]
Does this code break valid legacy device trees that define fewer than 4 lan=
es?

If a device tree has a data-lanes property on the LVDS endpoint with fewer
than 4 lanes (e.g., <1 2 3>), of_property_read_u32_array() will return
-EOVERFLOW because it rigidly expects exactly ARRAY_SIZE(data_lanes) elemen=
ts.
This will immediately abort the probe, breaking previously working displays.

> +		ret =3D ret_data;
> +		goto exit;
> +	}
> +
> +	if (!ret_data) {
> +		for (i =3D 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> +			for (j =3D 0; j < DATA_LANES_COUNT; j++) {
> +				if (data_lanes[j] !=3D supported_data_lane_mapping[i][j])
> +					break;
> +			}
> +
> +			if (j =3D=3D DATA_LANES_COUNT)
> +				break;
> +		}
> +
> +		switch (i) {
> +		case NORMAL_LANE_MAPPING:
> +			break;
> +		case REVERSE_LANE_MAPPING:
> +			ctx->lvds_reverse_lanes_conf[channel] =3D true;
> +			break;
> +		default:
> +			dev_err(dev, "invalid data lanes mapping\n");
> +			ret =3D -EINVAL;

[Severity: High]
Will this cause the probe to fail on 0-indexed device tree configurations?

The array comparison logic above this switch strictly checks for 1-indexed
mappings. If the device tree uses a valid 0-indexed scheme (e.g., <0 1 2 3>=
),
it falls through to this default case, causing the probe to fail with -EINV=
AL.

> +			goto exit;
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710082630.3940=
40-1-wojciech.dubowik@mt.com?part=3D1
