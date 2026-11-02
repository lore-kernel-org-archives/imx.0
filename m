Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603095;
	b=rnJjqzkAplAH7V+nxIr6I5Hlu49eev87vZNostXBRl+jL34BfuGYB6DPKh9xBEUESn0q
	 5VQj10XaoOkdEa2vG1wtUtFVGwNe734GZfV3cq0AueOH/3OAzKhEGsO2Y14q4ZmCn0JcA
	 d9N7l2sxHnv3jddNd+lnOhQ/W5xupICbohyZGt6Rr0jyz6o7lte4ljOorsannnvj87yEj
	 n05cxMM+JcrpLE79eh3hbRWlCp3093FGIPMbrdoIau9mnoODSDBOLKRRyvZW8FGDOHp1A
	 MYNyK5d+fZ1KFy3t8WyswgWVVznDyL5UYrg6INNmvH9qhFklqqMLUBRwRJzjax37Ujg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603095;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h5gRPK05G1R8Zd/G7jhkkXHCCY87KfTZCE9scMBs24U=;
	b=xebLUad8fz7ecQKj4V78cRZ/uapprrfIYtUc5YKsKDZGgF0HKxGeTwuFiqqhiGkm+NCM
	 juBiXqRiXkY1l9b0SpAnrYIu6NzQgpK5xFWqBAL7DdAh8avRu8KaGCEqndp+fNnmqYaXS
	 pZVhX9FfO/hVr5FEUDWh28Hiv/1P2yOtetDNbNvtYyVmwzhGR5amUfdBTq0D3b7PESV1a
	 pRMiL/iyZc8xBi/WJxPvf4dReHAgJF66uP8GPz7oW5HkcuVrFMh78mYT/ZZS4Ska4l/Xl
	 dcThwo3bTeJ/uvQn6iqHYWk74Mst+3ThFlhz564s2w8+WBR18bUHupvS9VrChbEw5+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SLITjWdE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92712606A327;
	Mon,  2 Nov 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SLITjWdE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D822A1F000C1;
	Mon,  2 Nov 2026 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603095;
	bh=h5gRPK05G1R8Zd/G7jhkkXHCCY87KfTZCE9scMBs24U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SLITjWdEm0wCvKjAONAqrM0UDgZTKqxrFl4AYg/Y6Tl8Dshit/HHIUKXzEtL5y/0f
	 fUljmnWW0qMuj7wVZxp/GGC1kTj+TqEhmRqRLUgvlb5Pc6OZ2DASTs6wdX9i3gWNNq
	 QYppQzggkFYC5bOJfV5hLdF3XucA+qq6Kk7g5mQphI9iJedsofoSo2Q6VuxgufSTAT
	 TaAMaFykvzGa4lB7wudZA9vj+A7vhZAqE4VKOtyOwT0Xl06zgA6ftOZA0ZfswuiB3j
	 3DTUpQ2DTLKKIPnZremDfSSwKMF1Zt22t7Twq2Hvi7ECmIos4viS9bXI66LQBjv9H/
	 HT98DgkInIcKQ==
Message-ID: <sashiko-outbox-192997@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinesh kumar v" <dineshkumarv85@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102065645.121046-2-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102065645.121046-2-dinesh.v@adlinktech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:04:54 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: arm: fsl: undocumented adlink vendor prefix in fsl.yaml
--

commit adf2fbda79acf7e7bef8349bedcf40bfbb38f343
Author: Dinesh kumar v <dineshkumarv85@gmail.com>

dt-bindings: arm: fsl: Add ADLINK LEC-iMX95

This commit adds compatible strings to Documentation/devicetree/bindings/ar=
m/fsl.yaml
for the ADLINK LEC-iMX95 module and its I-Pi SMARC Plus carrier board.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..c3f4c2814d6c0 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1597,6 +1597,12 @@ properties:
>            - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
>            - const: fsl,imx95
> =20
> +      - description: ADLINK LEC-iMX95 based Boards
> +        items:
> +          - const: adlink,lec-imx95-ipi-smarc
> +          - const: adlink,lec-imx95
> +          - const: fsl,imx95

[Severity: Low]
Is the adlink vendor prefix documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml?

Looking at patternProperties in
Documentation/devicetree/bindings/vendor-prefixes.yaml, the entries go
directly from adieng to admatec without an entry for adlink:

  "^adieng,.*":
    description: ADI Engineering, Inc.
  "^admatec,.*":
    description: admatec GmbH
  "^advantech,.*":
    description: Advantech Corporation

Without registering "^adlink,.*" in vendor-prefixes.yaml, running
dt_binding_check, dtbs_check, or scripts/checkpatch.pl reports an
undocumented vendor prefix for adlink,lec-imx95-ipi-smarc and
adlink,lec-imx95.

Also, in the i.MX95 section of properties.compatible.oneOf in
Documentation/devicetree/bindings/arm/fsl.yaml, the vendor board groups
(PHYTEC, Toradex, Variscite) are ordered alphabetically by vendor. Should t=
he
ADLINK LEC-iMX95 based Boards entry be placed before PHYTEC i.MX 95 FPSC
based Boards instead of after Variscite DART-MX95 based Boards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102065645.1210=
46-1-dinesh.v@adlinktech.com?part=3D1
