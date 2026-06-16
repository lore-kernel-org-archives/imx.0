Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B372543D50E;
	Tue, 16 Jun 2026 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611357; cv=none; b=TUVPWseJ4Z9M8bRCQMS/b/fz9rCvp3rmFixOpMEW4o/o9bjmRK1rZTWIg6mvnjflUdlWXHkj7mZJBflWIWht1GnC8nzf0mX55Jw4q7cK5XZPk7DfXnt2y0q6F1+JlMt1H4NPyDYlmEDYwPSFRnA/+f6jw1ohmRh5qnTe15n17uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611357; c=relaxed/simple;
	bh=U42HsML4Be8Od/7lulBpdcfaxspTZ5UifJfWsOaOc8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dVkj+FyH3DY1U28Ch+TOGAOpKaLfPQMsYaH/DNeaxHiH9eVEQq1d4OB6Z7foysf1WdwyYusVbxgMNRRkn5FoOGgfYT9t5Bnfxvf20pFQ8qMyl3333SfSsr1FQMTAigoqjtnIOVTx4ojOvNPWnHJYkkCOWIHlxeaGLPumvMr5ojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZobdNhpJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZobdNhpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4191F000E9;
	Tue, 16 Jun 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781611356;
	bh=TeNNUBc21wwql+A2x38thLF07VJvEnAUUoryzLQh/MY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZobdNhpJzV5HsTNfVthrrJsp9dh0cAdZzKyBGwqT+WyyTSZRe9MPG1MpZFTC4YJfU
	 l+EvY2MempQzgQtZGcoqdboDCFYKd+b+tL3Sz05fvEbl+PRxUFqP4pdv9hXLoN0HGe
	 SvbH9cJiu1/OWcHcGDD76yCYIgPa4uebNLX4Ysj4sK/phPHqKW1FUmgEz+broIJbUi
	 m9Jw74JYnpP/wiZGB2PMWrCpGK2CPxiaiGWbYTh2e3vomhT9w5JLb8pDySlnOVez9v
	 kTG7TebzumAIQnBCqnnaTbFSQKub3OHPJQPEA4XxpJJ4f4KJ+nQj3wl53i0yAB0BCw
	 5TZMPBRIzhS9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:02:35 +0000
Message-Id: <20260616120235.EC4191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `secure-enclave` property lacks a vendor prefix.
--

commit cf8315ecdb4e65137976e7833794688f5241f64e
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Doc=
umentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index a8076d0e2737c..14a6429f4a4c0 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -53,6 +53,10 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  secure-enclave:

[Severity: Low]
Does this new property need a vendor prefix? Since this appears to be speci=
fic
to NXP/Freescale i.MX hardware for referencing the secure enclave firmware,=
 it
should likely be named with an appropriate vendor prefix like
"fsl,secure-enclave" rather than as a standard generic property.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to the secure enclave node
> +
>    clocks:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-upstreamin=
g-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de?part=3D1
