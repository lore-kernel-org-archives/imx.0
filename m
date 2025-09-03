Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E832F744
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756942674; cv=none; b=SAgpEz2xbbSihUorsE1dT9gE9JSDYCJSf8tpU4cpLrmwLogsUVNh4FQl8vRjCLj0Yep8PQnErRX5X0LCM8OOlzmwM1AQ1r1C7RdwdMJrnCWIwVoORBCSVPI1HOIHSVLLa7yc08zNs1vgU9tcPXGUaWNQa9qqEwsShyDBNN+YPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756942674; c=relaxed/simple;
	bh=stw58zCoGvddooZhq93UKDXlgwE9hSJd7dCfuvUXu1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G48uO3Nukxs7vTylb+uXUwK9Z/kMAOUzoYRtwUV7QCUtm08jvo82TPj+KGMd8t8w0Q/UQ3pJxj8nkTXGuWWwcf4ZPt1dLOokGeda3mnp8cI0JgyW09UM4NBUhz7sVSiOTbJyb5FXIy79HDb28QKbRznY/DcCvNOvzVHmgaSAZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/tvalnr; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/tvalnr"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336b071e7e5so3540471fa.1
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756942671; x=1757547471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv/e5+QmWiSB8PrnuSDhZ46U1TqYFEGl3buUo+cKFiE=;
        b=I/tvalnrcQTwsBACj4JxyeKKDzkK9deJNQyIALJ1QWo2p8XFN7urA/ihnbg/uhdqSE
         +UmFUCZde21MUh/yCKeOPVBmNtzo0Pwv4pZmR8uc/CVlTjiif1DaO7xVzyOoGsmk4C4b
         kIkE5CldlBmj6D5S3JPwXwa9e1aQI5rfkHsZFCi+z0Plle/ZVsBGr8OG0ZsDld3uij56
         ScvLDLhjxBxD7hAwHlLB2hrZ9uIxpaaA6IprWPlDOz6B7I5HmMv8I4HCtTHMCco0KrUc
         ZOaOp/1QM0r7KoZy6QhyDJ7NqyfG3uC49UF5Y19rKn+AljcVpTSUOpYj//fPECwyFjDE
         TLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942671; x=1757547471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv/e5+QmWiSB8PrnuSDhZ46U1TqYFEGl3buUo+cKFiE=;
        b=m+DTtTGp91FAe8iwtUiPQ/6YgbwC3Nl9Jyxm2939DcDB58T+eWO+lh1ahA2i1ddara
         Z/H6n6H/j5gHUBhyruyq46b16PCW81eVYlpeLfu1cB22zBtkt1PFEetQT1Q/eoQ/Jb2D
         B2M5wqC0qsd0KTyXwPx7G2z6QRy6DL86kqpio1ay+jlYyYAuE5e571OO4J5Fv754GWvj
         iRRMYO1zkzFXqipoz6cAV9SJKDm5tp77DQDFZm+mdE6pdEM20qrnil+ZKW4EOBYo2Jhy
         /MGTRJVGZRrsIhTMApTJqnUX2iODjGZ5cIkNID0caP/1qd5pWRCtvxDihHyzObmLreuR
         IX8g==
X-Forwarded-Encrypted: i=1; AJvYcCXYwu3QPaBQoGWOzqDKfLBLwSp/iqASzqq9DoIxiyJ7LruqhLOxvq4AjawSko2Uj3D8GA4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwsugRAgAkTm77uEk8zM5HC1ZWv8LaTLYKKBKoQB3r0Az+W4qB
	2Hc/csgLldi5yuGn17US4566pVlQOPfyR7LnQiwEB9mrEJ7gvFRkogS0ClZS/hCcqM4k996LTXq
	0kcUWx+CPUffikvXWV4g2buIdArjlzRo=
X-Gm-Gg: ASbGncsKHSObjoSLnlJkQIpkjhdRRpjQYZTqShbqDyd2vNTj8WbrdfcM+6+8uUEJW1L
	6UcqXorvjKBJKU6gdzuOrBx0dnJDyWM9WRaqhZUhTZiI0/Y9HJ9g0KyXE2/9jW8l3ydFrP4U2Ox
	8AaR2z/0wBWLXX4lOXaw+UV5Hrq4HFasU0qF4UsHq3GtQnYONLTdEt4lrOC3rs7cM7Vjvl7rPSt
	OTNA1yIN2gF1eM7yCKVZgjuX3dGeDNtBzjmE69UTSkG7AdCqQ==
X-Google-Smtp-Source: AGHT+IFYFXtX+tu/KEl7pQSY71FNh6F7y1XpLJcTeG502OgoDXb/vUP+HRDx37HC/Vxfaeu0jNJZux+/9gdjOo9o0+E=
X-Received: by 2002:a05:651c:221a:b0:338:164:905c with SMTP id
 38308e7fff4ca-3380164ae7bmr15568211fa.40.1756942671236; Wed, 03 Sep 2025
 16:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903-imx6_dts_warning-v1-0-1e883d72e790@nxp.com> <20250903-imx6_dts_warning-v1-5-1e883d72e790@nxp.com>
In-Reply-To: <20250903-imx6_dts_warning-v1-5-1e883d72e790@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Sep 2025 20:37:39 -0300
X-Gm-Features: Ac12FXyZOBrMIjlst-APzm8-fpvaAVU9IDxp1yLvwRyOjk9Sn4UouD6F8_4boGQ
Message-ID: <CAOMZO5AGv2ykKmL631A6O2yas-1ffmFaZdHFGMxrFx93G9t8XA@mail.gmail.com>
Subject: Re: [PATCH 05/16] ARM: dts: imx6qdl-aristainetos2: rename
 ethernet-phy to ethernet-phy@0
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hs@nabladev.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Thanks for working on this series.

On Wed, Sep 3, 2025 at 5:20=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Rename ethernet-phy to ethernet-phy@0 to fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dtb: ethernet@2188000 =
(fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-ph=
y' was unexpected)
....

> -               ethphy: ethernet-phy {
> +               ethphy: ethernet-phy@0 {
>                         compatible =3D "ethernet-phy-ieee802.3-c22";
> +                       reg =3D <0>;

Are you sure the Ethernet PHY is actually at address 0?

The board schematics are often needed to get this information.

I'm adding Heiko on CC in case he can confirm.
