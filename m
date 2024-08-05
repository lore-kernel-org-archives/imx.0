Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1489055E53
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870290; cv=none; b=PwFW7GmcFxSgqnJoyP2ujJdvhHYvvnINOuzupCFEWg2Xqh7h34vwfTg53g1TogHqqDvXS1wpdEkp0pEtTbKU54VVPeCnK66vCRrCXpfbP951K+zwIXbNjLSEoR/Fk851p4WrqUu9x37wB0yIOMBdAwzdGccUskFf1RCDs/8d44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870290; c=relaxed/simple;
	bh=/Gqb82182GJ7ifqE0uk/Nla2L7+0JFR4zbzbtq/Xhqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQoGtLJPRsCZfkDSI0JMVuHXMVswsGLca3w3RFN2Msu6ZQbiNY/Z6P5lyMwwPnYrCKArhWa/eWBQ45W6I7MPFodfJbc18/wToK1gqy2VbT7nszkEILFxrm/dTg4I3u6gZZhu/rwcSMWhO+7H8yWldVbmNrRdaF/gAlRLCzDHcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRE7aQwD; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRE7aQwD"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ef9714673so1685884e87.0
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722870287; x=1723475087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Gqb82182GJ7ifqE0uk/Nla2L7+0JFR4zbzbtq/Xhqs=;
        b=LRE7aQwDm1ROZJq6NpiguImu8uYmAC6RefprEL3LSSUfiqdU3yU6zjlORVuAsCA+68
         hamZOV8uuZXQp2rf3GcGj5Vzg3Xwq+puzqAKGPKqc6nkAmTOIgefSaES9tm0YnS3UrOi
         +trPhg5NWJELOnnm5qPVwx47f/FcViC3/IFjxZ5BOkb0yrx22Bg+/OxBEhf3hnyY6i91
         D5pi7mVp0ba4pBybi2YlN40ykhy/G63NGkFWStBTZ/vb92aIonI/rs2FNqqD//fyGr34
         vQDE1s40I/J72jAHiD2rrBjZOwvny9UnRCl5+4pkWrGR8i+3xU/hdyUG1AkbbipUQfdg
         kgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870287; x=1723475087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Gqb82182GJ7ifqE0uk/Nla2L7+0JFR4zbzbtq/Xhqs=;
        b=lQaEcKDLHiLbna1JE20kSpK1wrJZC+7ALP4NFmIaUK0nwGmCL+5tuYNrxtMftSMFZg
         jY200P9ToTfKZ1Otj3zV97K0VT4lS/C17FSpqABkNKvdhZ20BeI2KjGjpQ3pHndnqEyp
         cNV9zOlBIyCVmKd77cAQLGGSixrBVJPqxpvzk0zy7idM9NTVzlnDIXIaNPxKJFSMHeyM
         ut0dekIjjBRdbOVkFLnJ+WgwqGDuqwrUHdMaDYlUXDW0ql2uwQfRgEoLihr82zqYwysj
         HJiRZPnkJCduJxgBIq1LPLhRihv3J7wWWTGZCnfDa4jRAhFxbzSIb038+FiJscmrQC50
         hYFg==
X-Gm-Message-State: AOJu0Ywki58TdmLLq/iY8r75GHMEsc5xN02DPiesfH38GIamTpGn2ScR
	pNhC22KN5r78zr4WEgwK9FUMwu96+RyeGsWE0KwxiNdwVHjwc86hLAKl6nhdqG6KObN70r4/Mi1
	mVHf4g4K5B6GEY9FzSOB7UqBlVBw=
X-Google-Smtp-Source: AGHT+IHtXF/b+BdgRW8ydHE95gguroW5hoRvA3hMIjAViRuKfUcgtBZQtCBnMeKEeFvh1998hhv6k2Xrmz0ePllO4Kk=
X-Received: by 2002:a05:6512:3ca4:b0:52e:ccf4:c222 with SMTP id
 2adb3069b0e04-530bb3b7bdemr4459342e87.9.1722870286858; Mon, 05 Aug 2024
 08:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805145735.2385752-1-csokas.bence@prolan.hu>
In-Reply-To: <20240805145735.2385752-1-csokas.bence@prolan.hu>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Aug 2024 12:04:35 -0300
Message-ID: <CAOMZO5BzcZR8PwKKwBssQq_wAGzVgf1ffwe_nhpQJjviTdxy-w@mail.gmail.com>
Subject: Re: [PATCH] net: fec: Stop PPS on driver remove
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 11:59=E2=80=AFAM Cs=C3=B3k=C3=A1s, Bence <csokas.ben=
ce@prolan.hu> wrote:
>
> PPS was not stopped in `fec_ptp_stop()`, called when
> the adapter was removed. Consequentially, you couldn't
> safely reload the driver with the PPS signal on.
>
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

It seems this one deserves a Fixes tag.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
