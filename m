Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D539A7F6;
	Mon, 31 Aug 2026 21:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211251; cv=none; b=VMfJIxs3gV2yqYqcrgFBFDhSk74/hx0aoeWfxhjDgSvxziK+3huSOASByG2OfhSx+kdfxWhR9XVArdUB7WAi9ulfOG94hUFvllllgGIR9Qf6WVOXKeNLkEDu9wNakDii5nzMm0S28SgXKQsaCgWZeGV60Z6EeXf9cKIywqS37m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211251; c=relaxed/simple;
	bh=X/Pa8P5LM44fYKMsT+VLq76vGR3uFhd1XeHq/WOrFt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WVw5zm3DDNqQyw7lhm/F0THuasIcX1p08o7Zlax2YhUaGw/MMZ15cjDfAGhjFfk0JXYjXx5v6rMEsac2m8buRwvXM2nwHb2WAoUWbLWpZlFXk2by+kzs0IhGt90tqZ33DsQm1qUgDH59rzlRAMTGG6rSz/RQm5LUgzrkPAglmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fddsfi2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fddsfi2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7871F000E9;
	Mon, 31 Aug 2026 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211250;
	bh=1hRm9RzNeDtQOdLokfhV9CkpRgp7SDr9Ih5SFIg5TIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fddsfi2xAGjNJ+Y0KQUCByuMBLXO4Rd2T16sdsfNhFvWzwm3zY88ZBlmDWRayJagN
	 R0uC/j1I89skUhxeeq9ija2eaj+0xyjetmpdwPmeBRo1Ces2fPxHudF2t+19JMZJv/
	 F0UfsrVnZCFRkAMijykMmJ9/TeW9TF/BfDSo1MnQN+mBapTl4JfpRS5T0/XMwGceeD
	 n0ADKOAyewQFbnbLRiV7Aai41yTQbSW1GJR1VgkL/Sz/C9ndNEjN9uMlHLjvthDftU
	 YRdMWxKzj8diJSfTrRqDaOCVfh3Ll4LPFGi0igR9t1AIWNsAyTs7z4jPiqOMJIoC+9
	 rftMwMfIZ5rWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: st,stmpe: let interrupt
 property optional
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831-dts-stmpe-v2-2-f93d5f080443@nxp.com>
References: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
 <20260831-dts-stmpe-v2-2-f93d5f080443@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:20:49 +0000
Message-Id: <20260831212049.9C7871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.

Pre-existing issues:
- [High] The driver explicitly breaks `interrupts-extended` DT bindings by =
manually checking for the literal "interrupts" string and overriding the va=
lid IRQ with -1 if missing.
- [High] Global static structures `i2c_ci` and `spi_ci` are mutated concurr=
ently during probe, leading to data races if multiple devices probe simulta=
neously.
- [High] Memory and resource leaks exist on error paths in `stmpe_probe` fo=
r manually enabled regulators and the dynamically created IRQ domain, leadi=
ng to a Use-After-Free.
- [High] The driver modifies global shared `mfd_cell` resource arrays at ru=
ntime by casting away `const`, leading to race conditions and corrupted IRQ=
 assignments.
--

commit 5a672301bc93caad7ec80c8b4ff3ebf32574e530
Author: Frank Li <Frank.Li@nxp.com>
Subject: dt-bindings: mfd: st,stmpe: let interrupt property optional

This commit updates the device tree binding for the st,stmpe MFD to make
the interrupts property optional. It addresses configurations where not all
boards connect IRQ lines, fixing validation warnings reported by dtbs_check.

> dt-bindings: mfd: st,stmpe: let interrupt property optional

[Severity: Low]
Is the capitalization correct here? MFD subsystem guidelines require
capitalizing the description after the subsystem prefix.

> diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Docume=
ntation/devicetree/bindings/mfd/st,stmpe.yaml
> index 592e8f17659f3..6fde068b526a0 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
[ ... ]
> @@ -225,7 +225,6 @@ additionalProperties: false
>  required:
>    - compatible
>    - reg
> -  - interrupts
> =20
>  examples:
>    - |

While reviewing the interrupt changes, I noticed a few pre-existing
issues in the stmpe driver that might need addressing.

In drivers/mfd/stmpe.c:stmpe_probe():

	stmpe_of_probe(pdata, np);

	if (!of_property_present(np, "interrupts"))
		ci->irq =3D -1;

	stmpe =3D devm_kzalloc(ci->dev, sizeof(struct stmpe), GFP_KERNEL);

[Severity: High]
This is a pre-existing issue, but does this logic break the standard
interrupts-extended DT binding?=20

If a device tree uses interrupts-extended instead of interrupts, it seems
of_property_present() will erroneously clobber the valid ci->irq to -1, cau=
sing
the probe to fail with -ENODEV or fallback to polling.

Also in drivers/mfd/stmpe.c:stmpe_probe():

	if (stmpe->irq >=3D 0) {
		ret =3D stmpe_irq_init(stmpe, np);
		if (ret)
			return ret;

		ret =3D devm_request_threaded_irq(ci->dev, stmpe->irq, NULL,
				stmpe_irq, pdata->irq_trigger | IRQF_ONESHOT,
				"stmpe", stmpe);
		if (ret) {
			dev_err(stmpe->dev, "failed to request IRQ: %d\n",
					ret);
			return ret;
		}
	}

	ret =3D stmpe_devices_init(stmpe);
	if (!ret)
		return 0;

	dev_err(stmpe->dev, "failed to add children\n");
	mfd_remove_devices(stmpe->dev);

	return ret;

[Severity: High]
This is a pre-existing issue, but are the dynamically created irq_domain
and enabled regulators leaked on these error paths?=20

If probe fails after stmpe_irq_init(), returning directly without cleanup
might leave the leaked irq_domain host_data pointing to the devm-freed
stmpe struct, potentially creating a use-after-free condition.

In drivers/mfd/stmpe-i2c.c:stmpe_i2c_probe():

	i2c_ci.data =3D (void *)id;
	i2c_ci.irq =3D i2c->irq;
	i2c_ci.client =3D i2c;
	i2c_ci.dev =3D &i2c->dev;

And similarly in drivers/mfd/stmpe-spi.c:stmpe_spi_probe():

	spi_ci.irq =3D spi->irq;
	spi_ci.client =3D spi;
	spi_ci.dev =3D &spi->dev;

[Severity: High]
This is a pre-existing issue, but could mutating the global static structur=
es
i2c_ci and spi_ci concurrently during probe cause data races?=20

If multiple STMPE devices probe simultaneously, operations like transfers
might be routed to the wrong device or freed on the wrong unbind due to the
dev and client pointers pointing to the incorrect instance.

Finally, in drivers/mfd/stmpe.c:stmpe_devices_init():

		for (j =3D 0; j < block->cell->num_resources; j++) {
			struct resource *res =3D
				(struct resource *) &block->cell->resources[j];

			/* Dynamically fill in a variant's IRQ. */
			if (res->flags & IORESOURCE_IRQ)
				res->start =3D res->end =3D block->irq + j;
		}

[Severity: High]
This is a pre-existing issue, but is it safe to cast away the const qualifi=
er
on the global mfd_cell resource arrays here?=20

Dynamically modifying this shared state could allow concurrent IRQ writes f=
rom
multiple probing instances to overwrite each other, potentially corrupting
IRQ assignments across the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-dts-stmpe-=
v2-0-f93d5f080443@nxp.com?part=3D2
