Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A671740A945
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885598; cv=none; b=CP+9kFI7sa5KR8kspJt5TDRiEOAFP4BMyrMa+4pamLMbSjoabYB8T5NYRDHASDk6OvDC4hJu9oZjLVC7DRDbeamijdUdhAosFTiU5301TyJ29Yro6kmNKerPlnHlaDJYHhpRCiythaDB4OEw1eje2ueKB2CJzl2ZCJuEggrJ7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885598; c=relaxed/simple;
	bh=iFR3G510IL6dkpBcgtM0pw7hqFERV12DMMAywoEFnSw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JR/oFLuelYuc5FytKwIXTMVuKDxpVJTc0eIQooI8gRrbIhFOyRG0AVAZReEOHnmyKNDtoa0RQTHZCDYmH5kGpl6+y+3P9FHNd+/K1RrL8BQXn+DDaJIndEgRY125fu23D7FsPl0Lye0RznAoqkWr5vx5B9t9reGzdpyW29eH/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWnLebvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWnLebvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251D81F00898;
	Tue, 13 Oct 2026 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885597;
	bh=f8nCfGLkWaKVBbpWRFozLdXdbSGP/V6/9aZbbCo3ayI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WWnLebvq2t+NXcAUTdjRLqub1TLrE4qHwrrKZEvnymzz53RjIYSBGC7wxfVr7uARF
	 3nviBRJXu5W2gR6DaGhAQyxcyGCIsbM+PWG1MszpFO/WZHU55ECfSkfx+TAJYz9dDg
	 cpc/E0zAC8iWmxJ8i6UXYLGfIOAUQCapmmKjPJqUBdHBc71xIR/w7NUVQWvFYs9z4w
	 kCc70941HAbj3D60i1oX8Jo1uEXSOt7nUy8nPc8P9X3Y5TnDbh7NpJ4G/rCxX9bBxF
	 Z2f+cApZkibS+utbM8st3aOjcaB899JIgyMjNJ28wDGLJ9XMxXjY5XJd77WSHucQfW
	 A/O373s3FpUgA==
Message-ID: <sashiko-outbox-169419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261012095924.1129312-9-wei.fang@oss.nxp.com>
References: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
 <20261012095924.1129312-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:59:56 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: netc: uninitialized tstamp_queue causes NULL deref on po=
rt init failure
--

commit 14af7463afd31a995fbafa852be1eeb366978370
Author: Wei Fang <wei.fang@nxp.com>
   =20
net: dsa: netc: add PTP two-step timestamping support
   =20
This commit adds two-step TX and RX timestamping support for the NETC switc=
h.
It implements hardware filters to redirect PTP frames to the CPU port and
handles hardware-generated timestamps via the tagger.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 1a7103fe1e343..cb262ae5ba796 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -277,6 +291,11 @@ static void netc_free_all_ports(struct netc_switch *=
priv)
>  		if (!np)
>  			continue;
> =20
> +		if (np->dp && dsa_port_is_user(np->dp)) {
> +			disable_delayed_work_sync(&np->tstamp_timeout_work);
> +			netc_port_purge_tstamp_queue(np);
> +		}
> +

[Severity: High]
If np->dp is set but netc_port_ptp_init() hasn't run yet, tstamp_timeout_wo=
rk
and tstamp_queue will be completely zero-initialized since np is allocated
with kzalloc_obj. Is it safe to call disable_delayed_work_sync() and
netc_port_purge_tstamp_queue() on zero-initialized structures?

[ ... ]
> @@ -346,6 +365,15 @@ static int netc_init_all_ports(struct netc_switch *p=
riv)
>  				dev_err(dev, "Failed to create MDIO bus\n");
>  				goto free_all_ports;
>  			}
> +
> +			/* Only the user port needs to support PTP feature, so
> +			 * PTP-related resources, such as tstamp_queue,
> +			 * tstamp_lock, etc., are initialized only for the user
> +			 * port.
> +			 */
> +			err =3D netc_port_ptp_init(np);
> +			if (err)
> +				return err;
>  		}
>  	}

[Severity: High]
In netc_init_all_ports(), np->dp is assigned early in the loop:

    np->dp =3D dp;
    ...
    err =3D netc_port_create_mdio_bus(np, dp->dn);
    if (err) {
        dev_err(dev, "Failed to create MDIO bus\n");
        goto free_all_ports;
    }

If netc_port_create_mdio_bus() or netc_port_get_info_from_dt() fails, it
jumps to free_all_ports before netc_port_ptp_init() is called. Could this
leave the zero-initialized PTP structures exposed to the cleanup path in
netc_free_all_ports() since np->dp was already set?

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> new file mode 100644
> index 0000000000000..756c69a02064e
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_ptp.c
[ ... ]
> +void netc_port_purge_tstamp_queue(struct netc_port *np)
> +{
> +	struct sk_buff_head free_list;
> +
> +	__skb_queue_head_init(&free_list);
> +
> +	spin_lock_bh(&np->tstamp_lock);
> +	skb_queue_splice_init(&np->tstamp_queue, &free_list);
> +	spin_unlock_bh(&np->tstamp_lock);
> +
> +	__skb_queue_purge(&free_list);
> +}

[Severity: High]
If np->tstamp_queue is uninitialized (all zeros), skb_queue_splice_init()
will find that list->next is NULL. When it calls __skb_queue_splice(), it
attempts to write to list->next->prev, which would cause a deterministic NU=
LL
pointer dereference and a kernel panic. Additionally, locking the=20
uninitialized tstamp_lock would trigger lockdep splats.

Could np->dp be cleared on the error path to avoid this, or should we track
PTP initialization state separately?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095924.1129=
312-1-wei.fang@oss.nxp.com?part=3D8
