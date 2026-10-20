Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489323;
	b=PJEKUNGFxMWtVXtOVOGKrI/NcPwaqvAiUQmgM7M6fiin+R9rRfwq3qVC7AYNOAxOz+Bm
	 0iOSdbtYoJjUfcduF9dmQwdvFo9B32X7bAGS/ah3hxOS7+ZqPUkzt3BEB53fgGQli02gW
	 UBQTIlrPe9nMiZiamQYx7a8AaygvBh0KD7LXyz1Vmvw2iIuYSkirTQr9AtlkdKm6idPXp
	 Jql3Gz7dS9ftkA3MLCAIOV/+9OARhQsWpx9gli/u6TQzl4TlLjvNNnCJg1vGTvdpNI5Ap
	 5+mtynV7iGONlgW3e7gNtyjAjZJEV/az1FEZkbKWeZpkfGZK6j5a1s4gY3phf9EhFAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489323;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0+w8L47pJ+QcNLvLT+uIclzH7RIf3GF4X4bJ73TryAA=;
	b=Uu4RdRLyn1yeVoO9v7+cCdBwwUcPqMT52JC59gXEjOk45TdDcc7Da7AvYgS+ZcBB0PEN
	 WbVn3PxsGawE8+LRAoIEzZtIE6KCcCupGwZwXG9PS51quUd34dgjLqgkMg506XXj4R9Rs
	 Y9A6SsUEPVAB6Ikcd55PJUzi+jrB8hHLbTdLLPA7UJjvrs7Pd8QBLmVG4QTOZrq5yDrhv
	 tkgFoiX9HW7sjX9wM9s7Mlrl3UeQwZ3ZyP2npDBxNv085Vec2gvSG5pdJRazPMujtTyUA
	 Ash7h4bnUK5CIGexS5M2xOerwKHIACXFx79+4NFMyUx2BwiSDWkyzfX/BXgrferJ84A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km8EWCwx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E660A4AEB
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km8EWCwx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455D11F000CC
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792489322;
	bh=0+w8L47pJ+QcNLvLT+uIclzH7RIf3GF4X4bJ73TryAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Km8EWCwxR+Zzjh6FMYg3SBjjCDcSzE2FgVCyhoD2TL60ip0UhKwxmoFunZ89pAQpC
	 ou5A7JPBulAZT5eYwHLFszy/9nlJQiL+Ahb/SEm2bQmy0SDPK/zi3cHWoiyXokweUh
	 DPuqOBdHE4bJdZhm57SOraVQU6dxmL5ExRYiKDxATyoV1WhFME2PVYN/l/J93U/yvX
	 sC5TPcsmr+cMVH/NbYMgVMb276IrtsBIjrsRN73qGUhkvWuJVnBnHDK/wy5lvQRwJw
	 jPWhBpvoNpDAL5JSW4T98ybUn38x0YU2gmShcc4PPKBO6O2BHTC7XzAd0hpbuOGYCz
	 Hmsp8qOYID4jQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso3754740a12.1
        for <imx@lists.linux.dev>; Tue, 20 Oct 2026 02:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+lOEG5VumcFMiTsrkUi2yagAJWTrnPDffoMk1DYht3Vxbsz8Ml/FNLOhAiUM/X7dDwnw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKwHLx9qz1IUdlq4Kx6V185HmHnq7OFa/HubtEC8hOAKWXkDK6+
	UAFvkcP030ruxiA/CgHMh05EUxAvbt8vx8mpGRyw40QSSFKIYp5aEaRDmYPKHhMADfdic9px1me
	/UVZJ2qOjl0+r0+BHBab94PwkwCq6eUg=
X-Received: by 2002:a17:907:3fa0:b0:c3e:f39b:2298 with SMTP id
 a640c23a62f3a-c419e64893cmr786840566b.16.1792489321089; Tue, 20 Oct 2026
 02:42:01 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018101744.93657-1-chunyuzhiqiang@yinhe.ht> <20261020075340.417899-1-chunyuzhiqiang@yinhe.ht>
In-Reply-To: <20261020075340.417899-1-chunyuzhiqiang@yinhe.ht>
From: Vincent Mailhol <mailhol@kernel.org>
Date: Tue, 20 Oct 2026 11:41:49 +0200
X-Gmail-Original-Message-ID: <CAMZ6RqKpP62XS5tPR714wUmwf6QkdY4V5fb7c4rTFSyoDc+DAA@mail.gmail.com>
X-Gm-Features: AclHuK8j2vhxpboFrSJHqbPHA0Zbly9gk71zkz9XBFZmbhQnPSzUv9vvEhv9tcQ
Message-ID: <CAMZ6RqKpP62XS5tPR714wUmwf6QkdY4V5fb7c4rTFSyoDc+DAA@mail.gmail.com>
Subject: Re: [PATCH v5] can: dev: can_fill_info(): don't wake up controller if
 interface is down
To: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	linux-can@vger.kernel.org, mkl@pengutronix.de, kernel@pengutronix.de, 
	haibo.chen@oss.nxp.com, shawnguo@kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue. 20 Oct. 2026 at 10:02, ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht> wrote:
> If the interface is down, the CAN controller might be powered down, the
> clock disabled, and/or its external reset asserted.
>
> Don't call do_get_berr_counter() or do_get_auto_tdcv() to read the CAN
> controller if the interface is down. This fixes a generic logic problem
> that exists on all platforms.
>
> As a result, IFLA_CAN_BERR_COUNTER and IFLA_CAN_TDC are no longer
> reported for down interfaces. This is intentional: the counters are not
> meaningful in that state, and calling into the driver can wake a
> runtime-suspended controller or touch registers whose clocks are gated.

The CAN TDC parameters are still meaningful when the interface is down.

What about this:

---8<---
diff --git a/drivers/net/can/dev/netlink.c b/drivers/net/can/dev/netlink.c
index 766d455950f55..1bc160b78b0e1 100644
--- a/drivers/net/can/dev/netlink.c
+++ b/drivers/net/can/dev/netlink.c
@@ -910,7 +910,7 @@ static int can_tdc_fill_info(struct sk_buff *skb,
const struct net_device *dev,
                if (tdc_manual) {
                        tdcv = tdc->tdcv;
                        err = 0;
-               } else if (dbt_params->do_get_auto_tdcv) {
+               } else if (dbt_params->do_get_auto_tdcv && netif_running(dev)) {
                        err = dbt_params->do_get_auto_tdcv(dev, &tdcv);
                }
                if (!err && nla_put_u32(skb, IFLA_CAN_TDC_TDCV, tdcv))
---8<---

?

All the other TDC parameters should still be available when the
interface is down, so just gating the auto tdcv is enough I think.

> Fixes: ec56acfef2af1 ("can: flexcan: flexcan_get_berr_counter(): switch on clocks before accessing ecr register")
> Cc: stable@vger.kernel.org
> Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
> ---
> v5:
>  - Gate can_tdc_fill_info() on netif_running() for IFLA_CAN_TDC, as
>    requested by Marc Kleine-Budde. This branch has no IFLA_CAN_XL_TDC
>    definition or call path at all.
>  - Keep the TDC part of can_get_size() consistent with can_fill_info(),
>    without hiding the non-TDC data bittiming attributes.
>  - Document that IFLA_CAN_BERR_COUNTER is no longer reported for down
>    interfaces, and explain why this is acceptable for stable.
>  - Clarify the Fixes: rationale.
> ---
>  drivers/net/can/dev/netlink.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/can/dev/netlink.c b/drivers/net/can/dev/netlink.c
> index 6f83b87d54fc..66b37257b76b 100644
> --- a/drivers/net/can/dev/netlink.c
> +++ b/drivers/net/can/dev/netlink.c
> @@ -548,8 +548,9 @@ static size_t can_tdc_get_size(struct data_bittiming_params *dbt_params,
>         return size;
>  }
>
> -static size_t can_data_bittiming_get_size(struct data_bittiming_params *dbt_params,
> -                                         u32 tdc_flags)
> +static size_t
> +can_data_bittiming_get_size(struct data_bittiming_params *dbt_params,
> +                           u32 tdc_flags, bool tdc_if_running)
>  {
>         size_t size = 0;
>
> @@ -560,7 +561,8 @@ static size_t can_data_bittiming_get_size(struct data_bittiming_params *dbt_para
>         if (dbt_params->data_bitrate_const)             /* IFLA_CAN_DATA_BITRATE_CONST */
>                 size += nla_total_size(sizeof(*dbt_params->data_bitrate_const) *
>                                        dbt_params->data_bitrate_const_cnt);
> -       size += can_tdc_get_size(dbt_params, tdc_flags);/* IFLA_CAN_TDC */
> +       if (tdc_if_running)
> +               size += can_tdc_get_size(dbt_params, tdc_flags);/* IFLA_CAN_TDC */
>
>         return size;
>  }
> @@ -584,7 +586,7 @@ static size_t can_get_size(const struct net_device *dev)
>         size += nla_total_size(sizeof(u32));                    /* IFLA_CAN_STATE */
>         size += nla_total_size(sizeof(struct can_ctrlmode));    /* IFLA_CAN_CTRLMODE */
>         size += nla_total_size(sizeof(u32));                    /* IFLA_CAN_RESTART_MS */
> -       if (priv->do_get_berr_counter)                          /* IFLA_CAN_BERR_COUNTER */
> +       if (priv->do_get_berr_counter && netif_running(dev))    /* IFLA_CAN_BERR_COUNTER */
>                 size += nla_total_size(sizeof(struct can_berr_counter));
>         if (priv->termination_const) {
>                 size += nla_total_size(sizeof(priv->termination));              /* IFLA_CAN_TERMINATION */
> @@ -598,7 +600,8 @@ static size_t can_get_size(const struct net_device *dev)
>         size += can_ctrlmode_ext_get_size();                    /* IFLA_CAN_CTRLMODE_EXT */
>
>         size += can_data_bittiming_get_size(&priv->fd,
> -                                           priv->ctrlmode & CAN_CTRLMODE_FD_TDC_MASK);
> +                                           priv->ctrlmode & CAN_CTRLMODE_FD_TDC_MASK,
> +                                           netif_running(dev));
>
>         return size;
>  }
> @@ -735,7 +738,7 @@ static int can_fill_info(struct sk_buff *skb, const struct net_device *dev)
>             nla_put(skb, IFLA_CAN_CTRLMODE, sizeof(cm), &cm) ||
>             nla_put_u32(skb, IFLA_CAN_RESTART_MS, priv->restart_ms) ||
>
> -           (priv->do_get_berr_counter &&
> +           (priv->do_get_berr_counter && netif_running(dev) &&
>              !priv->do_get_berr_counter(dev, &bec) &&
>              nla_put(skb, IFLA_CAN_BERR_COUNTER, sizeof(bec), &bec)) ||
>
> @@ -764,7 +767,7 @@ static int can_fill_info(struct sk_buff *skb, const struct net_device *dev)
>                      sizeof(priv->bitrate_max),
>                      &priv->bitrate_max)) ||
>
> -           can_tdc_fill_info(skb, dev, IFLA_CAN_TDC) ||
> +           (netif_running(dev) && can_tdc_fill_info(skb, dev, IFLA_CAN_TDC)) ||
>
>             can_ctrlmode_ext_fill_info(skb, priv)
>             )
