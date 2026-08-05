Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34F3ED109
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934139; cv=none; b=XPD6N4elLoIr4xcEzY1sMgyIoom1P5mFTngws/xEgRV0lzsEcJTpSB6fEdNIyxepK4/fjA//6VF/RooRqomQYoYyF2C/PuChj7bfQXPU4NNY95Qu98N4O70SINkpT/BS1KDmVfYtGGSEWFrQ9Ff4z4jOfEODtWmR9FgP2bf1ets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934139; c=relaxed/simple;
	bh=kM470gmL33Iv9aSAOr0xztTIhSMUcmHJisJS6g9iA4U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=FVv89LAkeCvxFXZ6YZFcyy2RhxRGButxnDPKlgJRPmLi5OzQmnCv2SzupZBkEmXmgVwdbEjD4qWpAYaAsni39C0sdpu8LkOFClu+WH2Pyf6UeERJlWvIuhS35aLqNJqpsNS/0pQZzyEB11pXJ+Q6CkZsqKwIIVpygGVBY93ZYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLGLCokG; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLGLCokG"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6685001353fso988018d50.1
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785934135; x=1786538935; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fDYKkUKm21fBzkrus0DJYqlBResm+tuLY/EKfmGA+zg=;
        b=JLGLCokG3oLT1MzdCTsq3vhsAHOEg8wIQ5TeuMtTYbZn/xt4dsWytKV1yf/qduPMXS
         18LM9JrYRGG3i7Slt8o/l1E5Cu6Wf9lHXxqYNrffDOWtUJHH1B7SsBWDnV9xXYtv0mOS
         HT+TcQsDWVwZBiqjrxVO3hOrSrQ/OiXppjuVz2FYjZgVvFTFFd/iJ4t8ROt9AR7UwkfM
         3g+JPHZ28qv4Iy5zIbGGS/bUEbUZC0M6ajKAaIB/5WALef43sprb07d3C7o+iSKoxDfB
         FcBxYLCXrsn4q0j4OpLd9I96ZYtuGPmWtFTvLIdK8sblKu/hjqYQmVtevY/Wj4xdQEyd
         QC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934135; x=1786538935;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDYKkUKm21fBzkrus0DJYqlBResm+tuLY/EKfmGA+zg=;
        b=A0hs4OoR/GYDCFCYRl6nUDlez1AH8X42o+oiPzIe5AQYgvqd9qwWWwbh2kqh3KiUDE
         LMs0O86no9Cc18sZRbYGdUmxPcVDLOilMgud/adMbV8LAvQ1mFeqTqywyRiNg8sPQfFf
         d1/GWTuZJTgDcqHoZLn1L/xbyfByThHZnsUXFPurxscxQNn7bD28r9w5VFRcNx7SDU7k
         OvA4sh4pKftT8KfHKatKHT158ftVTmGr2l01dzpmPhQiIgWqY2R0xKBk21AACnZ2P+Ci
         GOi/hVPxMzt5MUWg8UzKpEB/Dqf5B38+MxKTD/BXdg9P59N+TDHHlQps9YEiEbqzyY8+
         D6Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9c4CoSI9EUNxwG9ovl5prpn/ZMTfdRnOWx8RS6rtfBdo2D9KEeb7CrvRQjtRE/emr4nI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+bG3D8XA5+yJVPblUmUWuuX5Lgoqt88leeIGFRbHYbyJ0Y6CA
	AukqPlZtWxTS32k9KCcLpLHKr63ALVm8ekDi5chW1v0HD0PZSlYRd/wP
X-Gm-Gg: AR+sD10LSM5FSXwpX842l560A0c8902dVWyQ2nhMkxeA35HRNQaxqNSi42EuRFfDxyN
	3EFjYiBHQ8Y/5kVDgQ5qCD8/vWdVatdXWkWCEWa/iT6UAsdGAa+VvfPjylfaja6OJ5kNl3KI8Br
	jx3McVRsbmVUGzBjZsqD4iU1Ljq2JmZahypv1yRvL7cOTf6RncNog0AQFeuovRiHaLjSKSDbDzt
	4uj4dEfHH/cOndjB7Gv7w4A392/W2MpxdASCWbEYauh/Ww0ZPn1/PEaY5yEOcIn7A8xOenPbRXD
	5Fe8YwaE6w8UjcM+CMDQ57IrEqjQ9/oE2swRMA4nwWJn3NhmUcBddyXCrJNEbiJbxqt2nxIynv0
	azHqVpwuqVTzCs03vs8ligmKUkQOvREVrAFRafUEw9jcxHbB0CDuSI4nqUZjae2Gmx6xwG26vto
	kaRmLAlMRb3M1rhMPjIqAgHwv/QFermxmCKc15WnTNFpkPPLZi4w/g844f210znhv9AXk8uRwVi
	MJ9r8YbpQ5FXB/Ib/UWxOwnPr+53dZCIp4o
X-Received: by 2002:a53:bf01:0:b0:669:8f5f:fec7 with SMTP id 956f58d0204a3-6699a8ca5a6mr2644538d50.16.1785934134658;
        Wed, 05 Aug 2026 05:48:54 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669915f5a6asm2913336d50.12.2026.08.05.05.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:48:53 -0700 (PDT)
Date: Wed, 05 Aug 2026 08:48:53 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: wei.fang@oss.nxp.com, 
 willemdebruijn.kernel@gmail.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 liuhangbin@gmail.com, 
 mst@redhat.com, 
 jasowangio@gmail.com, 
 andrew+netdev@lunn.ch, 
 ast@kernel.org, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 john.fastabend@gmail.com, 
 sdf@fomichev.me
Cc: wei.fang@nxp.com, 
 imx@lists.linux.dev, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org
Message-ID: <willemdebruijn.kernel.4a69732dc0a4@gmail.com>
In-Reply-To: <20260805105314.3882595-3-wei.fang@oss.nxp.com>
References: <20260805105314.3882595-1-wei.fang@oss.nxp.com>
 <20260805105314.3882595-3-wei.fang@oss.nxp.com>
Subject: Re: [PATCH net 2/2] net: tap: fix skb->protocol not updated after
 VLAN network header adjustment
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

wei.fang@ wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> In tap_get_user_xdp(), when processing a VLAN-tagged frame,
> skb_set_network_header() is called with the depth returned by
> vlan_get_protocol_and_depth() to advance network_header past the VLAN
> tag to the inner protocol header. However, skb->protocol was not updated
> to reflect the inner EtherType, leaving it pointing to the outer VLAN
> EtherType (e.g. ETH_P_8021Q).
> 
> This mismatch has two consequences. First, skb_probe_transport_header()
> is called after the VLAN adjustment with proto=ETH_P_8021Q but nhoff
> already pointing past the VLAN tag to the inner header. The flow
> dissector interprets the inner header bytes as a VLAN header, fails to
> find a recognizable encapsulated protocol, and returns false.
> Consequently, transport_header is never set and remains at its
> uninitialized sentinel value (~0U), causing any subsequent
> skb_transport_header() or udp_hdr() call to dereference a pointer
> 65535 bytes past skb->head, potentially corrupting arbitrary kernel
> memory. Second, TC egress and eBPF programs that inspect skb->protocol
> directly (e.g. bpf_skb_net_base_len(), bpf_skb_net_grow(),
> __bpf_redirect_neigh()) will see ETH_P_8021Q instead of the inner
> protocol and behave incorrectly.
> 
> Save the return value of vlan_get_protocol_and_depth(), which already
> resolves the inner EtherType, and assign it to skb->protocol after
> skb_set_network_header(). This keeps skb->protocol and network_header
> consistent for all subsequent processing.
> 
> Fixes: 8c76e77f9069 ("tap: call skb_probe_transport_header after setting skb->dev")
> Assisted-by: WChat:claude-opus-4-8
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/tap.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index fae115915c8e..afcc4919bd04 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -1081,9 +1081,15 @@ static int tap_get_user_xdp(struct tap_queue *q, struct xdp_buff *xdp)
>  	}
>  
>  	/* Move network header to the right position for VLAN tagged packets */
> -	if (eth_type_vlan(skb->protocol) &&
> -	    vlan_get_protocol_and_depth(skb, skb->protocol, &depth) != 0)
> -		skb_set_network_header(skb, depth);
> +	if (eth_type_vlan(skb->protocol)) {
> +		__be16 proto = vlan_get_protocol_and_depth(skb, skb->protocol,
> +							   &depth);
> +
> +		if (proto != 0) {
> +			skb_set_network_header(skb, depth);
> +			skb->protocol = proto;
> +		}
> +	}

Does the same apply to the same call in tap_get_user?

And in general to other callers of vlan_get_protocol_and_depth,
including through wrapper skb_network_protocol?

>  
>  	rcu_read_lock();
>  	tap = rcu_dereference(q->tap);
> -- 
> 2.34.1
> 


