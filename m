Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E382DE6F3
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892191; cv=pass; b=TYfWtJNltkJ8Si4qWvrerriWfaO5Eb6QYfQNmMtXHaN0uFpL53BOVBgI2eV4VRJr+dqxxuYvqnSPuQhyQFM5vaBzzbqMe3jYVTCcaPmYImsInaeHBUqNzeGknuJh/GRIjjFKe2eIVMh6ZYzYyzn4e9h1U3IAmpAF5/l0+z7yxF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892191; c=relaxed/simple;
	bh=2a4Le73LBQr/hZI/otLXD8JXTTU+ceipXIWhUtHl5Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhSatRCEwavrQcSMG3oxWHeol8Mf8wvbhA5mZJ1zZhQqhHplQg6x83iMBUrpB9DfEtW6MtEdtCwl+ttpXM48xT1ls9cyDNvQ53Og8Dgu1MvAChzIje1bMx4pSde3Kbmm8dPqLcB5Qm7k4/a31HUolH1XgtZjs8I5QbRdwJThRsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARfnhb1M; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARfnhb1M"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-126ea4b77adso8808885c88.1
        for <imx@lists.linux.dev>; Thu, 12 Feb 2026 02:29:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770892189; cv=none;
        d=google.com; s=arc-20240605;
        b=SuohDTllvcVJZs7MHCf24WUump0vJaXyWNBGxOCy3361w06kSW8XW0UQ4EgilrA9Ud
         QRY95jNDdN1+jjPSszYcfn/+6HNLDg7ZoEBvdxaE6Ke9TuHldCSSF9KXxI3AV1f8s/yW
         y/qHCgWReOI5Bxta1fqRC2pjO8hla2aRjhe2AckToM4acwwkfNQsaSO4ZlsHjFs2OH96
         M/mJmN+Vn9C3/3++vN+XhhQZmFaf1VGrwpypG+NLkTC7NzDRR40j1r6xtXMSlZwHfISN
         DfXZAK5Y3fEIRGc6ztxLNxoNc4yhUEk1wVSGU40tOg0/GDfowRgyuSRmaUEyWQJMIARy
         fEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2WNwAh7MqNpr3gNRm798l0GPzFsj9dN4fIN0L2pm3tc=;
        fh=YZ+NIUwq+ElgQ61L/DXkpRExYrei1efjpA/hzuwEG5c=;
        b=KYlfl2JRXQWmGn15Egn/3V56ZqxUsqhXrqW4fl4LGGnlSp+Bl8gEOr+ZLWLmxgLeYx
         vp2+HR/8K1YY9cHWbN0qNpVrXSaVNff1itqlca8Uo9y41Ya8pBmkf0Hn+0qwLtr/qzHn
         jVUWn40T/DE2yzqU4if2Z+70j8Lbac1CAumJ8N86l9C4Gd+BS2Afche1Yx/9bGA+EnTs
         pk6dtsvOmTgmQH50t6YpUBV3tPPedOr4XOKjmvgIeONLwDdb8FDhX69Q6T3pluBQHxxb
         lAS3CM0k4x5roaX/4Xb2s6dKJv6HD+GoQCyO9CzWlXzQiALy0gln8rj77AgRbd69l56W
         0T1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770892189; x=1771496989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WNwAh7MqNpr3gNRm798l0GPzFsj9dN4fIN0L2pm3tc=;
        b=ARfnhb1MEvk11OvBaf+Mqv/n227ShrY2UHAAQVtZ/ENO+wN1Lnp2gSkRuzXWycIHRG
         XcrRQR82N44+5G2+jMuWNfvjsImsK6bzgBs3tyyXZQTP9D7MG4O/ln+BDL5+N1/vNkg3
         WikeQBCkXjAXGLlJue6R5b7cx7YYkHNzzdbQoE5faN0Ej05OkPq/+CYNhOXO+4GfNguK
         Znf/umAXTqYXUQAifI6IXC75mnMS0FqSCIO/kLofbxwRKdO7rIkHJDyd2ClzUA2NV6g7
         dmGY93Ks8gnLUxkTrKpEK/QkJvYkJKmzG6I6J2zVhRkmiJQPtiVBIonSft+myvVQ1x2Z
         txCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892189; x=1771496989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WNwAh7MqNpr3gNRm798l0GPzFsj9dN4fIN0L2pm3tc=;
        b=AH9oHwbuWoMd7hShVeBz1+6hyEFFF6OBe6Kk/UDAQN8e2AbKY2IAq1mNZeo2uYXs4a
         Fryxr9cwxS9Uya/mFGxL2H1EhomXSDJuvQyz7y6aaIJjoitPI//e+O4eRnW/wssqczSM
         n6WiA4xc5E6dGtoNa0q+5nUy5/DfM4Bx9cVYv+CE8HQnVosIhko6s/R95KAtf3q8OACr
         y2GlD8Q2WS4b5kLSlGA9wzcx9pS9CYhbxCo9tydRpU2ge7gfnk9pxIoh19Vqy2g/SMDu
         n7Ch3crDBXiP79SMGj6JOc6zqqYk9JH9x0cjvrMMO6HOCE5XGYdvwcO5pKXbgtGw3Q4t
         KZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWohAu3cSergGUKRyBoF8ZMuFlkee+roD78ERnu7PSSQPWJQDjGCiACfyrToWRuEfMm5qA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9lrZ2zl876vYIZwtcft1mRRXvAYcD5oc/LY9gSUPpFroLptWF
	ewWcYHu3RyOqoqd/JJn2xXl+Tw9K+M3yO25sQi8mI/RPH0LdMKWWW7HrRFvGrbwJFKbT79+k09u
	JoDs9C0JIH2Y4IeL4rbtW6ZQN9WdzCKQ=
X-Gm-Gg: AZuq6aIKUiuAhn2K902af1gakHFJ2jtXcTnJ+IQUhY4hPTFKqYadBbbyKGLsCO//odH
	Y8GSC7RPeGvp/SFT2TVSVa3eeEmD/rIP7AckiU648OXONVxf5hlZs3NSCMXefrlmNS5S3pu3UYu
	D3ppUY3JrSe/4BvS7msy/vVe2PSwBWqwL1t/JBvSCzv2elki6BQjmIetOMFLquueCGhEv5S6TWl
	dNYjN0WZ5ulDezz09mEzihqeo9IKIhZKo9K/w9zqwQjt7BoE0P5pYG735lzZcoE5Wge+koi8PxM
	58e+3C4dgqmploqWDxihZ9ayvOw5rodbhHf7PP0x2/2Pf8SU6YhXFUaGTTN5SJT9dx1sdMXCR9z
	eaA/hoj41PGiNtXzeQmiulw==
X-Received: by 2002:a05:7022:e12:b0:11e:3e9:3ea2 with SMTP id
 a92af1059eb24-1272f7b0683mr1034840c88.49.1770892188893; Thu, 12 Feb 2026
 02:29:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211214646.3700533-1-Frank.Li@nxp.com>
In-Reply-To: <20260211214646.3700533-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 12:32:32 +0200
X-Gm-Features: AZwV_QhhFT0cn79ldAjeoBPb3aybubF9rpuw8kM-MYNYPOpdFzKmXW-eCrt9Hks
Message-ID: <CAEnQRZACes8EptdEgg0i0vzdcxgUJwZAfQHU0DEhMnXtA-g01Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:49=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Convert eukrea-tlv320.txt to yaml format.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/sound/eukrea,asoc-tlv320.yaml    | 53 +++++++++++++++++++
>  .../bindings/sound/eukrea-tlv320.txt          | 26 ---------
>  2 files changed, 53 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-t=
lv320.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320=
.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.y=
aml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> new file mode 100644
> index 0000000000000..483507fa77937
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/eukrea,asoc-tlv320.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio complex for Eukrea boards with tlv320aic23 codec.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: eukrea,asoc-tlv320
> +
> +  eukrea,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The user-visible name of this sound complex.
> +
> +  ssi-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the SSI controller.
> +
> +  fsl,mux-int-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The internal port of the i.MX audio muxer (AUDMUX).

Same comment about port numbering applies also for mux-int-port. So
better add it here too.


> +
> +  fsl,mux-ext-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The external port of the i.MX audio muxer.
> +      Note: The AUDMUX port numbering should start at 1, which is consis=
tent with
> +      hardware manual.
> +
> +required:
> +  - compatible
> +  - eukrea,model
> +  - ssi-controller
> +
> +additionalProperties: false

The driver sound/soc/fsl/eukrea-tlv320.c allows an optional property
named codec-handle
so I'm not sure additionalProperties: false is correct here.
