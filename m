Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD320277C8B
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758281045; cv=none; b=CUidbed8hsPgI1mmmrt0uHwFMvZNkceHk8XywTY2yEZCMELMAGXxzoIOJv09dJtgtit9/ALZT1FprQF2y2cEdb0OxwHYEi7puW1mUlztVh+2Lu8j/zPwNIUVxPqthUG+utalVZEh+b0CxTWY3B4sQRpGlftgaqum6zwnPy4Ealk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758281045; c=relaxed/simple;
	bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srcD6pdh6zv//m74w6sjhSpu4zyTz0Z+j4620DG5wNoMztOwTcov9hBxa1uwzmGmTIfxe/bdFTddRR5Me1spcYp0aEFc2kDlWc7YTR6WhUNKhKs17ZzVyU/Kv/JCBwCMHdX8xaOwHg8z091mgNrnTA067wwQvU7UghNy9coVB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M54bqdJy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M54bqdJy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so1318253a91.1
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758281043; x=1758885843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
        b=M54bqdJyZ1j0BdMxIrTlBbY/uxG3zGLc4XUvSziy4FHbqTNr1Sfu7/xURSKml/jBJU
         FYt8z7Jvcz4vyLdDMFFv+ffwCdQBU7vwy69eIZPB2GFXtqF8qIANiuGOxp19XVI0lAiO
         Qz2fZlku9Bqw3I0J5irIiWIgX5CvM2JpHHJ9uJAEFWR5TubOiT5/Na0rQxBWCLeXSYVt
         4v7MLoM0x9L/D9wPwBWcTgyaED83puR4R4eaHB6yKKJJPrHBoIoe0MFZh27ikcC9O2j7
         wZvdtn3U5qRiAoVAIa/4SDv/9muDANQVpGWffVNksjSlkump8xXiP9ReBMlu6Fs5T0iE
         NZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758281043; x=1758885843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
        b=kvKkjyNu+HQId7+QF7VHYPoDedcZ+iC1UJsfXAyWMGE/pyktvs+bRZoqAmUwAMzD/F
         bLzW1D+TqDxDmSm41+7VSZSmA5ysHUPdLV1qXM0tXTaIlA4qCrz9PcRygZV9IEvvbIEu
         dmikYR4bCtG9KNSanuHW+xCS8qrE9PTRhq+bHJU8vByEvnZJB6LFljlKOupMErcEDR47
         M42lD2x/SsVvZKKnGcos+Mbzj35vXl2mXze9lOs/KEJo2X1Ran+ZBRFbPl1lMYhYeGEu
         4tkVJJsNIJoEZDHWS13qiffFGqzaMZjZRsd4pTRX9oRQNJlv+CzMvX6C+df8In8IypQQ
         2V2g==
X-Forwarded-Encrypted: i=1; AJvYcCUbRMpNw3f5nKlIVG1s+z9iNhPN2fAjpv7f867i67gr1Q4JZyN0lwWJYg2aUuPn9Ou/Zvk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn5KwRzmo1ZSMI91EVZbC/uN6wCnkdLynRr6JVxJGJvehy4X5F
	cLSl4kaf10UzL8HPv8GYleBTSB0JMbmLX4twUBNg+g7OCCOQoB3WzKMDkKr1AvLhmiqMoHoWMku
	u26vjkDkjniQFBR9Cv/5Q120J2KOYZYc=
X-Gm-Gg: ASbGncsH+H9pR4Jh9xaeqWaFXlY3vX1kxktff+i6a3lAxjsCg4p0/myRE8ndpUizela
	SVZXCOfwiM2AJwJV6rJYoCnvGOl0uB5F6oedGEPEHsxHcaoD2ICtHJkK27FXUNKmQ3JK79x08D4
	lU1Zeb8ysdUisAFzfx5xijH+L9PL5yky3hkLaejgS1wmyIvMcnHQqwvyGhj9stQJGn3J2P6vwnI
	Vf5JpoaHv0l8ccDhZMPPFHXa9cdBSvrxk75
X-Google-Smtp-Source: AGHT+IGR+j53MtR7Ycbzac1nvh8/Xsimed1/N5Ir4au4nEDEE6nsTs+zulbhVQrxaMtQaq9Cc1ET2UPKXkixOlwNUv4=
X-Received: by 2002:a17:90b:3a4f:b0:32b:d089:5c12 with SMTP id
 98e67ed59e1d1-3309838e042mr3853941a91.33.1758281042999; Fri, 19 Sep 2025
 04:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Sep 2025 14:26:19 +0300
X-Gm-Features: AS18NWCk1Oc5eecL3-ZExUWvIBIypCHeXmF72jHYDkEXM6phwnZTdZT1871xqCc
Message-ID: <CAEnQRZCByoFeuH0KyPbrt8T4pPyPwG1DBvrFQq82mD3KGPTuZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] remoteproc: imx_rproc: Remove the assignement to method
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:53=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> There is no referring to the field method, it could be removed now.
>
> No functional changes.

Please mention that you are no longer require to provide .method with
imx_rproc. We are still not
removing the filed in imx_rproc_dcfg struct because is used with imx_dsp_rp=
roc.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
