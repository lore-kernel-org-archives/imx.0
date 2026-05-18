Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5756F38CFFE;
	Mon, 18 May 2026 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131291; cv=none; b=J59EVuY0ElXts1uwe5PWfH/DdUJ0qQHmsOx4uP2IjvfAc8/NuKZCOw0hfeOqZAWgDxiofwIg2nTDYG3/brOeRp4E5MvBmZRca5eKu0rJfA7KclFBVdQaZtnC9l5Ie74YLNldraGUUD7vbkDWx/iOCjkppZBR6WQR28lLxHu1rV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131291; c=relaxed/simple;
	bh=rFGCoT2stuB+r4e6QBepELkp0pe9ghw3tS5Q2+iikbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gPTJQ3ni5y/SOUzw4B5NEzG6iumz6lkkkt76OLjb348aUHHrhbmqBKQIckrxcsvOvFLYgK77BWOqPiOFkGUJSvAGnT5NVQNcaWVOLD0EeMpx7EtJp+EozWJpOvC6LEIhHsRENjeM6ptcDOJYhzi0wKSi2nvex9hb5Mr43xZtGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTtW1/Sq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTtW1/Sq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55320C2BCC6;
	Mon, 18 May 2026 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779131290;
	bh=rFGCoT2stuB+r4e6QBepELkp0pe9ghw3tS5Q2+iikbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BTtW1/SqJ/so7ur6NdtlJJU2ASjIc5V3kdV9NOhhA5vwO34bUkH9l3OcSfA4Ub8jp
	 ZtBo/Ck1RPXjDck2qqqu12rvkssMFq2PDKnaCMyMMciFLC/7QW7RUcUYT4+kQsaA0t
	 ukJGTr/poKB+9Xb2nJ9f3AV7d1Hb9Lk4+khuEfZncmUiNy93gRvh9q8SI+Mz3KOVH4
	 h/txA4hfix0XlpH131Q7ydkAljYR5fJz20LctzrRuyGFCJPUsaf1NtA2pU1DH60AyF
	 ZVZ+WZ0u3IE7gNKSlONpsQHwnU5FEvosBmBQKhg4qhFU9M0ocSph83mzjYRIiHa36r
	 ba5pXPrWPI9Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/23] drm: bridge: dw_hdmi: Rework HDP and RXSENSE
 interrupt handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260518180206.2480119-21-jonas@kwiboo.se>
References: <20260518180206.2480119-21-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 19:08:09 +0000
Message-Id: <20260518190810.55320C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition when clearing the HPD interrupt sticky bit can perm=
anently break hotplug detection
--

commit cb7edad18b267f9862ac845a3672fd15ae20a0f1
Author: Jonas Karlman <jonas@kwiboo.se>
Subject: drm: bridge: dw_hdmi: Rework HDP and RXSENSE interrupt handling

This commit removes RXSENSE handling to simplify the HPD interrupt handling,
instead relying on a delayed work mechanism to detect connection status or
EDID changes. It also updates the HPD interrupt polarity initialization to
match current HPD status.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 270db58a0e7c3..2e09bff5faf79 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -3060,78 +3011,29 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void =
*dev_id)

[ ... ]

>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  {
>  	struct dw_hdmi *hdmi =3D dev_id;
> -	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
> -	enum drm_connector_status status =3D connector_status_unknown;
> -
> -	intr_stat =3D hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> -	phy_int_pol =3D hdmi_readb(hdmi, HDMI_PHY_POL0);
> -	phy_stat =3D hdmi_readb(hdmi, HDMI_PHY_STAT0);

[ ... ]

> +	u8 intr_stat;
> =20
>  	/*
> -	 * RX sense tells us whether the TDMS transmitters are detecting
> -	 * load - in other words, there's something listening on the
> -	 * other end of the link.  Use this to decide whether we should
> -	 * power on the phy as HPD may be toggled by the sink to merely
> -	 * ask the source to re-read the EDID.
> +	 * Interrupt generation is accomplished in the following way:
> +	 *   interrupt =3D (mask =3D=3D 0) && (polarity =3D=3D status)
> +	 * All interrupts are forwarded to the Interrupt Handler sticky bit
> +	 * register ih_phy_stat0 and muted using the register ih_mute_phy_stat0.
>  	 */
> -	if (intr_stat &
> -	    (HDMI_IH_PHY_STAT0_RX_SENSE | HDMI_IH_PHY_STAT0_HPD)) {
> -		dw_hdmi_setup_rx_sense(hdmi,
> -				       phy_stat & HDMI_PHY_HPD,
> -				       phy_stat & HDMI_PHY_RX_SENSE);
> -
> -		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
> -		    (phy_stat & HDMI_PHY_HPD))
> -			status =3D connector_status_connected;
> +	intr_stat =3D hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> +	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> +		enum drm_connector_status status;
> =20
> -		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
> -			status =3D connector_status_disconnected;
> -	}
> +		/* Set HPD interrupt polarity based on current HPD status. */
> +		status =3D dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
> +		hdmi_modb(hdmi, status =3D=3D connector_status_connected ?
> +			  0 : HDMI_PHY_HPD, HDMI_PHY_HPD, HDMI_PHY_POL0);
> =20
> -	if (status !=3D connector_status_unknown) {
>  		dev_dbg(hdmi->dev, "EVENT=3D%s\n",
>  			status =3D=3D connector_status_connected ?
>  			"plugin" : "plugout");
> @@ -3141,8 +3043,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_i=
d)
>  	}
> =20
>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);

This problem wasn't introduced by this patch, but could this interrupt
clearing sequence contain a race condition that breaks hotplug detection?

If the HPD line bounces after the polarity is updated but before the interr=
upt
is cleared, the new state will match the newly configured polarity. This
generates a new interrupt edge and sets the sticky bit.

The subsequent write to HDMI_IH_PHY_STAT0 using the originally read intr_st=
at
will immediately clear this new sticky bit.

As a result, the hardware is left with a cleared interrupt while the line
matches the polarity. The next physical edge will not trigger an interrupt
because it transitions away from the matched polarity, leaving HPD permanen=
tly
desynchronized.

Should HDMI_IH_PHY_STAT0 be cleared before reading the live status and
updating the polarity to prevent losing interrupts?

> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
> -		    HDMI_IH_MUTE_PHY_STAT0);
> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
> =20
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D20
