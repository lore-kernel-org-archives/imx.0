Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1F3EFD35;
	Wed,  3 Jun 2026 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474523; cv=none; b=YDo5uGSVGCtsFlRbaMQIV5/4Os9mAW+aPMV0aqOlzmbX28iIfDuJV9dbgfD1hgH3jfX2bkn6hsMAtRCrXU0cX109+C0rEaCfAu+kOZwha26W22WeK/oQzWKmADSdTxmA2VNpQbRjoMMJDZiOqui6tTktAyZtUiM2enir4AtEhBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474523; c=relaxed/simple;
	bh=wUZ+EqevtIFfrsDHCDNrLWre6bpJZx3lrx2zfRtA3LQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H03+pCLSRDlw4thhsh7s7+0pnYWRUjNfpXLEkO6TJp2gjIoA1Bv+GqMhfIDRxfXKjxqprZv8NC35CcXXEJHoa8F2/77IaL8P/yq5k2XZm3LjzumrHecJEOKUXiUwGGGNhRFJdTkyvDFTX9zE8Jd7OQBQ1h0CDUAUR5pqRaHEeko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWAsxKz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWAsxKz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA0A1F00899;
	Wed,  3 Jun 2026 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474519;
	bh=Sy0meL+dMBBaqvvMl3t/aYdndp6N/4lrLCKwnj5FLxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KWAsxKz9VpXhv7mKTVR0jLNUZiR4+dJ31ChoQtPJxjBL6cUaEw9UTT1AxXhm9/d+c
	 erJE5DyVVOZFp9lWovEbzbC9oqFY1IBXXNwMW5GtercZM+zSMyBrKe54i9jjeh2KAo
	 eJA4Vj4vLyRsgwxBb8hXlm9DozmvGKXJItOnsnOEeQasIZjpkw7WJxej4jxj8z7Kzm
	 OBFx3j6VnRqYE1r2KewbAFRToLrRBZ9Yo5XbSJBgOIbKrOwisjU0F9kssUxdx8aNPH
	 9w6BjIF/ublGPUgfCBhN92xs9Y2N9r/4h7/4UOS8EwtD+IkjMv5KIFJmCXegCoeU7O
	 qvUPcoqbZfCZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 5/8] can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR
 quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260603071342.641874-6-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-6-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:15:19 +0000
Message-Id: <20260603081519.8EA0A1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent lockless modification of `skb_irq_queue` leading to lin=
ked list corruption.
--

commit 5585c21d3d6c362465f049b7368b7a16b3da034f
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk

This commit introduces FLEXCAN_QUIRK_IRQ_BERR to handle hardware with a
dedicated interrupt line for bus errors and device state changes. It adds
the flexcan_irq_esr() handler and enables/disables the new IRQ line as
needed.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index 32e4d4da00a1c..23ddf79106410 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
[ ... ]
> @@ -1912,6 +1929,13 @@ static int flexcan_open(struct net_device *dev)
>  			goto out_free_irq_boff;
>  	}
> =20
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_IRQ_BERR) {
> +		err =3D request_irq(priv->irq_err,
> +				  flexcan_irq_esr, IRQF_SHARED, dev->name, dev);

[Severity: High]
This is a pre-existing issue, but this quirk continues a pattern where
separate interrupt handlers are registered on distinct physical IRQ lines.
Is there anything preventing flexcan_irq_esr() from executing concurrently
with the mailbox interrupt handler (flexcan_irq_mb) on a different CPU?

If they run concurrently, can this lead to lockless doubly-linked list
corruption?

The CAN rx_offload framework expects SKB enqueuing functions to be
serialized. However, if flexcan_irq_esr() calls flexcan_do_state() or
flexcan_do_berr() which use can_rx_offload_queue_timestamp(), it will
insert SKBs into offload->skb_irq_queue locklessly via
__skb_queue_add_sort().

At the same time, flexcan_do_mb() running from flexcan_irq_mb() can call
can_rx_offload_irq_offload_timestamp() or
can_rx_offload_get_echo_skb_queue_timestamp(), which also locklessly modify
the same skb_irq_queue.

Could this concurrent access scramble the list's next/prev pointers, leading
to kernel panics or infinite loops during NAPI processing?

> +		if (err)
> +			goto out_free_irq_boff;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603071342.6418=
74-1-ciprianmarian.costea@oss.nxp.com?part=3D5
