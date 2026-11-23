Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410342;
	b=bs6vh+gesfiZ4o07SraiOPYY1e01vyLqZ2qrhuXnJyy82b97QjyTgXpCg5DOWGuxB/E3
	 EHv1cDtHgackRq0UAWXD7gkYobAZS6e1LnF6Ri07sWSsqvDyZITnioiZ3xtlj586i/Mfm
	 jMEeW2iY0PpdbObUeY+SmVRb+fBqCHpNxgbr4zLBvOVI0rAQfCWvFfC30TKMxzz1gltRp
	 aGYIwzc9X2exHZugL2y4xEvhpn5tSE6kDbMQy7z0clDEEpGA8jPW+8PvbRvZW3cAGN4XW
	 Jxzy4gBiwfKbE4/tiXAyy7aRuJHTevJM54PTgDYs40WAEErbFN0weAT8JbtjlH2lECg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410342;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YZFYyshGMkQG/jKK+b6CCs4DmdN8U4z1ESvjudH9KZ4=;
	b=pT+SFamdi2fvJ7c84zZ+LVBWw17bbjAbCmmpXzCsWaFIt/CVeD0RGx8oe/Tv7Lz5RVx8
	 9u0Ou801Bvqh7Y61PXfW0TZTMSp3QKfJsEwlv6nqI6Pd3BtkwTEDeOaExflW127lC6N4z
	 EZrK/Z+mHTdiKGeD/hEm5XBzMQLH4f9KP7KEbEw4zaSeIN0+1sLtf/16jQPysWyNFXlzw
	 Xq6cB0kp+uoxvUi66knzm6qLuwQeJqZXYr3UZlXTCs0ysh9nWpmpbaH4n/4kSk5whwX/x
	 Ca5NKF36/mFxCYG1oYj0+LslSi70D+sK3gXCLcu/1+zogk8EMhPt2gxZ0Sf9kXos2vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fh3M8yiE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3635606A688;
	Mon, 23 Nov 2026 05:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fh3M8yiE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D12E1F00A03;
	Mon, 23 Nov 2026 05:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795410342;
	bh=YZFYyshGMkQG/jKK+b6CCs4DmdN8U4z1ESvjudH9KZ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fh3M8yiEUbu9z0IwRi2xmRsqpUznbp1mRezfJBcz4jVfCe80CWAs8XV4uXDRG/4v2
	 jsOXnxzOVaJHU1KbXwxyK2oBw2eZQR6aOQvulzOaylDZWcfuFTlpgqwQxotxI96HLb
	 YDrvTMouu4OYlMKYbMe7HC00jgX4mbKovooisV9t+oYVc7tHSsUa5i9o8ytCS2r+QQ
	 k+UFFfhUOLf3AOtJFXnzrV1+87e79S789G7LYselCvKdLAIlHJFm1vCvyKZbP3QjOj
	 44XpssWusv0JYzwDSg6nYihuoV91z5ZQ2xWvSPKuGS9fwzMmSbLVckcUvNSXkvdNn3
	 1NPFDor1jfbYA==
Subject: Re: [PATCH v8 net-next 9/9] net: dsa: netc: add PTP one-step
 timestamping support
From: netdev-bot+sashiko@kernel.org
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 05:05:40 +0000
Message-ID: <179541034095.3135.13496206683389250613@kernel.org>
In-Reply-To: <20261119030534.1892935-10-wei.fang@oss.nxp.com>
References: <20261119030534.1892935-10-wei.fang@oss.nxp.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In HWTSTAMP_TX_ONESTEP_SYNC mode,
  netc_port_prepare_onestep_sync() (drivers/net/dsa/netc/netc_ptp.c)…

--

net: dsa: netc: add PTP one-step timestamping support

This adds one-step Sync offload for NETC switch ports and advertises
HWTSTAMP_TX_ONESTEP_SYNC. The tagger hands each one-step Sync to the switch
driver, which queues it per port and sends the frames one at a time from a
work after programming PM_SINGLE_STEP and the originTimestamp field.

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_ptp.c
> index bd4d0b70e7ee5..a7ab62f76e352 100644
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> @@ -407,6 +713,67 @@ int netc_port_hwtstamp_get(struct dsa_switch *ds, int port,
>  	return 0;
>  }
>  
> +static void netc_port_prepare_onestep_sync(struct netc_port *np,
> +					   struct sk_buff *skb,
> +					   u32 ptp_class, bool *twostep)
> +{

[ ... ]

> +	/* Ensure the buffer is linear and writable so the packet can be
> +	 * parsed and updated in place. Otherwise, fall back to two-step.
> +	 */
> +	if (unlikely(skb_linearize_cow(skb))) {
> +		*twostep = true;
> +		return;
> +	}

[Severity: Medium]
What happens here if the frame is a one-step Sync and skb_linearize_cow()
fails?

skb_linearize_cow() runs before the message type is checked. It can return
-ENOMEM under GFP_ATOMIC pressure for any nonlinear or cloned skb, for
example one cloned by dev_queue_xmit_nit() while a packet tap is attached.
When that happens, the Sync goes down the two-step path:

dsa_user_xmit()
  dsa_skb_tx_timestamp()
    netc_port_txtstamp()
      netc_port_prepare_onestep_sync()
        skb_linearize_cow() fails -> *twostep = true
      netc_port_prepare_twostep()

The frame gets a To_Port subtype 2 tag, or a subtype 0 tag if
skb_clone_sk() also fails. Its twoStepFlag is still 0, but PM_SINGLE_STEP
is never programmed, and originTimestamp and correctionField are never
updated. Would the peer then accept a one-step Sync carrying whatever
originTimestamp software put there?

netc_port_txtstamp_handler() would also later deliver a hardware TX
timestamp for this Sync through skb_complete_tx_timestamp(). Doesn't that
conflict with the HWTSTAMP_TX_ONESTEP_SYNC description in
include/uapi/linux/net_tstamp.h:

    In this case, transmitted Sync packets will not received a time
    stamp via the socket error queue.

The commit message also says:

    If the originTimestamp field of the sync frame is not in the linear
    buffer of the skb or the correction offset exceeds the hardware
    capability, the frame will be dropped.

skb_linearize_cow() runs first, so the later check:

    if (unlikely(tstamp_offset + 10 > skb_headlen(skb) ||
                 correction_offset > NETC_MAX_STEP_OFFSET)) {
            NETC_SKB_CB(skb)->ptp_flag = NETC_PTP_FLAG_DROP;

only catches truncated frames. The "not linear" case falls back to
two-step and is not dropped.

Should a linearize failure on a Sync frame be handled the same way as the
other error paths in this function, with NETC_PTP_FLAG_DROP and a
tx_dropped increment?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119030534.1892935-1-wei.fang%40oss.nxp.com
