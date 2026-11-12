Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464654;
	b=AwXfsMa7gk4tGEJ7hKFdeN/uMpKQuFQ3mBoVY25U82AZTCmw6o0wY2drX5Gs9d5GVnRy
	 mgWvElJBkz9IfIInWkQ6uP2IgCzyqtO1XWVj0bWBMMD6UU2WoLcTrsmyXnsVBpE/+1zME
	 6GNp9ulv4bxgPcH1eg634KqixHpdrfoBg8bsxAsPVan820ZMmwIdG8CWQfYNpXUcIN8bf
	 mzSw7mg+htxXHxP58C2cYBe29xhg7dYQqSZAojtKsZPb+g4x+aL6K+kwiZ/KU0UuZGkwe
	 XY7f/93z59HSXWpttNAJ1K6DHfM7qYVMK8jhuB/WzRgCRpNzJvaMWMN5RVT3BU8Cj5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464654;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WKifyA2oo/6HmDif6mlCfr5jQMlGgAqYcyLxi9doZZY=;
	b=5LE/qN2EWv9qLJLvhDIVZkW+vcgeoEL3mrFXv0QATCYm5qEiNP+4Jlq7D1UsLrCYh6N2
	 Wog13vbDknYCblsiag936DNiMlUHGa9cpmgYYX5EUNCy8cg61TLNdjS4bMDmj6SxMTtuL
	 N2d4ZAtpdFYnEnvjvS3VPq5SSd4J74thMZjVp5wlxKCeWFPcRQ1LeD1qCMzRvN+XQ/JTy
	 1pXdxYnP6h7cWDW3S1FDmRvWUHrxF0oSkWYaiPRrRNRAAOyyMk8kKHExZRR7FtRBmsmNC
	 ywIGJQOTo8ESUlKnWltwqhtk7LdTxi09EA8P2bB68+AbM+J81QvFYv8iXbBV/ZZs+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMU3exVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A18606A331
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 06:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMU3exVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2155D1F00A06;
	Thu, 12 Nov 2026 06:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794464654;
	bh=WKifyA2oo/6HmDif6mlCfr5jQMlGgAqYcyLxi9doZZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMU3exVvcpY1QhYfX2Tegy0dFkCZXvOXBSKp4o6tQ03aua1qg7AkbRNZ4HzucOAKp
	 0rfwLTThGawq7e7g4KwCYdg4QnXT600Z5Ry8bhLnBv/671TmNUsOFpJa09OLHf03D/
	 W/dE/rKD1wUjcNjYo+E5lI8j7lZ1oh+8mJtrqgjKRP6OX62fEL+yA3DRVR91rv25aq
	 KPJcDm9BzgLlWAELoJ+tdDh2y19xkoIPOXUV4F6Ho8FSlt1LFi6bHGR64OSjR/3dM8
	 eE2d7KTVLjitN0oDm8z3jIRc8HUzyaA9qsu1dzOIiqj/dhqy5DXEfS4Pl3KLGdppvW
	 QC9ltfic1e2BA==
Message-ID: <sashiko-outbox-210520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261111062753.1397582-9-wei.fang@oss.nxp.com>
References: <20261111062753.1397582-1-wei.fang@oss.nxp.com>
 <20261111062753.1397582-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 06:24:13 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: dsa: netc: incomplete IPFT_FAF_L4_CODE mask in
  netc_build_ptp_ipft_keye()
--

commit 3f2860d50cc9cac6dd4199f17906d6ee10ebd675
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP two-step timestamping support

This commit adds RX hardware timestamping via ingress port filter table
(IPFT) rules and two-step TX hardware timestamping support to the NXP NETC
DSA switch driver and tagger.

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> new file mode 100644
> index 0000000000000..0bcc01ebf01de
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> +static int netc_build_ptp_ipft_keye(struct ipft_keye_data *keye, int por=
t,
> +				    enum netc_ptp_type type)
> +{
> +	u16 src_port, frm_attr_flags;
> +
> +	keye->precedence =3D cpu_to_le16(NETC_IPFT_PTP_PRECEDENCE);
> +	src_port =3D FIELD_PREP(IPFT_SRC_PORT, port);
> +	src_port |=3D IPFT_SRC_PORT_MASK;
> +	keye->src_port =3D cpu_to_le16(src_port);
> +
> +	switch (type) {
> +	case NETC_PTP_L2:
> +		keye->ethertype =3D htons(ETH_P_1588);
> +		keye->ethertype_mask =3D htons(0xffff);
> +		break;
> +	case NETC_PTP_L4_IPV4_EVENT:
> +	case NETC_PTP_L4_IPV4_GENERAL:
> +	case NETC_PTP_L4_IPV6_EVENT:
> +	case NETC_PTP_L4_IPV6_GENERAL:
> +		frm_attr_flags =3D IPFT_FAF_IP_HDR | FIELD_PREP(IPFT_FAF_L4_CODE,
> +				 IPFT_FAF_UDP_HDR);
> +		if (type =3D=3D NETC_PTP_L4_IPV6_EVENT ||
> +		    type =3D=3D NETC_PTP_L4_IPV6_GENERAL)
> +			frm_attr_flags |=3D IPFT_FAF_IP_VER6;
> +
> +		keye->frm_attr_flags =3D cpu_to_le16(frm_attr_flags);
> +
> +		/* Set IP version bit in flags_mask to match IPv4 or IPv6
> +		 * packets
> +		 */
> +		frm_attr_flags |=3D IPFT_FAF_IP_VER6;
> +		keye->frm_attr_flags_mask =3D cpu_to_le16(frm_attr_flags);

[Severity: Low]
Does reusing frm_attr_flags for keye->frm_attr_flags_mask leave the lower
bit of IPFT_FAF_L4_CODE unmasked?

In include/linux/fsl/ntmp.h, IPFT_FAF_L4_CODE is GENMASK(11, 10) and
IPFT_FAF_UDP_HDR is 2, so FIELD_PREP(IPFT_FAF_L4_CODE, IPFT_FAF_UDP_HDR)
only sets bit 11.  Without ORing IPFT_FAF_L4_CODE into frm_attr_flags_mask,
bit 10 is left wildcarded in the frame attribute flags check (matching both
IPFT_FAF_UDP_HDR and IPFT_FAF_SCTP_HDR, though keye->ip_protocol still
restricts the rule to IPPROTO_UDP).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111062753.1397=
582-1-wei.fang@oss.nxp.com?part=3D8
