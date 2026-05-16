Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1A2EA749;
	Sat, 16 May 2026 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960594; cv=none; b=XnY9s8gnmTR3PotXikk39wHTHIUXzzH6eEsxFoeUqlXYFJlDu4dm4cBy9shP1sDoHDQcUU9uPoZadk1ckngAD6MwskAFwVfBKUNsN4ud0dsQ8tD3PO1xGbJ5G7bRD6hNylO98MNd29l7t3B5LwLmq2GwRcniDRnKDRmnjwfUsU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960594; c=relaxed/simple;
	bh=4p1ja3PdkljLMW/wiFgeXQ+4PM2PIeQxKd65WFYC730=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lyZFffaz2cRuk7iP+jUgLIpizsaTSCb9+ba/IzonjfJj8JgJdKxWkwnexdViWc8esP8lxDf2SxoVAcEqBD6CIVq2+W2LOlQHScCBQhDpNg/7QsakjOama8GFDjD01pACEHVgvPiP9MqeiWDcfGd5REelzjLjJ2WiZQyKZlFMt2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUb8r7rc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUb8r7rc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4211FC19425;
	Sat, 16 May 2026 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778960594;
	bh=4p1ja3PdkljLMW/wiFgeXQ+4PM2PIeQxKd65WFYC730=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fUb8r7rcqcinn/8MiCslPLweUwWjvjJW1lS7AqLFan8gLSu0ZW033W0Dakzm8jHRA
	 g9dXp0fA7UCuS8dsJyfykaDWWBIH1PyLOm6gydPtzSG2yqRmbfO0XcclIfN5tEr0D6
	 7+rKLeO8T+DoPTMNYv8Y8w0uPl0XpG4II0AS+DXI7kjd6aGfYaoZIzRL1GqoP4anPm
	 tJjfderQdJZZhXGTR3KlOvdUQXSLLY7QmIWQYoc2ord7zuQakwMEPS1TQ8wrkq2Ydw
	 yIlVpobUWhx12A7406t1mKYH7igK/8XIxyQTHegwF7SFOdYYuZ8UrmEQtS9m6GmkPq
	 4qePyl6zB2bFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 19/22] drm: bridge: dw_hdmi: Rework HDP and RXSENSE
 interrupt handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260516183838.2024991-20-jonas@kwiboo.se>
References: <20260516183838.2024991-20-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:43:13 +0000
Message-Id: <20260516194314.4211FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing the W1C HPD interrupt after reading the live status and s=
etting the new polarity creates a race condition that can permanently break=
 hotplug detection.
--

commit 40973548d3ce7bfe1722c0d53b828f8ef0ca4d81
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Rework HDP and RXSENSE interrupt handling

This commit removes RXSENSE handling to simplify the HPD interrupt
handling, depending instead on a delayed work to detect connection
status or EDID changes. It also ensures the initial HPD interrupt
polarity is based on the current HPD status.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 300dac4a6c358..39e94d22249b2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -3060,78 +3011,29 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void =
*dev_id)
> =20
>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  {
>  	struct dw_hdmi *hdmi =3D dev_id;
> -	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
> -	enum drm_connector_status status =3D connector_status_unknown;
> -
> -	intr_stat =3D hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> -	phy_int_pol =3D hdmi_readb(hdmi, HDMI_PHY_POL0);
> -	phy_stat =3D hdmi_readb(hdmi, HDMI_PHY_STAT0);
> -
> -	phy_pol_mask =3D 0;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD)
> -		phy_pol_mask |=3D HDMI_PHY_HPD;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE0)
> -		phy_pol_mask |=3D HDMI_PHY_RX_SENSE0;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE1)
> -		phy_pol_mask |=3D HDMI_PHY_RX_SENSE1;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE2)
> -		phy_pol_mask |=3D HDMI_PHY_RX_SENSE2;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE3)
> -		phy_pol_mask |=3D HDMI_PHY_RX_SENSE3;
> -
> -	if (phy_pol_mask)
> -		hdmi_modb(hdmi, ~phy_int_pol, phy_pol_mask, HDMI_PHY_POL0);
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

Can this sequence create a race condition that breaks hotplug detection?

If the HPD line toggles (for example, due to contact bounce) after
dw_hdmi_phy_read_hpd() but before this final hdmi_writeb(), the hardware
could generate a new interrupt and set the sticky bit again.

Since the final hdmi_writeb() writes the original intr_stat (which has the
HPD bit set) back to the register, and the register is write-1-to-clear, it
will clear this newly generated interrupt.

This could leave the driver and hardware out of sync, with the hardware
waiting for a polarity transition that has already occurred, causing all
future plug/unplug events to be ignored.

Should the interrupt status be cleared before reading the live state and
updating the polarity to close this race window?

> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
> -		    HDMI_IH_MUTE_PHY_STAT0);
> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
> =20
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D19
