Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595210;
	b=44i1SYWXGKPzU0FXqkhhIpRYQoplTDbDP4zrWMk4oe8iZ8LTPoiZ0+idbIpC4FCJZcY6
	 /Ssn/NSIfdPf+nDlup1orPcb+g9SlRRsLXZ/3ghbAcvCJTFK6NfYC1ABGnvxhq2ffc7Wl
	 hOc8SICYgC6h/EbE0LT/lIqvWDkzuchatr6LRXtUJvlQxi/gr4w94CYXrXcJnQVSHBX98
	 vtf+QMto/kTLwm2QAaOLX4x8wpONIGobLaxk0YNlbv/0MzrDeCI6pJzxOT3n9wull2H8c
	 jpGw8RvR8HkYRmmj1CFHBFXcycn+S9obyhcNVBBUf0Gsi+/jnqCc89cUIShKPblZXng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595210;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+FGIpMG5ae4/LhcK4WslesNlSZmAoMou93v27skahbg=;
	b=oXBi0Vq832D456tXLmooFFFeWRYLO8HqB1ew+PEcfnMLV+/izpflNDPx6+ApkBvEenu/
	 paJUNfRgZuV83c/j87E4JmiHgNI3z5LPUU7zlUfh1ZP7nnc61ErSp1q8kTWSPkCWu3mgz
	 ghU24iHpDOfTnEVRET83IKjqOnq9e+Aufz72r3S7Vjn69BqWMWy4FBh3dIlavb5Xq4ckW
	 xy7oPYL7Rdf9uGYU4sxtlItr5ynL1vcF6Umj1Ba+pdeCwbg50TDvXd5m1CKYC5Lup40Si
	 Kstibc4gQ8LO6VVW2QuuMuizfLiZ/5d0Q94WZFsyeFVJn+qcw/rVBt1imBBAV0CJwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqenInLK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE595606A31E;
	Wed, 25 Nov 2026 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqenInLK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F361F000C0;
	Wed, 25 Nov 2026 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595210;
	bh=+FGIpMG5ae4/LhcK4WslesNlSZmAoMou93v27skahbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RqenInLKGULQhAJ+yNOP1gsCYdoSz8SnJOKzBfO85P5hrwyaFfWVMyT+kEBaiJ4MT
	 /ByedvDOwbrP8fxgvUd0D/bXDTihiyXGeeUwHCaSWSvKpzu/mX5ufF17qKvPMK1wJ5
	 dYlwEifwKYA4UjhhSUO/ZrGDkM/tcQfHK4D1KyURxUkNu6Y8Qb0SlYsiGbsQoADLmY
	 2OA/orVWreMlteO7qjhtGmwyd+rL6RxCFNQh2X0c1Hpomkvno+Vjolx1vLW9b4pEJW
	 uPstjpEw2AdExIx7ft+CUPiHfqPa4XBt4+McDvIY/tC6544zE+fc3Lb4smvY9abtur
	 Fm+Gm93w11zSg==
Message-ID: <sashiko-outbox-232893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinesh kumar v" <dineshkumarv85@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125082222.136238-2-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
 <20261125082222.136238-2-dineshkumarv85@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:26:49 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: vendor-prefixes: adlink entry inserted out of
  alphabetical order
--

commit 2f4d78076b6d244278338cd9e5998e364b7f32b1
Author: Dinesh kumar v <dineshkumarv85@gmail.com>

dt-bindings: vendor-prefixes: Add ADLINK

This commit adds the ADLINK Technology vendor prefix ("^adlink,.*") to
vendor-prefixes.yaml.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index e467da45cd7ac..6bbfa5619ee46 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -70,6 +70,8 @@ patternProperties:
>      description: ADI Engineering, Inc.
>    "^admatec,.*":
>      description: admatec GmbH
> +  "^adlink,.*":
> +    description: ADLINK Technology Inc.

[Severity: Low]
Should "^adlink,.*" be placed before "^admatec,.*" to keep
patternProperties in alphabetical order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125082222.1362=
38-1-dineshkumarv85@gmail.com?part=3D1
