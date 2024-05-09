Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2015E7F5
	for <imx@lists.linux.dev>; Thu,  9 May 2024 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715264188; cv=none; b=gXQCSQGH4e+ayEAV5fqAwUfeeGylZPX5uh6ZElLqZZhWMvI6DYXXy9cU3p0im9Mpp1x8O5g46VZyqKdAL3I6jOZHMiIaW/I0lL+eOjvj043N48G9dm79u5vhN5saGP++XNzY8q0V7jnac8/tqZihXfuEbqHBb8yDptV6n4WTS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715264188; c=relaxed/simple;
	bh=ESg1b5jnmOUHRR27iy09hYLRMXOuFgdVdTlPqAUfp4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuEn1tGRTHZyknh/zdQPyOp3HBMhV4G3wsFGqhv0udJZ9vsrWCFRK/amt+8umtqzQkLo3d1GgRE+rsy7Z3c4de80OURPJRyxgTF1VWFBl20DkE/SFTYXwibJZDrMarvoqJdYrh1UkZr9scTBCqSKYjE0OjqCrGlErolWzai0B50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWK/EO57; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWK/EO57"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59b178b75bso198158766b.0
        for <imx@lists.linux.dev>; Thu, 09 May 2024 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715264185; x=1715868985; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuarBTe05a8SJXz+yxbrZY1b0TySGHncC7/ocSyGfDE=;
        b=WWK/EO57XSFOAysusFxevaLAagRqkkIwa2Iq64DuFQU335w1Cxfh9Rpw2BzIsnengR
         WVg1qSCzP0pQCqpFCoFu4VbbUitLeyL9Z1NXH33xoD0llvvdDQzXjYlkM4S2g3eutmyF
         pzOpEtLRYKW59BWndm4X2AgPi0FgCTVJaGsiMQbKCoIfqFZdI4ruG74711JXbSp0Aogb
         rFlqeiQim6vcbDiiWVSDdDZ0GjTwNLyoeQ78kBL7svqkXsJuFhPrt/+oLmUwxVKaMoGJ
         BFu81pQNX6fd5FDluP+fXRwAGa/F8KxEsfd7Md594EuPV+K+67sSYJNJMbq8dnn3LKLh
         S9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715264185; x=1715868985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuarBTe05a8SJXz+yxbrZY1b0TySGHncC7/ocSyGfDE=;
        b=Sr/585XYDSlaW0lq3HAU7A3IJZaTtVJmIBCZ+hJVgS+inVnhoMISs8dlVFl8j7PVhf
         7QxHZsBezbqBinPuW0s89v9lX+4+fZzOmFvYKfBGAzu/9/4LgqbRQJGnVncnBAhxRdxn
         a7bqhJFFhwE9oPPJhQ63Jixzpwd0Rb+WNXfAecQrim7mfF3riMD+0/i3vIf6AkClAMkI
         AXUANtmOJrPKVR/VEZ1PmE0yS847U20lUzDikUVGgkN1JPdw3Xfuhb0YEo/7Jog1NUj5
         A3hBqqOfcqdH/XnxRPYrPjvmj8PzcTklvOvo5O4c7RZOTc+jjH27VzGLJDsXVVdhPWsl
         Dsgw==
X-Forwarded-Encrypted: i=1; AJvYcCV5BA6cIZNmpLVlTnEm5aeT9TH3ksAh6TPT1/GuTp3JCwp/0tm+VGkxQzDVbrxMFtajMgCwMvsWX6UHNFFN9Sj63dYS
X-Gm-Message-State: AOJu0YzA/+rUAAyxXSXZ2+EhB9vjReQBec9u0V3h7IJu7HRP825KFIdL
	nblOmLhLE7YaQ9Ks3AA0GGxZMSuyKq5DAWVYZn+A3CQYMDy5w9D31y2reYI+O1Acfe/uEf9M2qU
	JglEITnJ8hyJAtMHE3FXYXtCpKZY=
X-Google-Smtp-Source: AGHT+IHEaL0zNvf/wgfMz36U5EILzloZVUXfcXUHz3D2htjZ3euaCHd0ROhVyTfoIaJnj4SE31TR55hSPLMLzD/lDKg=
X-Received: by 2002:a17:906:4756:b0:a59:cb29:3fac with SMTP id
 a640c23a62f3a-a59fb9f1043mr357282066b.65.1715264184620; Thu, 09 May 2024
 07:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com> <1715231698-451-3-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1715231698-451-3-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 May 2024 17:16:11 +0300
Message-ID: <CAEnQRZDoiVSD+CQoS6kcmTVbacDU=Ct3SJe5__Z5JBPAofeVrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp-evk: add bt-sco sound card support
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 8:37=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> Add bt-sco sound card, which is used by BT HFP case.
> It supports wb profile as default
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index 8be5b2a57f27..b2225cb710b6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -114,6 +114,11 @@ reg_vext_3v3: regulator-vext-3v3 {
>                 regulator-max-microvolt =3D <3300000>;
>         };
>
> +       audio_codec_bt_sco: audio-codec-bt-sco {
> +               compatible =3D "linux,bt-sco";
> +               #sound-dai-cells =3D <1>;
> +       };
> +
>         sound {
>                 compatible =3D "simple-audio-card";
>                 simple-audio-card,name =3D "wm8960-audio";
> @@ -145,6 +150,25 @@ simple-audio-card,codec {
>
>         };
>
> +       sound-bt-sco {
> +               compatible =3D "simple-audio-card";
> +               simple-audio-card,name =3D "bt-sco-audio";
> +               simple-audio-card,format =3D "dsp_a";
> +               simple-audio-card,bitclock-inversion;
> +               simple-audio-card,frame-master =3D <&btcpu>;
> +               simple-audio-card,bitclock-master =3D <&btcpu>;
> +
> +               btcpu: simple-audio-card,cpu {
> +                       sound-dai =3D <&sai2>;
> +                       dai-tdm-slot-num =3D <2>;
> +                       dai-tdm-slot-width =3D <16>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai =3D <&audio_codec_bt_sco 1>;
> +               };
> +       };
> +
>         sound-hdmi {
>                 compatible =3D "fsl,imx-audio-hdmi";
>                 model =3D "audio-hdmi";
> @@ -608,6 +632,17 @@ &pwm4 {
>         status =3D "okay";
>  };
>
> +&sai2 {
> +       #sound-dai-cells =3D <0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_sai2>;
> +       assigned-clocks =3D <&clk IMX8MP_CLK_SAI2>;
> +       assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +       assigned-clock-rates =3D <12288000>;
> +       fsl,sai-mclk-direction-output;
> +       status =3D "okay";
> +};
> +
>  &sai3 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_sai3>;
> @@ -880,6 +915,15 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS      0x140
>                 >;
>         };
>
> +       pinctrl_sai2: sai2grp {
> +               fsl,pins =3D <
> +                       MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK    0=
xd6
> +                       MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC   0=
xd6
> +                       MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00 0=
xd6
> +                       MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00 0=
xd6
> +               >;
> +       };
> +
>         pinctrl_sai3: sai3grp {
>                 fsl,pins =3D <
>                         MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC   0=
xd6
> --
> 2.34.1
>
>
