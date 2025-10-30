Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377732DC78A
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761789243; cv=none; b=cB11SXUpYqLgyPjh2F8HTjhU2r0PJrXjazRDiUcnbn1DknXmbE7DPexQrmH8gQKxMfRPnqvEQTY6wQ8h2Z0iJxYNuiVUuLDrURe6oS6Gjd1+HQ1Vpu9SM5pC7MNhCY3FmpccpTN9Y9TikEEd6agn0V804AO/TVR++4jrcNHBjpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761789243; c=relaxed/simple;
	bh=phF+41jPYGFsWZNLAeFbe1hdIEJHWy1G5CKaXfNjyN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYfnkNuPIsjeDEeBNy6t9k/+SlvtO3kYpIYXBgE774Osu3ffDUfF3+McuTMRMJJJrZeWX3ZoC/yn2PLy2RhzTJBSBMwDEBnyl/wH+RDfYKV50a4isdLr7aFkUCU2zji8E2OzFEQb1+6Nd1BKrpaBdPwTyWWAOboh4YR0nh8z/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFvt16S1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFvt16S1"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ed0c162789so5860581cf.3
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 18:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761789241; x=1762394041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cny/pF2/UWb4s3KOzXzTRQuku/xp77wec9CPlPDB6hY=;
        b=EFvt16S10Wbanvo+AVstc9HlSsh+HjmhHbdBWGJrot29xlEWOxGMyYxFkZG2zu+fdv
         4tCTe47BCCDcEynG2riI2LhqGtK+a9VT9ftjq8lS7kD6/VDP+TbPk7YH4MKOgkdSJf+/
         wqU8ZsPvUcEnl9zB3n+VodjDixh4YPuk8E2NWk3Wix6u6N5qFvTJvL9sjfZ+FPI0sLK0
         xLjcaw6ryhguqO4s38Q0Hgrjx09+D+XXcfyV1jNIX/oXp28a5Q+Lx6i65p7fpzKybDLH
         DnnmNiRxT7QD920XLWvCKVZBRpEX/hTf3mkSRf07EJpbimOMwM6b2ejvvXinjagWPBiY
         clrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761789241; x=1762394041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cny/pF2/UWb4s3KOzXzTRQuku/xp77wec9CPlPDB6hY=;
        b=O1GQWjqbqV3OKo5HSkczppBWi/RZQh9q3XkH9rms3/66Vkqj12M/Dt9u1rlzdtEP6E
         7rfCTAuUEKHvZclO1Rp+93K5rD6+4vOiNdZcrU1VrWwIQiZaGW4YJWdSUa7nh16ra/hU
         7pdH3RxT7tTRB18tCF1XIDXzU1+n47c8Ct69ytIT02iZ6ORL2pOhQ4Ivh8Z7/aOs2fmy
         fLTTkUyS89eq5v1vqsfDBxrB52yfx6JFTpurDiGF/1f8XVBGCESZhecHbSingB2dPC03
         YAfqsarvU/+FOjWRYlV/hRB1rVBJ+EyYBo2au/7vSrOJhy1ul4ERmaQAbZXgggvtAnao
         ED6g==
X-Forwarded-Encrypted: i=1; AJvYcCVbVTTWuROYT2N0jmM7lmVjtbpORfYap2m1sE5+UNrdz48oAjeOp+iIPoSHyO9SLkA6f/I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2yWC4nQ3q6RsFw/0er2jfTSYsrsebZVVEY9COdUv6qSz9ruCr
	j3VWdMSo6FY0NVzF1VsTM7vvWjZC0BxNexDkOOP+KkEZ4S2OR9vIxv6J
X-Gm-Gg: ASbGncuvPbKOquHppDy4jhN8a0oAyWP0x29R9mbe6aDpQyJFiMoyhsXSmmD47euNwn8
	SkfnyjvYegEBQyQ1VLoyzwAW1CjVpQuJYOMPUxzroBzJUCnK0LEhyUZiVRYNitfAR8BP0STnF2Q
	dv4v4Tl2MnkISgm1n/34solCFvQbp1QQS9muUbBPA2p0VUg+BYfbQcExcDQVcAFA3koLfhbl5vK
	fsT+z2qTwMr5Lf/pS/g0Osjwg7akDY3lYtI9VHAaY7naQmk9dMpr7LYmymudDSeyHpB0nfjBJOr
	zCoVq0snkrNA/RChpq/19dNOH1fVzIVBW+1oygb1dTclutOkVf5vOaJkpUgtyWuKmYSGS8FsZ6g
	tkoS0+WBKCup7doYvNVJn9n/8L8lua1zt014dvk6YAgX9FciVnKWBLbrWDX9TSpOb43asBjiv71
	M=
X-Google-Smtp-Source: AGHT+IE+61G4p2S3GzFHVNxAsZS2OUebLYMCNTGNbtH9VbO1FZnXm51zQySPKvrbNYQTOh7o+SE+Fw==
X-Received: by 2002:ac8:5889:0:b0:4ec:f9a1:17c5 with SMTP id d75a77b69052e-4ed15bb2b3emr57941951cf.10.1761789241028;
        Wed, 29 Oct 2025 18:54:01 -0700 (PDT)
Received: from sam-fedora ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba3863cc2sm100445901cf.32.2025.10.29.18.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 18:54:00 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:53:55 -0400
From: Samuel Kayode <samkay014@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Lee Jones <lee@kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sean Nyekjaer <sean@geanix.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in NXP PF1550 PMIC MFD
 DRIVER
Message-ID: <aQLFM2-WgRvDHfZT@sam-fedora>
References: <20251029104228.95498-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029104228.95498-1-lukas.bulwahn@redhat.com>

On Wed, Oct 29, 2025 at 11:42:28AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit ebaec90ec0b5 ("mfd: pf1550: Add core driver for the PF1550 PMIC")
> adds the header file pf1550.h in include/linux/mfd/, and commit
> a7d6255a0bf3 ("MAINTAINERS: Add an entry for PF1550 MFD driver") adds a new
> section NXP PF1550 PMIC MFD DRIVER intending to refer to that header file.
> It however adds the entry for pfd1550.h; note the additional letter in the
> filename.
> 
> Adjust the file entry to refer to the intended file.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70de2f9c4a50..e428ec79dd24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18718,7 +18718,7 @@ F:	drivers/input/misc/pf1550-onkey.c
>  F:	drivers/mfd/pf1550.c
>  F:	drivers/power/supply/pf1550-charger.c
>  F:	drivers/regulator/pf1550-regulator.c
> -F:	include/linux/mfd/pfd1550.h
> +F:	include/linux/mfd/pf1550.h

Thanks for catching that.

Reviewed-by: Samuel Kayode <samkay014@gmail.com>

I will be sending a patch to update my email on this.

Thanks,
Sam
