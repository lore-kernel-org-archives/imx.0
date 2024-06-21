Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3A11E491
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718974448; cv=none; b=QSmT3sWnIlWAmDykG5/bqQ3QGxevo3haxmca7B+WvZPWsRFptCY72rxwRPzzGC7m+Jb8EQ1v6LV7zNHi6KJ2OGSov0Tsx3Vh/laNweAWIKybX5tVbLuPiIby92skeiV3OtgAOCoId3XbHXJKjRE2CZBN0OiA5JhE20HUBQ8PV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718974448; c=relaxed/simple;
	bh=LSQJ9I0cgRdYxNFwJwcV1JJibD4wbsNz2zrUxK+ak8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2TvbnvgL6XzMQZA/uJXVB0dKUBIkez0YLaF/N+9MoOO6emf+tsEU5wC87uddcvxCHqmPnwXoqUYfc/666cLjPTsbQhMLmdDT3l+4rvXO1EMEZ4HF4Ka9DlDQUYN8UqaDbe1z/Ovh2Kh9JScSLAoQAxlTt/uZ4H1OuU9JXL6Ts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDsI5Y14; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDsI5Y14"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f85f82ffeso248448766b.0
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718974445; x=1719579245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYJaA7XS25MstQlFWDdKfpHlFF9Sx8XLgOyXscP6JLU=;
        b=GDsI5Y146uJcC0BdK2SqFkIWCUykgi82WUM4IgvxGPVVSAlqlHI37xOJi79I+tEvLO
         dEf3C5lrhobnEBVdqm87ew6e9qYFnxFwXI4kuEQTO8BKeK4iJu7EOgBxy2EB2Ye8oYPl
         k2sYzK/m9+xkKFRREnZfDfJltT2Yt7CIDbk7BQ4/id2q6vkwvgerUvWg9yZsq9AQqd55
         q/JNIRlWv/KvU/mXa9gMmfo+YqS7No8vNmkufMf/AeAMz4DTCn1sBrkXGdCik6WFLGDG
         qV1tO2mlS7YsVXGWG/d3PqgUvh39+6COJxUNnMBNw6JII1dFogzMpEnIOaWjvi5H2Lk9
         CKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718974445; x=1719579245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYJaA7XS25MstQlFWDdKfpHlFF9Sx8XLgOyXscP6JLU=;
        b=lW53t11lhB6oCA3LMzKAOQFCwr4/LWYymSOmbU1c2hb4CTWV1Ev5q7MmnihtnJ0Rmy
         JdZy+MPK/lyij4JJgkam9bkjOGLOH+BPshzWjTw29cZfOgF6Km7WocYrxdnYd6riHCVe
         bUa4Scz5xhANKcamoXdo7O6Ft0dzb4B46TEzEcRIMRS+ryHHbDfKXeDyEONtte8ELdeQ
         oK5utYPA23U7452735IKLbtfHcQAJchtUTKyoB5EFrRQNpZfd2GV9xqoyHi+d0DCIQow
         5/oRK1lk6DJ4OCgT9HwQRMOJ8HKdBYbe6tOxUbdBthZzNYGA1cDohJKezZ4nLBmo27Ua
         8m0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWfIgBfFj/A7M4oVhyx05gEahCLIM+YWIIANCp08IcWxcWNBOAAqShvyJWFpbhjh8oxPlRa8tnUN5HF3gjsg/kL1KW
X-Gm-Message-State: AOJu0YwcN60DNWej6iTP5QFTjx++dz26iXuTTLRqfSDUPy7Z/IwExfGL
	Cz+oBRENs+DebLD0x84wpEb3QT6+Rg82kqPNkofYuA9wIBrSzID8
X-Google-Smtp-Source: AGHT+IHRru8dj1JPrNty1M+sqrOOATWLXykc/0tIQFtaLKd3tUycWUm6+/vMJitFroUxg9wBZEO6Ew==
X-Received: by 2002:a17:907:a4c7:b0:a6f:c167:614e with SMTP id a640c23a62f3a-a6fc167622bmr318798866b.31.1718974444550;
        Fri, 21 Jun 2024 05:54:04 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560532sm80916166b.163.2024.06.21.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 05:54:04 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:54:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 3/3] arm64: dts: fsl-ls1043a-rdb: use common
 spi-cs-setup(hold)-delay-ns
Message-ID: <20240621125401.of5rge7imyp4fdhz@skbuf>
References: <20240620-ls_qspi-v3-0-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-0-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-3-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-3-1a2afcf417e4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620-ls_qspi-v3-3-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-3-1a2afcf417e4@nxp.com>

On Thu, Jun 20, 2024 at 12:58:29PM -0400, Frank Li wrote:
> Use SPI common propteries 'spi-cs-setup-delay-ns' and

properties

> 'spi-cs-hold-delay-ns', mark private properties 'fsl,spi-cs-sck-delay'
> and 'fsl,spi-sck-cs-delay' as depericated.

deprecated

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> index 26f8540cb101b..fef3534157a1d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> @@ -104,6 +104,11 @@ flash@0 {
>  		compatible = "n25q128a13", "jedec,spi-nor";  /* 16MB */
>  		reg = <0>;
>  		spi-max-frequency = <1000000>; /* input clock */
> +		/* Add common SPI property */

I guess if you do insist on adding comments for this (not necessary IMO),
we could improve on the stylistic elegance by saying "Standard CS timing
properties replace the deprecated vendor variants below" or something
like that. But currently it doesn't look great when there is a verb in
the present tense and another in the past tense. Also, the plural form
should have been used for 'property'.

Additionally, I don't believe that a new line between the groups of
properties is necessary.

> +		spi-cs-setup-delay-ns = <100>;
> +		spi-cs-hold-delay-ns = <100>;

Do you plan on deprecating the fsl, CS timing parameters tree-wide, or
are you going to stop at the LS1043A-RDB?
