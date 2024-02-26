Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1E1AACD
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708979910; cv=none; b=eh4KCDcb+t030luc2wE0AZALZKX8uHdJteNoyL5FmYLKKVL8p3bHfdb0JnWGlks+X23ZGRoEZiDz8wQTin+s+lQls5dBlBfmfuO8bqwN+LRLRPrGOpdmf3b7sXVQstFmU5bRHLh08ceHZPsvVVycLAfvjmoQ21z98qI6BmhImzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708979910; c=relaxed/simple;
	bh=HsejdDvqC73ldVFNrH/9/DZMlTWUElyHEKA91R848fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWa28q2Ii9AO359nBeeSEFgwggxSTw5ETrMzYA6tMC9NQhNbNjY4YRNCZrdEQoYTWKZH5d3/Eq0g4mXrVUZRR298yF/gTFYAh9MozsRfY4pwCOzc3oSNrabjVGNvrF4zEMQVo4g8tOvET4rCGCdxluh7HK5baBxhoi8C5LMnIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tx8vgAvj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tx8vgAvj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc8662581dso1357205ad.1
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 12:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708979908; x=1709584708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0scXHFBtzVvkjRXYq6gEBt9Z90URlSPbBo1jvpXeT4Q=;
        b=Tx8vgAvjuNSJKxY3JchzoMdoQ6Z0pjdNBgGSslZko+WmV08hwfwXztLCuOdMOVD4cR
         HV4nq7FPe3TPdHfdhhvVnDdvylXGa5EiX/wkBjmNaQnxSdbJkZbuxbmzAsS+iUZiKZHI
         7lIvAvssHWZdY2dmEvEWe7ERkU4I9x+wUkLFFQbr1CdsxVTC6JVP8vb1Ms3TN6ReoSCb
         tH94ylUDkneKyhGIOC2z9Xksp4VjqY2M/VQi6rzH9bCqF0r/umn5IM1B+YDKgscqRluc
         0Dbl/fvkCTu5B6EBGeadkaVMRC8Htb6McGjaaP8MHBi8JZOkIfDybYOWzdbQBu88exCF
         vfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708979908; x=1709584708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0scXHFBtzVvkjRXYq6gEBt9Z90URlSPbBo1jvpXeT4Q=;
        b=lDqwVJJEJYhzRXb4gqppILcInjj45F8VK62iIvYLenp59sMfNxTd6Alpgi0SDGFZF5
         F3v51bsyiDQQli2C/em2QBKnaIuwFccOpiWV3ovZ7cdcRSC9iq4dUH5hXO6Z+BPAGJRv
         eeo9kOZsLDKLqC9enEM1OXRxTsa0seBUWrahegs2j5p4FjUvRMe5K2giHvagukDjWblO
         P8Hd0NuD0aJSfAZn9/jziig5AvdZ7eKCrdDPzbe2yy42Xs/F8cbuPkYNhcsLIkPx0twh
         ufKDKRepDs+DNWPTZCK2Xb/GYwG60JsTL8QH4SED98pwlSWLhIjATYwdNl73ekRmXxwI
         /sYA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ3jy0nNlk1+OecImAbNaQ0nMTZlFZ/qNeigqepU4KiSbTeva+PvG3tSx13OERrg5PafEFTHOPf6A1OrszY/JRzf3B
X-Gm-Message-State: AOJu0YyPJN81YYf3geR6PNmrDijtgqUGEApDF6k1JjFVwv6+aJeGIBbw
	aoFXMl18vP2IjsOntntjwEvgd8WP9k+WaxCFFjP+/RLkH3yfSkj8iMk9Koqi/n1Oa40+HW1yZ33
	EVcV+gGqTauSqVciOpDyx1MDbpQY=
X-Google-Smtp-Source: AGHT+IG/6g2Uunj3KJXa+FfivRmJy6KPW89uXNNLxqYlIofCsJ/0C9Rj5gg9hWMoFnHZFtzVNsWawNA10uncefclPMM=
X-Received: by 2002:a17:902:eb4c:b0:1dc:3c:fb67 with SMTP id
 i12-20020a170902eb4c00b001dc003cfb67mr8978730pli.5.1708979908509; Mon, 26 Feb
 2024 12:38:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240226203358.275986-1-Frank.Li@nxp.com> <20240226203358.275986-3-Frank.Li@nxp.com>
In-Reply-To: <20240226203358.275986-3-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 26 Feb 2024 17:38:16 -0300
Message-ID: <CAOMZO5CoucMLo2T7z25EpBeakmKt38jis-_OC1-_C1vGtXEwWw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx8qm-mek: add flexspi0 support
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

On Mon, Feb 26, 2024 at 5:34=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +&flexspi0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_flexspi0>;
> +       nxp,fspi-dll-slvdly =3D <4>;
> +       status =3D "okay";
> +
> +       flash0: mt35xu512aba@0 {

Node names should be generic.

Please run dt-schema checks. Otherwise, you will introduce more warnings.
