Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9739524B;
	Mon, 31 Aug 2026 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210419; cv=none; b=GB6hnCQXg09ow+GxE6OLK4KYAnbKs0qyFTnMMhUb/sgjCoprSYI5lvnhW9cL2Psy6L7d8JhLSCyqnNG8/7ZHSGJNwDWE1QHud1AoTGhiCK7ynmc2XWFyDkar8sOSmIODI55HIg+zP4R7BDYxbWSHy/udA1I91KJbFU9u7MRE9rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210419; c=relaxed/simple;
	bh=LR3pBy3K4+SChml/ALIz/yAdKPPOTerbVoZV8WykV6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lYJNZgQU2OmVuICxNUuu/vT57wZXgwe2S1tF6NxH2aJmnxjlxA9/2M1AfPTewlZqZnx23tlvnQ1cnlBnOVGVKlP+DYy5mIxDj49RvetUUmpTw1aomz9WQzQh6ivsIiG2AyLEI+jBfH0IfvQHnLk4JmFTXncpbiB8yg+xFSWJMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQEi7uVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQEi7uVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5480C1F000E9;
	Mon, 31 Aug 2026 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788210417;
	bh=StdHuL+uLxg4MZyPxmiamOq5qVX3FBP6DjDRxmN3h40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QQEi7uVEmK3uR1kpvtHuz2Bfa9/S6i7jvbYDN2GCYenZpRDMjA7OsEPazz/5lK7ti
	 rDscVjDGFO7T1m5UDjqmIsh1dGKS35QM2toEVVDB5QNKgzYa8jhSLHvIFJ1Xz3NWfO
	 3DOub3pwIGGJ2jL0vVq0IKBOD3YKyq7kNOvzCobqdlnQypiBDEG60j3jALvsfj7dZ2
	 gus0KNx7Dm4HNYx1B5+mk7Jr+EdPZi+DagZtaLbqTc1epbCTPnDDJBrB0w9cBC3ZDD
	 fdBVpCrN+3OO8+HP1Hj7jBLpOlyLj8TMvVdyxrsZY9H8KtTLhwUgAHeXHHaGE3ghhW
	 QvCEKq7OmYx6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: st,stmpe: add deprecated
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260831-dts-stmpe-v2-1-f93d5f080443@nxp.com>
References: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
 <20260831-dts-stmpe-v2-1-f93d5f080443@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:06:56 +0000
Message-Id: <20260831210657.5480C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating the MF=
D subsystem naming conventions.

Pre-existing issues:
- [High] Incorrect teardown order in the MFD core driver causes use-after-d=
isable and illegal IRQ domain removal.
- [High] Interrupt is requested before hardware is initialized in the touch=
screen probe.
- [High] Missing manual `input_unregister_device()` in `stmpe_ts_remove()` =
causes the driver to access disabled hardware during input device unregistr=
ation.
--

commit 2b78324bb3bbfce531df8a18d620cea4c9246016
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: mfd: st,stmpe: add deprecated properties

This commit adds deprecated properties st,sample-time, st,mod-12b,
st,ref-sel, and st,adc-freq to the st,stmpe-ts child node. This resolves
CHECK_DTBS warnings for devicetrees that place these properties under
the sample_ts node instead of the parent MFD node.

> dt-bindings: mfd: st,stmpe: add deprecated properties

[Severity: Low]
Does the description "add deprecated properties" follow the MFD subsystem
naming conventions? The guidelines specify that the description after the
subsystem prefix should always be capitalized.

> diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Docume=
ntation/devicetree/bindings/mfd/st,stmpe.yaml
> index ddb27ae64ba37..592e8f17659f3 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
> @@ -141,6 +141,30 @@ properties:
>        compatible:
>          const: st,stmpe-ts
> =20
> +      st,sample-time:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1, 2, 3, 4, 5, 6 ]
> +        deprecated: true
> +        description: See top layer st,sample-time.
> +
> +      st,mod-12b:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1 ]
> +        deprecated: true
> +        description: See top layer st,mod-12b
> +
> +      st,ref-sel:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1 ]
> +        deprecated: true
> +        description: See top layer st,ref-sel
> +
> +      st,adc-freq:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1, 2, 3 ]
> +        deprecated: true
> +        description: See top layer st,adc-freq
> +
>        st,ave-ctrl:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [ 0, 1, 2, 3 ]

While reviewing this patch, I noticed a few pre-existing issues in the rela=
ted
C drivers that might warrant a look.

drivers/mfd/stmpe.c:stmpe_remove() {
	if (stmpe->domain)
		irq_domain_remove(stmpe->domain);

	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
		regulator_disable(stmpe->vio);
	...
	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);

	mfd_remove_devices(stmpe->dev);
}

[Severity: High]
This isn't a bug introduced by this patch, but does this teardown sequence
cause a use-after-disable or illegal IRQ domain removal? Since the core
resources, IRQ domains, and power are disabled before mfd_remove_devices()
is called, won't the child drivers attempt to manage IRQs and communicate
with unpowered hardware when their remove() callbacks execute?


drivers/input/touchscreen/stmpe-ts.c:stmpe_input_probe() {
	error =3D devm_request_threaded_irq(&pdev->dev, ts_irq,
					  NULL, stmpe_ts_handler,
					  IRQF_ONESHOT, STMPE_TS_NAME, ts);
	if (error) {
		...
	}

	error =3D stmpe_init_hw(ts);
}

[Severity: High]
This is a pre-existing issue, but is it safe to request the IRQ before
the hardware is fully initialized? Could a spurious or pending interrupt
trigger the handler on uninitialized or disabled hardware, potentially
leading to bus errors or hangs when the handler attempts to read registers?


drivers/input/touchscreen/stmpe-ts.c:stmpe_ts_remove() {
	stmpe_disable(ts->stmpe, STMPE_BLOCK_TOUCHSCREEN);
}

[Severity: High]
This isn't a bug introduced by this patch, but does manually disabling the
touchscreen block here bypass the devres lifecycle dependency order?=20

Because the managed input device and IRQ are cleaned up later by devres,
does this cause the input device's close callback to execute after the
hardware is disabled?

drivers/input/touchscreen/stmpe-ts.c:stmpe_ts_close() {
	stmpe_set_bits(ts->stmpe, STMPE_REG_TSC_CTRL,
			STMPE_TSC_CTRL_TSC_EN, 0);
}

Could this out-of-order cleanup lead to illegal I2C writes to the disabled
hardware block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-dts-stmpe-=
v2-0-f93d5f080443@nxp.com?part=3D1
