Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8AD3A5457;
	Thu, 14 May 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748699; cv=none; b=IY2F1jHuDuAP0lw2a4vk4elhKBZrPiVSeCvBAPVk5Diz4Ahfe1SwpJteUL+XL1NHwMAZveyeIWyPBI0AnFmXn9Giv0nEyjNNuGO92JmpTCXa2NJFVQNnv4y1XTy2b4orhssuQgg7ku4vVrGDHXdbTUscuPXKcoaVEP5shj5KqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748699; c=relaxed/simple;
	bh=KO0gzZPZsd7Q/+8uuUnoZ46mZDJJd6UiBBKQS967+eQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mWw4rJGO9wd4to0aCpS3TcI5fyQ2K9aXnUwcCKFrxSNnaJ3dVHgeXa1l4+BeYyxaKB9GI9KKcqMGuxnvioJ5GNeXeYqV8gINVdHBD8jyE2jS0SnVGAwLZmxARmVxunJH0b2TlGt4IfJPdAYV0fUEgXe4A9IYj//2Hyzel8pzQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf/7KvFP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf/7KvFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34623C2BCB7;
	Thu, 14 May 2026 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778748699;
	bh=KO0gzZPZsd7Q/+8uuUnoZ46mZDJJd6UiBBKQS967+eQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uf/7KvFPYIeUuPFBL3HVGj24MoLcyAEi7uMQ+2HLsmpr4phYnMRJGfjn5qplqYE1t
	 G69ufN3xFKiJ1rA84iyBzzuV7G+lGinyOirp8rAyRiYbBwWR/vqT39yzoW8B8zTk61
	 Vu9SqV8lTSWBVombYiiQJvrTEoqY87CEBEMUo8+Qyrv8fD3uBWzRjXWn1OSN7s0aTW
	 i+zJHOKJxdxpi05eCsLICgGfh26J9m5gyAUGB5rm4JBGA2Va9a2ZlRA4npmK+pbThm
	 ScfZmfH6tEpkzvCm6B92Qw9uqEj/5GjtMvxs4yK/SxWr/46fWw32zbjYmUEWvCwzng
	 51z2ZPDwwOIUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 net-next 13/15] net: dsa: netc: initialize buffer
 pool table and implement flow-control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260513030454.1666570-14-wei.fang@nxp.com>
References: <20260513030454.1666570-14-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:51:38 +0000
Message-Id: <20260514085139.34623C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] NETC_PAUSE_THRESH is configured to 0xFF00, causing an excessivel=
y high rate of refresh PAUSE frames during congestion.
--

commit c202728eb814feedb124fe98e802ff02c4f35dad
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: initialize buffer pool table and implement flow-control

This commit initializes the buffer pool table for the switch to implement
flow-control. It sets up IPV-to-buffer-pool mappings, enables TX/RX pause
frames, and programs the pause quanta and refresh thresholds.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 34b5e655d1c96..7a40648496939 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -403,6 +406,15 @@ static void netc_port_fixed_config(struct netc_port =
*np)
[ ... ]
> +	/* When a quanta timer counts down and reaches this value,
> +	 * the MAC sends a refresh PAUSE frame with the programmed
> +	 * full quanta value if a pause condition still exists.
> +	 */
> +	netc_mac_port_wr(np, NETC_PM_PAUSE_THRESH(0), NETC_PAUSE_THRESH);
[ ... ]
> diff --git a/drivers/net/dsa/netc/netc_switch.h b/drivers/net/dsa/netc/ne=
tc_switch.h
> index cc278a862623e..4a9bf69907e9c 100644
> --- a/drivers/net/dsa/netc/netc_switch.h
> +++ b/drivers/net/dsa/netc/netc_switch.h
[ ... ]
> @@ -28,11 +28,27 @@
[ ... ]
> +/* PAUSE quanta: 0xFFFF =3D 65535 quanta (each quanta =3D 512 bit times)=
 */
> +#define NETC_PAUSE_QUANTA		0xFFFF
> +/* PAUSE refresh threshold: send refresh when timer reaches this value */
> +#define NETC_PAUSE_THRESH		0xFF00

Could NETC_PAUSE_THRESH be a typo for 0x00FF?

When the timer counts down from 0xFFFF and reaches 0xFF00, it has only
elapsed 255 quanta. At 1 Gbps, 255 quanta is approximately 130 us, which
means the switch will send a refresh PAUSE frame to the link partner every
130 us during congestion, rather than waiting for a typical half-interval.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513030454.1666=
570-1-wei.fang@nxp.com?part=3D13
