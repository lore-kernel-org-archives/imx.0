Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052137BE84
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294655; cv=none; b=c/stgklfeVyvO3E9u/KxmIZuIRb/11RYDyEWK0LutCWErI6AW0ve1bGf/ZNm0f/5sFb/4y2E8wBkoW3b/B7IgDqXWs97QK8Nzha5xLmVLmWopxAh9YlCswsmrhMjqaSapFsz4kLWiIIa9ouQt2NjCQQARnTi93LcoN4NzrmKXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294655; c=relaxed/simple;
	bh=Z3aLnsBMqI01ig7SW8ryw/EZMSWS5ROTkw8/sofKnPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtRls5ChUFPtvfLo6BJYmvDCB1/run2k1UfX3dHBLSKVIpjO7gMutGwLKNujgAPvf/D+lfQno+o8xdvpSwmX0d/L0QkuVIwT5Wahw+pgiA2TeiaxsWE84JjH9kJG8oAB9o8zLsjsn9pCoOJgDExlntVhR71hd/p/AfVVZcyRJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtgNJEir; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtgNJEir"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-11f1fb91996so12148003c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768294653; x=1768899453; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3aLnsBMqI01ig7SW8ryw/EZMSWS5ROTkw8/sofKnPg=;
        b=HtgNJEiruUqPLYJ7PwCgCL/YShBtdkyt+OOVfYNgsl3jKKeRKLU07SSctdRBb4/aiI
         x7ZpSwU095LTgzfvJyoLhOqUuR+Sgt1of3/W4zsUvB9Kn4Mascmgr+2K2WATzxdMhUO9
         X5XHXPk6M7zRDH7w9nYxwCTFYiRWg0HtaMUymgR/gLorQPLO8r040In8fsZpqKB51UWK
         RLfBIY+wfOMKU9Y5xCgDRQl33+sMcw8qlWlFWCkc9VeZ9ObZtaq9kduFEvBom+jjlLSq
         yeDmHp+RTE9eqw5I7atFGu4Yjiqd/VKdF6Oz+99Yiv43gi/pHdLokDprzOT37n2doNfJ
         5DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294653; x=1768899453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3aLnsBMqI01ig7SW8ryw/EZMSWS5ROTkw8/sofKnPg=;
        b=jzxEiAEMlZKfyHligCPISR/YNVlE4a0bK17ow+8iA5ykd0l5X+kVsBQJwahoW5ciHI
         0j9vq8GOD9fx73stZPLWKCAQJOqoSDqE+GRAFSyVX9xRxqXGK5Ff9CpCqdUsSczhTwfN
         fJSQe7eR23YxKWHiwve7ZaLyFMw3XbRSnZul4yamNOWwwCq2llyG57mV8hIfmrjMGJVd
         9U7AufQ20lcxoyCD0N4baIkQ2PDmm3NXEyBB0qrKs19agWgGKVvow1I60zHkH1vcA2x4
         ejEWAMWtzTz7tmW9OjLRUnFyouPFHcD3qNn6rwSZNmTm5yF49vW7wQplaYWneAiw35Gb
         S8QA==
X-Forwarded-Encrypted: i=1; AJvYcCUn23ySsWRiCXFbsJbTm0yF5KOl4G9mXP13JYHsgDQcfAhxvlUVPRDxKhQJ3l/8Cizm7KY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHJUaxYnD4m3cyBWIpiQ21k+ChEhw6ysSEHavfskSyIEdrxDPw
	Q5vPxuQICxhl3Y4jbkxiXAaSAFXLmPMfj3MnEhWmAblaaEc/vzWr56edCa2FI4bTLua3e/1z9GM
	tQgi/wWiC3bITDX35cc5t7NMI97XS1aM=
X-Gm-Gg: AY/fxX7Y/Ccs+Z1Nbvftvjq9DO5i2H+OVNcTLet/F6XIOvXuRLkOb32FkiSgap5ffOu
	NuWr0HxCsQEWFESWKJ6m9+I757k1/YX5/aPNw1YLIxbB+0Gmt3wVgxyESTuWm3t1RPvhRpeqmBL
	N2eLQJxvi/Fn4JPCVMaxVbFmaVwFsZvuZrc5N9zy+z0DyTDVoul7WWIIaMVJ8dI6PDrigjfxRwZ
	ua20c6p9zSwcY+LtUTxVon6XPdl4g26CVifnBYIP5O/FjFeV9vQ4Xilp3ghvczEpIXC1ORUdGAj
	pliao0DoKDlzeJC0gouIgvzRkiuaHx9mbsyBE84eZ6WvEQwper1OPYbIO/VPEgIEEIiYMqTIItS
	wenW2vQe9tQ==
X-Google-Smtp-Source: AGHT+IGmM3x0udx2jF6xiiwxJaTLbY/+mgnqHtLjywrZ5fL93iuUCbplfZKnu6LF3+3HUR+s0JIPBWJA6Z1zKzj+SNQ=
X-Received: by 2002:a05:7022:b89:b0:11b:c1fb:896 with SMTP id
 a92af1059eb24-121f8abb3acmr19422193c88.4.1768294653032; Tue, 13 Jan 2026
 00:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-4-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-4-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 10:59:59 +0200
X-Gm-Features: AZwV_QhwFp5t77VYOIbQmjoAD6m22-epBN6U6A_kPYCLkLGP8qgHDvodNf2mkP4
Message-ID: <CAEnQRZDy7nbidWqhd8AxV6pHhHYOPw3Cbd8f2ky6YrYs8z4y6A@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] arm64: dts: imx952-evk: Enable UART5
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:43=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable UART5 for using Bluetooth.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
