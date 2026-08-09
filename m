Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB519F115
	for <imx@lists.linux.dev>; Sun,  9 Aug 2026 03:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786245548; cv=none; b=chWMIKTwxQuCU1HFB3J5xPmyVxrxscY+ikBVA4VudyJETxTNNkiUoLIOt0Pi/JFQUfGz5Xiz37yB/wz3ApLEoaWcdt4Lm6yDjmSRn2Koro64A5SnAetJv7d+rto+lcFIr3Iyp3BiZnx7PqU/xivH+D0vAe8TTwYI1Iw4A3Xs6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786245548; c=relaxed/simple;
	bh=/KXqhK4EtKLrdZ/qkrRJei+E0a3/Wa+a3J2/nYTqbKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PCbZnDIMGkiSf+GVpT/mxXSbRrkbtXSRIsjok/UC1wYcZD4/M26yNd87nzQllB3JjaQvD+jWoudEdjAir8ZaolpMDieQKyj70dd8xs0HNCExT34cTcWcdCNksijpZ9tTcaFDWLABlEyciwb31SQgCVyrCt21QSS72TLWBu89GkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Av0nWYPk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Av0nWYPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98761F000E9;
	Sun,  9 Aug 2026 03:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786245547;
	bh=PATc7pGXiFUj19Ct7Mxsk+Dymta9poJKmRLT0A2cuuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Av0nWYPkacvG30VgZSixhETRwl/jva5yOgFGhbDD1zuA9B3JYvOvlQ7kCga4BOV0A
	 WVfdZFSeGdmcSBn1GfroUmAKYIVlnkk871CXEk/Pvz0wHa1QlC7/c/0rKmjqVS6SMY
	 uCPi56U17y6oP+l4xu8XMSVHiq4wgq6QV0Jj2OhvCnlAhAh2viBwJim0sZY2cnuh2n
	 UBcFi6LaOqWU6F92vQRMolLNYdn+JtHVwR4SYadpym06QCFe8ybXrqXL9nZ946jfRI
	 cICvhWgY8p2IWBL5abBgrwfsLSzweD32EW4W5LoP+XIVakJkEHFfEcpkUIUw0d3ZoY
	 EvCgv+/mVp2lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 7/7] net: dsa: netc: add PTP one-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260808032146.2335723-9-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
 <20260808032146.2335723-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 03:19:06 +0000
Message-Id: <20260809031906.C98761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unloading the netc driver module does not wait for in-flight one-s=
tep Sync SKBs or asynchronous context destruction to complete, causing a ke=
rnel panic when unmapped module code is executed.
- [High] Forcefully clearing the `in_flight` flag during port disablement a=
llows multiple one-step frames to be in flight concurrently, corrupting the=
 shared SINGLE_STEP hardware register.
- [Medium] Manual software modification of the UDP checksum can evaluate to=
 0, which is invalid for IPv6 and disables checksums for IPv4.
--

--- Patch [7]: [PATCH v2 net-next 7/7] net: dsa: netc: add PTP one-step tim=
estamping support ---
commit 4c7369406992245c62dd03f01878b8201447752c
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP one-step timestamping support

This commit adds PTP one-step TX timestamping support for the NETC switch.
It handles one-step Sync packets by deferring transmission to a process-con=
text
work queue to accommodate sleeping hardware register accesses. It bypasses =
the
normal DSA user xmit path to avoid double counting TX stats.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 4e139ffc2f76a..55664045ba19d 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -1005,6 +1028,19 @@ static void netc_free_ports_resources(struct netc_=
switch *priv)
>  			continue;
> =20
>  		netc_port_purge_txtstamp_queue(np);
> +
> +		/* dsa_tree_teardown() calls dsa_tree_teardown_ports() before
> +		 * dsa_tree_teardown_switches(), so netc_port_disable() is
> +		 * executed before netc_teardown() and purges onestep->queue,
> +		 * so here we only need to drop the port's owner reference.
> +		 * In-flight one-step skbs still hold references via the
> +		 * destructor; the context (and its work) is freed only after
> +		 * the conduit frees the last in-flight skb. By then np may
> +		 * be gone, but the work no longer dereferences np because
> +		 * onestep->active has been cleared.
> +		 */
> +		netc_onestep_put(np->onestep);
> +		np->onestep =3D NULL;
>  	}
>  }

[Severity: High]
Does unloading the netc driver module wait for in-flight one-step Sync SKBs
to complete transmission by the conduit device?

Because the driver drops its reference here and allows the module unload to
complete, the kernel could attempt to execute netc_onestep_skb_destructor()
after the module memory has been unmapped when the conduit eventually frees
the SKB, leading to a panic.

[ ... ]
> @@ -1579,6 +1622,7 @@ static int netc_port_enable(struct dsa_switch *ds, =
int port,
>  static void netc_port_disable(struct dsa_switch *ds, int port)
>  {
>  	struct netc_port *np =3D NETC_PORT(ds, port);
> +	struct netc_onestep *onestep =3D np->onestep;
> =20
>  	/* When .port_disable() is called, .port_enable() may not have been
>  	 * called. In this case, both the prepare_count and enable_count of
> @@ -1588,6 +1632,13 @@ static void netc_port_disable(struct dsa_switch *d=
s, int port)
>  	if (!np->enable)
>  		return;
> =20
> +	if (onestep) {
> +		mutex_lock(&onestep->work_lock);
> +		onestep->active =3D false;
> +		netc_port_purge_onestep_queue(onestep, true);
> +		mutex_unlock(&onestep->work_lock);
> +	}
> +
>  	clk_disable_unprepare(np->ref_clk);
>  	np->enable =3D false;
>  }
> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> index 1384a6f31d1c1..d0423b3c8c33a 100644
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c
[ ... ]
> +static void netc_port_program_onestep(struct netc_port *np,
> +				      struct netc_onestep *onestep,
> +				      struct sk_buff *skb,
> +				      u64 tstamp)
> +{
[ ... ]
> +		old_sec_h =3D __get_unaligned_t(__be16, hdr + tstamp_offset);
> +		old_sec_l =3D __get_unaligned_t(__be32, hdr + tstamp_offset + 2);
> +		old_ns =3D __get_unaligned_t(__be32, hdr + tstamp_offset + 6);
> +		inet_proto_csum_replace2(&uh->check, skb, old_sec_h,
> +					 new_sec_h, false);
> +		inet_proto_csum_replace4(&uh->check, skb, old_sec_l,
> +					 new_sec_l, false);
> +		inet_proto_csum_replace4(&uh->check, skb, old_ns,
> +					 new_ns, false);
> +		csum_update =3D true;
> +	}

[Severity: Medium]
Could this manual software modification of the UDP checksum evaluate to 0?

A UDP checksum of 0 is invalid for IPv6 and disables checksums for IPv4.
Does this require a check to convert a 0 result into CSUM_MANGLED_0 (0xFFFF)
to prevent non-compliant packets?

[ ... ]
> +void netc_port_purge_onestep_queue(struct netc_onestep *onestep,
> +				   bool clear_flight)
> +{
> +	struct sk_buff_head free_list;
> +
> +	__skb_queue_head_init(&free_list);
> +
> +	spin_lock_bh(&onestep->queue_lock);
> +	skb_queue_splice_init(&onestep->queue, &free_list);
> +	if (clear_flight)
> +		onestep->in_flight =3D false;
> +	spin_unlock_bh(&onestep->queue_lock);
> +
> +	__skb_queue_purge(&free_list);
> +}

[Severity: High]
Does forcefully clearing the in_flight flag here during port disablement
allow a new frame to be dequeued if the port is quickly brought back up?

If so, a new frame could be programmed into the shared SINGLE_STEP hardware
register while the previous frame is still physically in flight in the cond=
uit.
Could this break the 1-to-1 serialization required by the hardware and lead=
 to
corrupted timestamps?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808032146.2335=
723-1-wei.fang@oss.nxp.com?part=3D7
