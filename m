Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426A92798F8
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703627; cv=none; b=jc940BevE4I+cWyMI3baxAx0ioQlfKsZ/zbiiJrnEh4z+vjWKLAkV2/o0m3ji+4dckkH2cBnHz7qJsp3A/yAO0LVK+2LIPtewYJZyouoendevTSmST0FF10SHveJdKvaIvmfgTlKNtz4xpvqzJSmYkWT7fuI0UdJSfa4V4vZ5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703627; c=relaxed/simple;
	bh=D8NpYL/6xc4mr7rrNU+oPdbCsWAv+ESU6uE3kXfaDzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7KAUHqjRVhy9xiwHTnrENAoLDaHvGFoD+3itqRXKlo1HQwWBSSf7wH98PUSuwBJjLiv0CO24D4DZzEMOEoiEfzGsFIoyN841abHIcnJFyEZFqhXXXcP9Ljs2k/Vy2FtJ7x/YIBPOg/fSGkE3EJzVzQe+GubMTUYxN8ESKtnEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3vkkpqK; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3vkkpqK"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso48321151fa.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703623; x=1745308423; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=P3vkkpqKfNtt/cKr6jY96udFMKCGzsp0RP1mu/5xiD32NQpM831TFeGO0wXYpTc+vb
         BhGKyLPMi4X2QITrQfXaRHpa5KiLBajRoatQr9halELAlnKRZfERCEV+PkAC/AEXmk6h
         vxG0o92xlnnG7D3IjqqAm2qOBig+oTgAgHwX9u7gUA0+5JBYtCad8DjWWplCeZGZYOJa
         GaY6vxgju5onOKuzZROOH07Cj07ZnYpf4nBlBUXIM4xbuwz3+lgMhIT+cLrtlOScZNWG
         79sGj0YT/zoYEfX8RCU9pdiIeghgF3T7mM8bvqNGuzszdY0n2T8DJPx7RJcG/J0SiXwa
         TlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703623; x=1745308423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=mxCN/bqxtBwiNxWeNsDS6lr1KgZljKp384GxZ9Zh0zDwvGQJm+biu28jGibdqLnlLk
         37ir5TG3ePGsEZ93vJG07oL/mTirP/Ng17n9FQIGifqiD9fjYZrSY5hznMN9jPmqjk2m
         Y0ufuF4+ieemqAXnxq5EeOQbxV2Mlf++oUIEpXu33dOioDPrsz8lb3gS+1/1F7PU7Ocw
         hqlnujPE3VwSIz8oYBEIhRuBUAv0tTdwLRSPI1yXWzt78mawQaPj0ePF0KhsMiFsR8xe
         Ev9oVFGdNLg7EvxMGXbH0PFFWM9NwmI6QXF4p0VIesWOT/xNrnYTOgO6td6+jJ06HN47
         tVaw==
X-Forwarded-Encrypted: i=1; AJvYcCU9qc3XDczqM8edgc3TZ4BECe2Sn6mtU260P+Utk28h9QOUjyoqsnULot4Ypo8upuQjKmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgUT/Ecsl/NROwYdqYSTKWmt/tD5cBbs7/G2MqBRsXUDc3ysLT
	kUNgOIbbWwM0a/TC5f/ZOr7OrUwzSnGN+F7psZkTdePGBjcBQB+TM/bL+gPxCHkH2tnui69cNTo
	IXLZ24pqfvW1Cu2vHnxBVgVH77Zp3WxngKiqXJw==
X-Gm-Gg: ASbGncuEexqOz9u0WkwsP9K9BU5iblYbOyjUSkfYfjXudAQX1wZooEJctRoNddziJSV
	TOxPfoX58iZBrm4LbQnSOSPNKfp3om+fMuqLEYNpKBCoLAcuufQY91sItzT/IWLc+uL2KFhV1ay
	7118efx/syntXNkbm5SjrHlQ==
X-Google-Smtp-Source: AGHT+IFJ5QnEuy843kC3TQMpuk9QiZ+X6rbvXcL4GPOFqhedgkU8pg1nIDK1g44GiFTp9uNBiCz3X/eFYBa7DllDIzw=
X-Received: by 2002:a2e:bccc:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-31049aadff2mr53751861fa.34.1744703623274; Tue, 15 Apr 2025
 00:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401072725.1141083-1-ping.bai@nxp.com>
In-Reply-To: <20250401072725.1141083-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:53:31 +0200
X-Gm-Features: ATxdqUF6WJDaLjHdYSkCvv_YDIUzSOmPWDnDqBmf7i0pLM0MKIXzIz4bzkS8nS4
Message-ID: <CACRpkdY5XdzVxbNhw-nv5EL00NNqrJLiwc0B4O6somUo1gjNxA@mail.gmail.com>
Subject: Re: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacky,

On Tue, Apr 1, 2025 at 9:25=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:

> Add support for i.MX943 pinctrl.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
(...)
>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
>         "fsl,imx95",
> +       "fsl,imx94",

This binding is missing upstream, can you send a patch to
add this compatible to the right yaml file as well?

Yours,
Linus Walleij
