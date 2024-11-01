Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6D15820C
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462072; cv=none; b=h873c5pdwLA/Y/rm2JE4BNsUqsZjZrJ8jXF4o33ssp2daKfGvYFQrhW4wjWNluMTeSkJvV/k/Vkh1Ega4oYB0GY04rejM3tGbExIzQp3aEJA+dfs7e8aywY7uO3BTwo93JkunEruwp0XCavTZwR9CEbgRIh+rvpZZAEZyQFXM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462072; c=relaxed/simple;
	bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSB0fMwLSk+g3gCues3Ll/6rVfiLPFSNpcuME17RiAEx0/TU1eiuVaZm2A+oPRAfX1+D2ok7vH4NIo/aedJmw43F3LXEu6f6aNdhC/Ed+FeA5gNHLOHsnbazZP4sr0jjXVk7DS9cniGt4Q3CjUpx7RVxN8RwGiOKn0E43G6hbps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRDZMA7U; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRDZMA7U"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso17768241fa.0
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462069; x=1731066869; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
        b=rRDZMA7UfFUFE8bW2JF7ssU8tP0USEmBD+c4AooNXqVQjKvqRTh2oUY5yP2TwewgVr
         +MdVvkvgyVHYpv8gsd5Lq5ASM7Qc8czrSAYD1UcNDNl0xn6lqQXk+BPfxfjhu7p7zDoQ
         BZ1tnHQGMgXS37BV8LqE4z+1VrZX0JlUaf+YLhMuSeIitabQFm5OchQq22Hd9qWcfU6X
         Qp4BlswTkUaonvuYUO89urK0SgEabLHEuIVdaRgs5q+AeV2X8uNamWejoTBlP42bod8N
         VTdWMr7HhfHSokj/6RPHhIawrrw46/wEE1jjUcQDaT5p2THMLVwnckg5pcZ/Osr2rgQC
         rwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462069; x=1731066869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
        b=AXzA0RWpJeBl9I7+IzFagL49V10xomwmf4CIEhXa6/g6gVOO//zmOwO5w7HBlFwCg8
         V081N6ivXZfU0zj6xskJxMMXurXz2OX/6DGrdkMGCmVOPXrrtRlmJHv1y3Vhi/LP1AwX
         K8S5sciDFDgY5i/+mcOZlhDQcEkjyUyoBBAx9uGSIBII9lUyeuQKXsl/EHNAuvuMrBNg
         i8wZ+Yvk1soUOqFLPf89yZ4E4rxaMtr8i0nRZPgey8xpKsuDWZJxrJc4HfwPQ86DJ8Ij
         6eezfdBH/8Jciq2I78aEV2PUBoxzqf0/poQ7QV2OGL6wuIw+NR44jCDl7nFQG3jpNbQH
         H3dg==
X-Forwarded-Encrypted: i=1; AJvYcCXcW2HSXZLMeuZeXNBDi7vXMLLAmJrsLc9/rd8vT1RdYewlZLbGbZTa71If63bh5Kizykw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXI0Ju0V2nLjsJBjKMxE+3lcnZCIFPhOTiBI53fINbwELqgMY3
	nex3WE/kZoCsWGm7OScGJ5PD0sJYO2CB0tq7T9EGJAuuYCnSZzqv6eOT8Jr2MslpZgyme91dNVF
	DAYo9HLK6DG7VDasUVQn0z1YEiDktrS15VGbnHg==
X-Google-Smtp-Source: AGHT+IElM+4cf5nJiQK/flMPFGUQS/qscWK2wONW7FVnOjF9n3NBlck/a/D8oXjerYOiHg6n+ZKlCTOw3SU28go/iqc=
X-Received: by 2002:a05:651c:154b:b0:2fb:6394:d6bd with SMTP id
 38308e7fff4ca-2fdec4e750emr31077211fa.12.1730462068876; Fri, 01 Nov 2024
 04:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com> <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:54:17 +0100
Message-ID: <CACRpkda2Ss_oy8vX6V7KK9DCvSoWxSg2R_iCourt-XReHBcpLg@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
> and "pinctrl_enable" since this is the recommended way.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I assume this needs to go in with the rest of the patches.

Yours,
Linus Walleij
