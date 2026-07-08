Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CECC3DE44C;
	Wed,  8 Jul 2026 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540698; cv=none; b=DKmudtrYgFBFQg8vB3NttevN2m7zg3C2webNj0J6Ju//hjEo67cDfvI3bxIU9nQtt+ua9uFc69d/R1J4Wf+6p6EpgxIZclMrXgHMWgZX/7/vdZfTkPc0m+Z4BUXRtxDQvEJNqC2rejDQTeopfZp7vCycCRtV7IQZL8jl4WKiqn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540698; c=relaxed/simple;
	bh=4MwbFq22IWTqkeKUTzFJaht586+6ZVZEzWrXjwEBz/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zd4HjSquJ/QDxTHwt9k4RDo+qALl3gKZQtO+aV8eUKxSG7SiXRZ5AYD5gNk76WbB4N9rSmpjmS376YuI7NanE95w56CQEbSo01RUJbumB6HR9hfOVn6U0Bs5pSGS+4QerLP3T/i3UovFNO1LTNNZXunsK4IPQ1j7Ul3stWvEh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITCnJ/M3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITCnJ/M3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271EF1F000E9;
	Wed,  8 Jul 2026 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783540697;
	bh=p49wA3t75MpL8JynZKSCzLe94qEXZEw4W4zPtO1Hr8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITCnJ/M3tWcVoitez/mvM7TkOGtYoH1MrbQ6lr73biv3S1WQGddC3O1lj2oV0MqI6
	 GlpEju9bPmQZqFU8RRUCRUd/44oA1cQSLkuezPEC/IHIf3lmzErgGcvnE3KNHcHWzQ
	 288M61De/mJie4tAmmvTYpPEfbyY17A/iaCTNaba0S0qGHl3nw5yWoxLOa8gD/i0Yw
	 Qqsli6ii55BBiP+aQKWEyQu5mIozrHIBx5xZmzBBSSiSIc1Rfw0UQtjyexQG44Cj3z
	 mdXXoQtMXRDse9Jc1hW8SDeC0Wmi0gxu4Qzme2u124Syq34jfw1JI7CU1VvB/BV5MX
	 1mtkciamvFYOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: mfd: st,stmpe: let interrupt property
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 19:58:16 +0000
Message-Id: <20260708195817.271EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The commit makes the `interrupts` property optional to fix a DT =
warning, but fails to add the corresponding driver support, leaving the dev=
ice unusable in Linux.
- [Medium] Making the parent's `interrupts` property optional creates a sch=
ema contradiction with the `gpio` subnode, which unconditionally requires `=
interrupt-controller`.
- [Low] The commit message description is not capitalized, violating the MF=
D subsystem guidelines.

Pre-existing issues:
- [High] Regulator enable counts are leaked on multiple probe error paths.
- [High] The IRQ domain is not removed on probe error paths, causing a dang=
ling pointer and UAF vulnerability.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: mfd: st,stmpe: let interrupt proper=
ty optional ---
commit 4dfb528c2761ff56029b1d565357b3fc0352b520
Author: Frank Li <Frank.Li@nxp.com>

> dt-bindings: mfd: st,stmpe: let interrupt property optional

[Severity: Low]
This isn't a bug introduced by this patch, but the MFD subsystem guidelines
require the commit description to be capitalized after the subsystem prefix.
Could this be updated to "dt-bindings: mfd: st,stmpe: Let interrupt property
optional"?

This patch marks the interrupt property as optional to fix CHECK_DTBS
warnings on boards that do not connect IRQ lines to the STMPE811 device.

> diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Docume=
ntation/devicetree/bindings/mfd/st,stmpe.yaml
> index 32ccaafe91df9..8a6abc2f5b310 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
> @@ -221,7 +221,6 @@ additionalProperties: false
>  required:
>    - compatible
>    - reg
> -  - interrupts

[Severity: Medium]
Making the interrupts property optional creates a schema contradiction with
the gpio subnode.=20

The child binding in Documentation/devicetree/bindings/gpio/st,stmpe-gpio.y=
aml
unconditionally requires interrupt-controller. If the parent lacks an
interrupt, how can it satisfy the child's requirement?

[Severity: Medium]
Does the driver currently support probing the STMPE811 without an interrupt?

Looking at the driver, it explicitly rejects the STMPE811 when configured
without an interrupt:

drivers/mfd/stmpe.c:stmpe_probe() {
    ...
    if (!stmpe_noirq_variant_info[stmpe->partnum]) {
        dev_err(stmpe->dev,
                "%s does not support no-irq mode!\n",
                stmpe->variant->name);
        return -ENODEV;
    }
    ...
}

Could this leave the device unusable in Linux when the device tree omits
the interrupt property?

[Severity: High]
This is a pre-existing issue, but I noticed regulator enable counts might be
leaking on probe error paths.=20

If devm_gpiod_get_optional() defers or fails, do we leak the enable count
for the vcc regulator?

drivers/mfd/stmpe.c:stmpe_probe() {
    ...
    stmpe->vcc =3D devm_regulator_get_optional(ci->dev, "vcc");
    if (!IS_ERR(stmpe->vcc)) {
        ret =3D regulator_enable(stmpe->vcc);
        ...
    }
    ...
    irq_gpio =3D devm_gpiod_get_optional(ci->dev, "irq", GPIOD_ASIS);
    ret =3D PTR_ERR_OR_ZERO(irq_gpio);
    if (ret) {
        ...
        return ret;
    }
    ...
}

[Severity: High]
This is a pre-existing issue, but does the probe error path leave a dangling
pointer in the IRQ domain?=20

If a failure occurs after stmpe_irq_init(), like during the IRQ request:

drivers/mfd/stmpe.c:stmpe_probe() {
    ...
    ret =3D devm_request_threaded_irq(ci->dev, stmpe->irq, NULL,
            stmpe_irq, pdata->irq_trigger | IRQF_ONESHOT,
            "stmpe", stmpe);
    if (ret) {
        dev_err(stmpe->dev, "failed to request IRQ: %d\n", ret);
        return ret;
    }
    ...
}

Since irq_domain_create_simple() isn't devres-managed, could this leave the
globally registered IRQ domain with a dangling host_data pointer when the
stmpe struct is freed?

> =20
>  examples:
>    - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dts-stmpe-=
v1-0-1f51d15bb358@nxp.com?part=3D2
