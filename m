Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B732030B
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563316; cv=none; b=BiSm4m0uoShWhtAwliCxC5mVzJyQMgQmA4w9DMJlH5QD2uynTKKRVHXiXEiONs5OeE/R6VILqwDMK6lAcqkWL808Vj2NBe/00GHjiios9460qVre8uGgIoWsSwCuEH0MN2xeTDtUWSTOTn2vB04NQN7k+IOD4I1tEx2IPDA4xhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563316; c=relaxed/simple;
	bh=TiFOgc2oAgSwbqK688qnJnLQqSOcAVNWdpjOqSnMCVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jz/KMBINr9UaN1x5Oc9TaM2aT3SrxuGoQbflTiX5bMjnGwvJuJ06ukkIr4dEgO1DPcLY+YxPa7h2AEEHjfnqR2Ht/HO7Y1tLSbxYSQDI95f4cPC//auK577ZKeBsE166mzrj4BDYrUdxMwFHj9/W7fMLtq1MKgdVD9GV9Q29lzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPYxSG9g; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPYxSG9g"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-36a0e3e6a4fso13706085ab.1
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712563313; x=1713168113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDxZaL1eNz/pYsN2HsEFyRR/2Zct5H5ENMhocXCfR6w=;
        b=WPYxSG9gKTBtMtpOtAvIvp8+SIFxiSprITUTKLjIp5qNjfJ6OzN5iG2omWhdWVO2Qi
         /58zghmtCe/58NljO4quSsYpf7+Fh59rNAfdmmN+NUQXh7fBQnRVUhLyJu70HXVdpHn8
         SP8ZE/V7Ap8xUh5+XGK4TLHyMleYt8oBDQ+o5rppHsc7neKrpbi6nAjlzQiM7Hxt+VYF
         76AjsMp2SvpDENRsuODORhVVKnu/YlD2inaghj78czso7nHQXrMd4mU6L1z0bg/K0nHF
         MpfraB0Fhm4x4TZOpqPm+egtiybaUW26R8fpMLgCzm8UdwSMKk+0CfAghmTwTXBKMlT4
         Nv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563313; x=1713168113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDxZaL1eNz/pYsN2HsEFyRR/2Zct5H5ENMhocXCfR6w=;
        b=WihRjxwClHA1BfiTnvzw2V938lxZplJ9QmEJmVvV+2aSzjfmrEduwEDmInTvdWH6IR
         TV2+nx1YOf1Blmdke3WRHG1pi4dTSkarLtqsSCL/aU2dnCNAWFao/CxfuUIN1MLEgEdi
         uZmiaaUGxEa1zOwRoS7M44OytswwPtSSbJK5cTvdBLXp2SDqTo8yH7NWUZ47aiKOzmGQ
         6nzz5VTNQ70MTFENFUWXz0irVneYAJsOwg+IR+xIb/M13vnW7qnjnpc/gmVWUdZ2hxbr
         +CYLTIqA+aE2+nT5QX11aBRm6CJ197sPiHyoJqls2LLzDfiQlVokTFmyBeyJ1+qF+F4Z
         QYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmhAaRNV6x/WrvVTzHayg+ppKn0oiWgzx99WHxLwz1j+MYMj2bybON97gok3tf3OtBlFLoCWfXH0vk0cas10WEBmqq
X-Gm-Message-State: AOJu0YztMwFOk1ASyu3cKgZ8MN6GoxQrGwffX273XjkAjVhi18tqElL3
	wrUuVmtGOhGg+8K28M8wQA8xAe5W1U8nhQ4lWxWwtDiCHZMT00P2H+HCujwXhhjPpp+Wl69DZpV
	DkcBVXz1B6rWGVM5nQ6U5zrOxycg=
X-Google-Smtp-Source: AGHT+IGmitR2sfI1XGgs4E3RjDYYX2R9JX0br64X+lHpxBgQOLGozFRPqRUTMIqDQViAk6dxwQiaWeeYM9obmjpPAn0=
X-Received: by 2002:a05:6e02:15c7:b0:368:7e1e:7e00 with SMTP id
 q7-20020a056e0215c700b003687e1e7e00mr9956372ilu.7.1712563313596; Mon, 08 Apr
 2024 01:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com> <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org>
In-Reply-To: <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 8 Apr 2024 16:01:42 +0800
Message-ID: <CAA+D8ANiKH7Oc+KAjD_BMp9P2EVeM8Q6dLGFCC8a83bJXUpPEA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audio-spdif: convert to YAML
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 3:55=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/04/2024 09:27, Shengjiu Wang wrote:
> > Convert the imx-audio-spdif binding to YAML.
> >
> > When testing dtbs_check, found below compatible strings
> > are not listed in document:
> >
> > fsl,imx-sabreauto-spdif
> > fsl,imx6sx-sdb-spdif
> >
> > So add them in yaml file to pass the test.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - change file name to imx-spdif.yaml
>
> How does your compatible look like? fsl,imx-audio-spdif, so use that.

Oh, it seems I misunderstood your meaning. you think the name should
be the same as compatible string...

>
> > - remove |
> > - add anyof for spdif-in and spdif-out requirement
> > - change example name to sound
> >
>
> > diff --git a/Documentation/devicetree/bindings/sound/imx-spdif.yaml b/D=
ocumentation/devicetree/bindings/sound/imx-spdif.yaml
> > new file mode 100644
> > index 000000000000..beb214b51a50
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-spdif.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-spdif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX audio complex with S/PDIF transceiver
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx-audio-spdif> +          - enum:
> > +              - fsl,imx-sabreauto-spdif
> > +              - fsl,imx6sx-sdb-spdif
>
> This does not make much sense. You have mixed fallback with specific
> compatible. I suggest you to fix your DTS and submit proper bindings.

ok.

>
> > +      - enum:
> > +          - fsl,imx-audio-spdif
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  spdif-controller:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of the i.MX S/PDIF controller
> > +
> > +  spdif-out:
> > +    type: boolean
> > +    description:
> > +      If present, the transmitting function of S/PDIF will be enabled,
> > +      indicating there's a physical S/PDIF out connector or jack on th=
e
> > +      board or it's connecting to some other IP block, such as an HDMI
> > +      encoder or display-controller.
> > +
> > +  spdif-in:
> > +    type: boolean
> > +    description:
> > +      If present, the receiving function of S/PDIF will be enabled,
> > +      indicating there is a physical S/PDIF in connector/jack on the b=
oard.
> > +
> > +required:
> > +  - compatible
> > +  - model
> > +  - spdif-controller
> > +
> > +anyOf:
> > +  - required:
> > +      - spdif-in
> > +  - required:
> > +      - spdif-out
> > +  - required:
> > +      - spdif-out
> > +      - spdif-in
>
> Do you need the last required block?

Yes,  one of them or both are required.

>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sound {
>
> That's a random change...
>
> Instead of sending two patches per day, please carefully address the
> feedback.

In v1 you suggest to change it to spdif?  but spdif may conflict
with the fsl,spdif.yaml.   so which name I should use?

best regards
wang shengjiu
>
> > +        compatible =3D "fsl,imx-audio-spdif";
> > +        model =3D "imx-spdif";
> > +        spdif-controller =3D <&spdif>;
> > +        spdif-out;
> > +        spdif-in;
> > +    };
>
> Best regards,
> Krzysztof
>
