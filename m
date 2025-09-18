Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6065F2BF3F3
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758173981; cv=none; b=PoMVk9ov31v/Eo+taZuIdiolZtrCQ35N2DJDnjTZSRd3Np+LPAIj/ofXyc6bHewbtJhbM3apQ+8nh7nkx8azD2xr8FOPkGFCGoxEZvybwFSCAqPUR5ESu+hULyU4kJp30Bn4giZKt6dlnGpEKdnJu7a9945W4lHDxD+OCFeaMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758173981; c=relaxed/simple;
	bh=tL4EM/uHHsExhCxv0TtPtLPrn+LMaQDa3EkJi0o+RGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXkOAGdqMZXM7JAwZsLzARFbZj8KXslgbsnPmmoDXeCE5883xKp9SWtTp2rG+NGm3Teyi9fhz0XFRkHt7xIxQ1hU4eX2ONcpcQLHJJafSbmVwjSFM1eNbltcHCSoHAY0uxNBH/dR2tthBBnCiNKh57VijRHCLemjAuUn+UHenGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXivN+Z1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXivN+Z1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32ea10cab8eso435437a91.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758173979; x=1758778779; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=;
        b=gXivN+Z1YZl4t3IwltSubJWGo8mSCbMSrIzqJHYWOVPSD88sQbCaa8DBW4EBRiw/57
         GqhcDpA80kAZWZlVGjfLhx40ugRjdw0QZre5cS1OOqCw+NxjbriZ5TW9tx6cv6HNAVLf
         ZKRYMfq9G3WvwccxRhJvJiE7kLfd1EhQj8T7lXSSKAe/INGgkqv/P1fYZ6wHpcz2VbLE
         t1lKWRTRnFtv/d42oysrJn6fY04OXdV06tAoWEI5oowG2ostS6hbGgh4ilSNzGg5Hl+H
         3websB9gvkvIxt56auVNBv6JLcfSsKmoewIWWcMkv1k2Z5p6UNPWYJszYC1A49DRx1Yp
         7O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173979; x=1758778779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=;
        b=N7Ogx0IdgHmORsV2qL7jsgj7QDCThyFU3CNY7e1Eb0ph+b8whU70PCxlC0MDeVmv7C
         VIZ5hfrCgamrGNjWMFnG1LKNK1TY8m0jXd5+vV5zaDOYWDpx7i59ikFBgqLkJ8sHcEdq
         L7ZaUntL09VKvkQfG5ehFAMcD4jnKWxcCp0bw8b5+6goZIOi5nG4BmScTFcca+WLZSZc
         aYxwEvF0aNdo7PhX7N2iL8eF7Z++6IFLOhrUx3cI2NW4vMNI7bRj+vkWGkS72GPB5yea
         1yoSwqi9ySJUxgwR1cX3a2qqVGIv2CLqTCeC/I/DJ6QisZlXoUbU9T7ea2iONL5lAV71
         OnGw==
X-Forwarded-Encrypted: i=1; AJvYcCUBjy6FMT2VHPkjHlDBz6PeI9XFkPG+guS8MVd8r2BUDEiAEzLpN+oucb/ArIQFkhLDyC4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVTpxUTmy2EutCKPv20+Nvm7hEP7R9bzt0tlLmS/7ZXvyAo99t
	JD13TFWlR5ZOToNgRE7m5MXVQVuoh3NfRa2+UNR9/Drx3vynz3Sb9hGO
X-Gm-Gg: ASbGncudytAnKbb4eHsLdCLAGUmCyaBgkv5lVytkrV9rs4NEZ5A8nLp9UqPaEJHHUkb
	hhHlWtGGbJGBDsc/ahgJlkjXtkm3tEUPupet3uN0juY0ad6Uz1SHTH5gJ0sF5nGNd+qtCHwvmUo
	p6ojdRewlm230hedk3ZyNQc/Eqz3RJkcWerPSreoiuLpmih1SRQibwIcbGSiTBxmftdEyA0MQAS
	EoCXHFqu/xZhv2Q/diPO0PmsaLUinbIeiPiwdh5JsNAi/Exj/pQwyLH+pJkGil8z5Rpdk05ilJO
	rfUhlWFH2jK+XR3NAY/03tOcrM673+tY+g/QwixSvPOMeT2lWk9UveoUTakkxQV2HX7rvuj6eD5
	SLwrNOXx+yHoz4FIm6+/t7UC381rsPs2B/QJQ7ZqHCQ==
X-Google-Smtp-Source: AGHT+IHKTOfJ3BPX9Gvt+4rkN+1gu0cdFOaljvM9zc+7rWxc750973qp3+kLMzRM1HA3dLLSY8sf5Q==
X-Received: by 2002:a17:90b:384f:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-32ee3dbc98cmr6602993a91.0.1758173979532;
        Wed, 17 Sep 2025 22:39:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a592dsm4145943a91.10.2025.09.17.22.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:39:39 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:39:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 2/6] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and
 GENMASK macros
Message-ID: <jfhd77aocqhww5iz5wggmua45nvaf6oyggtkyggltacsjwgknm@juwsglvompqz>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-3-dario.binacchi@amarulasolutions.com>

On Wed, Sep 17, 2025 at 10:05:07AM +0200, Dario Binacchi wrote:
> Replace opencoded masking and shifting, with BIT(), GENMASK(),
> FIELD_GET() and FIELD_PREP() macros.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Applied, thank you.

-- 
Dmitry
