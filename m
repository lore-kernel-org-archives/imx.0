Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF664CFC
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712574889; cv=none; b=SyPazIGZRri+E//ZNq4rELEZowAX6re5s8lM1or1Wa4IJNTNBHO+u1twzk9HEt1R4sU1NRlj11VAYR7OKxhFuWJBfoUkZuv/QXjd3Fc5T0hFZhCbv5XQb5p/iZ/2/yM1ZpkwqSlbYbUro8BZbQ3u4UFjEDHuGTpg2EMVgd47bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712574889; c=relaxed/simple;
	bh=Hf3/uyTTc7xyvyt0ZRCrCnTsccSJPrqbnLcWcjaVrLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EH8EgtOx9n5Fv+u2RZBvZpxqzF6CQeHoNM9YPqQrbCzqtuKsNIIzIEWsXUunZu8WqRuvEwUxaHj/7R/c4lYfsJJ/w7gjcfZPGhTrCzZF3clUMy0qtqNz0WDAld53Jiu5ka53dlE6hloPjT2VMBW1TNO14j83v9Cs2ivKeeGgUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byN7+8br; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byN7+8br"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a2d37b8c4fso1218030a91.1
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712574887; x=1713179687; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5yiPdvyV9rNRJJhuFWlvTvKqry4UGZkHf/m3Yo7GDo=;
        b=byN7+8brK8LlF2GxyNe9ehjQ39ZklZ+3gy6BzMN+lRTJj+Wm3vlsMcnYaNWTVYhn8Z
         ynGWNTDdbI0OY9H4SRNwA4mrzBbR/WXMQ1t5aLvoVHLj5H28wIc9+zuJGkZdygYtk6JU
         fva4d1URYPsido2VhwurHI6AkRI0imr1b4tZkWUUx978SaiEQTuxqZ3e1+7yp9IRgpf3
         sCe8dveIFWaxOI85pVUFSwBGgkjH117CM/XFQ0o8hb0k3MvwBKd2/q/2qVKvFOHIt+Eq
         D0cwYpkoxw8NuEknLX3Xw76q+p0iOV56WbItYFCGTXVoLH+bXF1LpRejhzEbUAg48De/
         W5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712574887; x=1713179687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5yiPdvyV9rNRJJhuFWlvTvKqry4UGZkHf/m3Yo7GDo=;
        b=BR63Irkr5DoheXBP0xkpOnV7gR+G38N7cgzwkmjJTiKX6hGnKUDh6lA00gE8o6JueT
         9bKMxhPonGrDVkEayOdsShCopHwQtIHyTc4OePYy9kWXYsKeh21CWD77YHl6UTbI0e8j
         pyJqgePQ0Xwr3o4a+CeAZlH2yapksbKegbmS4JsoL/63+YY0+5iPeJ8MrWfjd7mzzeP8
         lqARZrYgcYr4wgZX9ID3/UhYcx/U30FUqhKo6NJylObKw2xGA3ufiVGJA4YJWyTI0cUy
         hNXew/Bee2KuVqALx4uAPbMksPl71dg27aFEKPH8yH0i2ezNFiZtWq3bWplY+IPV7z49
         V1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVq4ZVXajnZ84i1XCp17TWG3yxf4yPobHzQW/o4QvB5C9WwdsOUdFiPmJUdWgzfYG9lu6oAGAY2YWDi5rGPqAlkrYcR
X-Gm-Message-State: AOJu0Yyzrn10VXXxwer8xTeqBOzo7AI+xnjQePtxKxecAu2OFXJa9YEi
	UWhmswnoVvi2m/CNjwW7z0OIJ3goCBvzFAxo0xlwz9HdAI85BBDg3i4wsuSNfUvgIq0tZLQnDZF
	UAedMNESPd8KouzQlC21nwYduXxw=
X-Google-Smtp-Source: AGHT+IHCMk1vG85ZQnizg4WMLxtCMOThz1q4RK1dWajN7Z6haa3pN+/ibtoYI3BJZsJ3JH3vODvpabpzfLaIbxL7wQA=
X-Received: by 2002:a17:90a:b288:b0:2a5:3249:d230 with SMTP id
 c8-20020a17090ab28800b002a53249d230mr1160056pjr.3.1712574887276; Mon, 08 Apr
 2024 04:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408075806.1194297-1-mirela.rabulea@nxp.com>
In-Reply-To: <20240408075806.1194297-1-mirela.rabulea@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Apr 2024 08:14:35 -0300
Message-ID: <CAOMZO5BRY5YamT9bxPPMQo8A5msZ-kCUcxn9eLCJEEJwxD-J9A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] media: dt-bindings: nxp,imx8-jpeg:: Add clocks entries
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: shawnguo@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	festevam@denx.de, alexander.stein@ew.tq-group.com, Frank.li@nxp.com, 
	ming.qian@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, mchehab@kernel.org, hverkuil@xs4all.nl, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mirela,

On Mon, Apr 8, 2024 at 4:58=E2=80=AFAM Mirela Rabulea <mirela.rabulea@nxp.c=
om> wrote:
>
> From: Fabio Estevam <festevam@gmail.com>
>
> The JPEG decoder/encoder present in iMX8QXP and iMX8QM SoCs need
> the PER and IPG clocks to be functional, so add the clock entries.
>
> This also fixes the following schema warning:
>
> imx8qm-apalis-eval.dtb: jpegdec@58400000: 'assigned-clock-rates', 'assign=
ed-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinct=
rl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpe=
g.yaml#
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks for submitting this series.

In the Subject, you added an extra : "..nxp,imx8-jpeg:: Add". Please
remove the extra :.

My From and Signed-off-by tags e-mails do not match.

Please use the email from the Signed-off-by in the From field as well.

The same applies to patch 2/2.

Thanks
