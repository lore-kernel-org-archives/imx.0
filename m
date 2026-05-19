Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737823E1682;
	Tue, 19 May 2026 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179134; cv=none; b=fwScMIczRfP0IZ+cCQ73FxHpF+MFdxoo+jZGryklQHbIx6GlR26megHicPqoJiLXnD7MlW33883QGLZuINfMtWZIXaTjTQJW2RE3LmYEDy3y5rgU2gOKOK8hg61W7BZORIllNjcDfqvUtGUsf1Ocyju0IHckyJOu9HD1+YRBa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179134; c=relaxed/simple;
	bh=GLzbPCKYGbnogrz+00NbiwyzcVBd33ilF/ICSKzkoiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hljBSqHYHeX+xvnEtTYXKPyGOpTqx1OeVRMnyB3rua+fBqXgA4/K+DVeuJVYxuCqO7tOUhPmIIZ6p7sFTGlGypl66al5P0eGuMllXGYa+x7RsbVpMIflWFx/8vn4ASyG+PpMLTYQJW4pIsOWR8Wr9L1/lhVQu9gn4S8zPWgZQys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/bpBFyn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/bpBFyn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D7DC2BCB3;
	Tue, 19 May 2026 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179134;
	bh=GLzbPCKYGbnogrz+00NbiwyzcVBd33ilF/ICSKzkoiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=c/bpBFynyIHwFBRk7qLQO+b5yLHCIQpP3+IGogAN8hRPFigTTx/EX4SbVUCIoYHsj
	 yXDTaAeZjJa5mLzK9aIWoy9dSg0mybN0o5bOU55Tg6zAUFmLxDJD2mwOHSABuLMcuG
	 byYvE6c8Y7gR5oH5eLnqsMIRQsX/gWdNJBhfS/CLdJLfoO0R1ipP4IGn4ZBaxLpE0V
	 +GhJt3SQCxZjmv0kQObBB6hfjWMXMZvkGhEAmxK6r0cD3sj+OHQ7FRur7AxpZA/FKx
	 qnjmf06H8xPVEl7nkggfeIxkt+zdnD8UXKMNpWr1VjKldu6CTi5Q0v7jy0+f1tpcNI
	 WwDLY29kPJapQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 09/15] net: dsa: add NETC switch tag support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260518082506.1318236-10-wei.fang@nxp.com>
References: <20260518082506.1318236-10-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:33 +0000
Message-Id: <20260519082533.A9D7DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Out-of-bounds read and potential kernel panic in `netc_flow_dissec=
t` due to direct pointer dereferencing without bounds or linearity checks.
- [Low] Missing explicit inclusion of `<linux/bitfield.h>` in `net/dsa/tag_=
netc.c`.
--

commit 9e0475f22527eda82a3169b05fab7628a34dfd3e
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: add NETC switch tag support

This commit introduces support for the proprietary NXP NETC switch tag
header, which is added to frames after the source MAC address. It supports
Forward tags and SubType 0 of both To_Port and To_Host tags.

> diff --git a/net/dsa/tag_netc.c b/net/dsa/tag_netc.c
> new file mode 100644
> index 0000000000000..ccedfe3a80b64
> --- /dev/null
> +++ b/net/dsa/tag_netc.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + */
> +
> +#include <linux/dsa/tag_netc.h>
> +
> +#include "tag.h"

This isn't a bug, but should linux/bitfield.h be explicitly included here?
This file uses the FIELD_GET and FIELD_PREP macros.

[ ... ]

> +static void netc_flow_dissect(const struct sk_buff *skb, __be16 *proto,
> +			      int *offset)
> +{
> +	struct netc_tag_cmn *tag_cmn =3D (struct netc_tag_cmn *)(skb->data - 2);
> +	int subtype =3D FIELD_GET(NETC_TAG_SUBTYPE, tag_cmn->type);
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

Can this cause an out-of-bounds read if an skb is injected from userspace
(e.g., via raw sockets, traffic control filters, or BPF) directed at the
conduit interface?

If the injected skb has zero headroom (skb->data =3D=3D skb->head), reading
skb->data - 2 will underflow the allocated buffer.

Similarly, if the injected skb is fragmented and lacks sufficient data in
the linear region, reading the inner protocol directly from skb->data
could read past the valid linear area.

Since the skb is passed as const to flow_dissect, pskb_may_pull cannot
be used. Would it be better to use skb_header_pointer to safely access
these packet headers?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D9
