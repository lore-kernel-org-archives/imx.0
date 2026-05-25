Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2E320CD9;
	Mon, 25 May 2026 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697253; cv=none; b=c24xTmMBQTu1ZxyiLUg/7j9BWR/hKtAVOIvO+5aMVysFV9CUzenlbVY1RcJXG2uYJpCYe59vTKWYm9JEizIDbs75v/eVgwZx8BghOj7DxOmjC7r+pMt+ViA07rBXYgXXgGHtoBoxMy33mwFT/U+ql3OTXj+wxw0grFLK0h0MOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697253; c=relaxed/simple;
	bh=JLqZsFxWNay9MgAX7saAx6mmIZ6ZLZ0VWDvf3itMnuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rLIN41Pfo+HaPVu/xA9rNnvaVEBGNq7bTYnb2Br0wr54xZoobCFU8mlhHKQbPdkTlpwwdQJyOy6xx7SBJv7q893MixqAz9EeXr0sr326eUKN+bIk1puiNphIzQoXzLySeFqEWHgaQSVDjaWdpg1Xq+9kZmA3Pg0XluiHvJSDg/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxRZ+rA2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxRZ+rA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833E51F00A3A;
	Mon, 25 May 2026 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779697251;
	bh=6Fa2pBUFY1lIaLQnMdcZGk5OEdHSBm5oQKcFOT5SloE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FxRZ+rA2mf9vABdcCxi02TaVOVNhFFb5hOyHtJzYKt0YPUfjn4KUqSdVV6YjNOa1u
	 dIco1awhmG33mzmY0u0lKTjGBOn2LVqV/XI1G5S4FJbdWw3gv43ukIkkNoRxNInN+m
	 5zZZjgvyYanpzGfMjwX05xQnvuahW8FQvTtMNUvg6Qj15qChHV0/J7T8i2763gq6Py
	 F5OdeDV1WKyvddAVvKpY9Le0lSiFwENTuJkoPLzJBXIjEhw50jUl7246hqugjJHOSX
	 30LphQ0o5YTSKKAA18zFGrtbZLaKWjl/Quk6L7zv6h9T8LxODHu2sgVtZZH4dDPe+9
	 Aj96AV0+9a8SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
References: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:20:51 +0000
Message-Id: <20260525082051.833E51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The dt-binding example will fail `dt_binding_check` due to an inval=
id `reg` property length and unit address mismatch in the parent `syscon` n=
ode.
- [Low] Misleading indentation of the closing braces for the `endpoint` nod=
e within `port@0` in the dt-binding example.
--

commit 6a7b1f87ea2dd192a60ffaf87f2da35cb030c9a0
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: dt-bindings: Add CSI Pixel Formatter DT bindings

This commit adds the device tree bindings for the i.MX95 CSI pixel
formatting module. The module reformats packet info and data from the
CSI-2 host controller to match the Pixel Link definition.

> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-format=
ter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.=
yaml
> new file mode 100644
> index 0000000000000..bc2f5d448fe58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +        compatible =3D "nxp,imx95-camera-csr", "syscon";
> +        reg =3D <0x0 0x4ac10000 0x0 0x10000>;

[Severity: Low]
Will this example successfully pass dt_binding_check?

The syscon node uses a 4-cell reg property, which requires a parent node
configured with #address-cells =3D <2> and #size-cells =3D <2>. Since this =
node
is placed at the root of the example, the implicit root node defaults to 1
for both cells, which can trigger a dtc warning due to an invalid property
length.

> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
[ ... ]
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&mipi_csi_0_out>;
> +                };
> +            };

[Severity: Low]
This isn't a bug, but the closing braces for the endpoint and port@0 nodes
have misleading indentation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-csi_format=
ter-v8-0-6b646231224b@oss.nxp.com?part=3D1
