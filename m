Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823913EFD3A
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907282; cv=pass; b=SzFREIcKq7TH4kaQmFKh7Y8+4Q4CUg1PlVO4q8GnwioZ2u6BCxQk0iJXXRxzCIMQYHYRw8oRCkKrFG8zdZ3DAiM5XGjHAmKZtYDl0jaqILy1uHBDxDgoi254qR0XGRaicM7ex11pzRE2A7WMFvz8cSsWK962t+CVy1jgF4LuP9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907282; c=relaxed/simple;
	bh=G67HGmUfVGd2ZvWRQTeaSHRPd97M+0Ot/yOxv4YVwbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEl3yZuDPiNcHujqHCL3nCq9GCEOj0RjXNQtGFww0DiCJdz+qiab/tRW6y40JfUyZo29+qkyz0OYVoh2zsu4eJ5UCR2FIQpFrIXH3RoclhI7VxfAcXsMSzVXtTP+4DC0EWt/Gz6Hmu21oVImTNgVqoiQUUa/YOr3REvKTCUZNoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpDsprKR; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpDsprKR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so3026109b3a.0
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 03:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907281; cv=none;
        d=google.com; s=arc-20240605;
        b=iz3C+Ey+qMsZTb2ri+raMZr0cvIOFwpRZJY9bzyeJhNFJ3DPTwPe3FoNdJUBWR6SFx
         ROkuTO6hBd6sQrklxnMCWemuoVIgjeJnFXRwM7rkXqTI8gCjffspKSwMG3DQaBNkcXzX
         4SRjFzlgfgoYeVhZmSpW4Xz7kYFHTSOGFlsEoYTpS30VYuC3dnw1U83KiRMHDfuPPGQu
         ZT7BPsBcxh9YJLBN6grp2JhQ+NacRtWvBEhNEucuqYdgFIk71FiWJOMavk+BrlNFa/ha
         bKboo8FG4GtyredMCiqddu8FYUORY29QTycCGgnTxI28luXTivqPpf16E7ma7zM6Qsaw
         QNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        fh=6yhkMRa1Pq8NoWJrZT9GDxWIxuLoSCwhVI4jN37wYOA=;
        b=hPx6jqr2wTqVKq7ELDeyG+4tuGzpH/Bree/FEzpXxbynQTmzWVt6VXasT5NiAWJCrL
         /bED3koO2UjN/wz69nbvE/eqU8t+xGr0fjmhKObCKK3Kss81AkEm1E3AqZS12YDq6RqY
         ljD5kbFMji9iXUE3L1GTaeKiqJGfkW8kRw4wJ8eEoFYPqKAUSLBnIKTv5a+3pXom5tEF
         8l0ni7Z66Z/6QgBnmE7d+X1ah9Kpyyd86G7i8AkK3hPZgrPjWWnCaEsLTTi7oyXH7HGN
         rNr4sRnvF7EDTfal8nutuENaEgCf8g9s2vbLTrNlh4w3+3SsLOKsu99fPyc53JgXIWa4
         2rZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768907281; x=1769512081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=XpDsprKRDK93lMn8JjBnbu4F1RNj2AgPta6qeKcqv0iuND+U3MTtkD7Aq4KH8aIciK
         KtI9hWqh2mZ3lsgDc+xEoM682crCznjdYZ3LOLQE3GQmej3YM9xJxdmt7rXLWjbcOgf1
         +rJjv3rifJokNbIOt6PaNdKbHjAJnONLlt9WNYwhElgvzcWNH1gAi8YzGA/ZWHLUZJYr
         nf67BynSL+EFcOnuHX1W6OdiLWkfb7nmGgTv/mzyz8ybz9/q7L+aAGKwIxcaqrZEQazo
         gUYkDHIEiEAnTXhmWHj4LhQWL8BAJ8wzmCWEEsnoH390h+sOOyMPQrWqD5Zkwu/Mziw2
         4hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907281; x=1769512081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=HkedlkHTdcM2eB4eYxwC16BqRZhfuhQVH1M9fP5UhH7Qv7figqsA9IBPgVdvyyJRQA
         nhstaLPOoHNDcU7N0ltt2F5wYdhdsC9RqcoDJ63SSAgvwkGPPqMt3fdInPvdmWUH9A3f
         BtckmdgQce9xKGAdc4PVs7Q/nzZGzDSgy5mgsk4E7efm2PvzOjumoYXzjsg58piZAjU0
         YI2XNYDKaK5vfZlNrHWy7qfTxT6a1nj2Q6ou/ShYKmOV967dJBDi01QVvw3gXzWn9oMl
         pxH8P7uMl9JGliltPGRFuWgDypQ+raNXDJk73ktKOXAVd+WnTzm7GunRVQIRy6PN/M+P
         Xtrg==
X-Forwarded-Encrypted: i=1; AJvYcCV3L39hcOJzxWcNd1CbtKZfr5zyLqNk/b67a24+VAj91kueqUbBKTiZkUv5yr/Vdbjkjoc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrMg7OAhNhgeKt49Ecq+H6UoQfohLl/UYOgS5r26CPJpxuqKKc
	kkQtXI5Q/JjqWJhoGLu1Pgz8lAY2+Dq0to+ZAbYq4YN5c8Sdu8QLZEntJCC2bRGA400pCoQRwVK
	ACNepoZEcMQY+ZM4YP3l0A9vdgts3AJc=
X-Gm-Gg: AY/fxX5bqDbMm9G/DnyA/ypvg3pSohcyMkfyghYUT7Bg283IyNn8b1Rrw43/JcyzZyK
	v0MJ2Aq1Tga9MLYz/zw3gsy6ETVTGQ+ENqnSiwqrrTGiOO+L/xh9ksnKnhSFRyk7wqXlJeWh65/
	yVIkl4TUYJKyeE1xq9Szp/BfbEyo1OJqoIeIGsfFgv4Lj5yW+5kfiXHO3VNoK/73Qx8fIY1UaTL
	A9xXuFd0LD7qV4UcQijtVICq17LiW1x5VdBLpcvPBjTEePLpyRBqm4rbXm24BG7uadZ0oGqsIqu
	+HE76Q==
X-Received: by 2002:a05:6a21:3a42:b0:38b:e70c:6406 with SMTP id
 adf61e73a8af0-38dff36821cmr13408140637.22.1768907280519; Tue, 20 Jan 2026
 03:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com> <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
In-Reply-To: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Jan 2026 19:07:48 +0800
X-Gm-Features: AZwV_QjlRWGRppxCrBr9lEF7AFifqLu4-_l_Wvfec_Mh4jj0zdL8Z4fH3sbuZEk
Message-ID: <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 6:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> > There is no power domain defined on i.MX952, so make power-domains to b=
e
>
> There is no defined or there is no power domain? If the first, then this
> patch is incomplete. Please read writing bindings part about complete
> bindings. If the latter, then you miss constraints ":false" and commit
> msg phrasing is incorrect (and remember that in such case you won't be
> able to add power domains later because now you add complete binding).

Thanks for pointing this out.

There is a power domain on i.MX952 for the mix system of AUDMIX.
But it is enabled by default,  AUDMIX device don't need to enable it.
So can we make the power-domains to be optional for this case?

Best regards
Shengjiu Wang

>
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> Best regards,
> Krzysztof
>
