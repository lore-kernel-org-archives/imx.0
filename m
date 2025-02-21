Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4197252907
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740166647; cv=none; b=PUZMZII/cCgufN2UHcTcMb3PfddLTMDB14cUafQXDNco+46BKABsvmGc8YEYH7y65LsI5hfnG7ehcNymbhZB0suDu+TENuvyUYIgVgVs/EmSEMm6TYPdjfa4vlgIjh/K10vozL3U8LYisDvyhIex9RQW5aKXPj6NjXbtKqDbT34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740166647; c=relaxed/simple;
	bh=HbTWCcViPPsmoLTr3+5YzQtPxy9tXO0RObpIhkFecVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+OhivQLpAl33uymAjTp0m4AdDIz11Z0XCEnzWoMEjfqj3ITKtK4r6CpsP9N2M4+X/Tg+9Sa8Wrx8og+6AXPEWt4n7f3wsHtJ/lEMurvWmMbPTIxnNgta3Jh/rV8A21PKZAjfAN9xIhkaiyXILkoCh+N34+++dtCAi7yWWFfCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euf+AdAJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euf+AdAJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so5025206a91.3
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740166645; x=1740771445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5/TJQCPhOXtoCrPiCi87e6OcHCUr8SBAEgJYV6f4qI=;
        b=euf+AdAJgujnBH4k9jARwipdrVKIZCSwGVDuIgMNi7jYIhbrNY+Ak84V02hjDKnYiY
         FRxkflGKxDxIbCGWpu+Gw71nA95E1A5znZV9IHIhmJ7zQVoLdxMZ8nfWxIdhRoTlrVf8
         w+OygGbELBlvXRq9+KhzLcnMzZ1phQ6T000daT7oEfa2YeOfw2C4DEBjlMwMqj5DwFO9
         AgKVGZ9rbkncdLcIMpQBTOu3kz3l6hnnPXToRlhst9VRuqwIMOKSH2FyiQqTWoI5JJOt
         4shBu4bLhCCgjRVp9A5+uXoYx7eofW43bMnGKL9r8/heYw+djdnVKc1wU3Y91aE4kKlP
         OOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740166645; x=1740771445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5/TJQCPhOXtoCrPiCi87e6OcHCUr8SBAEgJYV6f4qI=;
        b=xQ0ux5d10Gs1JzNBqwtlxlniMwAHH2jBCmEmQO/BJSaFdk++Vi8sxdOvtlm9vTD7ck
         +IxLoKPwpwcTzIgrZouXkKuC0H0PAZaCLyt1eOgqHLwoz3dLNSlmHEFae+GhmNwPuzgz
         cb8rB51Z/NEMIswOL6pwkmcYoKNlYvj7duXz7yvEzYSLqEUypYKebhO/VM1J/B4KcJa1
         miRkqmkRztfqGPzUNIRZUJXb2NxhmDcDKZh2Ruw8frx5sjZu2MB+QMpF4/a6c+xqlLBb
         megP8mkm5PsvmODKJtS2ScPtw4lHV9J2zJNl3lBf5Y+1Mpw+MXWnw6yT3mVcMnaHeRHa
         tahA==
X-Forwarded-Encrypted: i=1; AJvYcCWvZCguZHndbNVWJot2s6XRC2RTlwU/u46pydjS5zPcEeyvOBd5ZzK4ECg1nmkklg8/068=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8KmPMxSWdxAHC2sKcPLmbSzXw+HGQNHakQaEB/eZcFiHH299C
	Y95YeCkF0HSgd4v3bj1Wp2KY/FHU02w7dC2dpLNJnhIEv7r23x35UOi2l/dkaCsJ6hiWUOGm6kp
	RKwlE7+tCAyhHEzL18utvaVwoWFI=
X-Gm-Gg: ASbGncsk0tkxqGhQRsj/qpytD4jW0Rq3hde8v6A3qP5DPsmXWsmcoKKbhRev/Xb/c4y
	ixTQukg+fT1GpOlUmDD2kKmwkAGICrFT8wqPRxpP+hU0hPSL8CZids/WvYxVM7l+XlSbZ3PsYaF
	vkVcVflZ8=
X-Google-Smtp-Source: AGHT+IGO5kmKNshQe2c5M4D/K0SzQbhuXNJ0QO3tdj2iHLQJhE4x02XTjnINnRUvMgd1/kya6uNiVNBOQ3RUUR6+yt8=
X-Received: by 2002:a17:90b:4d0d:b0:2ee:aef4:2c5d with SMTP id
 98e67ed59e1d1-2fce8724453mr5847905a91.26.1740166644954; Fri, 21 Feb 2025
 11:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com> <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Feb 2025 13:37:13 -0600
X-Gm-Features: AWEUYZlpZEzoF4sSIcwIUtnabf9TrVj8-PJAh3_pn5QwRKlyCWUIXfCyiFWMcs0
Message-ID: <CAHCN7xL=QZHs5sD7Ja7pBOcXM8cWVQYe270EizDFN--CH_5+zQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT
 freq. to 800MHz
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>, 
	Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 1:11=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
> SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
> applications running on the DSP expect the core to run at this frequency
> anyways. This change also affects the AUDIOMIX NoC.

Unless I am missing something, the i.MX 8M Plus Applications Processor
Datasheet (rev 2.1)  has a table of frequencies, and
AUDIO_AXI_CLK_ROOT is shown to be 600MHz nominal and 800MHz for
overdrive.  I agree that it's likely not running at 600MHz now, but
800MHz may be out of spec for people who are using the nominal voltage
instead of the overdrive, since overdrive requires higher voltages
than the nominal.

adam
>
> Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 86c3055789ba..54147bce3b83 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
>                                                 assigned-clock-parents =
=3D <&clk IMX8MP_SYS_PLL1_800M>,
>                                                                          =
<&clk IMX8MP_SYS_PLL1_800M>;
>                                                 assigned-clock-rates =3D =
<400000000>,
> -                                                                      <6=
00000000>;
> +                                                                      <8=
00000000>;
>                                         };
>
>                                         pgc_gpu2d: power-domain@6 {
> --
> 2.34.1
>
>
