Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49AD3E9C32
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025526; cv=none; b=qfGhc3BWfOrhvY1G6w7t2SDjxj6MoDrQ4EJJ9mPXIQTWf3mf/sCPT+rbkQVKew2Mr4a1FKDSnNppiDSguybfGDE21W/+GmKECMQ6Iqssc4xmr4fsOVsGNCO8VZ2ytxm7vunQs/hRROsYZvwL4WhvFf5KTGipKZC+t+IAA4XeELQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025526; c=relaxed/simple;
	bh=oIFZLgKvVdWRb4naDCDvsBD7Te5I9qLr1vHo4bzNbqQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=GqVPwMWEfazttxuBJjWhMcn6Z9lSj2bzbvJN7HxJM9tslHH9LY7OvwOMD4fyPIB8coY+a8azrW6cnCUqeAYb7XHMBwCDPe/8UHIyjBzLPzKPm67ww2eDqh0SjBK0de/pjLAVtMYRVylPnfclVVH6pAH3pf3M3Adtov0aZGl2hc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKY6E6Q7; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKY6E6Q7"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81f3b227a4aso36136477b3.1
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786025524; x=1786630324; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aSW82hn/Az1oQv4R5HnyuZcVGEyW1WS4dZZfeeZQW+g=;
        b=NKY6E6Q71yQjwOYMPnaTjNdy+sScDs3XJX3kipEMHHS/D3XYc4LvtRwihvX1p2mr7l
         uoQo0/3oe15F2aoYqI8QOuwBi7Wv2hlVkZPCbERyH+jphiAp1YWrUxFQHRyZ/OqtE/dP
         epQbcFT5NI1ZKiLlLNbd5wzp5G9RREUj0ai9OTESuQgbudYgqkHKaeAScsA520MtA8Ri
         /JV/NaYHPKS4I3KBsXnw1YA4+N6QJujfQ0Yd26m9Nz9aYr0+KnPaebXWir5zBeZ8s/zm
         h1WrH2A1PUmPwtuCJuwcCzFN20qjr1dI8259rad3N3pjQbf/44My9p0xM5Ywn8uukXg4
         WPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786025524; x=1786630324;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSW82hn/Az1oQv4R5HnyuZcVGEyW1WS4dZZfeeZQW+g=;
        b=TDozhBbtZgyi/KwDtN2/16yKL4F6WPEfmF9b63DAeWUnNpSocnKP73afJnrZOw389v
         nZn0O1I6dMm6FLDUz7LJKTo6FDg2hrIzy8hyOqaPWYLAZwjeXe3b1FrV9AjZw2AuiFAU
         Cxewmz2fqW4p8QSjRf8yiSVUhogH7N4obhreuqKmUcWSYmMg250NvNGACa5Dm4d8Fav4
         yqkSOq17Vr63Iuz7bY9WzSu7nIX/CIz2sLwLCu1onpFrQsuFkXuDihqRXC0didmqOcAt
         TM49lbUmv+M6k2/xsFR2bggsQyjmEb+N0supxpbSS8V00jvPe+b0qQSAbYs/QPRbOLqx
         Ib1g==
X-Gm-Message-State: AOJu0Yyng7YpdOjqH8Cc8czes+Ks8Bga5b4GjS9vSblpiRJ8v5BI0epv
	klkS6/+pdXOGMY8jzkeppgJMHX9NtHy3aotQfqRzxlIMjEzA7gfcMUgNgbIgpA==
X-Gm-Gg: AR+sD12hlEi6QFDlc11Xg659SrFiOJB4bi5brv9gGz6ZfCtbQJspMtDM6WpMJ9NbF2e
	9g6npFhxjSknJ9lAfyFAVziBwLEfWbtwOcYxdW3m2xs3GtaYMRjqgTqcABohYueHMmgr5xC3cAH
	W9LRSMfaGpboNk8gmX1lAZKa6ym7biPuq+Ble3I01cRa0evPQk06hU8J6BSwdLxdKpWSaSrttDC
	4IHj64H8jJgmQFcNObpqlGJC+2KvrKn3v0J+umcMNna0x5X57C7kdch6vbMwAMDLCijtrFQBMYo
	CGAGJJodzLuf1jixNNwtX+zz970cap2piJAiZexnTz1Re4ZvvXfPZma23Mx0nVVYgPNkSKkxEV+
	sKlX1GzySH6abJP7jMunqDVS9lZDpsst4KvkBHTfvNAO2CUhiIM05LM+Q01safa5RryY2eCZK7J
	1k5M6IURrdxsQS0DvOq1UZi66ue3G9CIMmBKlMYIQseKmWPOlfi9ZIzKTitsuUFpwpdlmZFRzrR
	BuGL2zhstAOnSfIbQjfu7WuwaIusUG5XV3m
X-Received: by 2002:a05:690c:c04:b0:804:a2d5:1e04 with SMTP id 00721157ae682-820222e54d2mr90939827b3.16.1786025523580;
        Thu, 06 Aug 2026 07:12:03 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820131db335sm39579797b3.3.2026.08.06.07.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:12:02 -0700 (PDT)
Date: Thu, 06 Aug 2026 10:12:01 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
 "Wei Fang (OSS)" <wei.fang@oss.nxp.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "horms@kernel.org" <horms@kernel.org>, 
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>, 
 "mst@redhat.com" <mst@redhat.com>, 
 "jasowangio@gmail.com" <jasowangio@gmail.com>, 
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
 "ast@kernel.org" <ast@kernel.org>, 
 "daniel@iogearbox.net" <daniel@iogearbox.net>, 
 "hawk@kernel.org" <hawk@kernel.org>, 
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>, 
 "sdf@fomichev.me" <sdf@fomichev.me>
Message-ID: <willemdebruijn.kernel.1f5ad76837fbe@gmail.com>
In-Reply-To: <GV2PR04MB1173961FAF524C3A3FB49204888D22@GV2PR04MB11739.eurprd04.prod.outlook.com>
References: <20260805105314.3882595-1-wei.fang@oss.nxp.com>
 <20260805105314.3882595-3-wei.fang@oss.nxp.com>
 <willemdebruijn.kernel.4a69732dc0a4@gmail.com>
 <GV2PR04MB11739F20D97C6507DB388951388D22@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <GV2PR04MB1173961FAF524C3A3FB49204888D22@GV2PR04MB11739.eurprd04.prod.outlook.com>
Subject: RE: [PATCH net 2/2] net: tap: fix skb->protocol not updated after
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

Wei Fang wrote:
> > > > --- a/drivers/net/tap.c
> > > > +++ b/drivers/net/tap.c
> > > > @@ -1081,9 +1081,15 @@ static int tap_get_user_xdp(struct tap_queue
> > *q,
> > > struct xdp_buff *xdp)
> > > >  	}
> > > >
> > > >  	/* Move network header to the right position for VLAN tagged
> > packets */
> > > > -	if (eth_type_vlan(skb->protocol) &&
> > > > -	    vlan_get_protocol_and_depth(skb, skb->protocol, &depth) != 0)
> > > > -		skb_set_network_header(skb, depth);
> > > > +	if (eth_type_vlan(skb->protocol)) {
> > > > +		__be16 proto = vlan_get_protocol_and_depth(skb,
> > skb->protocol,
> > > > +							   &depth);
> > > > +
> > > > +		if (proto != 0) {
> > > > +			skb_set_network_header(skb, depth);
> > > > +			skb->protocol = proto;
> > > > +		}
> > > > +	}
> > >
> > > Does the same apply to the same call in tap_get_user?
> > 
> > The situation of tap_get_user() is different, skb_probe_transport_header()
> > is called before the VLAN adjustment block. So I think transport_header
> > should be correct. The only concern is whether skb->protocol needs to be
> > updated after calling skb_set_network_header().
> > 
> > I'm not sure as I am not fairly familiar with the tap driver. I added this patch
> > because Sashiko reported that the tap driver has the same issue as af_packet.
> > 
> > >
> > > And in general to other callers of vlan_get_protocol_and_depth,
> > > including through wrapper skb_network_protocol?
> > 
> > I don't think this issue exists elsewhere. The issue arises because
> > skb_probe_transport_header() is called after skb_set_network_header(), and
> > at this point, skb->protocol and network_header are not synchronized ( In
> > __skb_flow_dissect(), nhoff = skb_network_offset(skb) but proto is
> > ETH_P_8021Q or ETH_P_8021AD)), causing skb_probe_transport_header() to
> > fail to set transport_header correctly.
> > 
> > Perhaps the correct approach would be to restore the original `skb->protocol`
> > value after `skb_probe_transport_header()`, maintaining consistency with the
> > previous behavior; otherwise, it might introduce new issues.
> 
> For AF_PACKET, it has been confirmed that skb->protocol does not need to be
> restored to its initial value; otherwise, the egress tc flower for protocol ip will
> not match the packet. A known issue is that the packets cannot match the egress
> TC flower rules for protocol 802.1Q, but this issue exists before this series. This
> is likely a limitation of using AF_PACKET to send packets.

Actually this update of network header to start of the IP header may
have been a mistake. If userspace inserts a VLAN packet, that is what
should enter the stack.

But for this specific issue: would it make sense to just move
skb_probe_transport_header before that adjustment?
