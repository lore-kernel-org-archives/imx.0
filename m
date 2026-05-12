Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA561A6838;
	Tue, 12 May 2026 03:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557903; cv=none; b=gk6dqbrKqoeMUjRmyo14BBr7yHkTySgR/kW1baWIuVCEvLa7+brJ4IWn9fHsBHnFLkXtJAo59fXG9WU3MpPFExhMuwiGcrDuaqJYJhtn/JcaAeJZPbXsA7KFMTfn0C4NnUO2JsmlAh5hmJTjbAMeDYprW/skhIREMPGkC02Tqj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557903; c=relaxed/simple;
	bh=AQup6eRZlVqfNfXDjeqcR6lbGFnS6rR6DWXHd+Ud/r8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MYbxiU/gI72hpkNZUaO5+Zld/yAW77CTj9ziPEpLySuNefbbDPmUEX9RuJvxUrSzMopEBzXb58ZYmR+n95/c3mMrJ3EqJ3n7cSnJXG4cdkApSXm6eL40mvBExmlq3e0jMWIsihiWGlquwEbDUhIFdMh1/IV4PJyHes4yJm/o5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n30kDTlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n30kDTlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0663CC2BCB8;
	Tue, 12 May 2026 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557903;
	bh=AQup6eRZlVqfNfXDjeqcR6lbGFnS6rR6DWXHd+Ud/r8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=n30kDTloxZU491fvOFOVDOtIV3V3uspx3A4OD6zqwYkOE4a9gOcjpE18yc7p7v252
	 lzFlgKs0W/qfU1s9XVnxuWIy9meGOuHPeB+cHOrRGIXvdsdB0jL0HjoOEPlw2Ij3Ib
	 /BqthKv9zRy/s5iwL/apVkEsKcebvDzfHw5tOOxqOavCA4FproEMcYibxL9gtW/YKJ
	 CzASgFNDnOEoOAlBgH79vfoJ44TEkWAnykBHGsjoOLf2SzXGTXS2kuXsWLkDBFCaFn
	 hK1ZWeenkrQpQKRGWdGjz3bJpFRyZYSRfjp7PoR8B/s/ll1EpmmF0rIiH9NsfB4N3X
	 u194GlH7/j4jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 17/21] drm: bridge: dw_hdmi: Rework HDP and RXSENSE
 interrupt handling
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260510124111.1226584-18-jonas@kwiboo.se>
References: <20260510124111.1226584-18-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:51:42 +0000
Message-Id: <20260512035143.0663CC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The delayed work `hpd_work` can be re-armed during device removal,=
 leading to a Use-After-Free.
- [High] The new HPD debouncing logic entirely swallows short HPD pulses me=
ant to signal EDID changes.
- [High] The IRQ handler can overwrite the teardown interrupt mute, leaving=
 interrupts enabled after driver unloads.
--

commit 7856139a882918cd7a789f36dd7c8fda0cd5ba3d
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Rework HDP and RXSENSE interrupt handling

This commit removes RXSENSE handling to simplify the HPD interrupt handling
and instead depends on a debounced HPD work to refresh the EDID. It also
ensures the initial HPD interrupt polarity is based on current HPD status.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index f32eea9106b00..7fd2de41bc02c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -3051,78 +3002,29 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void =
*dev_id)
> =20
>  void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sens=
e)
>  {

[ ... ]

>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  {
>  	struct dw_hdmi *hdmi =3D dev_id;

[ ... ]

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
> =20
> +		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
> +				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));

Can this delayed work be re-armed during device removal, leading to a
use-after-free?

In dw_hdmi_remove(), cancel_delayed_work_sync(&hdmi->hpd_work) is called
before the hardware PHY interrupts are muted. Furthermore, the IRQ is
managed by the devm framework, so the handler is not unregistered until
after dw_hdmi_remove() returns.

If an HPD interrupt fires in the window after the work is canceled but
before interrupts are disabled, the IRQ handler will execute and
unconditionally call mod_delayed_work(), placing the work back on the
queue. When the devm framework subsequently frees the hdmi structure, the
queued work remains. When the timer expires, dw_hdmi_hpd_work() will
execute and dereference the freed hdmi pointer.

Also, does this debouncing logic swallow short HPD pulses meant to signal
EDID changes?

HDMI 1.4b specifications state that a sink indicates an EDID change by
driving a low voltage level pulse on the HPD pin for at least 100ms. The
delayed work debounce waits for HOTPLUG_DEBOUNCE_MS.

When a pulse occurs, the timer is queued on the falling edge and
re-queued/extended on the rising edge. When dw_hdmi_hpd_work() finally runs
after the debounce period, the HPD line has returned to high. Because this
steady-state matches the existing connector status,
drm_helper_hpd_irq_event() will not see a status change and thus will not
generate a hotplug event. This completely prevents the system from reading
the new EDID.

> +	}
> =20
>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
> -		    HDMI_IH_MUTE_PHY_STAT0);
> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);

Can this overwrite the teardown interrupt mute, leaving interrupts enabled
after the driver unloads?

During device teardown, dw_hdmi_remove() attempts to disable all interrupts
by writing ~0 to this exact register. Since dw_hdmi_remove() does not
synchronize with the IRQ handler (the IRQ is freed by devres only after
remove returns), the IRQ handler can run concurrently and overwrite the
teardown's ~0 with ~HDMI_IH_PHY_STAT0_HPD.

This leaves the PHY interrupts unmuted at the hardware level. Because the
IRQ is registered with IRQF_SHARED, a subsequent HPD hardware event will
assert the shared IRQ line with no registered handler, causing an unhandled
interrupt storm and forcing the kernel to permanently disable the shared
IRQ line.

> =20
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D17
