Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DE442FDF
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154899; cv=pass; b=uKw0ObnJL5xGO/ScRoirc45mlGod2DXNlAvXe6U7TBvIJAqluXMDcWg0bkb89ggNO2/vIzRZv11FO78H90NGix9OqspevrQWpAesrz2eLSSuU3S8hpI4AC7OyGBh0Gdy+dvsS3GRHym+CfVy+mzf3O6+bR56M2aaaV6Slmmp8eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154899; c=relaxed/simple;
	bh=of8ZV/kCyQQV+q31+bi/0MLLfWXyjaVnFi/w7NTjqrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPZDoUZCcGFboxlGHH0wuHypafhv2KkmvR0Tz7zxNCDINxn8TNkZOFg+B5H3kCDa2NmVUZ4B9hY71Ul06ed5RegmlEwYv/Uevu+LpdJkO+aZ0H/4Kz6CmtTkeT2lthCDlOpIFHOzwrmdi+xGRU1a4n/Vga2Y5Ta9ktp3Uf+apCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3kzT8sY; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3kzT8sY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso46385055e9.1
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 05:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792154896; cv=none;
        d=google.com; s=arc-20260327;
        b=Ii3yFRVKR6ASl8XIo6VUfu22TVVk3UjG7sjwB0a1TLv3APgUGxV8yfYjjarnKiA+8O
         9QJ6CWPQS7XtAkHVgR5SyUtc0TMp6Vi0pZwu9fOhcmIwnsbBboSLbkYEPFzicE4nRhIw
         ny+611XogZPLUm2BaqmeZ7F0tXXdmh1BeDYjK6z7OzpNH0me12c2uvZobh4JGlaW0lKW
         P7ABPq3JbwRdE2L2Z/rcjtfLz0Qx9cPSBloxpcMlHtT4A62gcIcTyjAiRDql3EMvoxw2
         MuNnqlowcrRI6xSJPYwrNdbHbv6hpO4YKgSXMywFqbzSH8FM3pUk1xdWscykd+eeHqw2
         wSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        fh=rIn9XoiPWLOmXmOF07NIk7OJkVwNVIlPgKvJqeeKBS0=;
        b=noQId4a7sG0OlDXk70oVB7w0kEGdkdqPaC5jXws19eEkoK9Fh9srQDUmqpp3AjevX6
         XykJDs73FPkVqbRi8eVIy1pvAo+XHQxsfZ6Rogec7IHsHGAArl8ZxRzaq4P6oWIXm+XS
         YF48UYvvoIe+KIFMabbuMsqc13hWbW2qCSWD5NViBM+YwGJYKkbeRFnazhI5QapawD4z
         Lgrts2y2Lf+1O6wWjrbEivIE8dgB4YXZAMET/2FeJrv4RNzaJaBVz3sRcYX/8wssYbIX
         hMBywyBAeGObwx6OpVs2J2sdLxWSoJgfvYTJ0Ut8uDCyRkshf0iNlCpHTapNcr7MNVbs
         FspA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154896; x=1792759696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        b=q3kzT8sYJUadwFEVVBj7Im41acfjhHERybNalUfB4KMhlLITmbfsoe1Hmq8tAVIKMw
         2vbNLlyDkrSwosRscQMZGE3eci07cCwngWiGDgFV59QxRGXK0/m2ZwOZHFqLEa+DoYAK
         ScUubtSh7pvC6PwXkQ5GxXWbI5F2A/EKU+x5/p/94/wIT7ZNwJ+Jt5FSQN/WgVUU/DrC
         SZeoUf16g3aPrihCK+nkEAWI21jpn2sHipY7igs2NkDPiYSb424/4njNYfFqyMA7X/ev
         ABS+MWnl6ARiRb0hdMK5qIvparlal7GFgA83Uvs8A4PFwrTEYYMR76S3co7+gNdJDQeS
         cWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154896; x=1792759696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        b=GbZfVaoVuVaxtOyDABoMAgxkrzlv0YaKPfLg+fhKrRx+zK3kmD7bTObS/nt7YI+7Pp
         o+Il3POxfLcIVJ2c73zmYLXR8BdCwnPgY9/+ahii+6toYMDxYD0AiRG+/Y0OGiMdFnYE
         almeR879EDdjqoP4Vqef3EvGfKGT16DTh4Mzrh/ZotEu0w8amxgnRcVISLtUby8n8e50
         MZkgIyJ9gijOyjXXqotTIKfXHt30TvIkH2bHJ/CgKPwRGN+dbYTe1ZJeqglBkLJMYBNO
         eww3zmJEX00mwFTV5NtWdpfxXptFNzGe1NACAbnAUHDUVvd4fU1kce2r5/JEr4kRtxf5
         s2lw==
X-Forwarded-Encrypted: i=1; AKwUvBw4f0coUq/U3GhYRo9DgfDqHyWFcORM6blpR7SlBIfm0WaOxEibisNwDMhadg4mbZpInSY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKhgIHBCAP60gXjbd8D/i8y6IjKvkvrRFXiy8BMXQvpLVtV/RYo
	CIwxla/OMpvBB000JmbozgOnYB7qoC1oHVWold55nsQuBCA3hzKTwrXmjb89jkBRdw+850wF5wy
	9fP5uI9POl7dsrlo7h0bDPHhUnUs6lVU=
X-Gm-Gg: AYBFou1BRt6asuNh/M/xrLsOOG2K7mGAo/G0q4cH/Ej8rJotfZt4orkENWznYoNFPTf
	PExsnDP6GTdWVtHhFXZInKfrWPaHCdgw6EjxXX4kt3S3k2UDnbW8IZrSX1IREVSguQxfjDPdL2x
	mhO4REAUlwKCOv4cviOdm3trBonsD2l8Ew2yanvIIvFKZIQQBILJVPI8A6zunq8C7WuheJmKphL
	GGI1Mr1S+3RHvUnZFkpg1DnOeQdQhDYn6U+lEiC9BoHzS7L6HWDPJRdLGansvzWP0yadEyJYYK5
	7w+kK2bbHM4hM4chCJrr4VJUrqDo8Bzphq8snk+24krvnfl9g5740iVZr31meUJymROg67Qzn7y
	k6QHZZYgizjspCBzK+gNj9PMARQCtpnYmkTxUa1NuthW6Dhs2j3vQYODe/ComCnDcAqJGtmqhwn
	M=
X-Received: by 2002:a05:600c:8b30:b0:4a1:d492:1604 with SMTP id
 5b1f17b1804b1-4a1d49217abmr8476215e9.11.1792154895917; Fri, 16 Oct 2026
 05:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 Oct 2026 13:47:48 +0100
X-Gm-Features: AclHuK8lvl444VKeNoxNELwm6dJ26rZofEbdCjP1xmIlQpJFpVbMZ5iIywezxjA
Message-ID: <CA+V-a8vFf-4e3k1wUeDTjHMx1rb27WMrnsVn6OuijHA0ACzpHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] media: dt-bindings: convert ovti,ov2659.txt to
 yaml format
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:41=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Convert the OmniVision OV2659 camera sensor binding from plain text to
> YAML schema format.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Chagne in v4
> - update MAINTAINER files
>
> change in v3
> - update subject.
>
> change in v2
> - drop rob's review by because use new file
> - use new file ovti,2659 according to sakari's feedback
> - v1 (2025) https://lore.kernel.org/imx/aPdHqCWNdmVkch7S@valkosipuli.reti=
isi.eu/
> ---
>  .../bindings/media/i2c/ovti,ov2659.txt        | 47 ---------
>  .../bindings/media/i2c/ovti,ov2659.yaml       | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 96 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov26=
59.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov26=
59.yaml
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> deleted file mode 100644
> index 92989a619f292..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -* OV2659 1/5-Inch 2Mp SOC Camera
> -
> -The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array siz=
e of
> -1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supp=
orts
> -multiple resolutions output, such as UXGA, SVGA, 720p. It also can suppo=
rt
> -YUV422, RGB565/555 or raw RGB output formats.
> -
> -Required Properties:
> -- compatible: Must be "ovti,ov2659"
> -- reg: I2C slave address
> -- clocks: reference to the xvclk input clock.
> -- clock-names: should be "xvclk".
> -- link-frequencies: target pixel clock frequency.
> -
> -Optional Properties:
> -- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if a=
ny.
> -  Active high with internal pull down resistor.
> -- reset-gpios: reference to the GPIO connected to the resetb pin, if any=
.
> -  Active low with internal pull up resistor.
> -
> -For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -       i2c0@1c22000 {
> -               ...
> -               ...
> -                ov2659@30 {
> -                       compatible =3D "ovti,ov2659";
> -                       reg =3D <0x30>;
> -
> -                       clocks =3D <&clk_ov2659 0>;
> -                       clock-names =3D "xvclk";
> -
> -                       powerdown-gpios =3D <&gpio6 14 GPIO_ACTIVE_HIGH>;
> -                       reset-gpios =3D <&gpio6 15 GPIO_ACTIVE_LOW>;
> -
> -                       port {
> -                               ov2659_0: endpoint {
> -                                       remote-endpoint =3D <&vpfe_ep>;
> -                                       link-frequencies =3D /bits/ 64 <7=
0000000>;
> -                               };
> -                       };
> -               };
> -               ...
> -       };
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> new file mode 100644
> index 0000000000000..926e5cd966b8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2659.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2659 1/5-Inch 2Mp SOC Camera
> +
> +maintainers:
> +  - Frank Li <Frank.Li@kernel.org>
> +
> +description:
> +  The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array s=
ize of
> +  1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor su=
pports
> +  multiple resolutions output, such as UXGA, SVGA, 720p. It also can sup=
port
> +  YUV422, RGB565/555 or raw RGB output formats.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2659
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
> +
> +  powerdown-gpios:
> +    description:
> +      Reference to the GPIO connected to the pwdn pin, if any.
> +      Active high with internal pull down resistor.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the resetb pin, if any.
> +      Active low with internal pull up resistor.
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          link-frequencies:
> +            description: Target pixel clock frequency.
> +            maxItems: 1
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@30 {
> +            compatible =3D "ovti,ov2659";
> +            reg =3D <0x30>;
> +
> +            clocks =3D <&clk_ov2659 0>;
> +            clock-names =3D "xvclk";
> +
> +            powerdown-gpios =3D <&gpio6 14 GPIO_ACTIVE_HIGH>;
> +            reset-gpios =3D <&gpio6 15 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint =3D <&vpfe_ep>;
> +                    link-frequencies =3D /bits/ 64 <70000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe10d29b7657b..585bd3344a9e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20591,7 +20591,7 @@ S:      Maintained
>  W:     https://linuxtv.org
>  Q:     http://patchwork.linuxtv.org/project/linux-media/list/
>  T:     git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
> -F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
>  F:     drivers/media/i2c/ov2659.c
>  F:     include/media/i2c/ov2659.h
>
> --
> 2.43.0
>
