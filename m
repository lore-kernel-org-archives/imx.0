Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17434B68C;
	Tue,  9 Jun 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016216; cv=none; b=fnZHv2fI3ohyKVt/r9u9P3620w+lq9Dyuvw7Z0tTxHjuBit3CAYx3LQ6l6RC6rJgP85o14I9PxPm8qtVqcC/8T6cae0lH33Az5pOBUV4mwRbWu0Fj55iW/4KNimAfbaEQizdYKNaOjZ+yq+ulUyPCO/5apOI02GO4uluZufva/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016216; c=relaxed/simple;
	bh=MB9vLt9Ju+1MG6C8wzCNz2Q6+AcfMYL2Sm3Ypo2ainA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A0IJxx7REUqz/+HqfmhjikSdv1n/m63MxrO0Z9GdIf4CSSNUf3NEcK3mMxbGgmdaYR9SAW03STksVlo6bi2ZWM2XixdKm91u938KB7J+hh1wyJkUJGLPoIQ4unVoFVQZdoGqDNPDWTjmdxZe3RzJCZlSRQNM6E8InsVdH2yuGiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1x5uz+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1x5uz+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB901F00893;
	Tue,  9 Jun 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781016214;
	bh=TA8b+CpUBZytOdWZK5Wd86oUit2bC0O5v6SgrqO6Pcg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1x5uz+RcJbTfd/HneALEjvToUvV/V6hVAr4DwU8fhRNeVbKq+VT8J7MyOTMjlgFa
	 +V1LskOaa4EpsdX1MY+6B230ACcimbDs80ec+Zh0H+SWm69P4uVVC8GOwbqzYF+zrG
	 r8wiI+y3zob8xXLtpjbF9jauyTvAL5rt+KGBwv8FF/4Cke9zC7bCcrkUaGZ3pmIDZ5
	 JyhCWn6vdUrwAlDPUhX3s3c7C49ecIR4cqGWDYHB0TR4gxGJzzulEvbmXdswBiDMDm
	 8q10S+5mMLfZqNu5NUxTAPMDNPEjTZ27vMgul8h2gdBrXcbzo9iz1v6OZ/vOdbJScd
	 iWXf+P+NyXjoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] can: flexcan: split rx/tx masks per mailbox IRQ
 line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609142954.1807421-4-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-4-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:43:34 +0000
Message-Id: <20260609144334.6AB901F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Concurrent execution of split IRQ handlers corrupts the lockle=
ss `skb_irq_queue`.
--

commit aded1fca2efad9bc2736fa7932119f27a1b0a87c
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: split rx/tx masks per mailbox IRQ line

This patch splits the mailbox IRQ handling into separate lines for MB0 and
MB1 on S32G2 platforms. It passes a mailbox mask into flexcan_do_mb() to
ensure each IRQ handler only processes the rx and tx flags for its designat=
ed
mailboxes.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index 7dde2e623defe..0ed838f0719aa 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
[ ... ]
> @@ -1244,8 +1255,14 @@ static irqreturn_t flexcan_irq_mb(int irq, void *d=
ev_id)
>  	struct net_device *dev =3D dev_id;
>  	struct flexcan_priv *priv =3D netdev_priv(dev);
>  	irqreturn_t handled;
> +	u64 mb_mask =3D ~0ULL;
> +
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
> +		mb_mask =3D (irq =3D=3D priv->irq_secondary_mb) ?
> +			  FLEXCAN_SECONDARY_MB_IRQ_MB1_MASK :
> +			  FLEXCAN_SECONDARY_MB_IRQ_MB0_MASK;
> =20
> -	handled =3D flexcan_do_mb(dev);
> +	handled =3D flexcan_do_mb(dev, mb_mask);

[Severity: Critical]
This is a pre-existing issue, but since there are two separate IRQ lines=20
assigned to flexcan_irq_mb(), could they fire concurrently on different CPUs
and corrupt the rx-offload queues?

Both handlers call flexcan_do_mb() which then calls=20
can_rx_offload_irq_offload_timestamp():

drivers/net/can/dev/rx-offload.c:can_rx_offload_irq_offload_timestamp() {
    ...
    __skb_queue_add_sort(&offload->skb_irq_queue, skb, can_rx_offload_compa=
re);
    ...
}

Because __skb_queue_add_sort() modifies the list locklessly, it assumes a
strict single-IRQ serialization model. If the primary and secondary MB IRQ
handlers execute at the same time, this will lead to concurrent insertions
corrupting the doubly-linked list. Is there any mechanism restricting the C=
PU
affinity or preventing concurrent execution of these IRQs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609142954.1807=
421-1-ciprianmarian.costea@oss.nxp.com?part=3D3
