Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94638BF72;
	Mon, 18 May 2026 19:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131429; cv=none; b=r975TqyEFj4ZRkK1ckNAdmR+0mX52IeaTSDjdCm1EGOfyf9qe67hJcYEiEh2MLOboij2567PXfaj5ZyoZIl2s+TRSN91L2vAznXvBrqHJlfGS6tpWBeC19Hs21SNVO/N4DtnOhEZ75Vvn16UBjup2pcoGT6sRs/pKkbt7mIut+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131429; c=relaxed/simple;
	bh=Bwv+BgLJuHTq8aF8CwXAVLmYYbnE+UrJQ/WHylP55zg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=caxkYdV8JmOaa2McpOHwIVbtTDiVkUCCbPncPqNUcfNlm3UvU4pkCO13hR2ZmTz6PrBqG/u8xaib9ATBTByLgJ9QhvZFh1Bmvy3EC5+ZRQMzwvJLCBJyoZmaFQMHbfpT3RYUzeTpKQLy8INTT1bpaioSdfVnjJstMWgmWKf8Ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcLzFk/l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcLzFk/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF63C2BCB7;
	Mon, 18 May 2026 19:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779131429;
	bh=Bwv+BgLJuHTq8aF8CwXAVLmYYbnE+UrJQ/WHylP55zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HcLzFk/l/IqonkXMNaRFHVJejMtT+xMMbB3z6cOJDRA0WdNXtdTQa0ITp6yha13YX
	 bNUhWSxEORRML0n7pYSZjr42KeMwr7Xf4uh18VFyK9FmY2tGqGLkIJ4mQZQbwkQHch
	 czq1qjScQtIWVUIXRJlQFZEPWj061cYoZGI7nLak+gASCrtcPZx+UWGK1yU3EpajmH
	 oQ05ByeLN11MPBWUA9lJuwq3jsKlBFfc28KCa6pKrigZ/Ci77C0t7Smu3fI8h18aVq
	 7bF3O+ppU16JoOPmo+CkTXUAuvp7qf6XZQBxiImQn2Cppu9xmxEpP/+2Nngop9VE/p
	 IU2eR4V2vx0uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 23/23] drm: bridge: dw_hdmi: Merge top and bottom
 half IRQ handlers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260518180206.2480119-24-jonas@kwiboo.se>
References: <20260518180206.2480119-24-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 19:10:28 +0000
Message-Id: <20260518191028.CBF63C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing the HPD interrupt status after modifying the interrupt po=
larity creates a race window where an edge transition is missed, breaking h=
otplug detection.
--

commit b4c743935eb9892c0e2a6a962a52440a37e985de
Author: Jonas Karlman <jonas@kwiboo.se>
drm: bridge: dw_hdmi: Merge top and bottom half IRQ handlers

This commit simplifies IRQ handling by merging the top and bottom half IRQ
handlers into a single handler. It transitions HPD event handling to use a
delayed work queue instead of an IRQ thread.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2993,30 +2993,18 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void =
*dev_id)
[ ... ]
> -	intr_stat =3D hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> +	intr_stat =3D hdmi_readb(hdmi, HDMI_IH_PHY_STAT0) & HDMI_IH_PHY_STAT0_H=
PD;
> +	if (intr_stat) {
>  		enum drm_connector_status status;
> =20
> +		hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
> +
>  		/* Set HPD interrupt polarity based on current HPD status. */
>  		status =3D dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
>  		hdmi_modb(hdmi, status =3D=3D connector_status_connected ?
> @@ -3028,12 +3016,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev=
_id)
> =20
>  		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
>  				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> -	}
> =20
> -	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> -	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
> +		hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);

Does clearing the HPD interrupt status after modifying the interrupt polari=
ty
create a race window where an edge transition is missed?

While this isn't a new regression introduced by this patch, it persists in
the new merged handler:

1. The ISR reads HDMI_IH_PHY_STAT0 and finds the HPD bit set.

2. It reads the current PHY state (e.g. CONNECTED) and updates the polarity
HDMI_PHY_POL0 to look for the opposite edge (e.g. PLUGOUT).

3. If a fast bounce occurs right here (the cable is unplugged), the hardware
detects the edge and sets the HPD sticky bit to 1 again.

4. The ISR then writes the original intr_stat (with the HPD bit set) back to
HDMI_IH_PHY_STAT0 (a write-1-to-clear register). This clears the newly latc=
hed
unplug event.

This leaves the hardware waiting for a PLUGOUT event, but the cable is alre=
ady
disconnected. When the cable is plugged back in, the hardware ignores the
PLUGIN edge because it is still looking for a PLUGOUT.

Could this lead to a regression where hotplug interrupts break until the ne=
xt
reboot? Should the W1C register be cleared before reading the PHY status and
updating the polarity?

> +		hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
> +		ret =3D IRQ_HANDLED;
> +	}
> =20
> -	return IRQ_HANDLED;
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D23
