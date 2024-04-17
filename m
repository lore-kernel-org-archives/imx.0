Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF254126F2C
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343490; cv=none; b=gF2rO/lBvSnMbxSnIBfiPGDJ7yA0R6REzT8LGPnK9fSOpU9wZaAxiEuwOef/YqeNe5xk6mmn/eeRuKDyPwAFSvb/owDZERSRQzLgVGwL7CT9yN7cd2JifIIgbhOfbuvagb/MFk9DoagCcd1pyMZ9xVjtTiyreKSiCr69jm/nZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343490; c=relaxed/simple;
	bh=62qdf0MjfZ9+olO2ON2tKhaWuTwZqvJ4hVI3GsU0ZsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIdIp0t/BVQm2HIKHIONSh3SD+dnaWnNo3u55VD8YT48/i7nWHd8R1Dw7RXONqy8ipCJB6trrB9HI3mAJSe7IBni1Ax2uEpQQSvnxPGfQPRxIM3GkeFSB0UtPu1UGkNP73t/fjBiAnZf0kr/x2i4euY++l7JZhjWybXQlxcRHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btsaSwbt; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btsaSwbt"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ddda842c399so5552510276.3
        for <imx@lists.linux.dev>; Wed, 17 Apr 2024 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713343488; x=1713948288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=;
        b=btsaSwbtFAyRmMxJHJtQhn0PeUW9AD6M/OzDAOcxPkFEKH9CdIYvgvBQ4QVXt6LY+L
         0iUyJleGQMXzjdCxUHFaC+88GyIOs14Mb76oBbNksAD0lJxR4iktPjPzG04b3oW023bT
         KlhMimvP7Py5xe7ooPm5G3tMqI98rx3GPx/Q72XxHaV0CiPamyUq9lRZXlMBJp61HNSV
         /qVSGQctFbdwJYTDjETo15Xfu1B2t/7bPBqVz2fEI1PtufHF8UjYQuEfSbPZaOGWlG5S
         uSZWTNmOuS3yoiLTq7qeUQiwlQjpeP896CWqWZIbIP316tbh2cV+kNaYZYPUhuqVqpAE
         n/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713343488; x=1713948288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=;
        b=Sxoe4h1RC9aIO5slBgRCXT0jyFqBflb103GG6AqQNFLW7ubh47o0dIhW7UbDg+0Qt1
         fPKEFIh++yYoSCNU7tYxNY5cYfz1ySUW5OWJvFKv1ZoG2JrdXkRjDoTzPzE3J/NI2z+h
         fIjwFRhG1kNqYmLsf7ikIr5u8623IWfh9wRRApJfCIO37t4ZgYZT1qZHrjywxEjLRVnr
         X2BkSWU3nFMMBZC4eDroxBw34/PyTpVTqRhVh6tTO1I9f2kOgI4QJiWnv8kyZLRqmLg3
         kcv85fHJ9pY+xfwoUsZtq9C5RZINfBJrU5VZ8ZyFTRFb/zNp87rSEilY+qsP1ir34qkH
         ee2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXFsi3wOz0ZfAnYkyLyH/SevTTr07wUMBKnC25DjLj6ZdOMtjP/k0ZPSXH7KtrPrNeKH0Z8pfNyV2ZgKqEAw+PVztn
X-Gm-Message-State: AOJu0Yx6G7fyDvC3ZY4AppsDZzEXbgZ2lpmKMHWA/jjAy280s8NZVXD1
	da3ke3BxVG72zSw/47LmIJrXDIAM1dMB9/7fGfjDbRELOiUMW0WH3WdnlSYJpMHVO1mluucbzgS
	/cAwFdR+DEZ3z689knPPYlEFtW3z9bhKf75bTng==
X-Google-Smtp-Source: AGHT+IEqHMRvom0iWLGcDMIX6MMDmGJuXm9C6a6p3VWgXb1lMC9v99HG9mosDP74t16pkkQoXUvXtUBwwTi6W1xBvYw=
X-Received: by 2002:a25:ae97:0:b0:dc7:140:8c0c with SMTP id
 b23-20020a25ae97000000b00dc701408c0cmr16434750ybj.23.1713343487742; Wed, 17
 Apr 2024 01:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411064614.7409-1-krzk@kernel.org>
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:44:36 +0200
Message-ID: <CACRpkdYDDJ9g5iSZvi_4pPdH3LWNd7PHS4QP5mkt2q+O+t_FAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: freescale: imx8ulp: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 8:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

All five patches applied, thanks for fixing this Krzysztof!

Yours,
Linus Walleij
