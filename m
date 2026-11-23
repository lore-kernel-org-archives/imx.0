Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410338;
	b=PYnJhhLCjaVVlGOgd/MCgzUMjSMxBNMMp+uk2A6l031GvthFyE4xARQvb/+OMuHVekEs
	 pmER9vnsNSjoCDnrcd4RLaZVbqZqHmVnOKKsse/2KeJbynBqRlfX0xYa1bx6xcGZyXYmG
	 MJEA/X1e8y/pbkf1Z5ZLCJof8AX82SJZaL20QrxaeGD1EH+aP50YHGe9QUsoBMgdnxWoY
	 xn9BA/Kg40Y1gsz8pJ0Ue5TWlIsF67yIevtEXbtM6oN75Qxu2fnbg32QzfBEPAl9bbpb2
	 h2uPz5t5i7STDsnf937xQN/eiEV2m3eLacu+adxUs4QoBLscYlxAmdKx/7iFwPqi7AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410338;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OwqgaMwlssCF6T8XACGcIQ2/Zb/X9SJl/vX6eZW6QY4=;
	b=zqjvB3rm7freChdROhvUTWQcPjZpcl//y9cmyoqW5VBn4UDOKOXTAJRT5U1L7AgQo+nB
	 /vLEvtvITvdkvh7VyxrhmskxraFJROhLMzLdpURB3Cmk4mjYZ281QiJslZvrvMg/co6RT
	 hfst92HJwsYR4eDwFTO7h+LPDAfJ5Prp0VZsI5xRGPXnJr24JqpwEVglTHOCRLMdfMQPM
	 d0sbj6yCIFDPCBdxOA//G4b4cskoqWqMs4IVdDdIwbL73CvkGIaYQGNphKVHSEWt+ArcM
	 1D4kA97ITikh5+oXJ78FBFRzrpV9drH1BMppTzhci+XZqTCwWun0bi6nzwUHyeP3EFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejmeyoo3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0CA606A334;
	Mon, 23 Nov 2026 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejmeyoo3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9511F000D3;
	Mon, 23 Nov 2026 05:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795410338;
	bh=OwqgaMwlssCF6T8XACGcIQ2/Zb/X9SJl/vX6eZW6QY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ejmeyoo389uKlQeAdEASYz/LMHuJbkUqd1UV7zOurK46AZnpW5nbTuLvFGgnFC84t
	 YLDwFhslZ09ud9jDfU3aa0tRIQfbjPch4eRtHXEgfIUqY5ch6chdeqdQM7PbUa56Fa
	 DM0zQYnrHqrN1An5cg7JMbsYXit74wygWQC7xp7gVQv+/k3bpOfrRTe2kiVnhMl39c
	 AFg7r97hNxfHbcvLnw9T/pTsPo7o5sRu8hsY0kGRSLGUBMcEwh17sScubrK/oY396P
	 DkiNfrA+8lQbYUWunD1W4QvE9SblDe7CWMX4QWgMRhpNwSpxwGv+Cr4sWiVQZoDJIX
	 BERnRwEeedmyA==
Subject: Re: [PATCH v8 net-next 6/9] net: dsa: netc: check return value of
 ntmp_ipft_delete_entry()
From: netdev-bot+sashiko@kernel.org
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 05:05:37 +0000
Message-ID: <179541033709.3135.10401749390258091680@kernel.org>
In-Reply-To: <20261119030534.1892935-7-wei.fang@oss.nxp.com>
References: <20261119030534.1892935-7-wei.fang@oss.nxp.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] netc_port_remove_host_flood()
  (drivers/net/dsa/netc/netc_main.c:1877-1901) treats every error from…
- [Low] The patch restructures netc_port_bridge_join()
  (drivers/net/dsa/netc/netc_main.c:2104-2159) without saying so in the…

--

net: dsa: netc: check return value of ntmp_ipft_delete_entry()

This commit makes netc_port_remove_host_flood() return errors from
ntmp_ipft_delete_entry(). The tracked entry state is now cleared only
after a successful delete. It also changes host flood rule replacement
from add-then-delete to delete-then-add. In netc_port_bridge_join(), the
host flood removal moves to the start of the join, and the error path now
tries to restore the rule.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> index 7d0893bc0f163..e1ec7aecab0f9 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1880,32 +1874,36 @@ static int netc_port_add_host_flood_rule(struct netc_port *np,
>  	return err;
>  }
>  
> -static void netc_port_remove_host_flood(struct netc_port *np, u32 entry_id)
> +static int netc_port_remove_host_flood(struct netc_port *np)
>  {
>  	struct netc_switch *priv = np->switch_priv;
> -	bool disable_host_flood = false;
> +	u32 entry_id = np->ipft_hf_eid;
> +	int err;
>  
>  	if (entry_id == NTMP_NULL_ENTRY_ID)
> -		return;
> +		return 0;
>  
> -	if (np->ipft_hf_eid == entry_id)
> -		disable_host_flood = true;
> +	/* The command BD ring is always enabled here, with the ring
> +	 * enabled, the hardware completes a command well within 1 ms,
> +	 * so -ETIMEDOUT cannot happen here. Any error therefore means
> +	 * that the entry has not been deleted, so keep tracking it.
> +	 */
> +	err = ntmp_ipft_delete_entry(&priv->ntmp, entry_id);
> +	if (err)
> +		return err;

[Severity: Medium]
Is it safe to read every error from ntmp_ipft_delete_entry() as "the
entry was not deleted"?

In netc_xmit_ntmp_cmd() in drivers/net/ethernet/freescale/enetc/ntmp.c,
the command BD is posted and the producer index is written before the
poll:

	cbdr->next_to_use = i;
	netc_write(cbdr->regs.pir, i);

	err = read_poll_timeout(netc_read, val,
				(val & NETC_CBDRCIR_INDEX) == i,
				NETC_CBDR_DELAY_US, NETC_CBDR_TIMEOUT,
				true, cbdr->regs.cir);
	if (unlikely(err))
		return err;

	if (unlikely(val & NETC_CBDRCIR_SBE)) {
		dev_err(cbdr->dev, "Command BD system bus error\n");
		return -EIO;
	}

When this returns -ETIMEDOUT, or -EIO for SBE, the hardware may already
have done the delete, or may still do it later. The comment above rules
out the timeout, but nothing in the code enforces that. There are also
two command rings (NETC_CBDR_NUM is 2), and the poll is a fixed 1 ms.

If the delete did take effect, np->ipft_hf_eid would keep an entry ID
that no longer exists. Every later delete of that ID would then fail on
the response error status check in netc_xmit_ntmp_cmd():

	if (unlikely(status)) {
		dev_err(cbdr->dev, "Command BD error: 0x%04x\n", status);
		return -EIO;

Wouldn't that make the failure permanent?

If so, this would have these effects:

- netc_port_bridge_join() now returns this error, so the port could never
  join a bridge.

- In standalone mode, netc_port_set_host_flood() would log an error and
  return on every call. The host flood setup would be frozen while
  np->uc and np->mc still say it is active.

- If the hardware gives the freed ID to another port's rule in a later
  ntmp_ipft_add_entry(), this port's next delete would remove that other
  port's rule.

Only a full DSA teardown and setup would clear this, because
netc_init_all_ports() resets ipft_hf_eid. Before this patch, a failed
delete never blocked a bridge join.

Could the error handling treat these cases differently: not submitted
(-ENOMEM, -EBUSY), state unknown (-ETIMEDOUT, SBE), and entry already
gone?

This logic is still the same at the end of the series. The later commit
"net: dsa: netc: enable ingress port filtering lookup by default" only
removes the PIPFCR write.

>  
> -	ntmp_ipft_delete_entry(&priv->ntmp, entry_id);
> +	np->ipft_hf_eid = NTMP_NULL_ENTRY_ID;
> +	np->uc = false;
> +	np->mc = false;
> +	netc_port_wr(np, NETC_PIPFCR, 0);

[ ... ]

> @@ -2099,6 +2109,8 @@ static int netc_port_bridge_join(struct dsa_switch *ds, int port,
>  	struct netc_port *np = NETC_PORT(ds, port);
>  	struct netc_switch *priv = ds->priv;
>  	u16 vlan_unaware_pvid;
> +	bool uc = np->uc;
> +	bool mc = np->mc;
>  	int err;
>  
>  	if (!bridge.num) {
> @@ -2110,6 +2122,12 @@ static int netc_port_bridge_join(struct dsa_switch *ds, int port,
>  	if (err)
>  		return err;
>  
> +	err = netc_port_remove_host_flood(np);
> +	if (err) {
> +		NL_SET_ERR_MSG_MOD(extack, "Failed to delete host flood rule");
> +		return err;
> +	}
> +
>  	netc_port_set_mlo(np, MLO_NOT_OVERRIDE);
>  

[ ... ]

> @@ -2123,8 +2141,6 @@ static int netc_port_bridge_join(struct dsa_switch *ds, int port,
>  	netc_port_set_pvid(np, vlan_unaware_pvid);
>  
>  out:
> -	netc_port_remove_host_flood(np, np->ipft_hf_eid);
> -
>  	if (atomic_inc_return(&priv->br_cnt) == 1)

[ ... ]

> @@ -2134,6 +2150,11 @@ static int netc_port_bridge_join(struct dsa_switch *ds, int port,
>  disable_mlo:
>  	netc_port_set_mlo(np, MLO_DISABLE);
>  
> +	if (netc_port_add_host_flood_rule(np, uc, mc))
> +		dev_err(ds->dev,
> +			"Failed to restore host flood rule on port %d\n",
> +			port);
> +
>  	return err;
>  }

[Severity: Low]
Should the commit message also describe this change to
netc_port_bridge_join()?

Before this patch, the host flood rule was removed only at the out:
label, after the join had succeeded. If the join failed, for example
because netc_port_set_vlan_entry() failed, the standalone host flood
rule and PIPFCR were left alone.

Now the rule is deleted at the start of the join. The disable_mlo path
then tries to add it back using the uc and mc values saved on entry. If
that add fails (-ENOMEM, -EBUSY or -EIO), the port stays standalone with
no host flood rule, np->uc and np->mc are false, and only a dev_err() is
printed.

DSA does not call .port_set_host_flood() again after a failed join. So
the port would stay without host flooding until its RX flags change.

The commit message covers the delete-then-add trade-off only for
port_set_host_flood(). It does not mention the bridge join reordering,
the new restore path, or this failure mode on the join error path.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119030534.1892935-1-wei.fang%40oss.nxp.com
