Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B19147C82
	for <imx@lists.linux.dev>; Mon,  8 Jul 2024 17:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458704; cv=none; b=mSW4Jwtx7ROX4B+ZHi7Seo41ItCAzUY1cEUUz4CT8gmNA4cCX3OeM4/9Qwn1jZGrOFRdyDj5My3+TtdPtKpHtH21h7jqfR04mvRn3Z6a2Bj5WhiMnRGvvRJEtaqVBQhXXBGPLG6Jk9lVQoo826HemC04kHBIEIy9qi5f//GX35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458704; c=relaxed/simple;
	bh=APOKFIr1SgMd2jyTWNlNrszt1hUq4EMwIy0rdhYMZ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAW/5j6Qw4ltYIRYPP9mh05HVjJSc2MzEV4ebNOZ/5pqcnEB2M+hi0KzaQDlyIn9KqX7IgMNUBWapNTHuj1w4NRS/zwI0Hz/IG3D0eNJ9KiwxzkcX/3fUC2mw7j7WmQYXIA7ar9q4X5X6PGKkZ4KulQ9Y64njcJibFj3qkMYzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyroU4xW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyroU4xW"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70b03ffbb3aso3214457b3a.0
        for <imx@lists.linux.dev>; Mon, 08 Jul 2024 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720458702; x=1721063502; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt0tMUEkzdV0wxc/818/AlxwGzejskA1bdOrhHyCTrg=;
        b=VyroU4xWdoqneFYrMtsiJ58rAi1ZxJl/BAzMftXemIlJPku7v835gPKWlKGnguPtYw
         m0DuIvj6GNdryQV8HuEo2T8azmZ0HMCYipTet4D/IgW6WncPsejvJtLabKn+c060CkeQ
         92tFjirFEO+o8N04AUXhNc3XnYZEKI5mXlQOUwZyjT1hkvHv20Wzs+JxzID6Xc/Bd9iX
         G617S7dTiW2YVD9fQI8/itlXJTv7s4/5g0efE84aZ8Gmrofwu2rIzE2qyeEIt26fAVLD
         6M0ps1yNzbZmEDWZHLxYsjmbLyNwJgacoq4CHQL0rm+MWTHyckEt0qvBfHMYRTezofUf
         Lztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458702; x=1721063502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt0tMUEkzdV0wxc/818/AlxwGzejskA1bdOrhHyCTrg=;
        b=couJIbFsKTFjQFwq0EHcEMtU+/z65aqjWC73eeKHniUcy+YisZRTpo9wtUw+tgfrLf
         1UVe4yzTY2cHCqGAECZ/iPb9eHDIl5DPfvABFafmfZ5j6HHGLjW5uSPKxEWvCl9Jy0R7
         VDJT+yMGvoOkB+d0P7yApRp/LFFjQpURQGWp2xBppv7+HVePGg3nq4Bt077JAo5CKWW9
         G7NCiuj0nNokgIrup8Y8u9YORHuAX0dhVFc2DmZKVknmQs/oqMu1er+yF8vQeQ/sjkIa
         5LNeuMCl8PXS3jelFBg0chEMMpOi5m01Grg0pjdB/7ttZH6SZsI9qIknsVpidDxaUJxQ
         NAsA==
X-Forwarded-Encrypted: i=1; AJvYcCWx9sflY46kcv15es21W2NKyq+Pc5XhY9dup0jYzQ/aFPl0JZA3F3zCIsOaXF7gjJbg8LolRQ3B8Fxx8T2sEmH+pBWy
X-Gm-Message-State: AOJu0YwLn1GjGPYhVMjTuwIRns/Rk2iSE/s8sO8N6AmNHAKynTDsr8Jd
	7cyqbJub/JT3rFFDef+hUJYidKWA0FK8iPLean3PjRRV1fM/k7Ve
X-Google-Smtp-Source: AGHT+IGjYAlk0pW4CoJmEyH/1a3UARBmiHebpaD6kWN9BLP4vvc3l+Bv+VjXM07O9HMcU6UhnE0RFQ==
X-Received: by 2002:a05:6a00:1ad0:b0:702:24b3:d036 with SMTP id d2e1a72fcca58-70b435e7827mr429688b3a.22.1720458702262;
        Mon, 08 Jul 2024 10:11:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2a4:59f0:2144:2c00])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b64d0sm96863b3a.189.2024.07.08.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:11:42 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:11:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Input - constify read-only struct regmap_config
Message-ID: <Zowdy6eeTEZMZyH1@google.com>
References: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>

On Fri, Jul 05, 2024 at 07:38:49PM +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_config
> structs in the input subsystem that are effectively used as const
> (i.e., only read after their declaration), but kept as writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       Input: qt1050 - constify struct regmap_config
>       Input: fsl-imx25-tcq - constify struct regmap_config
> 
>  drivers/input/keyboard/qt1050.c           | 2 +-
>  drivers/input/touchscreen/fsl-imx25-tcq.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied the lot, thank you.

-- 
Dmitry
