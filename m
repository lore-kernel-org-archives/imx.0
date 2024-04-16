Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2D374EB
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713285691; cv=none; b=TqOnhOwdQaGeXaKsg9Ma+CVNeBrp6900r83Bkwq4y6BuP+jyMMhetPLt9Yw++NnI0VE/WF06+746FOC6zHPmEfgMbxotatUPUp/NaeHP/jLvW1KYqbpr//vlG0FPSZy8sBcSCLo/EaDSHzrC+MbactAR/cFMu2J76f/kI5EWZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713285691; c=relaxed/simple;
	bh=n2QPNvPuVN+mGg9aHHpFcDKDnrcqLCsURfATRKMqsz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2AWwxiSqapL8kBnxFG7MDNiXdx2JuEwdKmVnWkQJtmmm7F014BmlXVg6JSX/49ZvpFSl/a/Zdx5aY15YkoRvNBVPtPkb0rx5YW0WQGv06DgxcvGD0+WBdLcPci88K53Th/Dqqy/rCTFYZ8iWJIO+eyvpv8QZ4PcEhqAQGAz5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBwXxUJn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBwXxUJn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2aa0f3625aeso603345a91.1
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713285689; x=1713890489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1ATCU1Md8tgFRlK9+WCz2NrwVn9WPr0B+EpBjJ78NI=;
        b=EBwXxUJnnMe/bkH56p9TCW7YRKts9AlwBgBabNPbHqYQ9/mJJvbCp5F6nuA0xKK20x
         /T/gzv5ocF7Up3XQDkS6cfvfVE3M2UJr9MRk6YTYEHcqv+baI0jYkOlK2xoo7B8AM7dj
         IwnUUNvUUEzNlpEQtHazx7N5+PUZObUNfbDj3GrjlEAgfi+3Tb7wPCKSZGXZIdg96QoR
         MM8y8nGZ24yWOT/tx78zMvaJtAljRfuuPBZzMjYXWWBi8x2yHBi2BDnHwN/GfMK6qiFR
         aApHhmrFX/Y9MZPRps5msT5hLvgynBh5/gYZvHAgF9jsD/iJgLQVjL67zrG+VB6x1/xM
         NyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713285689; x=1713890489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1ATCU1Md8tgFRlK9+WCz2NrwVn9WPr0B+EpBjJ78NI=;
        b=UFotfgKCq3TmPibLQlpcRX4+EyZo41VQJZB7QkJoYypfRG/th2VlmkNAHNaS9l9gIU
         hCBcG8YNnGMLNr0/dg+wFKGafFsK806NmS213XbMOww65VVQE0vYpLlSI8TgUVQ83t8y
         YUXR1x2v+dDc98m7oNDW/zbFAObLCnNtZZk9Ew+cFqELPKks5BMmT5N8tsdgIowNlRYC
         Wzmd7PMQVX49pBvONAaE0drmaCNsL/6oonJSfmXnfDG0doeyF7gWWs6faYzdMc9Gazov
         hYiNvFibjy58fUoZBJiuioNifNDn29i4SAc9/3Cbp5iHZvEbhwNtzkpY5SYggKrQOxpH
         CAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaa9DCf2D/2tgEWTckZn09eHaO82/nFf9UmuYF1Rwemj7azi7hU81XXVRREppntfkbAm8fEOnientD/Q9+zi+tgK84
X-Gm-Message-State: AOJu0YxB8wMkPQRJBj6MuTWa5pFJ+1V7yZH1ccX3uIkeVlkJphwPxHu4
	VsZvZpuOu3xgZczuE4/iJ5h0TS7gT7JYbYOscztnjH2QKpuhlXxroxzj7Ju11FcAfIR6FZpPaGT
	7tEHCBF9bm/Mz6fWQRfjXC/OXi+g=
X-Google-Smtp-Source: AGHT+IESH7+EWeYIw4jeZC7l99COVZ+9VNJTY8eGys6W10quyfujwug7mwoD9JM3MQgKDQzehSqIvZBcghY5wmKOick=
X-Received: by 2002:a17:90a:db0f:b0:2a6:8e66:d585 with SMTP id
 g15-20020a17090adb0f00b002a68e66d585mr12675470pjv.4.1713285689175; Tue, 16
 Apr 2024 09:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416163256.2121923-1-Frank.Li@nxp.com>
In-Reply-To: <20240416163256.2121923-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Apr 2024 13:41:17 -0300
Message-ID: <CAOMZO5DZ-8Cphm_U+ric4yE0uCXc9cTbVs2BPBzWYQd02xTN5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8qxp-mek: add cm40_i2c, wm8960 and sai[0,1,4,5]
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 1:33=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +&cm40_i2c {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       clock-frequency =3D <100000>;
> +       pinctrl-names =3D "default", "gpio";
> +       pinctrl-0 =3D <&pinctrl_cm40_i2c>;
> +       pinctrl-1 =3D <&pinctrl_cm40_i2c_gpio>;
> +       scl-gpios =3D <&lsio_gpio1 10 GPIO_ACTIVE_HIGH>;
> +       sda-gpios =3D <&lsio_gpio1 9 GPIO_ACTIVE_HIGH>;
> +       status =3D "okay";
> +
> +       wm8960: wm8960@1a {

Node names should be generic, so:

 wm8960: audio-codec@1a {
