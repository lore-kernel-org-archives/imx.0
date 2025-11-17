Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B911321421
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391146; cv=none; b=tAYapsZP/OgQK9PwqtJRl+qc9TKQYLrdIut+OF7EH2vJcHt7EFW31fY+T4Vs9Ku3avkYLvysXZXQ/CqC8W4OoF/qWVwG6vdWeA5ZY2wRyfDQephizBEbX9cUx8+d+KaRz2IndzalKaQhfPYj+ph/UDMlen42YGPbkPkPS7R2EZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391146; c=relaxed/simple;
	bh=MlEkZrYnj5YncvhL5E6ysRu8GQw1O8M/FI/2sDyaPv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToXxauvETKvOMkSorUV0FTxC4/X8HVZlDmjyPPGgDN9opkBH14GcUPtte/izRv+HFR0RZk5GNLPSMAyj5Azu1M4mcdNX5cdjdk85sXdD4DCwtzKYUC5HBHyWj+IwWq9rxw5BMKmklUzXvsIJyh43/Pusg6CxoEQPNbweWdxUWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbh146gp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbh146gp"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59584301f0cso4401269e87.0
        for <imx@lists.linux.dev>; Mon, 17 Nov 2025 06:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391141; x=1763995941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2msBzv7WSueld5/KoS1mtRsvHobokM0CCxMsMp1dgo=;
        b=Lbh146gp+B7DTJvI6Ok8GT/jHtixSzQeHw0Yy3t0uh7G3HGVVNaj84ZW7kwT02AjlY
         RpDzTjdeBvdRbNkXRkkr8D/XmXJUM173Lf8OOYO0xHI5q27Aq8uXUh/q7y5oG7kl2gOJ
         /l3QphOiyeMvhNjsVh8wO+Ldyw/ju3L701QnhItAjk2otUgDAQULCeFoz5mOieTYYUtA
         qb8iU5Q5NSZilFPhLdwP9BZNv5hGBG07uDkcdRUl3d/UqE5mw2QD2R48i5uN3GKPvUi9
         coYIEoYNWAVoQvfKWK8QusoS8JBvv2etIPpD2gU9N2ao96H63RrC2T67x57XdXKhl2QO
         K5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391141; x=1763995941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2msBzv7WSueld5/KoS1mtRsvHobokM0CCxMsMp1dgo=;
        b=fHbuKth3wq0d8BzhW3Bnbc26aWVjJ6xiwBh1wsj2ODEtqC7gl4qEH5jxcCgjtdS/tV
         cxwDv503vt9Fx1s0ikQ7+hfHiZsGiW6+ZyZ83QETHPlIw5EL4CQaFJ7PEWV+hwpZii6Y
         6oGO44suRel/41PznN11uBzFD2J0z11SaZwrrUeFdWPEpuVnNDqqPJnfeDZ2F1Q54RGi
         py3l1f49KIr22ETmKz3F2CtXgEOul5hBWLpgc9kSOPUEXiwPzJjUZyAxHzcYI2lZ6SSd
         Ra4KC1x5LI1rbdudd+V2lPdHsWPsXk0aRdp+L0jEy2PIlGgwMYaznownCj6RruZmwjrc
         qH6A==
X-Forwarded-Encrypted: i=1; AJvYcCUSgcdGJLUDIZ4kw9GCCunnkWNmKKG7cgyCz3S2JqvFUJ7Y67/YrQMkmv5UwBWlpqZU+RI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzurLKyoAp3JlhWFmq+Q/VG/Y2KM8Vly6SDRVoSbpYQ3vfldBJY
	2KSSyS8wr6VOaQPtiQit6BHsgvy5wLLe4/ss072BY7R1eadxeIAFKdysO4WZPoHWJCE4LPYLElo
	2MIx8fj86JJmPcIFw4htpDQZeAhqLrZA=
X-Gm-Gg: ASbGncskCr0OT4x5SRhur09HghAkzhfMsJkFJQ3g/ckEcNjAo/ToFNpseGbI1nvJw1k
	VTI3Z0ACPZze2RiKPGHCccstzN21ck6YGUDYBd2puMaEljClczmNhM/yBKkI73BZkY95n6QwGh0
	ejBYO9S/FtWte/9TnVJ5QYOx3ywCxUzl6INbWGmmOVTXViynf1WcPEdI8yt3DKVuXzXITQ+gjxA
	rOQW2Cqka6TopJ0Cz/vaZXBllZTPJy4tepjHQeooB2ARbQmIuxkPFcTSDwvs4d7db0alKJluVss
	dVDgG4NGYnZc+HomXQhbW0DwWN0=
X-Google-Smtp-Source: AGHT+IFWM6h2Rvtm8RkhWj2jEpDk8QuIv+uwfqZ7nxdfep6jv5iqz1/m/jBBMwF7isKVulGKioEmeomT4OdX1HrsVJQ=
X-Received: by 2002:a05:6512:1552:10b0:595:909d:1af6 with SMTP id
 2adb3069b0e04-595909d1dcamr1123293e87.28.1763391140693; Mon, 17 Nov 2025
 06:52:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com> <20251117123643.711968-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251117123643.711968-4-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Nov 2025 11:52:09 -0300
X-Gm-Features: AWmQ_bnEYQsdBy2VHM5TVlUlvxtXcSe8WkHYIS9A8Mb6DlSo_EpO1i8bwOVaCQo
Message-ID: <CAOMZO5ByfNSYLAMwxFh4KfwtpPRFiFydQOtB8_avu0un8u9rMw@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad
 control settings
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:37=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> As per datasheet of the HDMI protection IC the CEC_IC pin has be

Typo: "has be" --> "has been"

The same typo is present on patch 7.


> configured as open-drain.
>
> Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for =
TQMa8MPQL with i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> index ff2bacf24bfd2..03b75d4cf699a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> @@ -868,7 +868,7 @@ pinctrl_hdmi: hdmigrp {
>                 fsl,pins =3D <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL=
 0x400001c2>,
>                            <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA 0=
x400001c2>,
>                            <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD     0=
x40000010>,
> -                          <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC     0=
x40000010>;
> +                          <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC     0=
x40000030>;
>         };
>
>         pinctrl_hoggpio2: hoggpio2grp {
> --
> 2.43.0
>
