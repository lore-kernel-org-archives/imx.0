Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30235B645
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211938; cv=pass; b=TNnBeW7SNYpdUgY3tbFP9To5wZyjVPt9chnZD08jz8oQyMmlY/WDV3JDCQgAb9+G4sLR6ImwuLKtHSZFs8LatHka4dd73aUhVrP9DIpA+vMT/OeCE3K3OKOT2Lc0sOeFMHYqOX2dEqzEmANcKAGEFoHGxSYgLXfGRTsJhthgr5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211938; c=relaxed/simple;
	bh=6UXnrwOPUjL2E6250sd/ClfPcfdLjBvvqjWcKYXcETY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HK3lReL8LFwsOVk1e3KPA4taGNptrxww+KpKWNP73jwDVnatoSmXR7+5L1gYgLzJ6hiL1PT7BtiI9EoNz8h+XOGnpXtm8KajKTHN2FjGVEPEtWD7qwQymxYVLxy50VvwfEMAHRMlunIndrjiyDnYsyCHXyP7ieDC6cSr0WCPf6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cenSqcNn; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cenSqcNn"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-386fb2c31e2so31534661fa.1
        for <imx@lists.linux.dev>; Fri, 27 Feb 2026 09:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772211935; cv=none;
        d=google.com; s=arc-20240605;
        b=VH+nc5ea1Kad2K9E/19Jsn5f7RS7C+e8HzwUGR6GT5gK1mtn2dcMtdks9qFSToeQJh
         rZg1zrd+eIHrpwVIb1XVPiguldOYldJoE1FP1fLuyHEDfbe/yWvoDA1mZs7X8co+1PEA
         rAxQjVNTdrYlbMHujzJv3he7wTXOgLsuk04TLYm5Y+uMIxsIPypbUUBGUfR68+R1SrY5
         t13GQZcC5CFGpleYcC4Z+ghzSp5xbW0gyRG47+Pl0JZHtuS7dQyTsUY9Gda0cpbESHPR
         uJn+p7lT1COe1h0WzcGZP10EJEaFheO2yS5D6cskzy3Rh+WMje3UP+em9qCzHwVArVS8
         EMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfT43a+fQbphg7vfjqYU7GmKspMnchPetUK5Jg7ieIQ=;
        fh=rUQrko72Jw8hVICO/d5Ujag//AfYDW+fu9j5tFlARV8=;
        b=cTOWIkCu0Thwpdcqnr7CVXbmQ9nK01nxE5IN6tOtM+y/8ahWkC4aL6TlsH4uPIwBX1
         y/stSsC+RhjVo5khsSU5NA0tpKRtT9j/og7/7UfxXVtlszMWAR4UQtBvl9pqcdFWY5ql
         69EvxmhJ2/i8xj4Q+IQ+7L2Cf7/MjRPkVFRask8FNTEh7Ul/7mR+jgFXz62pioOY5Twi
         zX5kFN9ohUPAODvi5/SWeeTg6bs0qI0lHZ52WxcXa/qnGVIz3X3VkVrNVhYhxHNCHjIV
         sXziiRxkDAGVfYrOhbMhbymBTXuYZUmqfWK3DcvZXS9sykfrQPnua3VBV+BkEAcqLRM1
         gnjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772211935; x=1772816735; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfT43a+fQbphg7vfjqYU7GmKspMnchPetUK5Jg7ieIQ=;
        b=cenSqcNnma8XaT87rOXESGJTHOSmm0/9FM+2snQR/3GRd1Q1UtXIKF+H3jGOWiwJDX
         nEG7iiBaL568WAeWERrhGFhfaOvbHthFH/Jef0r7I3Mxs+JikE5yu5STok205mW8+0/t
         IMqBpT/tQ9kcUJexPwj1EwwXyeHU4t+9XU6mTbGEQ2DAAdEWehEKUwPIwWryxJ4ZAcBN
         AaE7o/JhfAHrvUcQWC2CEhCSQDOnFNK9sgJO7b9+RjZSGY2bD/Nz5gGSOJUAG7H6W613
         yEkVgZvRPNe/R0XKdQ4go/sjG+uGuAuciZPSLdGAzdZu247kpYS+9A4lwH0GvnJqwBVt
         Fotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772211935; x=1772816735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jfT43a+fQbphg7vfjqYU7GmKspMnchPetUK5Jg7ieIQ=;
        b=sUsZ1YsGN199WVecZR//Dfs2t1QnETa/A5carJyZCNdM9E+UM4Eup2+ijd9GN0sNOO
         zAZlu1VWujy9eAsjW09+T9u699zbGJL5xTIyy4m9TatqG6takCpG+uzZjBSceCWLUQtV
         RAWuhfF9bGPRnOIF6X1u7yLG1M9ygamdahm9r4snm2uHxR89ec6xFh/mlTyvtRloyWA/
         eJGzBwhrVxpjcFhbKeP0q5EL1H9DT8uvclyHIVq5O4nZfvNpodk4wBb2D56Tg5CGEuyp
         u9GlYC1f1DqD5XZP12Duw1Bt1Wurb3bJngkSAqwqLSbWFwNmcSHBa91SkXJDdoHvh9p+
         RiRg==
X-Forwarded-Encrypted: i=1; AJvYcCVutJXCf8Uxap0icYMZieP5jqhJbRbc6c6w2VOLZAjG8iG+NenSbv7ATpUUgQJtWiV4CJM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWgJ2H7vq9nOclGYxauMrWeQSpsBpY+Eau2sGWB0hEOKnwWnHG
	R++7Fi4C8T43gnS8Zf7fVVGz4Za6XYkRobFCVBFJcQth30NuhxQytE4Yin933WqJ8qb8ga16onU
	iI1ekKBQFxsz+pEBI3tL5JqTCVM1RNjg=
X-Gm-Gg: ATEYQzwQzwODSApV4Ei8iVKBEp42w4oTdy5lfZiNuytUDx3WO3t984qTCUrU2b7280O
	M2/MKjt8bGVlZaxu1wN22/Jf9PTXD81/acmPR5c8VcrWaEloWuQDkQO58pORcP5L2IPl4Qt4Gdx
	wZq/CeVDu72fPpV5E+UeXC+k0WYF7YQ2IsZsp6ZS8SKjYUZCLcfq03du7fHOjyvZjrAA2WmjBEJ
	aoF5sNIhbOwBIWzQJIKmuxcYLcWIWkvnrvkL4bonJkC/8JdB3ALOpaAqvHZTyVz0laUumHpaUX0
	I7Lr9WrYSJJn8lqb+8DKaB/SsyRqDFpoW/UkwUxnrv/YVqihLfBXVie0M3qToeHcQKTkBEXU8Xm
	0qLw6yHc=
X-Received: by 2002:a05:651c:4211:b0:387:176e:68f5 with SMTP id
 38308e7fff4ca-389ff35b4famr22558011fa.26.1772211934931; Fri, 27 Feb 2026
 09:05:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227165836.3445577-1-Frank.Li@nxp.com>
In-Reply-To: <20260227165836.3445577-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 27 Feb 2026 14:05:23 -0300
X-Gm-Features: AaiRm53taJAwYmks0zdsuCd09L6pF6yl_1O7CbjkcLe8Epc_edKZ22mV78f2GrE
Message-ID: <CAOMZO5AGwAAU3j0t62CaqNZF7tmyKoWv38ymB1i5i+xnprwJWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: auxdisplay: Use unevaluatedProperties
 to fix common property warning
To: Frank Li <Frank.Li@nxp.com>
Cc: Robin van der Gracht <robin@protonic.nl>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 1:59=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Change additionalProperties to unevaluatedProperties because it refs to
> /schemas/input/matrix-keymap.yaml.
>
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): =
'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,=
ht16k33.yaml#
>
> Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to json-=
schema")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
>         - Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
>         - Add fixes tags
>
> Resend include Rob's Ack tag:
>         Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Rob's Acked at
> https://lore.kernel.org/imx/175796984570.3379405.7210704746413204244.robh=
@kernel.org/

Rob's Ack is still missing.
