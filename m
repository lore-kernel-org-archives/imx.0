Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231CBFC0C
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 01:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712106689; cv=none; b=E+fFtWepCPqk9oUJT9tEPtg8KZqPTYJhJo9nA1GjRh2NKAH8sfgC/jhu/bpfRhFmxyJX7vyeNl8s+i3AIw2psmU7kl2qEPB6HoPexCsA5IsSQHpXF/DTzL3aiAIGEIoy/idUzmkWr/sESehEkpW/c/80t1lCo0lOxUmNFHobAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712106689; c=relaxed/simple;
	bh=lnTs2cVXM93CsaTLuEe4HYuxRslxisuZ0kDsO5APKs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWzNTQO4WO52+wty+WpUfu/dvv7SbplmGkmDPpNQyVjVGNfGaElD6wVw3VpzimMak25pXZ95LLo96zsa8UnXmZcCPZna9FKZhy7a/XMpPP28FELW6A9XpE3Xa5k9sv+wdMXCSDae3piIScbJ9RALwy/9XsPHTQHqySdL0/NYEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmPshqtX; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmPshqtX"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-614426b016aso8593247b3.0
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 18:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712106687; x=1712711487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z73wb+SKG9jSZ/Yydm0AUJwXmsHQ5eHka22JkZx8e+M=;
        b=DmPshqtXuM4qYI36V4xwXq3Az73UxLxE11RGGq9QZsDCpao+xy+feOXWt7AFi8WScm
         kDihZlGIF8voveFMecp3hjcC122d0Pl1dT9Fdd8Umu8d9SfaY5CNvoxcOmIf5aRTVPFv
         UIheL9d3Mad/UZaIVDTqvT8u1Gp3RSCpxOzpnJrOBziadrB/qGLnIYqqltu5+DB8sxri
         SOE+YvHDU+QX197TT65TOqQzC8URCIw1nfTWDq7N11VxdQPD7+2sWvkY/d5mNfy+nVfQ
         VjpWEayfOFSR/6OKs8LtXKFWe5LHZ87NTbPUIGrghUsPTOcUIAYzpj+Z0F8l+UOjTNdK
         9YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712106687; x=1712711487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z73wb+SKG9jSZ/Yydm0AUJwXmsHQ5eHka22JkZx8e+M=;
        b=Sb2frtbVbywbCH6WrkrcLVc2ymEwq67QxSt1zMR0NgchtPlc4HH3htmlqeEcWB4FlL
         ZSxy2DRxQQrpB2meZfbUkRjYSG7RvePpgbT+eW95LyoSmzp6jwN6vR0TzChBCksFdLxe
         j/YJi/qDfAV7kukbyjFZLv2+Xczpc8IzgkyLkzAHcOeZbC3rAMW+vj3/rdIc9p2i8NWS
         bjMdZmVdr+aX7cFbMfokt6yRR6qxHLW2U69dTOm7XGgvWOA1kYaK117PC2nyQwIjeKGJ
         cT2Y6GGQX/YyhfUZT+a4NePnWxYkckGQh69cF0Sijqmwg+ZhPfLp8ej5pWU1euEm0hLh
         IdIA==
X-Forwarded-Encrypted: i=1; AJvYcCXasBwzf3KK5DyPGBHEe5QHVfmHBtrsI7HkMRT/aFFmbZW7vIONCe6mczHd+Ql04tCaF/wJGe3ZUCQoX+TaPBUhDvbI
X-Gm-Message-State: AOJu0YyawwbuC4psO0JCtj6qn/kPSa0qfSR9j/3r4dyCMru3jMc5ANYQ
	qm9m/CrVJlSSvidDc2UnveVAwyHcRgRtkTxVX6YvhQKeyoeBSmF/wrIg/r7X+l+19l0Aoe5omu3
	1CWiLFc+Z+SdUuCf/q14HX4nzo6U=
X-Google-Smtp-Source: AGHT+IFquNV7etgb2w5kQlbd8NCb/0m/IZnAutbSyCn47svG6p/9K8iqIcJf4IS+AFN9acf4nFrrk9isPtaGO0YKFFI=
X-Received: by 2002:a25:b910:0:b0:dcc:a446:55b with SMTP id
 x16-20020a25b910000000b00dcca446055bmr8770788ybj.5.1712106687196; Tue, 02 Apr
 2024 18:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240402193355.2333597-1-tharvey@gateworks.com>
In-Reply-To: <20240402193355.2333597-1-tharvey@gateworks.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Apr 2024 22:11:14 -0300
Message-ID: <CAOMZO5D7bL0TiPHu4mVsO093Xnp2eYQXm+5gPxojFGoqh_xEJQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8m*-venice-gw7: Fix TPM schema violations
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

On Tue, Apr 2, 2024 at 4:34=E2=80=AFPM Tim Harvey <tharvey@gateworks.com> w=
rote:
>
> Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> bindings"), several issues are reported by "make dtbs_check" for arm64
> devicetrees:
>
> The compatible property needs to contain the chip's name in addition to
> the generic "tcg,tpm_tis-spi".
>
> tpm@1: compatible: ['tcg,tpm_tis-spi'] is too short
>         from schema $id:
> http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
>
> Fix these schema violations.
>
> Gateworks Venice uses an Atmel ATTPM20P:
> https://trac.gateworks.com/wiki/tpm

Thanks for the fix.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
