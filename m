Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED63375D5
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 15:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203204; cv=none; b=hy64D42GSLZLMnYGuOYkyP3i9327CmhwZRKvoCi6T07d9xCWzWI9M1V0I0+ylJQZSKP9i6k4gYq02xoLfkekdYxDmmYxCQbHsPO/pEeMg/99TqjoN2TaMnQrLLT97LfImbSTKYeKstFvf8f7Txm8w9YGB7JDaqBNjZbxCD30oBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203204; c=relaxed/simple;
	bh=n1KfjKfpUR15iqcsyI8AewdHHKTKixOybQJ7vGLbE4c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=HwqvgcpGIm+LxUZciumltC3aNe3mp9r0ykgVgmlWGNPslXMoKBKgu50PkLxy0GfjIRLLMhXqMHredAa1trmDPD3+jNB0AG7Ev2CNadGqFdjhb8DRCronJ9ZNeguIG4AmJ1rxAHDee4nqb+ao1YclFhQ8WB4dTQVmm9M+FR2wFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7CrGkTO; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7CrGkTO"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-824af9535c8so8186797b3.1
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786203201; x=1786808001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L+wa+H68v40Oc6TuXXsleyL0sXcMHjYANUloxiBM5MA=;
        b=o7CrGkTO+otT4OozntrzWvp7fu86BvQdAg/NkEzFklIkcA7hPhXLf/09f7cCWf57lV
         3VmE/nFN5I3JfK2fW2G1233karGTwGw52x0IqyYgleq5xZVy2x0eZthv9nzSEiCBUST9
         cw4exmtrk+5Ln+685EWqbFYGKzRqMN8Nx1ISKeQkYyzvaVUxmZ/fYkI0mLYUL6GoY46+
         Eo+PpmA6vhs0A5Dw3E11eLDxo16K7Xzrwp3i+QM4i/AhAb9Cv33KBIowEWmY8M2LABrk
         keJ3Sk8TwsPBgvE1dzGK/1bqrfifr3muHRX8CgjCosul46UNMlF47Q/sTNez8O3NAxd0
         eXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786203201; x=1786808001;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+wa+H68v40Oc6TuXXsleyL0sXcMHjYANUloxiBM5MA=;
        b=jT3D3FEJ24IZqCH0amOe0lo1MMcCNjeefBRtUhDjTZWs9MrZd4cHFRGe8QbKLdLK3d
         RnEAHRXVnXzOkKMlrrCQFrf1ZvHyXMy+JifVhJ2zVSqEu3d+9EHXsUC47ijpPLkn8s5l
         bmS2nXtlOs9qGJgS7n9i7KfzmmtDcBgYZnTddm2Dv7ugWxHkKFy/cKI241YeR5GdlgYN
         JPYjfZ1l8XefeMQ90AHcVhdhoBHzfg0JKqPCkYg/JRds+NO55Rko8f+pDFX4aNquSL4K
         2StGCHmiQfez1W1hHEh3GX/K5280jqcn3AetWiPQLONY8PnyCL6wHuxY9+owbXJQTemQ
         iiug==
X-Forwarded-Encrypted: i=1; AHgh+Rp++LlYvKu1UsuQHVBLuHa70drg8wVaCYd65FX6TWPfvq0rzxbvmhUhCet+4b/eDEFKU9Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw2tuCDAqWGIlqlWUfcCR79CvV6LZS4WD5Fq7rmDgi/tzg17eG
	5MdWQxbAtZiJulu2umtZDdmEYrZORyeCv4DbziBr6HbjqcvAySqwnMmD
X-Gm-Gg: AR+sD12y43bvFZgjoMZGHKw4PoXprT4zDYr3qpdanzmsMrxXIKyIDD0GrPTrVTH4hGB
	ZG3otrTn2IRj6lOqTv3PgtskV1fAC/1GJNSavkxy77OVTvsCSOM47qjhV6hpcB+OaZcLxhNz8jM
	jiqvTNuPeR6QRUbZGP2q7+6kjOssX69QIjGNNBHONovZYBbQ2ZGVzoJOGpRiyd/tFbyTeNs7bws
	LSPDCjQG+hMdjL779iifusZZdwCZMBtcFyW4sEur1W8jpBFfJ5JPqPsIMaS3CBZEin8hsbuyxkl
	7l0vLnMVVRRPTAqpokqLlQv7bIg6tK2aJKoHOoRl/W7Ro7+SXTvyO3sUhO7uM4ekjcM3jx3eDwI
	Zp/c313kBHZHMXLTnDjHFMFBvmgS445LkNALACVD/zkmyjgtwUo10xjPrHWb+OvtKKmVHWfsRup
	ljgbb5GXkswGgGVfsEQ0QoFbvBOKzme51G1yfL7jENIwMuNAf054k7tL8Y3YhJnZV6fRPUZ5jHl
	3XmgbGpdmbGF/vh0ObtoDkBioKQf0mpoBs4JYFQVpuxMHA=
X-Received: by 2002:a05:690c:b12:b0:81e:c998:9c9a with SMTP id 00721157ae682-820224daff1mr185323067b3.17.1786203200789;
        Sat, 08 Aug 2026 08:33:20 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f079edb3sm27530177b3.14.2026.08.08.08.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 08:33:19 -0700 (PDT)
Date: Sat, 08 Aug 2026 11:33:19 -0400
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
Message-ID: <willemdebruijn.kernel.13efaee8c6042@gmail.com>
In-Reply-To: <20260807063405.688780-3-wei.fang@oss.nxp.com>
References: <20260807063405.688780-1-wei.fang@oss.nxp.com>
 <20260807063405.688780-3-wei.fang@oss.nxp.com>
Subject: Re: [PATCH v2 net 2/2] net: tap: fix wrong transport_header when
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
> In tap_get_user_xdp(), when processing a VLAN-tagged frame (e.g.
> ETH_P_8021Q), skb_set_network_header() is called first to advance
> network_header past the VLAN tag to the inner protocol header.
> skb_probe_transport_header() is then called with skb->protocol still
> set to ETH_P_8021Q, while nhoff (derived from skb_network_offset())
> already points past the VLAN tag to the inner protocol header.
> 
> In __skb_flow_dissect(), proto is initialized to ETH_P_8021Q and nhoff
> points past the VLAN tag. When the dissector hits case ETH_P_8021Q, it
> reads a struct vlan_hdr at the current nhoff via __skb_header_pointer(),
> but that offset contains the inner protocol header (e.g. an IP header).
> The bytes are misinterpreted as a VLAN header, yielding a garbage
> encapsulated EtherType that matches no known protocol. The dissector
> returns false, so skb_probe_transport_header() never calls
> skb_set_transport_header(), leaving transport_header at its uninitialized
> sentinel value (~0U).
> 
> Move skb_set_network_header() to after skb_probe_transport_header(). At
> the time skb_probe_transport_header() is called, network_header still
> points to the VLAN header (offset ETH_HLEN), so nhoff is correct and the
> flow dissector can parse the VLAN header, extract the inner EtherType,
> and advance nhoff to the inner protocol header, allowing transport_header
> to be set correctly.
> 
> Fixes: 8c76e77f9069 ("tap: call skb_probe_transport_header after setting skb->dev")
> Assisted-by: WChat:claude-opus-4-8
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Only if respinning: include the explanation why tap_get_user does not
need this, only tap_get_user_xdp.
