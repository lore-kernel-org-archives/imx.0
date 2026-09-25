Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AFE3B4432;
	Fri, 25 Sep 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326615; cv=none; b=OogaR/C1FD0UbQ+1/gbRww4TpsH1Wx4/visZlkc8w8AAY95ApwW2yYXEno3ysJ+NJEqumeZaFr1UijWCJJfjBBpfcdrgKSWWwjZTURz4XOPwmvVYfaV4BQpsYAbd4zXdAnQglqRlEaV7JlXcq/JRR3yqG4TUnegf+0wmZ18irug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326615; c=relaxed/simple;
	bh=/gNHDITeCemawo+auI+YxlZ21fio3AcKNSjlri22Xrs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JwtRqEq1ceaduVe5qmgaE/sSBgQy+JbCagFFjIuGxnt1JAMOyAp/hRDhdBbHGL1ItDX/MpB6hcwqmGokkZmRhL56ZIFdhA4cClDaj+zl5Klba7Ke9w4l/e6jBtLZaR/uDmm8lXl17LQmj7KvlEGOfbFzPXKQwPf7NNex8uxc/40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lh//hWnJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lh//hWnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528D51F000FF;
	Fri, 25 Sep 2026 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790326613;
	bh=KBLzfZBvtkfYxHX8ib81+pPiMZ6btVM7b1Tk0KwiG9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lh//hWnJzqssD3XE/jadOfeuQLaOKc2GPUDLJPachY/a6pPCQVbeXQkS6jNcFP/qm
	 xu103PQL5dLmrjRhtycPMIqtdJzmZwvYokktLAqo15vM7WToUDLmghvDyOmTfdnZa/
	 V1oxnGmL0eWb0PLhFTUvtFM3glBOpc3xVRGtsS0MAPlnbZznG6uBArZTx08kv0Y4iV
	 5UbOAEWbGBSF/DDXxT3MN40Lz9w3VCnX0qAByO6aICcK+XUPX7zjNZpKFPl90rzrVs
	 xKe/I70pYtoae2+0DdgyrHvONaGbh0Lshd/JeXHN/pxFoPC9AT57XqQd4Y+ldm4c9o
	 5X3pjxnuztueg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260925085152.41852-3-benjamin.gaignard@collabora.com>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 08:56:52 +0000
Message-Id: <20260925085653.528D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: removing deprecated compatible nxp,imx8mq-vpu breaks =
validation for older DTBs
--

commit b108674bf1919c1736feafe71d426544535366fb
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu

This commit removes the deprecated nxp,imx8mq-vpu compatible string from
the bindings schema following a driver cleanup.

> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a5..69619d2c86fa0 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -14,12 +14,10 @@ description:
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true

[Severity: High]
Will removing this compatible string from the properties:compatible block
cause regressions during make dtbs_check validation for older device trees?

Since device tree bindings describe the hardware abi separately from the
Linux driver implementation, does the schema need to retain this entry
indefinitely with deprecated: true to preserve backward compatibility when
validating historically shipped device trees that still contain
compatible =3D "nxp,imx8mq-vpu"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925085152.4185=
2-1-benjamin.gaignard@collabora.com?part=3D2
