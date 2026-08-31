Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18EE352002
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188443; cv=none; b=i5SU+MfA2n1Y+kCd01SuiMBk+EUGJ3aOcA/LwrWWVQIZWxWN8i70McRd6+PKoA4ZWO/5N5YgCHIu7cGEJD9ob0oSmKZuq9fErYxVW0rDTmyk+O4M294qx1tr9gsjsTE3zyF+8xgtc/aTsGDq7K2zYeboYha4MVFLs33kHsA7ZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188443; c=relaxed/simple;
	bh=witbMN2yxefa9SDAdH8HD8oV0HpMjY6956EEPK7KEWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLkckVRs/RpZFixG/gN5weeGKAKUTF0d5/hRiC9JeNn1gVZCGgVDo2BRycsxEcIMxxRY3RfuizmzLCOsgGkk69Y+1NFfMfdm+Mz+mKL0tkBj750loCt57ZKzdKc1I4UGEPeXD4Nc3ZGSUHnzZyg9gZFhItT1DuY3ZHbQZiY5RfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM/9xjsw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM/9xjsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B361F000E9;
	Mon, 31 Aug 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188442;
	bh=nGE4pmHS6Jma0KLBnG1hGDrFGqq8Jr/m+oCt+cWKTsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cM/9xjswzUD4O3dlJDjGVbcvNOLSVCDA5k7obmVGGzRIIsgOTbGMBEWn9mEebItuH
	 ymjY4YsxL2izyvInNkO3bQYH8EgOsJXvXE5uBufDcx9s+3p1UVFz/mLJGOCjImrBFu
	 HNR5PZl03wOUvQ0vWX24+YcEGTsgMJXGmQ8mztCMo+vnrhqfiQFXwJI67OWgFaL5P4
	 aN7KaI6FZWoYbw+PiJ1O1hXySI5GP4Cr5YuznfLfaqSMGeqahCA8cIq1koqojM9nhg
	 UUDAjugpJlk/HC/HyHZQLVutOcphSFRZNazOz+UIGgd+/BJv6kv9wIUsxBZk4jcMtV
	 ePvKCuJR7QZ8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.12] mailbox: imx: Add a channel shutdown
 field
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831133314.4125787-195-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-195-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:00:41 +0000
Message-Id: <20260831150042.11B361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes the teardown race for RX channels but misses the i=
dentical race condition for TX channels, allowing spurious interrupts.
--

commit 339489ae41b0a2b0727c73521707e00976aca9f5
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Add a channel shutdown field

This commit introduces a shutdown flag to imx_mu_con_priv to coordinate
channel teardown and prevent the ISR from re-enabling interrupts after
imx_mu_shutdown() has disabled them. The flag is checked by a new function
imx_mu_xcr_set_act() before modifying the control register.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 6778afc64a048..44c2cc06b794e 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
[ ... ]
> @@ -220,6 +221,36 @@ static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, =
enum imx_mu_xcr type, u32 se
>  	return val;
>  }
> =20
> +static void imx_mu_xcr_clr_shut(struct imx_mu_priv *priv, struct imx_mu_=
con_priv *cp,
> +				enum imx_mu_xcr type, u32 clr)
> +{
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&priv->xcr_lock, flags);
> +	cp->shutdown =3D true;
> +
> +	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
> +	val &=3D ~clr;
> +	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
> +	spin_unlock_irqrestore(&priv->xcr_lock, flags);
> +}
> +
> +static void imx_mu_xcr_set_act(struct imx_mu_priv *priv, struct imx_mu_c=
on_priv *cp,
> +			       enum imx_mu_xcr type, u32 set)
> +{
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&priv->xcr_lock, flags);
> +	if (!cp->shutdown) {
> +		val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
> +		val |=3D set;
> +		imx_mu_write(priv, val, priv->dcfg->xCR[type]);
> +	}
> +	spin_unlock_irqrestore(&priv->xcr_lock, flags);
> +}
> +
[ ... ]
> @@ -377,7 +408,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *pri=
v, struct imx_mu_con_priv *
>  		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
>  	}
> =20
> -	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), =
0);
> +	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, 0));
>  	mbox_chan_received_data(cp->chan, (void *)priv->msg);
> =20
>  	return 0;

[Severity: High]
This is a pre-existing issue, but while this patch successfully fixes the
teardown race for RX channels, does the identical race still exist for TX
channels?

If mbox_free_channel() is called while a TX interrupt is active and there a=
re
pending TX messages, it calls imx_mu_shutdown() which sets cp->shutdown =3D=
 true
and clears the TX interrupt enable bit, then blocks in free_irq().

When the concurrent ISR completes the current TX, it calls mbox_chan_txdone=
(),
triggering msg_submit() to send the next queued message via
imx_mu_generic_tx() or imx_mu_specific_tx().

Both functions unconditionally rewrite the TX interrupt enable bit using
imx_mu_xcr_rmw(), bypassing the new shutdown flag:

drivers/mailbox/imx-mailbox.c:imx_mu_generic_tx() {
    ...
	case IMX_MU_TYPE_TX:
		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
		imx_mu_xcr_rmw(priv, IMX_MU_TCR, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->id=
x), 0);
		break;
    ...
}

And similarly in imx_mu_specific_tx():

drivers/mailbox/imx-mailbox.c:imx_mu_specific_tx() {
    ...
		for (; i < size; i++) {
			ret =3D readl_poll_timeout(...);
			if (ret) {
				...
			}
			imx_mu_write(priv, *arg++, priv->dcfg->xTR + (i % num_tr) * 4);
		}

		imx_mu_xcr_rmw(priv, IMX_MU_TCR, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->id=
x), 0);
		break;
    ...
}

Should these TX paths also be updated to use imx_mu_xcr_set_act() to prevent
a spurious interrupt from disabling the shared IRQ line during teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-195-sashal@kernel.org?part=3D1
