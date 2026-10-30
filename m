Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367425;
	b=35xD4Oxaa6ME7VEOKlXsd5SmvdzlFa87VnvyaBF6yyl3SYpW1wQq++Ama98UGmt4zgzm
	 +DCY2zXPVXs3Wem1mXV4xiMkibMZIdZ8BowRoWYa0wtLZ+YnCuDflG20lWSKJOKeQ7mvh
	 o8+PFJHJmiTKPfy8Yo8AwIGTAqLN7XKoH7OXp1qYSTMei3GqKhRFTr0Ef/srdlGt1uCob
	 kzI0RoIBGLWR3q7McO5KkkE+hJpDQfcNZFxZOgYPwoLP1fIjWMF5a/4/HU4lmQiDcmUCU
	 Tu/Op/hjOatlEHFMIfsMsmlNGXfnwXwwX4v1CA1ZOjdYH9lNZXD90hwHki9p+J0J+uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367425;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iQeSM90k4Rn4yZVYk12BaoWHKR0eCI8v0vSVJFAbaTE=;
	b=zMHHb/AV8zWRdK84rWbuexueMXYXlMplf2xJpXO2MKJJVfTMcIUcF819oOXlA+M7B72p
	 A8xy53igqb500hq9XHTSFq9MzSuZWi/xBU2hKQIqCn2wXyAOlrolMm6dukrMxa9bPSjoh
	 kNjSzsOUEfs/BE5UBAnX6Eu0Fr8Vy41gIS26OFNBuZv4MFTcypPtPjlA1y4p7eJZXDa3P
	 pSYOszNNL16nS40VR0aDdHvDcbuV6Wy+M/yFbfHgTg9yzfmFL+MKtyk/JCBJvJ/kkAcyc
	 If7aRMAQ9JbXnqCF1P6kMkeIHdTWBN+nK2V5Hgy92Oq44nO6xo3yUSFnUCR6bR3bZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSu5tadn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6560606A31A;
	Fri, 30 Oct 2026 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSu5tadn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7D61F000C1;
	Fri, 30 Oct 2026 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793367424;
	bh=iQeSM90k4Rn4yZVYk12BaoWHKR0eCI8v0vSVJFAbaTE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSu5tadnWcyDhwnwm2dXLF0Ms5kOGtjcwELtoDgiM2E5l0GmwwEL+9FMefVTk7XTr
	 iOTsQoawR484S1e7yipSkox+ReN4ERltXFNUKjzwNY0egQzJiELrVf5s6wvv46veyx
	 +CTPqsfsmeaV+FeIT5Tx+uMbou2+qxH8AUnNjb7HprrwecAzy/CqZjrtrs6bmT7OPo
	 4TNWWercKaI4cCI9nLl7xMdwUufsJ5h1qEDo0crt2SldVmdurybHmYJFSzAYjMIs2Y
	 LiWLj4kOGM+WVg5m7E/CJWmvoLfJulr8SvjhnkR2fbim0iveGaPWPeMPRa7hQC4y6P
	 TXRwnwj8TQb9A==
Message-ID: <sashiko-outbox-191073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] bindings: Add devicetree bindings for new
 phyFLEX-i.MX 95 Libra RDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-1-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-1-1c1cebb5be99@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 13:37:03 +0000
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
- [Low] dt-bindings: arm: fsl: wrong enum sequence indentation breaks yamll=
int
--

commit 46ee5c7fdee02b781beb27b96a47fddb125b6299
Author: Benjamin Hahn <B.Hahn@phytec.de>

bindings: Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK

This commit adds devicetree bindings for the phyFLEX-i.MX 95 Libra RDK board
and the phyFLEX-i.MX 95 FPSC Gamma SoM to fsl.yaml.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..f917ae7202e96 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1551,6 +1551,13 @@ properties:
>            - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
>            - const: fsl,imx95
> =20
> +      - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
> +        items:
> +          - enum:
> +            - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra =
RDK

[Severity: Low]
In Documentation/devicetree/bindings/arm/fsl.yaml under
properties.compatible, the sequence entry phytec,imx95-phyflex-libra-rdk
under enum is indented with 12 spaces instead of 14 spaces.

Because Documentation/devicetree/bindings/.yamllint configures the
indentation rule with:

  indentation:
    spaces: 2
    indent-sequences: true

does this cause yamllint and make dt_binding_check to fail with an
indentation error?

Should it be indented by two more spaces to match the surrounding compatible
entries:

          - enum:
              - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra R=
DK

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-wip-bhahn-=
imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de?part=3D1
