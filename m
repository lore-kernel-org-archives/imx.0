Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312C2AD3C;
	Mon, 13 Jul 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935674; cv=none; b=Uz1WxHhYMMKQEf1lI3d8+KzP2URCEJ4q6CHtFS0dQR6ZCsIo/cWoqmDxTPVeTFVBNPAV87DVAWLc4gkaHO93oyis+/CwghtnB8u8I7SLjbDDmUgrPZmbqNcqg+FFY0m0RFW60HwhMD4mDGofLVDjYY4zS7BoTSeoQw5mWdyDDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935674; c=relaxed/simple;
	bh=hJQ1ziTW2JI09ZxZcoU9nNprmRwrz6JnyxTyNxt/O/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EBQidKanmxT48J/KbMT6t2bbaTqiE/DezMsrmtHdEUVAkWcVhFFs1uCaSbEFOtlZB3CigeJWbCCiOSt3xQsHv6IRAFmyzkg7EFQKff5nAX4Gd47ayZzGPAhvf2pnBooGZb3Pe4Gc6YZWTgIosQwITT3UPd+29iFLqcV00QDbl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQhJJar9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQhJJar9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9AD1F000E9;
	Mon, 13 Jul 2026 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935673;
	bh=JOiqyyOIGH5pzpK5RIgRBrgElun3fjrf7x0O+jBl87k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iQhJJar9f8Vnzwkv/ETtK01NLtId+xxuCp72bWCJWBGDNZ2ZWjnj7R9TiFtSNWyEp
	 gzwgAPGB+pVceul5pEZaj91u5EI3F6lROGdKhEe6Js3qrQozyG+DP72Sh2OVDK6A8X
	 PGhl44Y7DdedtN+YI5V8QK7yo3TXE6Bex/3lA0bGRmbeHpvEeuszmwNaprf5KkRd9D
	 2uAPiazkKsknDR8foNCE04i9l8ItFij4yW50y8HclmDzI4lJ4D7V6JA6TlMd5J1f4m
	 X1VGLm5PlM5Ej6rD+y1t0M3fwQ4vHp48TpQcuWr2/YFUqRijX3jJdnpHdg9ds1QGmx
	 RnerrqC5Onqtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 09:41:12 +0000
Message-Id: <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema uses a global `oneOf` for `iommus` instead of conditi=
onally restricting the number of items per compatible string, allowing inva=
lid configurations to silently pass validation.
--

--- Patch [1]: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS co=
mpatible ---
commit fc0a6e2efaafe1932112e71e5a72e67dfe8ffb3f
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

dt-bindings: media: qcom: Add Shikra CAMSS compatible

This commit documents the Shikra Camera Subsystem IP, using qcm2290-camss
as a fallback. It updates the compatible string list and changes the iommus
property to allow either 1 or 4 items depending on whether the CDM and OPE
blocks are present.

> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5..490a7f3a8c5ff 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

[ ... ]

> @@ -76,7 +80,14 @@ properties:
>        - const: sf_mnoc
> =20
>    iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected

[Severity: Medium]
By using a global oneOf for the iommus property, doesn't this allow invalid
configurations to pass schema validation?

Without an allOf block containing if-then conditional constraints tying the
specific compatible string to its corresponding number of IOMMUs, a device
tree configuring a QCM2290 device with only 1 IOMMU, or a Shikra device with
4 IOMMUs, will silently pass validation.

Should this constraint be enforced conditionally based on the compatible
string?

> =20
>    power-domains:
>      items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-shikra-cam=
ss-review-v5-0-db53be15dc4f@oss.qualcomm.com?part=3D1
