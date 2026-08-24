Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8113637F8C6;
	Mon, 24 Aug 2026 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593470; cv=none; b=T9uPoT7em8cMyEFCKCgVa586OXJNVher9JnD7gYmEqe4ch0Zyo+klyKNsTkVbpGZo1W+CBRemtdFqo3JwmvGRIHIoPei8xU0DTAudvD1hAVIhW8h38INIJX9eSL+Ys9Tfb0E0ZfXnE/L48CBwX8PeVFJslyZVM0u4TfObtMykg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593470; c=relaxed/simple;
	bh=xWk2GGnjd8ZQtXrQh1C1EAZtLC9/clbg532B0m+uubk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cYOkAAltLJFuTJo/VTXfzL+e/jmG4C5Yvwn1jJBJditcFnyPv0132oLreVE1N/SC9yX66emCJzs16EkeFARSLAkk1gy+hvKwP+CbNCir2XNgCBj3oavWU1SeyfOQ+vrzT3HIHDLpemFg4uzXjG3J1sRMnuoTONwnS7JRbmGjioA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHGjH/m0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHGjH/m0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33451F00A3A;
	Mon, 24 Aug 2026 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787593458;
	bh=iMfvVd4pC9j2BGHAoKIpROi8HQ3pPpjSqJ3a7bQpP8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHGjH/m0gB9WQ/jUKVsBxi0hha9WVd8Z91CAsxe9MCUyb30DgJI0MByU7CnjWaVYv
	 is8+ha5BvcjN5L7mlFtvNXv78kSu7F/5skAbNUM9lWkKmdirlKPJgPp7gNqXC4AupF
	 w0ZntbJAsDfqb1vE89WE4ZhnaIgDXytdM7eJVJs0eNt5eCPjIrrN7VYzo5jWAKuvZG
	 EGtx9DAQtLjZBezD1vGlFYORpelKllOgNqr3MMa5sdyROKlRswwEZLruDuYeuf9Vkm
	 tUChPVCGTaJCz+mHAbFNNp+BALTuVAo5aLmiyO65lZAZuLb1UcQw4rUgSeqaziPHxp
	 /PsWfLM9qc5lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v42 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825-imx-se-if-v42-2-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-2-2e8efac0bb16@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 17:44:17 +0000
Message-Id: <20260824174417.C33451F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Direct contradiction between the architectural documentation for th=
e i.MX95 Secure Enclave and the implemented device tree binding schema.
--

--- Patch [2]: [PATCH v42 2/7] dt-bindings: arm: fsl: add imx-se-fw binding=
 doc ---
commit a9570710d7ea386acbf5fca1ead47f270b0bbd1e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

dt-bindings: arm: fsl: add imx-se-fw binding doc

This patch introduces the device tree binding documentation for NXP i.MX
Secure Enclave hardware. It specifies the compatible strings and properties
needed for communication between the application core and enclave firmware
via a mailbox interface.

> diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b=
/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
> new file mode 100644
> index 0000000000000..fa81adbf9b80d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8ulp-se-ele-hsm
> +      - fsl,imx93-se-ele-hsm
> +      - fsl,imx95-se-ele-hsm
[Severity: Low]
Does this compatible string contradict the architectural documentation?

Looking at Documentation/driver-api/firmware/other_interfaces.rst, it
states that i.MX95 secure enclaves will use a single unified compatible
node (fsl,imx95-se) for all enclaves.

By defining fsl,imx95-se-ele-hsm here instead of fsl,imx95-se, could this
create an inconsistency with the documented interface?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-imx-se-if-=
v42-0-2e8efac0bb16@nxp.com?part=3D2
