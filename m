Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7F16FF44
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112230; cv=none; b=fJxnzc2oVWFyPoSkMVtVloOPX9Q3NTzJ7KmGYGaFjr24ggcQonsr4wkK9blgZyb1cemeTmCn7TwmkRCeIgndzWaFbwrEFX39/RA4F7RFDuergcBiHa/c3UYrvZirmOYQu+3Zzrw/gnPk283VAkfjF/9eS4Ei6QxlpuWB0DLIYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112230; c=relaxed/simple;
	bh=ecdtu9IoLAFC6tSfFm4Ul1T4VV4iYp3PqZ1Bd6n427c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR9XiyZBBTWkodYP63jd0hBvqX+La9TmViJhBFtUu8SGbM7737ptPXLHPSY9OBSBY5lmLUtAZwHHGDhgd2oVg/hK4s04ool7fwT3PGBDiI6HTAcZ3oNYYYcZAMyjBtRlcQOo63oTqzy7aQkOXecuEP4IKxHlGWvjJLvJn3ihdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsLilk0d; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsLilk0d"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so5734350a12.0
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112228; x=1750717028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=;
        b=SsLilk0dJ/P/Q2YW52gypd4lCFna4hH3VhZ/vj974GzAE/DHuH1/MhFAvQ5FHxUOw3
         wtIl8rkBhsBAzacLRWXXxJofZin62CJ7BsfTJZAOS3JwIURf+YN2l/ueyEN7W5w3MwEg
         8jBY5WaUiWA7o+kLzHuBC+sh3LR9AEO2Ph+7x41gDZyYgJpgnEF3O9tkL8hKtPKogBVu
         dJSgMx5q4xbsNL9XcB7vQEEO5uLBF3s8eMIW6hVKPipX0USRb3ZqzfZOZryJf9OOk7/4
         VTfP0j7LJLB1o81WfAbCk/pXA5xAGNvK7dcOB8082/JbFPRTRQ9mXKAuXGi7ObiqsTji
         P/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112228; x=1750717028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=;
        b=E0yU0+qb3IoyRJ+FbUOQYyRM+kcHcf6I117N8RNdVhNARJ5zLlivRUmg2/e2YVI85z
         la1F5Nj2+VpVLKYJAs40QiV/w/6XycUidOvcjrE/6AYLcoJyZ2ulScmE1LOkk51/XMK8
         psKgQMBgXCvVeI7y5Tj77qmE7hCM+4SS+xo3xbZcJ6qo41t9C17GKThEKegKko+rSfJO
         IcA3Uiw/+3ZyPaGRqk3eQmBIrKqqLfhnzwBdhyPz33yZJp+PLORWyp2HJs6ovAhBFV19
         vyWB1wfr+X0yGopLT+jzziD5ZV+N1KTdnGhABBoOe8ESm8tzu+h0hCmm/qVVbmStr22o
         Izkg==
X-Forwarded-Encrypted: i=1; AJvYcCXdlQ3p9vFmOx/JFRuFA6/FQJw7yCixozeQj89UxZx86YiApJfmoNzcHyq9++/PHY0Qvzk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjk9VbUORcisEfV+/FvSJkOkCYMwN18fChDI4WwBHEVzSX6JiO
	JMBtCorOZx0t0uEOSbWjtw5P/N1lOhee9lSy291044cWSPjsi4wvlcu2
X-Gm-Gg: ASbGncu0VCVaNLAPBEcgA6U9ibpLtnxTbUCEwPdCXpbts37YGQ9IlMVvAzt7HWtOQvg
	c01cAjDbEvcXSioVEFEedKO2G+wm6cqRSH5wj/y+1tkCG3lHsvBmaALxPHRlh8f1oqwpxXBW2hV
	O36PxYAKqO//0XFLY0ujSewt0KAKcM8NN3k5s97Vtl+m+Qf4KOEa53JOBjx5ImFdrVUkFbQSYZa
	5soXyackq9BSBVO7GWppyjjQq+BxDAKxUWgf/ty/i7eA5OVhG17D7lz1np3rt1THGIsNgBhY0fm
	RYr0+0vSXwtvlWUAjdq18ErQeQ1BjnjhHLrikniPcMaW88FlmiY/q6fqvLPVqa4DLEEAZ9yUxXp
	5LE7E4gz8oA==
X-Google-Smtp-Source: AGHT+IH0R/kwqrtGK7vSfYsjfazrkbGVD0Jb0vrp0a0cSzfE6EUdfWb215kTnNr1aWjA7NvqBBDnog==
X-Received: by 2002:a17:90b:39c5:b0:312:1ac5:c7c7 with SMTP id 98e67ed59e1d1-313f1ca7855mr17965599a91.2.1750112228057;
        Mon, 16 Jun 2025 15:17:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm9229246a91.13.2025.06.16.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:17:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:17:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 3/4] hwmon: emc2305: Enable PWM polarity and output
 configuration
Message-ID: <57210f02-ab4b-4bcc-87a6-7a41a239b569@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:24PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Enable configuration of PWM polarity and PWM output config
> based Device Tree properties.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
