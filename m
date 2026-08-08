Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FCF221FB6
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203129; cv=none; b=EjHooRe3zPxAMEf4v7pXbNo3IRCGhADNfrReeMiM+74tn1FiaDcXvM40KSZFX4eEoEE+5d2Nf9ETV3DOWzEAZpKA+FLROcYwX6hTj548BsJf0z3ukrd1tX8HI4nzqgq04dXcbIQw3IfoBI61eKqGhqQKNU/ncDMUIkxsuGrzK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203129; c=relaxed/simple;
	bh=avg/jQxBOIQlx57U/8c51C+uOom6aQtP9E7HIUCJewM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=MTiOw/sNT6DMP+IBzDcKje1w76nvIQls5PpG+D4/g/fljKIKLbu7G39SmIKzvn0qdCKbHt0e3zUZVBPdRbLhbv69vZRS4Q5P3JMAlHmXJfnUAEvKt/JhZSVL4QCFvTf7daTR5IUdEw8gRH86/bcdgHq0w2xnEwvW06tFBx9/5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrCwrHap; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrCwrHap"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66807ba2f0fso739185d50.3
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786203127; x=1786807927; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v+UUcaMhlc8IxxN5aJcZYdqNcrd7TqnKbW0pUSKDh7E=;
        b=JrCwrHapN9qBy1yso9yH4DH9j4NRiGcJzHfVJcnZiVyc73GLtjofyXJyq/dZVpsnEB
         MuDLZFwbG3qc7iMylknqAdNDK4UltcWOeJxTD8ZknL02MsiX8424N2xmB+dVcWDinZ+z
         gk6bq0gIeCf3xmjFho59uQaf9RodF+UymdqT20TQubOcZ3JLqaWaS3KkVZm+63aIDsZt
         lqy46OgV4sZnyQi/aTrG/iMVh4sTK9EZEBKVZenplcnlhAVJjJXTjBD3SY/DhNijL+Zl
         E0OC0aQOqhH+mQ6ZyU80kZT8Vq9F9FE2D0sjrblDnXkca9yXyKLJth3fyn9Z/79Rvt3s
         cgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786203127; x=1786807927;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+UUcaMhlc8IxxN5aJcZYdqNcrd7TqnKbW0pUSKDh7E=;
        b=bPXPHF3GS7GWDa0GdCV2vaxwrJxLh4L21dZIOXgqPsf2MribNKVjcHIYpMIqy/bLzK
         CWBj5mQR2W1Wu2GZ4mn1lPJuUGCsjegQgrUZLTIOhkbjQWXOwxMmw5OsfeNKKf4NjT6W
         Nch5Jng72w4QzNE55lBhZlc+aP1/N2W6Y0RR3j0b7ZShWlpEyxrFcfmCttzkUg2Qpfpp
         Pr5NMnCiaKMxIy55ygT8bFvyHCZBLp2/eRiN2PL7J5DQhP+eXjWFbiV/9Zs/a5SWx98e
         m1jP8QdyCrWA4QPljHd758KCgzYxnFmcxKrbA99G7ANQR0m1jjIinwjPcPi5WD4I3ajt
         ffMA==
X-Forwarded-Encrypted: i=1; AHgh+RpvaQRinPX9NwgU7bl+vDLO25jXWtLOL7Y8kCM6V3RsyEqu9m7ozBeVEUf8YcQlshBwxes=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOvKp0TRmBsDWgHrPk+GhLMmslSh8gQCTeIxcWjOpmMWrxhoJn
	RhaXFBIrEsg+R/DSv+3vTyNcX8fbo93bUUXjjYBnSolIObXadkLsRcpH
X-Gm-Gg: AR+sD11OvuL0okdlnx/Ssul4uoSYuGox2/yNBYTZrrBi8tyLmx/ca96Wcyi+rCahdSh
	nCRT8VPCailvAIPz93W558FO/hspMvRgbr9vtHPTCwxCYUcLZ16UJvVMEQNBeSui7uPY7SzD22j
	WZoq5JJjy+4onLJ9sN8+x9G8LmVKkKiwKxq+hNrUPArUvqewpc/7si9IbNezRWLS7o4IZqYsX5R
	E4kmAE1xs9tCn4Gxms15F8a7G7t0REHEMTiqSKhSCv8E75l98t7sOTRmrc2bhSG/EMMWBDcAGuj
	dEnYfowG/vazZRF8Jj6YJaVJj0QVwX3lRRPQ5fC76+xHSyLZPcTTIw80WazydSR0EiaaRK04N5r
	pR5pwrxVJmYgUueQy6IzAI+TIx1J55G2dDvkQ+iElItAHhbJhe1/nzYlfXmtcwnRN0xH/5wDwRf
	xW8ffDiwtcdy4fchPiNpdoS3sJtXdxE+lgzR68ScWsBeGInAEW1sLWtqKcLsl2CU54XjRbNizfN
	Sq9PYiIkEmNbqfgySNu1CW/EkXJFO4Ro7/vwgcsMDwK9MU=
X-Received: by 2002:a05:690e:1504:b0:667:c3f6:3810 with SMTP id 956f58d0204a3-66ad73a7c6amr4278650d50.49.1786203126984;
        Sat, 08 Aug 2026 08:32:06 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acad51b8csm3171220d50.8.2026.08.08.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 08:32:05 -0700 (PDT)
Date: Sat, 08 Aug 2026 11:32:05 -0400
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
 sdf@fomichev.me, 
 liuhangbin@gmail.com
Cc: wei.fang@nxp.com, 
 imx@lists.linux.dev, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org
Message-ID: <willemdebruijn.kernel.7f71161e0a6b@gmail.com>
In-Reply-To: <20260807063405.688780-2-wei.fang@oss.nxp.com>
References: <20260807063405.688780-1-wei.fang@oss.nxp.com>
 <20260807063405.688780-2-wei.fang@oss.nxp.com>
Subject: Re: [PATCH v2 net 1/2] net: packet: fix wrong transport_header when
 sending VLAN-tagged frame
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
> In packet_parse_headers(), when processing a VLAN-tagged frame,
> skb_set_network_header() is called to advance network_header past the
> VLAN tag to the inner protocol header. skb_probe_transport_header() is
> then called with skb->protocol still set to the outer VLAN EtherType
> (e.g. ETH_P_8021Q), while nhoff (derived from skb_network_offset())
> already points past the VLAN tag to the inner protocol header.
> 
> In __skb_flow_dissect(), proto is initialized to ETH_P_8021Q and nhoff
> points past the VLAN tag. When the dissector hits case ETH_P_8021Q, it
> reads a struct vlan_hdr at nhoff via __skb_header_pointer(), but that
> offset contains the inner protocol header (e.g. an IP header). The bytes
> are misinterpreted as a VLAN header, yielding a garbage encapsulated
> EtherType that matches no known protocol. The dissector returns false,
> so skb_probe_transport_header() never calls skb_set_transport_header(),
> leaving transport_header at its uninitialized sentinel value (~0U).

Not for this patch, but: having a mismatched skb->protocol and
network header offset is asking for trouble anyway.

The blamed commit states that this block is here for GSO packets, and
the mismatch will by fixed up when skb->protocol is updated in
virtio_net_hdr_set_proto. But that only updates GSO packets, while
this block affects all VLAN tagged packets. Both GSO and non-GSO
should be treated similarly throughout the stack. One approach is
setting skb->protocol here. But that does mess with anything matching
VLAN packets. There does not seem to be a perfect solution..

> Move skb_probe_transport_header() to before skb_set_network_header(). At
> the time skb_probe_transport_header() is called, network_header still
> points to the VLAN header, so nhoff correctly points to the VLAN header.
> The flow dissector can then parse the VLAN header, extract the inner
> EtherType, and advance nhoff to the inner protocol header, allowing
> transport_header to be set correctly.
> 
> Fixes: dfed913e8b55 ("net/af_packet: add VLAN support for AF_PACKET SOCK_RAW GSO")
> Assisted-by: WChat:claude-opus-4-8
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
