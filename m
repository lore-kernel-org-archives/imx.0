Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549032D1911;
	Wed,  3 Jun 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473726; cv=none; b=HS2xkvwaXtlmpePaqUyk/egVwxttALmr1fFxHP1SeXTRmPzu9a4cWkIUNlTmVGi4AJ7AKF5qNIIJcq0L8zc6nqwwLgTCr+qFeume1LKZnH4E9ZnhgDNiESW7tBpY7fa4z/eExYbffWED5455KtbP5jxOSRcZqhbToXBAaDUOasM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473726; c=relaxed/simple;
	bh=NOZFpu3nLdRcLnC7S4Qp+4saKzUpXtWHo716rz9R6nk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gWT8F5x4+vR1aTcRAM+vwBR+a/EIwnruQRMzt5EA+dpdpHA0BGlw5NgusN2UkZFckXzS0PIjymwJW9BKas4fY+JVJ7PkyrzyGi84YQRmFtR4ObRs7tQz+Hm6WDLQuMX2X5QZFWKyVxeGxiGtR2USOslE8HtBqjnGQrvcgIHWPOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxNeeFaF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxNeeFaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2481F00893;
	Wed,  3 Jun 2026 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780473725;
	bh=1SgAuiHTq+gaVC0enPP1oUiuz66/OMy2UaQ5VvbiniU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UxNeeFaF2eaMUS2SmTjWtaJBK5eVH6iwJ0BoIzWeN2lsS5CPH2e/cJVV05K17h/JD
	 95iD8AS7Ycm5CzIRjR9QQ3jXN3YWTMcIK38YxgELlmVZlm+YrE0o70eSzgS5V9SwHt
	 oy9PW+ZrfiV03xHntTY71dSZIECGpWAphJRW5+x/HV+AcYmR4XuxD7zvVe0LXK5Pe8
	 SR5bgrTSWAiibbQ/uzs3jgYnK3QKbFG+K4pogV0TOSXHh1z9WDE/TrFtaV5t7lbMV1
	 fPVq+Bh9pC6kCY5vN4mWCpEoGz7llGBEet8qPizVtWgHwQanPP6mLEGBcWMoLNxU99
	 pCoawcWbKbaVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 4/8] dt-bindings: can: fsl,flexcan: add NXP
 S32N79 SoC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260603071342.641874-5-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-5-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:02:04 +0000
Message-Id: <20260603080204.9E2481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent execution of separate IRQ handlers silently corrupts th=
e lockless skb_irq_queue in the RX offload core.
--

commit 1b40c6c47df0cbe3a237b4923882ceb85a965615
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support

Add NXP S32N79 SoC compatible string and interrupt properties.
On S32N79, FlexCAN IP is integrated with two interrupt lines:
one for the mailbox interrupts (0-127) and one for signaling
bus errors and device state changes.

> diff --git a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml b=
/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> index f81d56f7c12a5..d098a44c2b9c2 100644
> --- a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> +++ b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml

[ ... ]

> @@ -173,11 +174,38 @@ allOf:
>              - const: mb-1
>        required:
>          - interrupt-names
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,s32n79-flexcan
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Message Buffer interrupt for mailboxes 0-127
> +            - description: Bus Error and Device state change interrupt

[Severity: High]
This is a pre-existing issue, but can the concurrent execution of these sep=
arate
IRQ handlers silently corrupt the lockless skb_irq_queue in the RX offload =
core?

Since multi-IRQ platforms (like the newly added S32N79) map different FlexC=
AN
events to distinct hardware IRQ lines, the interrupt handlers can be dispat=
ched
concurrently on different CPUs.

For example, CPU1 could be executing flexcan_irq_mb() while CPU2 is executi=
ng
flexcan_irq_boff():

CPU1:
drivers/net/can/flexcan/flexcan-core.c:flexcan_irq_mb() {
    ...
    handled =3D flexcan_do_mb(dev, mb_irq);
    ...
}

CPU2:
drivers/net/can/flexcan/flexcan-core.c:flexcan_irq_boff() {
    ...
    handled =3D flexcan_do_state(dev);
    ...
}

Both of these paths eventually call into the RX offload core to enqueue
packets:

drivers/net/can/dev/rx-offload.c:can_rx_offload_queue_timestamp() {
    ...
    __skb_queue_add_sort(&offload->skb_irq_queue, skb, can_rx_offload_compa=
re);
    ...
}

Because __skb_queue_add_sort() and __skb_queue_tail() are lockless queue
operations, won't concurrent insertions from multiple CPUs corrupt the
doubly-linked list pointers and lead to a kernel panic on subsequent access=
es?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603071342.6418=
74-1-ciprianmarian.costea@oss.nxp.com?part=3D4
