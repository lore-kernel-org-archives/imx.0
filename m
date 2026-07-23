Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31238E8C7;
	Thu, 23 Jul 2026 04:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782491; cv=none; b=M9FAgLpX9WeqJgxPT5/W6dno4LA30bpqhENmTPtReDGVZroxrQwVwydi5RRaOW15cqTZSeFmDcF32zHLkbYti1WvQYtJiPPukT1l8tkXxaTXADfgVhg/iColeP1jLzFHGGhc+FZz06vUlhCjmfXXEcqrszh9FvCD6Tb4Mz/jVkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782491; c=relaxed/simple;
	bh=fCEdPv83tQJnZ46Ma1MJPoidRJQh2aG6z2ZUkVMGiUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pFAQV6XmG9mpsbMJQhAlzTfbGolT0QYqAAuhovrVlDe+O4I5/1vGcJNHTjnb+yNmJLA/hwRNd/u9qe83IuB6+XQtVwriyVsuo6x0oDIu1SPgwA80quy48ji/nwbiwQdGztvEsVMV8i7rTblDCT99z+X40gPoG0qhXldHH4ah0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGanFbuR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGanFbuR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A8D1F00A3A;
	Thu, 23 Jul 2026 04:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784782483;
	bh=uWntOyP+EyuvssIB5Ns/ZVYT6MSg9KBuMzAA0xrwouU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YGanFbuRUciFeFOM4BRU9RzxIQ93g10M0hpE5lhKTXL9n3Ibxn2lwjzafVR9dArgZ
	 4d+Wiz4u5lhrZna5jj7mv0qhbtG2nWD0ky0azplNiLEBx5QW7+FvRj+mnqBt2Et+df
	 MV0yL3xfivWBdKbciBMZ59ao39gk+/ingGCsMro/vrfJ48nkhT3rVaE5Wv8MPyT0rC
	 vLvjBkgUDY7P5xAlfEBuw0rIfVeaIY8yXzpx4QgQJL5bY/vaqkDdyF26LSN3nbsnv5
	 ySAyS1Qt9l/mNGAeSYgLtE5g5NQQWeqeCV+39lUJPc2cGr+DdyjWUtxPFBmxaki1C9
	 pXQpv1y9gzFNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260723-shikra-camss-review-v6-1-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
 <20260723-shikra-camss-review-v6-1-7c46f9bbb4db@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 04:54:41 +0000
Message-Id: <20260723045442.78A8D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The YAML binding uses a global `oneOf` block for `iommus` instea=
d of using `if-then` conditionals, failing to conditionally enforce the har=
dware-specific constraints for each compatible string.
- [Medium] The `qcom,shikra-camss` compatible string incorrectly uses `qcom=
,qcm2290-camss` as a fallback despite being a hardware subset, violating De=
vice Tree compatibility principles.
--

--- Patch [1]: [PATCH v6 1/6] dt-bindings: media: qcom: Add Shikra CAMSS co=
mpatible ---
commit 945dc84434e7636d9e3d6c379f213e274cca7db3
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

dt-bindings: media: qcom: Add Shikra CAMSS compatible

This commit adds a new compatible string for the Shikra CAMSS IP, using
qcom,qcm2290-camss as a fallback. It modifies the iommus property to allow
either one or four items, as Shikra omits the CDM and OPE blocks present in
QCM2290.

> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5..490a7f3a8c5ff 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,7 +14,11 @@ description:
> =20
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss

[Severity: Medium]
Since the commit message states Shikra omits the CDM and OPE blocks, is it
accurate to use qcom,qcm2290-camss as a fallback?

If an operating system driver binds to the qcom,qcm2290-camss fallback and
assumes the presence of the CDM and OPE blocks, couldn't this lead to bus
faults or initialization failures since those blocks are absent on Shikra
hardware?

> +      - const: qcom,qcm2290-camss
> =20
>    reg:
>      maxItems: 9

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
Does replacing maxItems with a global oneOf block weaken schema validation
for the existing qcom,qcm2290-camss hardware?

By using a globally permissive oneOf instead of using if-then conditionals
in an allOf block, a device tree specifying qcom,qcm2290-camss with only 1
IOMMU will now silently pass validation, even though it requires 4 IOMMUs.
Similarly, Shikra could incorrectly pass with 4 IOMMUs. Should these
hardware-specific constraints be enforced conditionally based on the
compatible string?

> =20
>    power-domains:
>      items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-shikra-cam=
ss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com?part=3D1
