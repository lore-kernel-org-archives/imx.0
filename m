Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E174DF5C
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 04:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735447854; cv=none; b=jYIawWoHPo2onuK5hmFMR5CJmN8FqZyL1tLQ8C+29ABuepgy3EdFFVIxPCGzjAlHkwrs7/yQLgVlLfbR9cGkixuTFeV7QPChcTnYfwtBhU5dKSCiBhy9jTATKsA1fo+clwtOcNCPT3/98aU+/QYLPvTmPp3q6xmLu1V54qNlYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735447854; c=relaxed/simple;
	bh=A9Utw4Ievs8DrIF+31k4OffyyIv1G+bxB759Ajy1L5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEjN9dfEi0Ihkk/DKT4h+IoZbZz3ukRER/Gm2VzK1RAYYXDF1A8QKKEIl/3GazYDCA9imzGZS6V5scFzlRyq3G+TuWEvLXhUkrVeY1CqN5h+tlrqcsqYlBGTMK7bpCUmfju8rHVTfKaBpODdnLFLWRC5iuIR39eSfqob0Az2HwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMAvnseC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMAvnseC"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30227ccf803so99948741fa.2
        for <imx@lists.linux.dev>; Sat, 28 Dec 2024 20:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735447850; x=1736052650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=;
        b=zMAvnseCHNNZ0tINIxlxbigVuzF9D4ExmZWosLU//7716krwCltnWThZMmbowREuj5
         qZUzqRSTKnwR4dEL3gar5lb9CmztDntkm++NLTy9ptOKYzOnsC0MUpp7TZPGVqkmaQ1J
         h4EDLz5yQRVNWiHFgMuzhSvbnIlsg8aczvPWEidwPCP18QfZGClYgAuAWNqFnQQjtU5D
         aUPuNyqIbFOiK6gizg5yhSfoZc0zL0u6qkL//9pB1ZLDrBekL5KH3LgeKL670gL+Gr3z
         e514Zg6P+47xlyU5ThOtQRPb2BnofxQo2w8hkvjwZg7iawWCH+/56ibiOfMTROaO55fm
         s39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735447850; x=1736052650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=;
        b=BTDUUq/Ec0VCGdY2HmXoeC38Ks62Y8dIQW+o2M5KcOrD+Zd9Ya7hLCvz4lEvcYEAdQ
         hK1O8L2VtaTJYoO7ECQPJnMEucwKyUyUueNx0nyc8VJ/BRn3sFChfUJms3xpI03hDpHM
         z/gdaEFfDv9NgaGMU61/epTRUHMK9dilmFYRRzhTiHPYR9yyT6AGyrQl5kY0rfWUwHto
         Q+ofRHBAjndd2xA/5eMk9K9vnqs6GPP2VWjxMbc7+i7cRJLbbIeNHcUv042byiQ/FDlg
         f1FDhz5DFVMbcPmd53BMaLvJHDCt19Ts/5EmfEXjjfd/TMgNRggEzTn+OKqPuaPQ5Tnd
         1hcw==
X-Forwarded-Encrypted: i=1; AJvYcCUYMG8kNpzDdT7w46ZIouaZWO0ZzsZnHP7K2Z4BT2MVlAj5lRoEUemD37FINCDHKim4Zq4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5qW847F0Te/cbdAYq9XsV3KxVDXrOdzrb/F+GHlCs5TcR9vLG
	CyGqHd1gZJtZwu+eLXrDOIPDBDzwjyCHmJQ9KYfpjFeJxd87MnW/+mjo/tQ75DQ=
X-Gm-Gg: ASbGncsmBGWmmyhmE+xbNWDH9IH0VGXlhj0sXAXwRaIvI34NwJOJtV49RWVZ8jyPEx7
	qJek8oFuPDiaRipPd14lvfdlAyBg3UvT6GKHxzXHkvvj2MM4p5EqzMWxhAS8oT1gDHSmzoV0vqm
	ErO4K7EXsB54HsxMXmj7AbN/8zuLXu7ws0TypgeavNNMwjVuXw2fvRZVjJHEl1X83wY+UWqbJVq
	DyozaGlR/zxlis7IvpZJHw3XbMW+5pBYTczwygQFMqUSViHayUU5RtnH3P5v5DLo5NuvYQymiQx
	aoAEDWfcSDoFEp862OOkFwOqVQh3Zrgjz9ds
X-Google-Smtp-Source: AGHT+IEsNXGZt2QOXuXj9OJSqWCxJoh9IxQNwSFDjV5JTFWQrndLXIX8JMTwPgrw564c1ha9VHBhRw==
X-Received: by 2002:a05:6512:1114:b0:540:2567:469b with SMTP id 2adb3069b0e04-54229533e5amr11323899e87.16.1735447850491;
        Sat, 28 Dec 2024 20:50:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236024c7sm2833143e87.110.2024.12.28.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:50:49 -0800 (PST)
Date: Sun, 29 Dec 2024 06:50:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	deller@gmx.de, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Message-ID: <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
References: <20241226022752.219399-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>

On Thu, Dec 26, 2024 at 02:27:45AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This set removes a bunch of functions in ipu-v3 that
> have been unused for a long time (since 2012-2017).
> 
>   No changes to functions are made, just full deletions.
> 
>   Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 


For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
