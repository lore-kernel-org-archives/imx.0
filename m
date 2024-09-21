Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68E13DB88
	for <imx@lists.linux.dev>; Sat, 21 Sep 2024 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726921486; cv=none; b=FbN8N1z8eCPYLIYO4MmM3c8ub+KOwyslbRZKnid1jHimjITYIWM33BIDcLp0rw4OxMUz5M2CSktF2GM1JT1baVh68OvjgBumkOmtw5tz5IUWt/MCh2bMN2YFs1g8X/slEnmKidkhfCgONArIjyCHPg6Ro8pe/9y+glZYIplTzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726921486; c=relaxed/simple;
	bh=Lm5wT3nctgKw603dwlAmokov0gKbgWJJS54F9VbU9Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o05dQ8RHLcN+doF+etaPIqx02wf6RU5XTNozjJBaAEQr/3yyr7Pz0Q5sskMlGKvBSmjAa8ZhttbfYRWS3vDPO0ss8zLjxXEapQ2BjpMCGYeHksoOneBmT9DT5pfRAm1+o/QvP+KqvD0dnZi/zLvu4QNIX5T4PNXMRgNFq+Ex9i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6KG1OzY; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6KG1OzY"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-535694d67eeso3076968e87.0
        for <imx@lists.linux.dev>; Sat, 21 Sep 2024 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726921483; x=1727526283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnV4AAkppYdl3VxpkVdBWhDkeq1tyHDu6V34X7mplIs=;
        b=Y6KG1OzYGXbL7YgSbIEdx6fU/rS1/MFzQjVq9kiPmqtI2dRQd2ffLCzWRaQ3lQM7oF
         3Of/FQRuMh1VD8ESvFbX8iGG6yB2ewTCSp/YNUG/qQY831Z4LhlERZ/9qyZt/asgWW7/
         56H7LLfz9LPIiVHJ/8l1++Si0OfilT+GccAARn+gELxSEpFl9CwEge9qghjHikZOR17S
         CGZpBFDNuq3GltwCihadacsK1Z74CgWq9YDtjMvEOv/83vnyqL+RB0hs0iTstrL8vgs6
         7DRj7iMgfDzyHEyzDE+KnVzAALJpQk0zkVKSHWVFGMyg+HuqLXs7C5+s2efgcnVKaruI
         tgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726921483; x=1727526283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnV4AAkppYdl3VxpkVdBWhDkeq1tyHDu6V34X7mplIs=;
        b=JgbaWF5SC5rVkUb2gQdypCFoEvQDE3ar27zDx3HtmIgZx1KcLMHzDJa5GvLOYIT1Y3
         +2+f3j/7OomJjrZxli/GX7WGxp+5VN3a4LsmUPM777qe58uNpYTedlmoqun0hbL0ZRRo
         Df+i2xCcGmKPb8ESiBnZdGefFGkkl7yyzdFr831/a26eWXOn0CXk1sRpp5E6HL/6s8ZO
         yh3jijkoM4eAcNs3UV/jPQSbJ7+1q3KKVL9vsxGto2rCBglw1OQP7lolpVZ4veY8+44U
         sHGWojPfww5PLNO76d5O7HGsqGXulysBoV3ShcOeLja4hGJi8u/eNG0vi72/95/ULP3K
         CNDg==
X-Forwarded-Encrypted: i=1; AJvYcCUSmaCYX6rdTOu3aCqsx9sSwmxDrsYD6jpwK1YsX+f/IlJljldrRZV706Y+3LBGKYcMUdE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmvOaGNgssohGRvzE495enKa4T7ERwoZNW6BqnU4/inafYcga2
	FfpldwNoBiSZ/0cMJrRkWCffF5l/PJ2DvgIK3H+jOcsyaZ5LjWQOOtViQjY++51dKmNAyxptCR7
	XOdZM+dguDear69dlRRPZJROH3uI=
X-Google-Smtp-Source: AGHT+IHoWHrGLBUT8JY+piHvjihWgo99vAImbbX2yX9mk8Be7SSOMzH323JpYw94nPlLuAepPzXyxgM4onEBHNSwyKg=
X-Received: by 2002:a05:6512:a8d:b0:533:3fc8:43fb with SMTP id
 2adb3069b0e04-536ab7c7c4emr2435107e87.0.1726921482619; Sat, 21 Sep 2024
 05:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240920080154.1595808-1-michal.vokac@ysoft.com> <20240920080154.1595808-3-michal.vokac@ysoft.com>
In-Reply-To: <20240920080154.1595808-3-michal.vokac@ysoft.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Sep 2024 09:24:31 -0300
Message-ID: <CAOMZO5BrmuWdiEo6xi8ChT01jfLMaLAb88iUhS1kt6qqr_h7pQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: imx: Add imx8mp-iota2-lumpy board
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Petr Benes <petr.benes@ysoft.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Herburger <gregor.herburger@ew.tq-group.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joao Paulo Goncalves <joao.goncalves@toradex.com>, Michael Walle <mwalle@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mathieu Othacehe <m.othacehe@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Fri, Sep 20, 2024 at 5:02=E2=80=AFAM Michal Vok=C3=A1=C4=8D <michal.voka=
c@ysoft.com> wrote:

> +&usb_dwc3_1 {
> +       dr_mode =3D "host";
> +       pinctrl-names =3D "default";

Per Rob's robot message, this pinctrl-names entry should be removed.
