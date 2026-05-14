Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3D2190473;
	Thu, 14 May 2026 00:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717940; cv=none; b=ACiX1uKSwl2ojkw78dT8H2QvW1K56H5PeX/fbjwcf4wyWX/aSZUVW8Hp5HPZrYbc20n0MZtqRHh85XEXANMmCimLWeR9e76O8B/puvNynvpawoSUI7WL1qCIvdu7qSt8EN00vQ94JfbYWGZiHl6ouxZheojSqYuw4Kbw1vf7XPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717940; c=relaxed/simple;
	bh=Kb8beeGldOMtP8VGFDc0GQozSIqbhJM6BE5TUhEp5JU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hnkxLMArZV3w1ydTk2W7Xyl7JXTNMA2pOzBmMWHNh6Chqt9VS0/1xloVgxRa5x6cifyoJFXBsuTWM+fTCGUyJwhfR5qGEOmwap6qCsTvlxzZQHj8+h8Pii/QDz/nRAFEL9l7z2kWEMVMbnIf3+26ti8jJzw4l3vPNOsvopBzHys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHSQV5vY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHSQV5vY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C352C19425;
	Thu, 14 May 2026 00:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778717939;
	bh=Kb8beeGldOMtP8VGFDc0GQozSIqbhJM6BE5TUhEp5JU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gHSQV5vYwDVNncN/qBYrbfk6siiTKFckrADFmcCt0LMBcEogxgWQchKV852V/5PdC
	 7vGKiOtrEb4YaGvd45caqGlUgmd5ex12ou+sLMeoIR+Le6AlUZHBb7VLPzqfaxrumt
	 q0xk7nza3vxyCV1CKTlklr18fGVg98Hzp0hLWuHuM6oyuY+gZVl6jmtjrb8Iiwke1h
	 5IaAQJ4w6ZmqLKYDXtdTOfs/wD2suq1iBnVUE/kKozbqi2bnJDsLFkX+j8T6FCsbXx
	 z/n65+g2m/CZUtqIam96RdzFrr3Q7GfwzxoZIuNYMR+sGBkQoAwowriRFz1GGTejKo
	 wXd7mgQ2jlBew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: regulator: convert ltc3589 to yaml
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li" <Frank.Li@nxp.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512224544.1223283-1-Frank.Li@nxp.com>
References: <20260512224544.1223283-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:18:58 +0000
Message-Id: <20260514001859.6C352C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding schema omits the `interrupts` property, which b=
reaks schema validation for valid hardware configurations that use the PMIC=
's interrupt line.
--

commit 6cc3d4149b88e8fe5fe483876ec1bdf0a91a59e7
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: regulator: convert ltc3589 to yaml format

Convert the Linear Technology LTC3589/LTC3589-1/LTC3589-2 regulator
binding from text to yaml format.

> diff --git a/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yam=
l b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc3589
> +      - lltc,ltc3589-1
> +      - lltc,ltc3589-2
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false

Does this conversion accidentally drop support for the interrupts property?

The LTC3589 driver in drivers/regulator/ltc3589.c checks for and requests
an IRQ using client->irq to handle internal regulator events like thermal
warnings and under-voltage.

Since the schema enforces additionalProperties: false at the top level,
valid device tree configurations that define the physical interrupt
connection for this PMIC will be rejected by dtbs_check.

Should interrupts (e.g. with maxItems: 1) be explicitly permitted in the
properties list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512224544.1223=
283-1-Frank.Li@nxp.com?part=3D1
