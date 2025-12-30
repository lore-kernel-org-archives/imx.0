Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3271E8329
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767120736; cv=none; b=eBYgJDiMt1/fmhOgdMc12S0J+DyT8cwwE9tnstx+7T8pSZ98soLp49sJ4FBKQb/205Dr1oJ/0zIBxglQbQ4exlHvWYi4fllmGTSzCaIASqSqpz9hJkeKp5i4ew8Cc/eq+7M9yPZ/irsBjdE4vEXFO1tW6/i8s8ZS7Xb3IWEIk3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767120736; c=relaxed/simple;
	bh=mKXPtbc05cOGV1jo7EsldQLGLi8dz4bhVniBKjogV+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYYwuBL6f3DMdQqlsF0NCZ66aZBAEhkePza/xwVQICWZEivmKJe9m3KHLoS47lggGDKC9u+jawZij4w7es2/dGNA8DEIz2JwRvysTYlpyxPL9fXSB2S9Nr06/D1f3rXvOmq5hZGU31KJ2khdCHcc10Eo22GWEVNcwm0q4LSTnrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjSL/ov3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjSL/ov3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37ba5af5951so93333731fa.1
        for <imx@lists.linux.dev>; Tue, 30 Dec 2025 10:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767120733; x=1767725533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCfXUzqG3cVftHj53I17dFR7YjIPCtvXBTRyCBkqeHM=;
        b=VjSL/ov30G4cJHP8UO3VCXl071+M0NDsOmvpDNVBqKkoc9BAYMum0PpvfN2TuMXGzt
         D9uOz/JhXfRwqyUZls9VeVRMSTKgkSFmwFR/ivjYpLYvhcZc+zPup1txCFCnVRfzGiWB
         e3uJvx0dAZ67b/zJwN2dk8s4Hzhx9pCNW5TnJJOyeTq9kOTvM0gbdvnF7MnYymiN4tw2
         eHGwiiA5hKRgLpTAGCI9TwcyNL9bqqaae+gX7WpIL4cZXgez3lRoHcQ2J7fOICGrPf1u
         mFN8eK2iIiqblwi+EN5r5ZYg1i2TWoU+HGtRe8Ly4ZRjBt4JKpQ75bkMWmIKJH4EMKwn
         WsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767120733; x=1767725533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCfXUzqG3cVftHj53I17dFR7YjIPCtvXBTRyCBkqeHM=;
        b=S4Bw3tIXUHeSrdjuDU19hGpvl8oT4pfcsyGe0joAO0qtTLR3NO7dTtei3z56qIG92M
         LdEBVF9uZUMFcyCFcMNab8jz/Skb+qYDZjLAPaMpvfOuOewu4G+Qs9z+Fng4YhMBF6Cc
         o03lYP8ahtT/DQVGOgd32hAaY8IrMaIhXushJGTwkhi1oZWzu8v/Tc7dvP8L8ZV69Uxp
         oYN4JynqPf4fjV1lPyYGNk5Rxj/gL5Vm6njx+w1JSkGn59ocHfhqcoXcojCH1OMLulWk
         8MCGvTgCwX/SIG0aQYpeGzgva9CR+PnWrxtX0MzuzaPNWWIO+HwqIPHhE1T2Y2xjYY1V
         rU1A==
X-Forwarded-Encrypted: i=1; AJvYcCUj61xR/BbOviV2uky6teMnFuAoxH72oJv5plDEbLThwi5slp9IChFPpBTuaiQjYFsGwPU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyychExbZhHGjuW1UGjFrx/tkPPggc0hhdiHtvzH7n4UbTZWKDT
	1Q78xNHBX+enYlXGlKnnthnHmAhLTfGXQCoSjhdQOcgnOluGD4W9MNqeLHNklZGMfmuPJ7i4eg0
	nsEtEghYrBZF3CJHxVKQpzuH19XBvrHk=
X-Gm-Gg: AY/fxX6HPCPpCSch1HN7qZI+lmilplx/Ub3g9pfSlVznR+LRLevPbKAmUTSECHcmjML
	ta2ZSNLDdUFiKMoS9hfuCzzoY0j6WBoOgbwmIO5HXuzlwQ0MMqiuIFKx0Nf3ZeNHJUPmLy5jyQ9
	plkSighPQ1xbRA+sCADzMNqvgLzPg/1qqNQJxtMrIwciNJwzE2qR3USj6vxFuVQkZJN9q0wP1/6
	4djyefdE9U3/HkZcqLGpw1qGxdT2j2TJN3xnMTN2U8fCGq4Dx7Zha4XEaZupsi4vWJvcS7TVvTG
	gQ566bsiTqFEVceBScBrxafIOFI=
X-Google-Smtp-Source: AGHT+IFUnSlXZesKC7/z2Gedmk72Vyhz3T3P9a2mLpOhYQo2tRcPsOk9zvHAtYmSF9PmyTomhYgLnFqHRIU4PBG0H44=
X-Received: by 2002:a2e:b8cc:0:b0:37b:aa90:1f5 with SMTP id
 38308e7fff4ca-3812167ec45mr111776001fa.39.1767120732669; Tue, 30 Dec 2025
 10:52:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230184121.52635-1-marex@nabladev.com> <20251230184121.52635-4-marex@nabladev.com>
In-Reply-To: <20251230184121.52635-4-marex@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Dec 2025 15:52:01 -0300
X-Gm-Features: AQt7F2rn2wnlugSDBnS70XdP_2HLYj3sWlBtsvhMqL_ZKxQusvKKkquuYWpTCf0
Message-ID: <CAOMZO5Aa6iDg2u-sJu1yPZX8T2wE=QVzwSbxjZHo1bMwfDW5HQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>, 
	Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 3:41=E2=80=AFPM Marek Vasut <marex@nabladev.com> wr=
ote:

> +&gpio4 {
> +       /*
> +        * Hog USB-nRESET high here, since neither U-Boot nor Linux
> +        * has any support for USB Hub GPIO reset so far.

Which USB hub chip is used?

Documentation/devicetree/bindings/usb/microchip,usb2514.yaml describes
a reset-gpios property.

> +       lm75@48 {

Node names should be generic: temperature-sensor@48
