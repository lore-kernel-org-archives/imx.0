Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31045230D0E
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079105; cv=none; b=fccVRf2qv3D8X4H5ZO+lpXnllgMd3sfjYa8/8deanXkamWdwpxBRtsO2ZoQvUVwB4Pmz+1uLHENSRx3xl1oR7dn2lo1C+qeTYtQWkot2wFHryGr/BfzbZRpI+Pv2zfWCtu3R6Y3xbjQSLP9A7OoNKyBJTKy564dvumgvl60smmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079105; c=relaxed/simple;
	bh=siv3Ien97FCkgAjG2Q1suDpHQa4tobCL+W3T5TCoEj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHdpWQOIGO8O8AU+Vh9IDZ4QfPfoMiPY0cvR06/Rrh3ED7jvQwL3zzWbaumdsOK2tfnbuwkI3fO6kl4/cocOa3ugImcPKH08o3stp5LIdTvteYF+VSRi09BZYmi4yzq+COzG0OK25w3uzYFgW73jlus64yTA6IsGXN7egYgCFqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNbt9j5K; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNbt9j5K"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2360ff7ac1bso30633885ad.3
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750079103; x=1750683903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=;
        b=GNbt9j5KIZeJNLLw2XK5lGtAruHvwDMtI6ykGIXtbAfgR/mkOXWFCgw3N8fnMLXiDk
         R2k7QTWMo+O5wGZWzMwHnYeNhK6EGNxwnxnEBO8+rsc007krWrFDFgBwKPMKiybDIpxi
         P1YnfhdifMt7jFVISrZlt7NOJz4P9xkGgrUQbrIK1sJQuDA//+VvCsdVG0xbcWJWUMbr
         LPuPs5EGW2jZsbsgbMbXWurqKArnDHAvjXF3ldoVX/HNJRMWegOCU3WaoE4L1lv7wZ4y
         6wqbghZ1PmeZV17VallUXrKnfY7W+fb12g87XjY1InHmsuJvx+tYtru0+9hHLUuKg+Da
         dLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079103; x=1750683903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=;
        b=xREb1YfC/ydNLTbBkwADbF9bn9T3d7IDkkvvs2q4UZlBqwXE7HjiTTQcf8CWpdW4pO
         MY1y84V/CCqO4m7dEh5A/sdomzyLLlpUKP4hN0epOFCZLEbf8FxRPp/bu64YRvOYJv9e
         PTJJavlNk6EH5KUl2Q5lhKtY+lSWl/lU8whlMnc2XxMuwKwuATfe5s64uTi504RZtc/A
         m4CA7hkWC/jYEBESr+/OyntMBhVVJtlEkgR/mGaitR/2DsJvphoyFyCZ3CorZqQ7/m0j
         ojrVlfLhWnIDjY/XnXbvwztVer1Qa0del2qJjpbCkKg2rKA8F0O2Noqi76WrSH0Kdm3+
         6fpA==
X-Forwarded-Encrypted: i=1; AJvYcCUqNH3oP9HTxuUkAIM72cB8fiEOEEeBTTuHO6rLHlkPvSoAmGEziBJ2i7L4lGwp5Y59KH8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA4y2qU9SM33BA+fz37lEjeGBMcUxrezECjjsaeN9c1567lHYr
	a19uTDQqh7CIq/EgPsgBFiKkN2v3pbN+kQNs1slB/TNM9rGpctU7EoZeDe2+kfwRaNTJykvTa+B
	BJZp0QKpalVGRnvCs8OkYMVGAsbVzYLs=
X-Gm-Gg: ASbGncugJguaJbSRReHlpIkXML/uGqUg/yBtkbGEeEAWOeH2wQuWa3wQpaZVaZAgQS3
	TvKKAWvpf1k8WVuH+fIZZDMfDBAC2u/on/jx6YnasmfyWplCUQZnbLCFVzfgZpo8d014+zLLHQ2
	W1Bf5KZO2QisnP7bx6pc3MB0W8MzscG46+LctzUgl7
X-Google-Smtp-Source: AGHT+IGIA/B2yzj9kVtPTV819XunUr+pzfOmCuEtfwePf361QYYolQtgx4s3tdeFt0KKKXYZVrT1BQRfBwQae0le85A=
X-Received: by 2002:a17:902:ce91:b0:224:76f:9e4a with SMTP id
 d9443c01a7336-2366afe7bfdmr139261545ad.14.1750079103282; Mon, 16 Jun 2025
 06:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com> <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 16:07:02 +0300
X-Gm-Features: AX0GCFsHX-yp69BTpUbkYuCgM8eD072u2RLLllJxgon-4nc2mIU3mnAX1gZC5_Q
Message-ID: <CAEnQRZCQj5b9GSb=i2cTn4YKtAsQPTwJ6DkiqaZjmrmboim-8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:57=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 has a System Manager(SM) core runs the System Control Management
> Interface(SCMI) firmware. Vendor extenions are implemented in the
> firmware, Logical Machine Management(LMM) protocol to manage
> Logical Machines and CPU protocol to manage cores. The documentation
> could be found in file drivers/firmware/arm_scmi/vendors/imx/imx95.rst.
>
> Add below to support i.MX95
>  - compatible string for i.MX95 M7
>  - fsl,lmm-id to indicate the LMM ID of M7 LM
>  - fsl,cpu-id to indicate the CPU ID of M7
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..a3ffab60df52be6f1d7cf4846=
ca5ba1c40f03bde 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,7 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7
>
>    clocks:
>      maxItems: 1
> @@ -68,6 +69,12 @@ properties:
>        Indicate whether need to load the default firmware and start the r=
emote
>        processor automatically.
>
> +  fsl,cpu-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This property is to specify the CPU ID of the remote processor
> +      in SoC which supports System Manager
> +
>    fsl,entry-address:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -78,6 +85,12 @@ properties:
>      description:
>        Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bi=
t.
>
> +  fsl,lmm-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This property is to specify the Logical Machine ID of the remote p=
rocessor
> +      in SoC which supports System Manager
> +
>    fsl,resource-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -114,6 +127,20 @@ allOf:
>        properties:
>          power-domains: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-cm7
> +    then:
> +      required:
> +        - fsl,lmm-id
> +        - fsl,cpu-id
> +    else:
> +      properties:
> +        fsl,lmm-id: false
> +        fsl,cpu-id: false

Hi Peng,

Can you remind me why do we need the else branch here?

I mean if the compatible is not fsl,imx95-cm7 then the properties
fsl,lmm-id and fsl,cpu-id are not required and I think that's fine.
