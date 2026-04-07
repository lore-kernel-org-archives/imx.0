Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E83988EE
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555408; cv=pass; b=NhVI3GeVJClTMabZgPlMdE8uGHQag/8DeEgfYXx5ZvryHSQLONlmMlkk9NKcESkv1VezwL2hEqzvKcnvlNeKA+kkho39G50pXhi0hPrV4e2exHTqcuvtP9UbCkBFYFVTpHrcyBlWg0OimkXZkIduSEoLaNpqgRtt1pA3oGJeuFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555408; c=relaxed/simple;
	bh=97UWIPqM844FoFFO9G2TTuAy5vOhw2svUbJZXfGxgzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atzNLLAkGfFjJu/t95zM2bkOmkHPVVusqhR7/qR4deVY+UmRY7+vS/cctDCzdTcCHawP8zJwvrgkOe9FNFdtZtludmFz7TGj75VbLAHL5pVjGVLKLf63rR3S9E7YZEqlGh2nRgYsYhAqYgnXoTjkrdkNExHEcLacYziHgjkCsTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqvWYYCS; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqvWYYCS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2adff872068so22477005ad.1
        for <imx@lists.linux.dev>; Tue, 07 Apr 2026 02:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775555407; cv=none;
        d=google.com; s=arc-20240605;
        b=bzHHgVdtzWBNY/MQDa0xCzBcmw5OXhT2kkFrJf4cQzDMw6Vs1DE9xw27SIiEutb6Je
         mr1pKDr/eU1RVN3DYxEFIUjBRXa0rRZrmlNl0FXy1zJYBA8pi6/FFiQRJTGHGaIUOF9A
         lJ0kAHsMvbJCvypBPOhtwcQmuLfdbhnT5stjwTCxP5n504yX387kit8X43Ioni9F/cdZ
         lCHN0yWOX0BBljWgw212g19HuaxvlL7Kye3oci8hfPrXmFLVqNOy8xf9JbAzQd/wMtHM
         gYrPXxJl8gYjykIOjUrGGAJuGNZnmzdA4Wm8rtncBN6Pi4Ng2M46qdBKdA4+RSrf20A0
         Q24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        fh=qn6uU4bd123IW977i+9nRH3z7O9Y35JdeEn7rV7jJ3E=;
        b=D1YzXaa13yaK12g0C4qk1AyUE/mhBtRuAenxNkvPnTjKavFwRoAJ6mmbKhCK99Yj/f
         IkFge9mDndLsr5ulJ01JIIMLfPCDQvt5sgMc6mGFviye+nRH1FHa8qknAeQfUuKGp0Fy
         xrVDZ179DCa/CPVvw9cnATE7IdQXHJ2dK92GGHFMF14Qgf4Ut8rtnjam+LV3YXtPbli8
         A8W0qSkVBQF4x4yPOQQW3KkaJ5YFWdUPIF2MKTBSKrm0SjigOWDPR3XRHdrkT+UlCr+b
         oQtRBH1R0RdIIQzmxtqBceU2KjMc9TffPI7GXWnfaSdbMroRKD5Ks3YHrgVKKM+tfaC9
         YJ1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775555407; x=1776160207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        b=QqvWYYCS+idGtQheV3SLRMK6tRdYy+pF+OhXngpGn1iMHUvGaRxyx6D6vGTrqBFO1u
         iUjBu4sQSNBmzL2vROZTOLHtEL3uGRCjiBx+WwMwPYc0t1QSQpIOy8h71l7tazPNDFKW
         gajhhqCJ35Yk4JEbQQ2jG1tJmiZGapHO2svffA6D+Oh56dnxigh+KBZE5qhOwzagRQip
         xXpdHlXaqFBe0IRpZ5s7zak3r7X5Icm7Hc0BDuvAWdbpLKd7X/lD6cqLO8n8HRzPn1jT
         Eh0ain4KTAjGzclzgVcBlAtv4jcmmVtMKxLac3z2/cRmhV49VTxlsiD/mvUiiauPWOuD
         dB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555407; x=1776160207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        b=Gtzrd2O9l/nosiy7+LhFPFvyw6O5kbwcS9AN6C/tjRayIPuICflPBWKyHyjQjpesbt
         UBVkrjx8NOvH5JbdQ20Eq4t16kH7fOanX5M4TV8CECgRy7s96YofHWW5gGxuKUVs2V+8
         nBe+enu+plN37U/1Z7YeTi5o9+6fBoZ0REb91WsFk6H+l5F+tsAziv3Y6rp2sUjORvg7
         VQ7Hg52SZacLrI5tAzF9axo5pfbNFXvwi41VyLO3CR95zKr1r6hsd3YRi87081Pm8tsC
         x8ZIQnVGoY5rFwwdV6ac5zE4KE5s0ZwMGxIAWpZGsCFY1nOiFLwZYaXnuVCC7HNHMedA
         X34Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkP9Dl/VFsAhL83u/s/84GKseOdPvC4pGfZwU/n1nIFmZnjb9I+AgU5lsn9z+lmmIR/Eo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYasAqTOzhGHEh+kpXHIqEwV1x4P9n410Wt5QQ/op1BstaVm/d
	xwIiTyi00hZAw1g9STN20jIZRB3EuqJCG8cZ38aANzL2ggSVZlU96a543mB1abnJsmC3zXLgw1r
	YMn1HoBOJB4M6hrjOM/UXDhOa8JV76Dc=
X-Gm-Gg: AeBDiet7i19uCXzgtMKLulHEkrc/XE1DXPSCVyvZ0nwz2wZ5tQicx8fPS8FDsSfSM/3
	4+ZQ928szVrmDzzyP9IL5n8n+nRx9NClAyozP/KHpiB49Nh0Tat081BwYlX1sK7zGeDVdsyMIHK
	V74pBpWMmVEzZtWdv/iPsZqc818Tf/zM22bPx3nqIaCoPNBa10eyyu3W2QDQ3UAMntn5ODIXHNT
	0usEE1sLQ/dsvULJlaRx/fb42E1NHvFFqSNv86kxdqQCGp3r4QkcnhUR8D/we3o06UxSehqiqfZ
	CXKi04A=
X-Received: by 2002:a17:903:3b8c:b0:2b2:ade7:820d with SMTP id
 d9443c01a7336-2b2ade7a263mr29495345ad.22.1775555407014; Tue, 07 Apr 2026
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com> <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Apr 2026 17:49:55 +0800
X-Gm-Features: AQROBzBDsI8MMkaElAEIhn9Rq7nCFmivdfNIApAyidNH2a8-Ops7NCH-H1ksaJQ
Message-ID: <CAA+D8ANg9CEpaGGpUQ8D7AWuMkk-A_+HKtedFAp+ZYxHMV_MZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>, Peng Fan <peng.fan@nxp.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH =3D 0 =3D> IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  =3D 1 =3D> IRQ_TYPE_EDGE_RISING
>
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  =3D> IRQ_TYPE_LEVEL_LOW
>
> Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP=
 audio board (version 2)")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fix.

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu Wang
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-ab2.dts
> index dbbc0df0e3d1..443e4fd5b9bf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
> @@ -281,7 +281,7 @@ pca9450: pmic@25 {
>                 compatible =3D "nxp,pca9450c";
>                 reg =3D <0x25>;
>                 interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <3 GPIO_ACTIVE_LOW>;
> +               interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-0 =3D <&pinctrl_pmic>;
>
>                 regulators {
> --
> 2.51.0
>
>
