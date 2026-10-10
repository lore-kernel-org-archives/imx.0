Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB949503B;
	Sat, 10 Oct 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636599; cv=none; b=Q4AbnwdtHRU3irpM6Ly9GKy0XDwk7LG5R2oP1CA6HcwYowoW4OAZAmE6k+WG/mKkjhmFKlr+yG+middY7aKj9/lbxm79bo2vOimLzxlz8DZuoqACVCeP3KfIX73YcxBDZcewa48CbNg3q6K1Dv2kdBbaat58cqAJt5lC2Ab0K3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636599; c=relaxed/simple;
	bh=sAaXDH38xLKsn8ggNPrR5D9yoVqSdPgUGdXtJ5zMnLQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lG2jVVAdxJdIYOrIPfH7pCJn3JJVPeTmmeuAEq4J47W0b720uzpmCiIABTSGlnvg6kb9To0zrBISJOQFFWLi+sdRo4W5mzH0Nzh+woq1Zn5XtDhpfzJ3ZtNbDBcvHjrZTr29Rfo3b9Kuyfi1wbJ0sSwqhpXe/jIUJuaqC6R/5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqs81stQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqs81stQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D05D1F000FF;
	Sat, 10 Oct 2026 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636593;
	bh=MnC4coSqLn+0ix328wN65ZbXK7ftYv9cjIR8DeyKSWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gqs81stQNVWHJ0RFUhwkjj4fcCCxu9FpbdWzfBfvyRXRytkGI9uN8awNKM7jJlKki
	 zqi/HiPsCKQ1Kg7c2yOjsQg33wSr+CRZ+TGb87K0bEp93V44vroJUfLghofaAsJ0yM
	 qQRx8MSMV2HVYouiBL+yHhORhgBqfBrw7N7eZ/ohe7eJWshwxUTswNE39m08GFQ3Dr
	 TRnoTOdYH7RlHI08H1fM3QXKGn8Q0S79MX134TBNltb9u+92EEVRWFpbX6NY2LbBZF
	 YtUnIKcx5iDWlmgFXGWIMO1n8UNmtRw40jTlKwpfHcYIwqEme0zPxDi0+ID8F1zw0h
	 hXhkpKmSq9Sbw==
Message-ID: <sashiko-outbox-166542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v1 1/5] net: enetc: Add pseudo-MAC support for
 ENETCv4 Ports via a DT overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Manoil" <claudiu.manoil@nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <5c38f45b9ff1d73c6942d42e23940ecd9ab7b71f.1791548316.git.claudiu.manoil@nxp.com>
References: <cover.1791548316.git.claudiu.manoil@nxp.com>
 <5c38f45b9ff1d73c6942d42e23940ecd9ab7b71f.1791548316.git.claudiu.manoil@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:49:52 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: enetc: memory leak of partially applied overlay on of_overl=
ay_fdt_apply() error
--

commit 8ec35cbb99007d6ea94d2243308ce4530bb6180d
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: Add pseudo-MAC support for ENETCv4 Ports via a DT overlay

This commit introduces pseudo-MAC support for ENETCv4 ports by modeling
them as fixed links. It uses a compiled device-tree overlay to synthesize
the fixed-link node at probe time when the port lacks an ethernet DT node
representation.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 71c971618388b..7999355b5b9f5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
[ ... ]
> +static int enetc4_apply_overlay(struct enetc_ndev_priv *priv)
> +{
> +	u32 size =3D __dtbo_enetc4_pseudo_mac_end - __dtbo_enetc4_pseudo_mac_be=
gin;
> +	struct device_node *np =3D dev_of_node(priv->dev);
> +	int err;
> +
> +	if (!np)
> +		return dev_err_probe(priv->dev, -ENODEV,
> +				     "Missing of_node for Pseudo-MAC port\n");
> +
> +	err =3D of_overlay_fdt_apply(__dtbo_enetc4_pseudo_mac_begin, size,
> +				   &priv->ovcs_id, np);
> +	if (err)
> +		return dev_err_probe(priv->dev, err,
> +				     "Failed to apply fixed-link overlay\n");

[Severity: Medium]
Can this leak the partially applied overlay changeset?

If of_overlay_fdt_apply() fails during application (for example, from a
post-apply notifier returning an error), it can return a negative error
code but still populate the changeset ID in priv->ovcs_id. Returning
immediately here without calling enetc4_put_overlay() bypasses cleaning up
the partially applied state.

Looking at the caller enetc4_link_init():

	err =3D enetc4_apply_overlay(priv);
	if (err)
		return err;

The error propagates directly and skips the err_mdiobus_create label
which would otherwise invoke enetc4_put_overlay() to handle the cleanup.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791548316.gi=
t.claudiu.manoil@nxp.com?part=3D1
