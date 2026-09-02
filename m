Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C348C37702E
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369039; cv=pass; b=BGVXQW8ME5WUmwSursBSMSa/fS5zEkiiexGrb+ty30CLxA7N3XG04826tPfHexM/N5f4fuxpAmRUNnZIDC+DoxL5T8WGuVuoMduy0iUOPlKIvDiDoMngolCTN5Tc+MZ1AUqh9HQq12TJcQ/oWrifCEGnlH1yabh10C4Fgtdi7aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369039; c=relaxed/simple;
	bh=mTnQX3Mp7xcXwmjhHicO/NT4zipxlJZDBHdnZk6kKHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmwBW8ObyorP3FLJjAbny5RFNBLx8nJ26z1MAIXeEX3BLZdOpm0LhLXC/VVtoN3hmfnWfy+Ndhvtdd0J9QeTkxS+y7BmPEuttGSPoz5OL8fIet/LcLPSP/ZOFKWFh9lDgv7Um1fWPw1kiDNRimqhcxU9JJhvqBtTEiG2QRFYFFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YKLuxK37; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YKLuxK37"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-484415c8bf2so1045294f8f.0
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 10:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369036; cv=none;
        d=google.com; s=arc-20260327;
        b=qGx4r1ypdUbdq3GLUVmedJJd1qO4Hlpr3l7HOOWqB0lPqXjRrJFnInJelmTDIramsk
         3L1cFc4W1nFTXdOVCTzft/MgDNYzTOwnFhjER6R9Sjpqi4hnzC2d6A76wVt33qolitIi
         54mln2rhbvhno6gj8y9AWyzDJR0YRANO0trpAAdNnJXHet1P+vqdRp0ZJo9Gc/U3v+ST
         TC0W5mqnIkexjHz+9tUUltk16F7q2vEi1w9jzGfXusywXDKB/QnHZ0ybEU8HPSaf6Ps8
         mp32fmiIiwOTd9qk3cd1f3mYHTmtIkK+j8MsQtkCT70i8w6owtVUITFDqCqe696N4u1z
         plSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        fh=6m4nV2aUX95w8vSu7kigd8kmL0dnHgN6d7N4L5F1iw0=;
        b=Tt0So9ubcBovAzaHMZ6m0aMRGdVc6cYbA3ZTp4rDXKN+NImB+ED9fe5Vp1pIArc9DC
         v4eDbrbPzOHZq+eK/TaegBMDZud1efv+mS/vL9c1YQz6/8VSZkIMX26/D7GRxwm5nBDv
         7bO+K4obAZNlhI7qQ0lQI2zuUaEnbQpL8SkzDI2Ri1tM6SNTgH7DuMdF4IUkhFsLxL83
         3qx+6HG3kLEHbe8GD77qJ1fy2KoCsDEj40ixd9ityoDhN8baGkZ9QC4wqNBZc35vmN1p
         EHp9HIK12ITHuxOzkEYli7eCYIhFMk5AWhSOTVeFuYzaU0XRX3UQJklU/9CZyEeq7v02
         Z8Cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369036; x=1788973836; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=YKLuxK37z2CNVyZLjFOzNvDvluCMJ09vADF6dAApuquIzXJMkzsPlKbWIZpgwmiH4k
         FtoyJr+CCP2iRxue2jQy7Ony5ybIe2UiP2D7jPIAk6hhlmrsDy+aBvEujjJvMMsHwN8a
         FIifxFow/aoNdAGWDk2qMz27Tw8X2tJbsL1Gb9br6rDoqfC7FYOKNN+AKGiMQBhwWIpM
         2QcVG63uK2k/JDtoEQL+7tAGiY4tFpVlp4lh6lOK9MKQibCL7Nx85Lmn1i2H4ZbVteWI
         PK/sULXEAudjh6n2l2boknHDSQlNy9C5nJ4NA/h8+VynJnxVHuBq0T9n+UApGW1zZhfJ
         ocbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369036; x=1788973836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=kw8SHw2n9j28iWcehL9mnkqysmfzrZyLy+WovltwJW0qwFJmZAr/IVGG7odWbQxwUl
         +AVj+0fmWzOys5caAkCasorpQgsjjaK8DnKYXon+e71ZWk9qiALepWkVUU2Wsr75zR0P
         l7Nkja1j6+YbHuTAWrmxjCauvHO/m9EixeD8CpLqCfyJ26fUGAnmYllvC0cXw1qT7XYF
         lvg3fcudVmlXLmb+uP/acrhcLkWnOrSNJGxLQodJTqyPVt+EYKUcD5aJRBh525iOyVli
         f7BE+1aKM/PP9Kcg+yfrrtpRnKQDfrYWJeQLadB6hCcbFyJNXoe/08z/ujsX8SZGne9A
         in0g==
X-Forwarded-Encrypted: i=1; AKwUvBz9zI50oBBFE8X3sIdxlNQKI9DYsUu/KsbyiziDk34HGNAub9AMMfkaatCUnNc+X+7o6kU=@lists.linux.dev
X-Gm-Message-State: AFuF++n52zw7pzAstukEXpxceNsUp5rCvWGmHpgnrVtFx7xD9eizIqCn
	uyDej1eacpa0OHdaLdJh7LO6crMREW09schv78EuVpBH8ZvNSPcdppllkx/GPHE+WiBcuDC04Tk
	J2w8gKG1T26tZOobwcdFFh2YvhDraHaa1hy68FjMs
X-Gm-Gg: AYBFou2xfbcT5TVn+cruHIIdZjYQvX76NPb5VxZHFuRFYC6yJbT95kv3okADVTkhJZw
	ijAHidDXHrrXVeicLd/8Kpp2/5g+jLgetm4IwDRYROl3FYshAfOsZSpRnIs7n7t2lEiJS2KUinc
	INU4GkL9gM9MmBnlQdimHsNhrGr4PXpwxMBIedkJKP1fJ9onZr88Zp43q4/puXdz5BIqvqUHA+2
	zn5K/r+V/sNCFdZJB6p4KsvELfy7Cnju0G64ZN3RMGiRVhifM4lrvxuRvGOQU8c8EME+4ckVKqe
	pmsgsK91iUBp+Qb0fxBiYpdCNCvT4AWuC+DNtBdgLEvO5qJyXPpmw0tiYXWII/PYqn3mP9Fg6Pz
	SuGnwAaI3pK7+PHm02eiBbDn9f67gd7Qwe6x1w2XD/KzYDMnyj2NBZbk=
X-Received: by 2002:a05:6000:4817:b0:484:40b0:ef30 with SMTP id
 ffacd0b85a97d-48488deded3mr13204952f8f.6.1788369035314; Wed, 02 Sep 2026
 10:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com> <aphSYUS7xGJjj2gT@SMW015318>
In-Reply-To: <aphSYUS7xGJjj2gT@SMW015318>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:10:23 -0700
X-Gm-Features: AcwNN1XAESqNH6wBokuk-x9G05tfeqXIGUNdG4bw9ZYytsqReJ2H5J3a05HeJ1A
Message-ID: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> Nick Desaulniers:
>
>         Is this patch good to pickup?

Yes.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

It does depend on
https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/
though, so you might need to coordinate your PRs to Linus with Nathan.
Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-er=
ror-v1-1-b27015390901@kernel.org/
going via kbuild tree or what?

--=20
Thanks,
~Nick Desaulniers
