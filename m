Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795758667;
	b=rMaBRufAEZ/aRHzo7RUk5KkAiDNTEdrldQTdopEXOv2OkasCFfdLYUUBkz89/rycZuyw
	 vl8ySFoajaXKlZyW8EfjIaAaXvVSKm7nR6VtjT0IUqo0U3j1gtIoVpcUCTIRxA+UQotzm
	 zojRCrBGo5jDbu3yViKUcxnJe+KTKvDrASyG65jq/Gbkc0ZrEP55DW8iem6rsIx0s+pK0
	 MWuZyWism9hQ7m69mA8wmydSbeEwX5KtP1OJLd+lUnX1V1RN5+VFWeB8M7b+DKsx+TmOn
	 WdrHuBGn+lwj/W3lkKWpxj5KZ2DOPxDxA2ZsniCrzHgUSev9Ok+c9Mo0dDUQEOGXJzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
	b=HxxwSV36NvkCe+nj1OmhvPlNfvds0qNEfgxkNQK41RGvME8K/Zr578vt3xKn/xW/HUhv
	 fIln3Om6mWHj3IicluqMMQ9AuqcZmR+FJkjCGuq2DS1uuQtj07sqifZ02WI2pw83zMuIU
	 0D36Jkf7iXAEsZ+bSMSRXip5feA5tc2nIS9vTByr21dk18VBqDuQxr1J+A6znW2bZd5r+
	 sCUlgL8dvxdPsfJOWNjDBgc8tBJ/W9y8JeTtXc6xuygXRf2PTo/9zzZ/V+Vf9smrTCFlm
	 0UUx8nxnhv9R6akM7VyWFm24A1uAD4qZigkp5xdnqklnnEaKFArfLze4UXSyE+gbN/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3rJSISC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC4606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 05:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3rJSISC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1255735766b.0
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 21:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795758665; cv=none;
        d=google.com; s=arc-20260327;
        b=jp9rb/ONo6gd98UY2bi7JgvfEP5H2b940+MCXGQ8wW8CymO5ALzdy5kdzdKf4HSc6W
         f7WQdzBv2qqBsy6qySZOUkYf55mze0Sguir0Qfi6TwRrc8T31TjspzhsSOlYlTYADRd4
         MCLBPYTCZia/wy/2niYLUPR789JS8+XnAIxfGzuGE8dBzxbRlOzt1FgwZMWSgzI7GZLQ
         6ppBED35sRvBmzL1XFgEyFhyBKDCMmbE7xTjCynC+l+9ojt1W0c2lLuQgH0oyceODbrP
         lCSrnmT0EeEha6zAfiyRJviquYn91d4DOT8mvQ6AuiODFlw9V9rWxhUUokxhBhBK9HJl
         H8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        fh=XHKloYQVqKb3s7xorMbPRHsR2vkEb9aDvkMVNivsQmg=;
        b=qTBxgXtQweHMb8ws/LF4Jo+bhrNZYsx78/0NDFXLUP3M5Ql4Xkp496jdHZBBFZTsSC
         R5CLcyJ/uh4qgghbUkBM0mzqrR4QgbwkAoSNL9yS6+Ex+UQ6v6eAbBfCfn7RjKz7F1S9
         nxLQqoNUauz0gZqyft600FGKxkGAwrykudWaXeqxXcred2vXn/7y2u+xibCUR+j0Jvez
         O4SnCexbdFNyb4yIH0dSIglhOH3oPaHa2Mae3FDAqf9jowm3wSwztipUE1g2uCAN0qJP
         ZxMHwZEy0FRRIlBGa65RxISDHu7UVJBf55PkVTCtV/ckeeNvsfUn17QH5peXp8mNJwci
         i/ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758665; x=1796363465; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        b=A3rJSISCGvHPfO27VKjBihLKncimNP9LYVVfNQcf/vlBGtarP22NGaJlS1QfFyqY1k
         5aTPEcyoSAnMpDr0bLRzBP/O4Mviv+dLvnKlxRVC/47bqPQzbMAappaAfFFQ80C9LRcJ
         22DAL3+vB+KOUMmGNe/H3+NHIBOI4DcK0CiWjjriLhggww5Io00wS8H3+A+YcAUGys//
         OL5S5SpBZgBp7jGsDgdkEBRxApzhB04nzqWWCfIf+Pif1Zz/7EAH9u0yD0PF6wh/vh4E
         lJ3NcEAixM7LG1rtYwpvUk3IEk2etSDdIBu+iFFHEXchaGS7gvKiMBGEJItG5Ll4F5tY
         M4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758665; x=1796363465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        b=S0fumaco8pkrAtkFFvA828W75LIpXODnUSZTtsz0BMQ9AgFomq3oZoNY7iHrc3bz6f
         ovuscTs5yws9szPwG6R/BelvwenYXhMOdStF4LfwJTvcoOwzLab1e42aJvgplVNrUfPg
         R9VBKm5XqeTFb/QZNHXhVrsi6tdpSBcwtPc/MrahqD+M8xKHeJfP76ooo+o+1l5xgPxn
         68K0IzYaM3U6f6iitLF9ItiFcp1zhF9X7Wquy1IAKp0/L1+7JFJRfBsvbD9wi+GpJHUK
         /Fz84zyqsudfUfeI5t7n6eIIaYX/n6Gc/FSHehF6P6jxfgmzL5NDSjjRakCjMyp34gcz
         F/cQ==
X-Forwarded-Encrypted: i=1; AL+hErFb9i7VRCzVCFkOty5Xry6j2fF67CzXVihz9ySkQ7OaZNWDOMYMupclv7pgxalO0MHhHmM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+kvBapndyxEU6pgKe5CzhClSeUpYq6DG+NwWqbutMgjcWzTJoe
	6yCHQm2lQ2xc7Zkf6Ho8ywdj/SjPoNF4aeUAjVZkQ+qRkQEiYUIiCvhe6C7Udc2yQ//XjqQ3L8C
	Yg5QD1q+YX1szKr7Kf2jGaiYq46ZG7FU=
X-Gm-Gg: AZFdTZc/0yRWcdtBTA01uP2PF1DextnWe2gXIKJuNe86dPYdM4DThWKpRlS73iGDr5M
	0RYLRxpZCuBMNPrmyGgi6xIu36CTKf0NnJAaKsFukj07zPfJfsdswgaNhfU+S7t0Mv4onzqObzU
	Zo0VjWMACe6309cyT3xopBAYrl1PhnkUN1JOK9S2O4roBFsqUhuWcWlM+F4oCihLwoCVzgCYmwO
	JHuEZhLbeZ5QXtrNujays1eQ6VGvVeOIesJIXPP5XLmLtFw26CcFHFgnDbRWB9ZHH3yQlqRhgJL
	D5g/LihDxRxE0MxDHs4Cuca8o8rTjeUm25Bh2peCvjPA5gjI3YxZqKkmVpquSn8ogi+Is1sRpAR
	xlfRxP+y3AxIV2wEq7LLlf7qlL0aOas5SLYs=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id
 a640c23a62f3a-c513ab0cf13mr1274661966b.26.1795758664865; Thu, 26 Nov 2026
 21:51:04 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
 <20261126160102.52163-3-dinesh.v@adlinktech.com> <e281de75-7294-4f7c-a570-d51cceb70c24@kernel.org>
In-Reply-To: <e281de75-7294-4f7c-a570-d51cceb70c24@kernel.org>
From: Dinesh Kumar <dineshkumarv85@gmail.com>
Date: Fri, 27 Nov 2026 11:20:53 +0530
X-Gm-Features: Aa3M54qZ7qETuPSsSaydI_K7kgRHcYJbzNWIkAB1COl4VYnvMvXjxJvC7-etm4w
Message-ID: <CAG4v1_AT6kMjExcy+L7edXwnFVrJjjjEBC19FDaJyytAXU775Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@nxp.com, robh@kernel.org, conor.dooley@microchip.com, 
	s.hauer@pengutronix.de, daniel.baluta@nxp.com, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, festevam@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof

On Fri, Nov 27, 2026 at 7:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/11/2026 17:01, dineshkumarv85@gmail.com wrote:
> > From: Dinesh kumar v <dineshkumarv85@gmail.com>
> >
> > Document the ADLINK LEC-iMX95 board compatibles.
>
> Looks confusing with the actual board. SMARC is often the actual module
> and here you claim board is LEC-IMX95, then what is ipi-smarc?
>
> Explain here hardware briefly.
>
>
> Best regards,
> Krzysztof

Thanks for reviewing, and sorry for the confusion. To clarify the hardware:

 - ADLINK LEC-iMX95 is a SMARC 2.1 computer-on-module based on the NXP
i.MX95 application processor.

 - I-Pi SMARC Plus is the ADLINK carrier board that hosts the LEC-iMX95 mod=
ule.

 - adlink,lec-imx95 identifies the module, while
adlink,lec-imx95-ipi-smarc identifies the LEC-iMX95 module mounted on
the I-Pi SMARC Plus carrier board.

The Device Tree files are split accordingly:

 - imx95-lec.dtsi describes the module hardware.

 - imx95-lec-ipi-smarc.dts describes the I-Pi SMARC Plus carrier board
and includes the module description.

I will clarify this distinction in the commit message and Device Tree
binding description in the next revision.

Best regards,
Dinesh
