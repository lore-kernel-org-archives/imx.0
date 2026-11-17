Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900417;
	b=wykQ9AP+vlxyc/J1wa6bLQh/dWwfL2p9INKgZCMW4dAVNWTUVlxSnUKM6e26sbGXlwAS
	 Bk4qKlSdRPLqvioEqWZI/9+AGrxsZCccoMiTz/5ovMuO3cLrMMYYkXpzJumgcVtmIkS1s
	 8NRb+1pErVDXQ4XEzJwZuvVbVQyxwC8R5CySNOmFBslwI/MY+Y65zfnoHTXC57NB51tg0
	 xFav6Cw8ExyN/cSQXZgLEz6fUycSCYwgau4LOv7CFNmWTIC2Dy9nGm7SLsg5ttagmGtkt
	 xo5mZnZ+rdn/1Mz4F0bYlFeI+OybNGBg0h8Idb464PDjffmbtA0BLTYgCaf4HRE/4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900417;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PF49f21C1HR8Dr08aXZ+TnHEhYFVvqv6INHAegR6xJA=;
	b=oDdG9NHsKRz1vXayeykBz7qc3f/MUGkQH8Sou1EoogRL39vkoTIF0/wjMnQkigAhwVb5
	 SCCpXhpXeCseYmV/aIuebTAKpMUo6H46Ak5kp46mbN3by/xIlj8HDX1F2xWgVIs7xPEXp
	 CUcZbPobjzPQ9BlyZJC9eXjANk2j2gghmIXNBDPJuR22UiaS5tg88bj69iI0A0D07iGtO
	 D5BKpw5zzd6lKjWDTm4soOeMh0TVT1FtSLAUSS2z9WQJ0KQKpA+6xwY6OiC5gjn9Owi3U
	 Cp6rDAcbJgkg20xl7W3YWy5Siwh0jSt6fVRYnOaXaKH0xgaMuY5CmZeGt6hasu0iEYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPYkofVn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7423606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPYkofVn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEAF1F000C5;
	Tue, 17 Nov 2026 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900416;
	bh=PF49f21C1HR8Dr08aXZ+TnHEhYFVvqv6INHAegR6xJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bPYkofVnTWNxxuWsFFNWqyszq1BbkM35VJOb7M4OhEnjCuCM1OqYoxh+f3A3EJEfk
	 3AeSy3S1pV7MCTT8LvgrDRnB2iMbXOKJqLW3PDqzFMAvEAZhduZHJmHbDB3kmUnK2B
	 RKhfpIHiNkq5pxneJ6lkgQ7ij7qC85f336l+M/wPhUMhGUivqp9hJKP1ihbYtcO6EY
	 Xixoq7D+t2NsVV8xWX8wfQl52rgGw82p/lJLub+zG+/shzNSKyAx61KMmKnpP5ssqn
	 2OzA2YIjaATkW5wyn3ilX+g7RwWdal2VB4/nRrGcV6hjL5V5EcmxXfQ5wiL9V0vaXe
	 xcYc3uXr2V0mw==
Message-ID: <sashiko-outbox-218340@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] irqchip/imx-intmux: Fix probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peng Fan" <peng.fan@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261117-imx-intmux-v1-1-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
 <20261117-imx-intmux-v1-1-189e7e0ad98d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:26:54 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] irqchip/imx-intmux: missing irq_dispose_mapping() in
  imx_intmux_remove() [1]
--

commit 86b73ac3be694b14f9c6ebf1c3858d6acbcde2d7
Author: Peng Fan <peng.fan@nxp.com>

irqchip/imx-intmux: Fix probe error path

This commit unwinds initialized channels, IRQ mappings, and runtime PM on
probe failure in imx_intmux_probe(), and enables the IPG clock before
enabling runtime PM.

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> index c7914fea3d1f9..a9eda7646e2fe 100644
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
[ ... ]
> @@ -281,6 +282,17 @@ static int imx_intmux_probe(struct platform_device *=
pdev)
> =20
>  	return 0;
>  out:
> +	while (i--) {
> +		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
> +						 NULL, NULL);
> +		for (unsigned int hwirq =3D 0; hwirq < 32; hwirq++)
> +			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
> +							     hwirq));
> +		irq_domain_remove(data->irqchip_data[i].domain);
> +		irq_dispose_mapping(data->irqchip_data[i].irq);
> +	}

[Severity: Medium]
This problem wasn't introduced by this patch, but does imx_intmux_remove()
also leak the parent IRQ mappings [1]?  imx_intmux_remove() clears
the chained handlers and removes the child domains, but never calls
irq_dispose_mapping(data->irqchip_data[i].irq) for the parent IRQs mapped
by irq_of_parse_and_map() during probe.

[1] https://sashiko.dev/#/bug/linux-1cb10b02-3764-4fe8-975c-f222a75eec4b

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-imx-intmux=
-v1-0-189e7e0ad98d@nxp.com?part=3D1
