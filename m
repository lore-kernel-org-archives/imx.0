Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A734334C06
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950787; cv=none; b=IoPY5x6iQ+RMj0g84p4xuq567O4oJq5j9W+taalWpngNBHbgN/JZNsZpy2CvbwRFqUA1jw3neVvQEVPrIm7z13bDUz/Y1YYQSfeJ3XfOdWn3vSkorOSO/rAHt4fz93b8nkRzVEAJtc32CPA6jnHq0b3l4s/Ir9r1Unzyxjlr6ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950787; c=relaxed/simple;
	bh=GoygDqYWw5QnBxpPn+aUvq/6hrUvKX40S6nIeuv1rgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvvE/eV2NuDP3osm2Clq9EgnI2/Nig6JMvAOcwA9lLYOiI/DUUKx8NJZ9QvdNz7kMbPXLMgUuA28qKmPgitK/OSWOTnj88vf1Go8FlAsAufRhRRK8etXHUeFTiq6JuWSoHlvCvb7iFjfTH+XpbqT05YZvq/ghBp5eibVeFiuOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO8JKBsH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO8JKBsH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-298456bb53aso8454255ad.0
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 04:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762950783; x=1763555583; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IuUTav2xUOTbkma3ItG1F52J0EZPCIhhyycd80cfuj8=;
        b=VO8JKBsHhadQjb1Ok91TA/qoG41dMx8YBj+TbdAU1SVc8qupZpfg2f0TX2f3QHzRDz
         HW5ujzAsh/xX1WW9nCcDvAwSBXt2q0dwPVUwGCp/DCCkPMo8QdSVMRpfIVUsdHEPBW2B
         x+D0BmctM3Vz8g7Dy6g03nTRnrnRd6L81ov3Xuw/xy72kAntX50pfUwdwzjfsGrrLZPY
         aV2DVj5gBWTIKplPzY2yDPRw8Ge9ybyzN625dNL/L/BhRoxCtThaumqqmjZ+R4P9FlK4
         VAuWTdM+FnWfdw6t55vkp0jZ3Gb+t/q0E6DLNigC1hwkRBt0QDGALs4GJQyxBscrkZNz
         4ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950783; x=1763555583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuUTav2xUOTbkma3ItG1F52J0EZPCIhhyycd80cfuj8=;
        b=tipyX+pSGuNFXvUO/L2unlkqkcRKEcTSrCbFPpr+UmeQ3LSQ2Yom67Jm6tAr/jv+iG
         8eV83VbeT6mZHcLgCb3+B7uHZgZI0Vf9AMgdmIWssKi/5ANpV85JhYn3QvZRPhG15SSS
         VK79k4mWAKwz1inBFMTP9qDZaWl407n50q75VOY8CVyHA8gfr5AQFeFlFmU2qQ5N7zhM
         QobRlNzX0mylYmoqvFm7p768XXZC3qC8VrPfv+ISvC3i2twAGGaQ7pDVP49R1vSYZLl+
         ZokTfBFujGIVylBkY/H8/r6SlX2N0twASAJ2lRN0e1APXby8ncLMUGkyB5j8xny8JXrX
         JZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUjnfRHWvfDqTPAVOkTIDbZJ2I0j3Lqd1Z6ZVciu9y/UVlotFnMQ6dM1zlRXk6nSryXOxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrS92B3mzaXX7yiSTuojOvrVsse9vbzV4dwdXAWB1uILnADOeF
	ckRtn1172D17G6lZtt/4t30vhqPB7Fm1K9AIk6wCgyam0lAMl9XkJwJbkQL6HzoLeexZKmwvFMo
	yTl0LASQJej3dRUWsCnLDF8FvwAzKPF4=
X-Gm-Gg: ASbGnctcBq+UtqHzwU6aKqcktzXNQBWq1z1FR+Ix6PMDYn3nKpQdL1q/4rQBRkR7sUi
	Tn1ZVXaYYeJlkuoBW4OnLdEnADVAkkHMWdKQsHN+OCOB7ZCe18sa96xucg2m95Js/QxFN2z5AWw
	k3hp2L2HQIsp5XGtfuJg/XGqm0bcG1VARS6oS061BIPCReRZWHimCfigglX5EMZVvcV+4nm/bj+
	gpHafgu6VJjMFHBWWpQGYG5o5idrzthtjFv17Lbvh6qZ8jiA1ema1hLlQ==
X-Google-Smtp-Source: AGHT+IFabhPWRSsuZsSo5sbgc0lLZtsJguRmqpiSDLmiPKtI899emQH3LjICEzz3+Agz/sH6qEDUHd1ILnm2Zjkbos0=
X-Received: by 2002:a17:902:ccd1:b0:258:9d26:1860 with SMTP id
 d9443c01a7336-2984eddd8e8mr38233045ad.40.1762950783418; Wed, 12 Nov 2025
 04:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
 <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
 <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
 <baafb460-fb65-4cd2-9911-89d828199d9b@kernel.org> <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
 <CAEnQRZDg0yAjR-a-4J2ZKAjh3mm8NeQCA=o2kyNJtXMAFCMLAA@mail.gmail.com> <56530f64-6ddf-4d2a-a079-0578db260449@kernel.org>
In-Reply-To: <56530f64-6ddf-4d2a-a079-0578db260449@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 14:35:26 +0200
X-Gm-Features: AWmQ_bl_E_pJAreACwvdhcI2KJRqNKpXEYmnMwMcnpAuTrSvxvSsy1R2nTa94KY
Message-ID: <CAEnQRZD=h5qOC445U3_+HPh7aCE8TohSpZmg9hgkRE7mg5HUpA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"

<snip>

> > We (NXP) immensely  appreciate individual contributions from everyone.
> >
> > We need to be fair, the v1 of this patchset was taken from NXP
> > downstream without
> > respecting the Developer Certificate of Origin.
>
> No, it wasn't. Please read carefully DCO. The chain here was not
> correct, but that's the only thing.
>

Indeed carefully reading the DCO Clause b) you are right.

> >
> > E.g there were commits pulled in from our internal tree without
> > keeping the S-o-B tags.
>
> Read DCO, please. It is not mandatory to keep 3rd party SoB. It is
> perfectly fine to skip it, if needed according to (b) of DCO certifying.
>

True. In my understanding though if one bases their work on others work
they should at least keep the S-o-b tag as a common courtesy.

Commit messages explicitly says that the work is based on NXP internal
tree patches.

At this point I leave to Rogerio's appreciation on which S-o-B flags
to pull and how much
of his work is based on NXP tree.

Thanks a lot Rogerio and Krzysztof for helping move this forward.
