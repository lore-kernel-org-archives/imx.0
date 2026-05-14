Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8078F26;
	Thu, 14 May 2026 00:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717426; cv=none; b=M9gmA3Y0g6H5RChBScqyTz4K+N92M9MdrvpQtb9HxO22S+IVlsnfY6eFvPF/qlgmDQlIarLj/OCriOhDRt4zVdXEFAdnjCFkSo3q/+tYADo2yCiQODpn9Lu3tMltjzPNYBzcgtmIZrGoqY6wVPqsk2F8krEctqcdK2YNuyMkw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717426; c=relaxed/simple;
	bh=gppp5HdjLL8AzFManE8Yuhxxzc0ZHRZSSO5L0dVYbxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L2LGOqx0wrg27GeCBTamZnX3uTn8z7fjlptDgLMsSddhXM+Jbms2REaLdqHPqHL0mdzEBJ8j0bTvw+sUUPdknaAXXQYgHWDlT00LvVmaFkdlrHA10m55hRNgZPMgl4pX97DURU5hInVFzopE1fuZujN5g5Ccqa07yGG7/vqp6Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdjZGaIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdjZGaIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4FBC19425;
	Thu, 14 May 2026 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778717426;
	bh=gppp5HdjLL8AzFManE8Yuhxxzc0ZHRZSSO5L0dVYbxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LdjZGaImwwRE5mg747Yd2i/R4XIeBQB11GTofsZemtrr3cPLKI6+e2nmmcRywVEnx
	 X1M0H8L8ly0cEDLOrJvv+wfXZSPb9ZXnER/uer1ZpcgYmEh0VkM+J9MHo6Mh4EePAB
	 GTvB6pT2dzKvYuR7NFo4G+A1PveFunWflgue+2INRs3Q4utyxZENF1z5DMGyQMZ5Lk
	 zmvC1QFt9iw1nX255sDPPTQeXNLRUHmk9RZaZQVvt6H97yDFrXn512ciKtxmAK9NPB
	 xZBC1udt7nIQkMe6fuEYkXFHU/nIouymIV2hgYdPoeQmx3AdVTZVQVSx7UAR8idZTi
	 y/E9fGuQIPthQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: net: dsa: Convert lan9303.txt to yaml
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li" <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260512214704.1084890-1-Frank.Li@nxp.com>
References: <20260512214704.1084890-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:10:25 +0000
Message-Id: <20260514001025.8D4FBC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unresolved phandles in YAML examples will cause `dt_binding_check` =
to fail.
--

commit ff1d6b54c66febb1ac2492f6699ba1d476db3541
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: net: dsa: Convert lan9303.txt to yaml format

This commit converts the SMSC/MicroChip LAN9303 device tree binding from
text to YAML format. It also renames switch-phy to switch in the example
to resolve warnings during device tree checks.

> diff --git a/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml =
b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
> new file mode 100644
> index 0000000000000..42f8473538a07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    /* I2C managed mode */
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        switch@a {
> +            compatible =3D "smsc,lan9303-i2c";
> +            reg =3D <0xa>;
> +            reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_LOW>;

Will this example fail dt_binding_check? The &gpio7 phandle is referenced
here, but there does not appear to be a corresponding gpio7 label defined
within the scope of the example.

> +            reset-duration =3D <200>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +                    label =3D "cpu";
> +                    ethernet =3D <&master>;

Similarly, the &master phandle is used here but is not defined. When the
example is compiled into a standalone DTS file during dt_binding_check,
does this result in a reference to non-existent node or label error from
dtc?=20

Defining dummy nodes for these labels within the examples might be necessary
to allow the schema to pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512214704.1084=
890-1-Frank.Li@nxp.com?part=3D1
