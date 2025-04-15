Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68C922A4F1
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743387; cv=none; b=Injq6vTt7B4TOJhlk3Os0hL80YsXuaL/NK+aE/YcE8YcErUtubYvU/q8CL/0wT052hROZRy+ML1mHSvuFLAs/e7xxMKHSSgWfgdojlEAm7iKqcQAf2MiQECDE/ocUzqSitee2BlMyeBQBW1+eKmH72iOs1nqFb5Qo6vIalaIgKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743387; c=relaxed/simple;
	bh=4Hgh7CGJxXIEv2IFwzCoT4epykvsdR8/qSVJxPJ9L7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C06lqCn6yeOyzHza4DbC+bb4KMPmTMqQVgantfh88J7jMd4asKhvmiyDd4i1VVhUdoqe88mQLV2vfghGzcsrrRmuEw+bHY/RaB6XVGARWKOYXd7WDZyC61U0rDobW0SfFpxbM54W49T4mtdDQYH3Wq4FxSt9gNdCEOEXmFmqPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrXA0zOo; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrXA0zOo"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b10956398so6880146e87.0
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744743384; x=1745348184; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=;
        b=SrXA0zOoeN5oFo5oIWFr3rRY5xdvhbzK8IN+9R+LX10LtcRxNp0CR/7LnSVhQJcNRE
         3nXKf49Sp98WCAK4SghfRv3C1o9TUkH5N0NYUDEMucmEKkMuGqp7/vPfeKIiOWxJPo6e
         L2eSMCVMCFNNAlo5VtWCLOneeBENK5Vm97ImP2MnBuFxcv+mHGH0FD34AT+Bc2Fv+1w6
         38pymhesyBDGGmdOg1K2mPEIS8jlgKdkI3vayThH+84g5EuOfBUw/FX+lLbDhdnadj/L
         h2NScGL/sXRAi4a8sXsunNaAYZ2BpUSokNf79YF3gDCWMoIUtHSoXcF67egapBTrTO1X
         e8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744743384; x=1745348184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=;
        b=f4Oeobu46o2GFESMHw7IYzB7SmaTdxDp9CvPfoOpbDfmsDAyu+xhIcgSswL635EPLZ
         Ziy4qxEFW2MDk4cf8USr6mtqaRmCmc9ECVllMoknvZKkJznwg5Iovax2D+51lBRVGr/w
         j6BOPUZdPJUmxx4UpDeue9J8CugJi3MC9sNJ3/c8UYKmXkUoJ3azVSJrmLzwVPxJPsYz
         nLkU1veDN/kWf9uU2Xma5KgHFhsnoib4XTx9YJ1qvuPYfk+JvC6nuL3nxainT4l5B+rx
         DJbUV5J7Jxoh35yGm82U/4e5B+I1K0UlHmGhaS/G0NiLgK49mqF9xifQ50ta4iDjikXw
         FHTg==
X-Forwarded-Encrypted: i=1; AJvYcCUVQO+/SJ6nz1mbKGIaNqhUVvvSPhUa5mF0WvABUmrn91r35suVGV3BOGV/20FxLJvNtJY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGJ7jBqpdhE26jRWt2B0RptGryFzmXIN8isRavt1mQ5y5D/8lK
	NdhUAs6ui6SEQhhTV3WG+HSj5ZEK9KUbVtDnxshpzEh7Kizs6sfrbaksouxE6yzHAvEuRUjWXRR
	JyhXi7iaWyQ8bSxl0DR6RrEDH+fk=
X-Gm-Gg: ASbGnctBJ/FjcpgNzEm7BPFXvZWiH7GLuwBk9KaWBZ7MEHqvLvBCao/J+xAwCeHqCpq
	iiuFXtif7REnKT0HZgZuV9WOjj0eqd1bK4AnUoomQBJHju0BmBrVG5h1g901skCjsMc6K5ldS1X
	YdoclvEbtGQGktHJBfLgjsbHdzfemrShjy++umcKVOySvhtyz7t0m74A==
X-Google-Smtp-Source: AGHT+IFNxa6DPHsE83s7VHoRFcwZshVZ41bCnYbQKpm89CbfRxgsUxs8fFz0skmgp05sI9qKmAv98Zh90yZk49Tor58=
X-Received: by 2002:a05:6512:32d1:b0:54b:e70:4122 with SMTP id
 2adb3069b0e04-54d59697e61mr1955095e87.21.1744743383630; Tue, 15 Apr 2025
 11:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-5-f309f8d71499@gocontroll.com> <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
In-Reply-To: <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 Apr 2025 15:56:10 -0300
X-Gm-Features: ATxdqUETMW1I9nEhZzbzObdwy0X6emkJSQXXceuVqIn2uB-H8JgZsWUwIheR5sg
Message-ID: <CAOMZO5BdFm-Yj+ZCApND+A7n3m5QQ7F1q2eS-eUrdGXgkTZRpA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:53=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Apr 15, 2025 at 08:54:28AM +0200, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It ha=
s
> > 2 GB or ram and 8 GB of eMMC storage on board.
>
> "or" ram?  I think it should be "2GB ram"

Please trim your replies.

I think he meant "2GB of RAM".
