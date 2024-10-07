Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43331DE8AD
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728294891; cv=none; b=UUcdQi87I17l3oS5RSgGt6eGcR1hSORXJRes5pt+0zf4a3UKilHYkGzn6EC+rHglftAfrqd9T2HAfCkPoZtjJrsjGvOtGDNAWyiVFYud76cDjKADf1qsIkIAKrUk5BBgdKrI8PtKr/1X5EpjQIoLa4S/APODaXS6i+qcM0CSN7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728294891; c=relaxed/simple;
	bh=XPuTahtxHfXasKgZvlJ24F5uRaM7cQ4b1F15SQPxJl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyRqrWtKKapFmEYNGMPam49urmdhoNjeVsx3hcoSDOVizYKSgi+q5lwzG0wNnDzmQMSPfhGWAJe94YrYEypvTenSTraae88Neub6AnFdMdAinlW6KBcfVEIsGn5ZDhPtqBLC8q0eluQeKj37nl7PrEaVgFkrFQjeWQDHdxUi/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPAErYUN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPAErYUN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso42882625e9.2
        for <imx@lists.linux.dev>; Mon, 07 Oct 2024 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728294888; x=1728899688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gaUYthw6ApPY7iMEBlPEvXCrC/ELjE9zT9gwyCjWi3k=;
        b=nPAErYUNHGN1vCVg4cGX6HzNlWXK24jaoUD8MjaJIHtbNxL4S4DtwF+SNJTVInnUP6
         LpcRzsdspIMaOQSDJ0bVH2a6lFNhsxhi7BB24o/hd5H04yneZOa7VZSb3SyCIXEvl+5D
         BAb1qpyvnmcp3r/PBrf1PYsdY52bFOzws0FRwRjhYaKgHMJI2VHHqnaEdm69HJp3qRUM
         c7adlB47icFW/OulUHLeLMmxQeSYWlO8N3qUSj/8iOadHEw6loQK+t9PysyHOhk3SiIM
         sil0l+5GuJxXDy8PJoLGysfH3N80JH7EV+ISbANdu52KfgjcU5OHfJjtBRZqPfw5yg6B
         Ib9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728294888; x=1728899688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaUYthw6ApPY7iMEBlPEvXCrC/ELjE9zT9gwyCjWi3k=;
        b=o7nTsArQyKZHMshQJsGB/tMvDKXIDSvvGCIIODW9GEAbFFjPgoizrz1y3DovqlV3pW
         6QaYqmS0PkicZRoXMD9vSrLf73BBxkOH0734ngm51jLiRonfEyy5Uq6RgJvqYNiVGrNB
         SoM/rFxtsJuuiOrPw9hV7fH4eshg6vm6q3C9J41G80prqEl87Ho6G2diTU8xbRmiWhJz
         oRHIefwXztaWOyuxKtOX1LN37PJrcs3d2O6Xb0OLvHV0g9cLgt4lnWXv8gaqqFGsBcFb
         QMAAQnSn/77JVbjlIP2BX3qrLQ2nDF/v3qQN+xtVWKxYFjU8zfaYnO7Lrq5pv5yCLGgt
         GkSA==
X-Forwarded-Encrypted: i=1; AJvYcCX8TD6F3whK36u4WWdUaFmcDC1adBuljlzCSuTmlBBJGuplwqwbxv19kMOrdmmpKMPcuVA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYAtzH0hpGQ123yEP9So1UCluLrzTR5ptijJMk4YxG3WU48Kz+
	IHoRQdiTFMbVnmyZiucy21KJuezvGXY8oRs5I98RPetsCETKGBs2Tljt6NsOMq8=
X-Google-Smtp-Source: AGHT+IFVxjKENE97XWETeGH6TckcY3Iu3heqkwwXnzL72mlbXZp4BBGafyTCRPMtDD9hj02mIVRoVw==
X-Received: by 2002:adf:ed8d:0:b0:37c:d569:467e with SMTP id ffacd0b85a97d-37d0eaf7aa1mr6482622f8f.59.1728294887935;
        Mon, 07 Oct 2024 02:54:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a56dsm5329817f8f.41.2024.10.07.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 02:54:47 -0700 (PDT)
Date: Mon, 7 Oct 2024 12:54:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] clk: imx: pll14xx: Fix potential integer overflow
 on multiplication
Message-ID: <3e0def9f-ebb6-4171-9395-1da118b0ea29@stanley.mountain>
References: <20241007084840.1167527-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084840.1167527-1-colin.i.king@gmail.com>

On Mon, Oct 07, 2024 at 09:48:40AM +0100, Colin Ian King wrote:
> The calculation of fout is using int multiplication and assigning
> the result to a u64, this can potentially overflow if the int variable
> mdiv is too large. Fix this by making the 65536 a u64 value to ensure a
> u64 multiplication is being performed to avoid the overflow.
> 
> Fixes: 53990cf9d5b4 ("clk: imx: pll14xx: consolidate rate calculation")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

mdiv is always clamped in then 0-1023 range by one of these:

	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
	mdiv = clamp(mdiv, 64, 1023);

so it can't overflow and the Fixes tag is unnecessary.

I think the reason why "fout" is declared as a u64 is because we were worried
that on 32 bit systems the "fout *=" operation could overflow.  That looks
reasonable to me.

regards,
dan carpenter

