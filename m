Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8683EB11C
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885597; cv=none; b=exrvL0GuH2nhxwE75mLHJef2tiqGCFgWCepWvMfktq7TrSWsvB+0KYz4fw5B5R6gvMC6+rrmjJEi8YyizTkaec3NxFWE2CwwI+Y2So+FlooRxikoSFYkNH+G9c6tWB7rv+bqRoOvj8+WwnPOtjdU+bzdq6f1WYAKTgy+jnmWCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885597; c=relaxed/simple;
	bh=DknPkjRq9/2KncIY+46WisFJwqpOK9NoWhMV0r3o6nQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rI3qGGfxAGhXgz7uRYuN5ZQgYL5cdIQ7zxqp8bu04tdu5QoVq75eC7auJBBFyNtwfcOob7XRSM9luC0T7Ar6xpH7Cuz0sNtWCehTRP7b7ItoOeuKk6ezkBBDsd31neAuAR42e9EohrVRWpffzjvd78k+N14vfAbdLPQj82qvtFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMseEz/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMseEz/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619CB1F00893;
	Tue, 13 Oct 2026 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885596;
	bh=VZJXOU+xyXwt7eZFDLK7Vf4Zs0nBDHBLve+CzAoY5LM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMseEz/gnw9Be5/TRd4LhTrZC/vDOyrQfEr+IURfgDu58aoCV8ujBLP8CNVVJuKZ9
	 y4QtHm5LEnQ435kJGHDlrF/PYNiK2GfphJMWpsFpXkn0jVxkv3j752CQq3HdhGgqzg
	 IUEmshlSYeYLqSDwtb+mh4NAlvFWFCm0rSFOptC2rBS5nmZ/aBZPhJ3yBVk+N7tGvU
	 QY7RGOop0Vrt1H8QtEWDJYg36DpmuNNsBChf9gEeyXq/Kob/ViF/+enpz3Cmck/SzV
	 tZqjxG0g8WPm3LsF7uTREF7unzEw4yriTKfByDR7jdlo52jWpO9QI2I04t4jvuniXj
	 H4qSEVZvEqI/g==
Message-ID: <sashiko-outbox-169416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net-next 5/9] net: dsa: netc: use entry ID instead of
 pointer to track host flood rule
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261012095924.1129312-6-wei.fang@oss.nxp.com>
References: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
 <20261012095924.1129312-6-wei.fang@oss.nxp.com>
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
- [High] netc: Sleeping in Atomic Context during port_set_host_flood
--

commit ec5410333ea86338656a97517d41df973b9cde3c
Author: Wei Fang <wei.fang@nxp.com>

    net: dsa: netc: use entry ID instead of pointer to track host flood rule
   =20
    Replace the struct ipft_entry_data pointer in struct netc_port with a
    plain u32 entry ID (ipft_hf_eid), using NTMP_NULL_ENTRY_ID as the
    sentinel value. The ipft_entry_data allocation is now freed immediately
    inside netc_port_add_host_flood_rule() after the hardware entry is
    committed, so no heap memory survives beyond that function. As a result,
    netc_free_host_flood_rules() is no longer needed and can be removed.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index c639ae67c9b71..e33a184fd0054 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -1890,7 +1876,7 @@ static void netc_port_set_host_flood(struct dsa_swi=
tch *ds, int port,
>  				     bool uc, bool mc)
>  {
>  	struct netc_port *np =3D NETC_PORT(ds, port);
> -	struct ipft_entry_data *old_host_flood;
> +	u32 old_entry_id;
> =20
>  	/* Do not add host flood rule to ingress port filter table when
>  	 * the port has joined a bridge. Otherwise, the ingress frames
> @@ -1898,7 +1884,7 @@ static void netc_port_set_host_flood(struct dsa_swi=
tch *ds, int port,
>  	 * will be redirected directly to the CPU port.
>  	 */
>  	if (dsa_port_bridge_dev_get(np->dp)) {
> -		netc_port_remove_host_flood(np, np->host_flood);
> +		netc_port_remove_host_flood(np, np->ipft_hf_eid);
> =20
>  		return;
>  	}
> @@ -1908,20 +1894,18 @@ static void netc_port_set_host_flood(struct dsa_s=
witch *ds, int port,
> =20
>  	/* IPFT does not support in-place updates to the KEYE element,
>  	 * we need to add a new entry and then delete the old one. So
> -	 * save the old entry first.
> +	 * save the old entry ID first.
>  	 */
> -	old_host_flood =3D np->host_flood;
> -	np->host_flood =3D NULL;
> +	old_entry_id =3D np->ipft_hf_eid;
> =20
>  	if (netc_port_add_host_flood_rule(np, uc, mc)) {

[Severity: High]
Does this code sleep in atomic context?

The port_set_host_flood callback in DSA drivers is invoked via
ndo_change_rx_flags (e.g., when toggling promiscuous or allmulti mode on the
interface). The networking core holds netif_addr_lock_bh() during this
operation, creating an atomic context where sleeping is prohibited.

However, netc_port_set_host_flood() calls netc_port_add_host_flood_rule(),
which performs a sleepable allocation:

	host_flood =3D kzalloc_obj(*host_flood);

Additionally, it calls ntmp_ipft_add_entry(), which allocates a DMA buffer
using dma_alloc_coherent() with GFP_KERNEL and calls read_poll_timeout()
with a 10us sleep (usleep_range). Executing these sleepable operations while
holding a spinlock with BH disabled will trigger a sleeping-in-atomic panic.

> -		np->host_flood =3D old_host_flood;
>  		dev_err(ds->dev, "Failed to add host flood rule on port %d\n",
>  			port);
>  		return;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095924.1129=
312-1-wei.fang@oss.nxp.com?part=3D5
