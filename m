Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081335;
	b=HKv0XeD0Uv0L7twwyT6VkVZLG+jjwoo6OeSELDocVQObtSyZmXjNJewTGEdCMomlAZ0W
	 inkN2y+iqTPLMK5JLq2Ua70XjZ9wxa/9GACYzi+glizRu/MT0dtp4G7YUe9b8wWp8v0am
	 /3bRcPpeIgPfE57DvVqsfS2n4GrjsEEQu7KxbVT3UAfeg5W09Xz727q0TSF5DaAqluiVC
	 SvNUNXzYL9/gJpm/fulAm21tGzL5DpQzw/VWiU8Fac2psjacplw2LvbtDdu8WvtOWJp55
	 JNQGLZNWhv9O+Ooko8kfjQl0rDy4or1pKEG+OuMnyEn51WKQFs1+/9xK6+zxa9wsWoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081335;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/D99FBui+IgQqOoHfHSwVVVX3NUjUeNBW0CsxCpgIqU=;
	b=yhuX3lf4div5SfeuRvrLAMA5hnYLSxwJwn7nb4+vR5Vnex14UtQoL4PBtL6AiHR7Ookg
	 bVgy+vV+IuRs9mzaIObf4hWyj3q5TMxyLXUMCS/4H14FSABX1e1CwLwl99ENMawNDKzza
	 KnTbfeKIleKyDB7Z4DuSf1UZR1flhdivf13mNWPFT5bOhfneMq9BofRqF2PUGnUE6ny4v
	 A+NCjHHW49RpPkkQQKvRKkVVHVYsBGzlzbEXDsc24fVB5z44kjof/GmRcbT2qXNV1auAU
	 NUvvj70DZC5esM6hUaNV0es2avSp8ujOmNu7OrnoUjG0n2HuJK5S7d7RSpwnPpakigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4BsR25t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517E606A32A
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4BsR25t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1081F000C8
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795081334;
	bh=/D99FBui+IgQqOoHfHSwVVVX3NUjUeNBW0CsxCpgIqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F4BsR25t6ndbvM9exfF0bEMuftHRlwcSDHVSo2rd2FTlWColie6vq6odA4QZkkF7m
	 mXF2hYrJPmOa0o9d/RXB/K+kMrpE/kS8ts6n+ul2WCIPln7Y6pPpAHuVbDI1pJpN0a
	 trd4P0gCEBSsDNGhD3cxT4OjZUQviP+YgtXmegY6zS46dzR9u6QTK1go4/ISzETnNq
	 N8CQ6G3H90INQUZJRSIYtikAobWhvl4pLfl4eDU2gj4CV6XyzWmv0nmCAlW7YIBTQu
	 AXH33GFiF34LuDC7v5wxsr5JjFauSvVFAgXoryigThRQdnNiDOPBcX58y/ttPq02h+
	 C9uEHAfvHJYPg==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso1758065eaf.2
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 01:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFTjeSUtNtzuAXAnvMhBo7afz0vSZCU2lqKlq8Fe0qkvNj2Ldy9xRSTEhyl/naQBTW4CB0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/fsEGR6bBRHvbW1Da1fGrFGadFQcBFjp7/n2nQH2D/MJ/oFxrY
	9xW2VvjOD5GP4feLLYpVFLwwB/Rx6wlkYjZJODmuaqFm7LyP99kEmPxmgK/uooqNKXgYT4BWAnO
	96y0SI6mtBNW267xI2r/VDAOluQcCqmw=
X-Received: by 2002:a05:6820:2409:b0:70b:af3d:2b75 with SMTP id
 006d021491bc7-71b187c106dmr3548649eaf.65.1795081333803; Thu, 19 Nov 2026
 01:42:13 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
In-Reply-To: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 10:42:02 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq3k-FtqtX-w5WEcTBAee9ukmbMMWL36vx0VNL0KPpPzg@mail.gmail.com>
X-Gm-Features: AclHuK8OdpBInB5Oa2_kN1teNvgvUNzWkFon8eg7MKr-np2dztkIK38gr9QBzf8
Message-ID: <CAL4Wiiq3k-FtqtX-w5WEcTBAee9ukmbMMWL36vx0VNL0KPpPzg@mail.gmail.com>
Subject: Re: [PATCH v2 net 0/4] ENETC GSO fixes
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 00:51, Vladimir Oltean
<vladimir.oltean@nxp.com> a =C3=A9crit :
>
> Sashiko derailed me from "[PATCH v5 net 0/4] Fix short frame
> transmission in enetc":
> https://lore.kernel.org/netdev/20261021145314.1435049-1-vladimir.oltean@n=
xp.com/
>
> which also touches the driver GSO code path, so I'm making a detour
> to fix 3 unrelated issues there (which I could all reproduce using
> LLM-produced programs).
>
> The main highlight of this series is the introduction of
> .ndo_features_check() for enetc, which runs for every transmitted skb.
> Each patch makes its implementation more and more complex (and I'm not
> done...).
>
> These patches all assume that at .ndo_features_check() time,
> skb_shinfo(skb)->gso_segs is set properly. There might be issues there,
> see commit 67b0cca9ba88 ("net: validate xmit skbs in generic_xdp_tx()")
> which fixes one case which led to gso_segs reaching the driver while
> being zero. For some reason it was merged to net-next though.
>
> Running a bidirectional eno0 <-> swp0 forwarding of raw IPv4 64B packets
> (no GRO or GSO) on LS1028A-QDS rather than some micro-benchmark,
> I am not seeing a noticeable performance degradation. It is in the
> noise margin.
> Before: 7440 Kpps ingress, 586 Kpps egress
> After: 7440 Kpps ingress, 588 Kpps egress

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
