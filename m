Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D6E381C4;
	Thu, 14 May 2026 05:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736124; cv=none; b=PgvFjVd3wH5RFInqyGZkqQ2fxyOTovgPlPR7umO+nTuLWTf+bfCZKYOGGccY/Ijsp0P/GA0wCss54EMz/MMwBCgxoEjd/8+7Mrhru6dSZPo335RHJFzK80Vt/CvZjwweBCu+EnkBlZMIpngFXSrXzupaXmfMwf9+NW+lkWCjo1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736124; c=relaxed/simple;
	bh=F0hLRQYvgM4FYnU85AviTiv7NndLLm3mP/J3cRFEhnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdIxwpvubmHLwlhIME24NszcbZFhOq9/Kcztg0hbX3qPVPkYQAyoGT5wMhgX8I7qZjPQpAto25WsQf4yxDC+V4YXO6MfPhtD8svhjJiFTF+8FNz8KS9MyDbC3VgLz0iY1O10l9JOXhTVFzYq+/zx4Unkb4gVrpBLlKncAJdzDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+LziL6U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+LziL6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A35C2BCB7;
	Thu, 14 May 2026 05:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778736123;
	bh=F0hLRQYvgM4FYnU85AviTiv7NndLLm3mP/J3cRFEhnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=m+LziL6U6hxyqpSK1pV/nNO1f6F1a/+vZ2A5TX3jXDt7ZUmwu8I/AjTYJSNyio+8k
	 K4PwYiClxRu+EJRpOPbkp2KBhUCpvssn6qHmAyQAEsxKV7DD7QtqMq2gYvZ/A1Hyh0
	 f6SEf9Dep03BDuOUeOlblDJcnmE7bsojUjbuVH1NB6A4snsUumAq9ct2oesTmE7BHw
	 KwATjfQpAbG2K0uqoluFadUtfv91ICN1MUbgdQseQ5zf4EzaMQTCm3bhUqWQKm3F2O
	 k0Zh+rm0oMQHifPyOZ4aP0757BknbgUmMBX2qK9qp9hHC+tTKVOWdgRFTQ6hWHDDNE
	 sGtNXjJ8UWVTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 net-next 09/15] net: dsa: add NETC switch tag support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260513030454.1666570-10-wei.fang@nxp.com>
References: <20260513030454.1666570-10-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:22:02 +0000
Message-Id: <20260514052203.57A35C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `netc_flow_dissect` function accesses `skb->data` out-of-bound=
s without verifying the SKB's linear length.
--

commit 93fb7c6739d18313bc6426f6ff8df23c472a2795
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: add NETC switch tag support

This commit adds support for the NXP NETC switch tag, a proprietary header
added to frames after the source MAC address. It implements the Forward tag,
SubType 0 of the To_Port tag, and Subtype 0 of the To_Host tag.

> diff --git a/net/dsa/tag_netc.c b/net/dsa/tag_netc.c
> new file mode 100644
> index 0000000000000..07684e0ff0647
> --- /dev/null
> +++ b/net/dsa/tag_netc.c

[ ... ]

> +static void netc_flow_dissect(const struct sk_buff *skb, __be16 *proto,
> +			      int *offset)
> +{
> +	struct netc_tag_cmn *tag_cmn =3D (struct netc_tag_cmn *)(skb->data - 2);
> +	int subtype =3D FIELD_GET(NETC_TAG_SUBTYPE, tag_cmn->type);

Is it safe to access skb->data directly here without validating the linear
length of the skb?

While the comment below notes that hardware-received frames will have
sufficient linear data, skb_flow_dissect() can also be invoked on locally
injected packets (for example, via AF_PACKET sockets, bpf_prog_test_run,
or tc hooks). For these locally generated packets, skb_headlen(skb) might
be extremely small or even zero.

Could this lead to an out-of-bounds read and kernel panic if the skb is
fragmented? Would it be better to use skb_header_pointer() or validate that
skb_headlen(skb) is large enough before dereferencing?

> +	int type =3D FIELD_GET(NETC_TAG_TYPE, tag_cmn->type);
> +	int tag_len =3D netc_get_rx_tag_len(type, subtype);
> +
> +	/* The RX minimum frame length of the NETC switch port is 64 bytes,
> +	 * and the frame is received by the ENETC driver. From the hardware
> +	 * perspective, the receive buffer of RX BD is at least 128 bytes,
> +	 * so the switch tag header is guaranteed to be in the linear region
> +	 * of the skb.
> +	 */
> +	*offset =3D tag_len;
> +	*proto =3D ((__be16 *)skb->data)[(tag_len / 2) - 1];
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513030454.1666=
570-1-wei.fang@nxp.com?part=3D9
