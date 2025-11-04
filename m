Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322B1946C8
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762274058; cv=none; b=U4f2QT15+Pg/K1IwP3lIaBqC/+XPjAj8VX+0pli9IXvezgb5Ys3AYMGt0lHbykpR8RhhwZcpkX0pBv7TJYAWUqi/nQlHs2+kIwy00muHX6NHLu2eSP2e/avCgshLAvSCCGZzO55LkDB55dSK1FvBX0LCo8XumMhNIVzfhtEOjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762274058; c=relaxed/simple;
	bh=a8zjnlZJoP75Gcp3unqAhRNeNHZZuPHHbDlOcyOC1Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQGeNrMpcIkHfUCxo3XpU30xl/FdWG0pkNwzBbMqlF9LGXqg+V4zm9I+Q82Nmwa4Vellmxa95pru3IaATCf/7soPtXi7BAqX61kadjkBj7IFXrSN/04D7Pz8xJJ6BekhLwrX5uM15ga6CGE1cc4RCRzhL3rTSCuhTV887Ns94Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIAWmUMe; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIAWmUMe"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d71bcac45so62896077b3.0
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762274055; x=1762878855; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeY/Q1vjgJqdUpxoN7I5OLtGxJW4ljCXvqhX1XWJkyQ=;
        b=tIAWmUMeP4cBVDvixemlupy/1OlhNH0btaqKKavmGa0AR1wHF0dL6z8NFgHSdda5kH
         zykQc57zT8S9LLQ5KX9u4YS+cz6jzVbNO5uLo1SQaYbwRhHQPBePMyfZ81tGCZWlJH3/
         QWNtQ9sDzpcBt84NKgA6D1oqcNktjDAPb0tqlV53VNLMFvEa8btykYeICZQnGF3s1mGQ
         OwBv8q1dTfQN17MUzWJDZKB/eAjJArcMAWWivA6F2KiGfOVu9GVfCF39BS6C1tWp98cn
         JydAaMF/c8uNhLfFfNs88z7P/TpGtfxImnh6fo4U8Ds/C8UMK357xLTjWu9q2r1yyf+/
         NCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274055; x=1762878855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeY/Q1vjgJqdUpxoN7I5OLtGxJW4ljCXvqhX1XWJkyQ=;
        b=s2KFkuT0BK7pxG4gbBA9QVgylVBTXcTtID7fQ62HstL6uXPVXMTTXhSQbtQHy0ZQUE
         RudklTgIND6YmnMZ6Nif6hS2UOylDxXRoybzsGaqYXVZ4WJwaU/HG4GAI1cEPnmpkrdu
         fmoo4SE7+Oe7WRvLtFDH1i8lfbf3ycznQXqB2MzAIveRCO/P51YtePFwQRjErzEI2JPO
         Hswco+h6V9OfA6c+2O6e+094VOucI4MvdPLSzspwdURvrg1l6lSh7NQfvTIvdlv9QXrN
         Asbhx/ejFjbpVPx0IFSiSk7dI6REY0/54quIS78BEcxeLRwipmbCXal4m3TfzhuqCdie
         gXTA==
X-Forwarded-Encrypted: i=1; AJvYcCX6dh0VG80IVxwIXKji71W3OgwA9J5tA3tgJzLyO9/rCXOCtRUSpL5p/EU9L4T166av9Rg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGzkZkBq3jeluTG0HMLStfUgIi4cmtFuZdmFUQ/qdelpAFwrCB
	/eI5iVt161mpEEhYhXJ283SSR/dgN3Nr/q3JNUl5+pnyTcDwDG3msv0BgsXGB3Uc7k73Nz9pGEj
	hnT9dSjrFZkQ4O4SIlQjwkcP6P0ztucayr1irTDMolQ==
X-Gm-Gg: ASbGncvuCdwYmPaGMWt9FvS92TAw+dEnaKMp85PFGcOqiusorOJeL3RsoHgDAWX4Rd4
	UZS3IfE7rM1mYWwwztJjixGBV9Q5xYVCg0OaXJ+y6YRaYMrPC/8qP8azrvRH6S6Fh3z85hXzzT7
	TNnFLvFAS6OKNCD3e5aOKKwheDKdVIFiLovxf5AIqGqoCGAsVzs3DN3gcmkyeLXoB+jQZcBhIix
	AC9i15Fa4YGrgttlkCwZMtAHTiXxugnOXfadQvS9SiOE6IGQLJwTxgSwbWKGw==
X-Google-Smtp-Source: AGHT+IF0Z/yNF7yi6Lz9tQRkNyi37+NTyOPEnzyNmvGQXNJdjD0tMjSSXuyBHzY73wkfo4eUOH3v52Gvr3xMHkvavMo=
X-Received: by 2002:a05:690c:4882:b0:786:802b:d7ff with SMTP id
 00721157ae682-786a41efce2mr752787b3.59.1762274054906; Tue, 04 Nov 2025
 08:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028031623.43284-1-linmq006@gmail.com>
In-Reply-To: <20251028031623.43284-1-linmq006@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Nov 2025 17:33:38 +0100
X-Gm-Features: AWmQ_bk9KtCzO_f_YWM_AynJxSlgpLBL58lIquCitQc40-GRB32NM5WebMbg_Tg
Message-ID: <CAPDyKFqiNeO==u0j=VTKmWaG8VdMR-mS84QoLjrussfMYrr1mw@mail.gmail.com>
Subject: Re: [PATCH] soc: imx: gpc: fix reference count leak in imx_gpc_remove
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lucas Stach <l.stach@pengutronix.de>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 04:16, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 33991f3c6b55..a34b260274f7 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -536,6 +536,8 @@ static void imx_gpc_remove(struct platform_device *pdev)
>                         return;
>                 }
>         }
> +
> +       of_node_put(pgc_node);
>  }
>
>  static struct platform_driver imx_gpc_driver = {
> --
> 2.39.5 (Apple Git-154)
>
