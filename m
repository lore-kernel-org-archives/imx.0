Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046609;
	b=Yvc+32snKiX+eATQnkDZFfW+MALKhyzlG7RAXBoWOL9pzU/fQkUqFagJeNfaSThbE65n
	 KykzQ/SU249STImBzMH4hjqJiqfHNYfG/4u7qc24fa4URbgpsFjZNML9bFznkQVbCpWE2
	 sgX+TjGHWEXfblpR+/V22hju1+iRZzEyKGFimJJOY8tFwjSZDhX4uHlDdG4bZ3y9HK8A5
	 Rtewyo/M8qCUwjtvRqNat9yXiHs5weWrCGEiVdIAv0eLLZ3HOewHzWkSQAuIH3U/cANv0
	 F6IUYDK2z5LmnnT0inazMe+k3Dn1Z0qf2GCioLW5kNJ17uQ1/7oQdtaEKTX648k3/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046609;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wyfuj7NvvZbRNd5oi8oKRypq3whiMRjk+iKeQTsU3ew=;
	b=nTEFzhkGB/KxAHM8n1cd10ulnnJyyNy5MOooQ1Ng6XoBMyal/AfTlmAZr8f05MLIsjry
	 ggjDbnkP/x/SBnVIYPE86PwUQ+GDDKZkP/HjRRxjF7OVH21Cit/WOhT+s0XBSQc1ccMwH
	 SR4PLr07LdvfHS3r9iAuZllwHLHT80klF87XXLcQ5W+3QQsMuT3Co1S4IKMXaRTGSAHJ4
	 AuVshoSzlzFv8xjZnvFTzx9XTOlRuWcVKL9JgIc0eNrvSUEDrhJMavYzKx2s0Gl0vYgqN
	 vI9FxH1y4TiRP7zll53En9SOrxDRzaRrbo0cwjCrtx6bByUM0rdm9WabZBfF+gO6v7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gJb/T9DJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E670606A337
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJb/T9DJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EFE1F000CF
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 00:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046608;
	bh=wyfuj7NvvZbRNd5oi8oKRypq3whiMRjk+iKeQTsU3ew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gJb/T9DJyAdLfSZdoqK6HPP1JWwTP7vlA4Yf/LleMFzTNRdrwX8NfOa6NHEJ9kGCD
	 E0jSXp1+ttsn9Q7HPZjX+L7FulXlDdEzB7Zt9lWjbBX3LFoCsHWjCdoTQ433vYmCe5
	 MsVfHrxNim6YFlGDPOwxPMVRbAoUF+/2qHKDWwUyEchRZ3ljZKuVHK1aErWp/ZIf1k
	 3xdyKdzOZNDNZzWmrhoocb/OKukFqa1LlGW/AF+y5nXPYI5xhZ3wul2f7uSCuFccxV
	 e+tSvlX+yJ1xjhQCWv7By8IwnypIH7u/5zu4AuRVUOwf7qweK3RsYI6OKjtB03quhS
	 BKHYEy1z6qN9A==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-7190d9bdb2cso1150655eaf.0
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:03:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHiFlyuthyQ5EMEXubkOCu2O8/CO5kCi7SdgQbU0b1q4JSf2VhNAOtCp5aQ5N//jBex/WM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cYX/sXIYQ7SRUWtkSV9dMh+z9IGBS02k1WDlhOU9a50kYjZrO
	UTY6NM/RqV8WtgSyrIfXP3i94+9k3dB0XKmi06QAP07Dh0SF1XjfMS/aa9FY2H4DKbieXzKmHYJ
	vueAS3v6bNPdZ2SW+u3cu3FUOND/RUbI=
X-Received: by 2002:a05:6820:1517:b0:716:d3ac:6950 with SMTP id
 006d021491bc7-71b18297a2emr3293454eaf.7.1795046608044; Wed, 18 Nov 2026
 16:03:28 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com> <20261118235055.1225115-5-vladimir.oltean@nxp.com>
In-Reply-To: <20261118235055.1225115-5-vladimir.oltean@nxp.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 01:03:16 +0100
X-Gmail-Original-Message-ID: <CAL4WiipQ_=cN2+F0wFiMy8Ji-d2tfd6ZuBo3HCYiTEQ6RxF29g@mail.gmail.com>
X-Gm-Features: Aa3M54opHWuR9SlJEPohXbxMUMlaFEN9TxFaq4PW8CJ455fM-o3BKFzXrSMiZDQ
Message-ID: <CAL4WiipQ_=cN2+F0wFiMy8Ji-d2tfd6ZuBo3HCYiTEQ6RxF29g@mail.gmail.com>
Subject: Re: [PATCH v2 net 4/4] net: enetc: let core segment GSO skb when
 headers exceed TSO_HEADER_SIZE
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
> Like many other drivers, the software TSO path (enetc_map_tx_tso_buffs())
> copies the L2+L3+L4 headers of the skb into a fixed-size TSO_HEADER_SIZE
> (256 byte) slot of the per-ring dma_alloc_coherent() header area,
> without checking that they fit.
>
> Sashiko casually points out during review of an unrelated patch:
> https://lore.kernel.org/netdev/179294166520.3134.18097439321876673016@ker=
nel.org/
> that TSO_HEADER_SIZE does not constitute the maximum size that packet
> headers can have for GSO skbs, but rather, an essentially arbitrary
> number.
>
> An example where headers can exceed TSO_HEADER_SIZE is with an IPv6
> extension named Segment Routing Header, set through setsockopt(IPV6_RTHDR=
),
> with a type 4 routing header. With 11 or more segments, the headers of a
> TCP/IPv6 packet exceed 256 bytes:
>
>   Ethernet                14
>   IPv6                    40
>   SRH, 12 segments        8 + 12 * 16 =3D 200
>   TCP (with timestamps)   32
>                           ---
>                           286  (30 bytes too many)
>
> No privileges are required to request this socket option (but it will
> cause driver writes outside allocated memory). A reproducer sketch can
> be found at:
> https://gist.github.com/vladimiroltean/7cecf636b788b29f361a2fbdae646010
>
> Bizarrely, enetc is the only affected driver, because the core
> accidentally protects most other drivers against this bug in
> gso_features_check(). There, we have this logic that saves the day:
>
>         /* NETIF_F_IPV6_CSUM does not support IPv6 extension headers,
>          * so neither does TSO that depends on it.
>          */
>         if (features & NETIF_F_IPV6_CSUM &&
>             skb_has_ipv6_extension_hdr(skb))
>                 features &=3D ~(NETIF_F_IPV6_CSUM | NETIF_F_TSO6 | NETIF_=
F_GSO_UDP_L4);
>
> enetc is the outlier because it only advertises the more complete
> NETIF_F_HW_CSUM, so for it, this fixup does not clear the NETIF_F_TSO6
> and NETIF_F_GSO_UDP_L4 bits.
>
> [ astute reviewers may ask: what if we disable NETIF_F_IPV6_CSUM at
>   runtime, via ethtool -k, so as to bypass this fixup, don't we make
>   all drivers vulnerable?
>   No, because netdev_fix_features() will trigger the code path which
>   also prints "Dropping TSO6 features since no CSUM feature.\n".
>   So TSO skbs will now be segmented in the stack. ]
>
> Surveying every driver that uses TSO_HEADER_SIZE:
>
>  Driver  | TSO6 | Checksum feature    | Core guard fires? | Verdict
>  ---------------|---------------------|-------------------|---------
>  enetc   | yes  | NETIF_F_HW_CSUM     | no                | vulnerable
>  bnxt    | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
>  nicvf   | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
>  otx2    | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
>  fec     | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
>  mvneta  | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
>  mvpp2   | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
>  mv643xx | no   | NETIF_F_IP_CSUM     | n/a               | safe
>  dpaa2   | no   | NETIF_F_IPV6_CSUM   | n/a               | safe (*)
>
> (*) dpaa2 also uses a fixed-size kmalloc(TSO_HEADER_SIZE) per segment,
> so the identical overflow would apply if it ever gained NETIF_F_TSO6.
>
> The above survey is what influenced the decision to make a localized
> patch in enetc_features_check() rather than create a huge disturbance in
> the core, even though, IMO, TSO_HEADER_SIZE is a huge foot gun.
>
> Note that the LSO path (enetc_lso_map_hdr()) also copies the header into
> the tso_headers buffers for a reason I don't quite understand. However,
> I've excluded it from the discussion because when the GSO header size
> grows to weird sizes, it never gets anywhere near TSO_HEADER_SIZE before
> hardware stops being able to support this offload. There's an earlier
> limit at ENETC_TX_CSUM_MAX_L4_OFFSET at which it stops being able to
> perform HW TX checksumming (a dependency feature).
>
> Fixes: fb8629e2cbfc ("net: enetc: add support for software TSO")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> v1->v2:
> - drop word "super" from "GSO super-skb"
> - subtract VLAN_HLEN from maximum permissible GSO header size
> - stop blaming LSO
> ---
>  drivers/net/ethernet/freescale/enetc/enetc.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 6cc519eea5bd..2bc65cf6f508 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1138,7 +1138,19 @@ netdev_features_t enetc_features_check(struct sk_b=
uff *skb,
>                 return features;
>         }
>
> -       if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
> +       if (!skb_is_gso(skb))
> +               return features;
> +
> +       /* In case NETIF_F_HW_VLAN_CTAG_TX is disabled, validate_xmit_vla=
n()
> +        * has not yet run and a VLAN may still be in the hwaccel area, s=
o we
> +        * need to be one step ahead
> +        */
> +       if (enetc_lso_get_hdr_len(skb) > TSO_HEADER_SIZE - VLAN_HLEN) {
> +               features &=3D ~NETIF_F_GSO_MASK;
> +               return features;
> +       }
> +
> +       if (enetc_skb_uses_lso(priv, skb))
>                 return features;
>
>         if (enetc_tso_count_descs(skb) >=3D priv->tx_bd_count)
> --
> 2.53.0


I should probably rework my series :
https://lore.kernel.org/netdev/20260403043237.3909226-1-edumazet@google.com=
/
