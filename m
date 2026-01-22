Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BB62DFF3F
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087408; cv=none; b=QbqjQdBaTvT5e0xeQLOVwu0N84lksGbwSp8ft6z2SOAPRbpdCTX+5EjO9cI8tueM4BE4dq9tvMFgfveRMQxx1CI24sVnaVSDYsYGvrtxEokqHgW6O+EfAtmRGU5+gvc+IUPv8p3OytNFW0lNmuM9p9nMOZ1mSr9XvgKH8p3cwVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087408; c=relaxed/simple;
	bh=yrhDq1FKTFkwWit5tdCS3E1v5g1V/whLfFj0w+I9B64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUl0amNTsa7WhStlLrDniBUryzEz48/OMSSoQ9r+fSsyTUqvI7fz4R9Lr3KDs+SJGKeM8fgo2GtqeARIg2ThbCsfbN6hZWaHuqhWOzjubn9jnuc0XDsfw/ME3HGNAGvWGlUcuMLZwJCwEGSNq2qx6LvaNAw810muViofLtdWAB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwBoi+K7; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwBoi+K7"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso118726e0c.3
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769087405; x=1769692205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOJbmAqeybZjyx2TKIYAL6AqeWnXA5ugxQdeE7j7WVY=;
        b=mwBoi+K7MZwurBP1notv01v+bLeH1jCqRKVFAZdY2gSaVHP8FRm4AIckFnMpOxSLGq
         RgdEoN1esbOk1rdGXGGXeyt8TvSy2ySQjIO8NwoLZrsJ1OBT7e2+pCLQXCUialXKKqWT
         qMHQKkdsWlz7VNZjcHBrVoANZzVDtrnzzBwrh7G5MQ2zIxz87olxwxYguuw+EBZ/+U14
         6xha1OUAsxIYDYA2UC6tpEBIi5kWXng2nsVHmXzHiMkIQKNYuwZ9o0nAfgc2d0Ih/dPh
         o2yJSV9RxY8D6di8T98uLjQCMkMMpESdm9fFPJTDgN1y9pVKjS9R5SmvDxPjWnEVyvi4
         CtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769087405; x=1769692205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOJbmAqeybZjyx2TKIYAL6AqeWnXA5ugxQdeE7j7WVY=;
        b=Rx3Ppae+4nGaFfrkOwxbeaIPiZk+O8hF85AWg11aYmweZtdcmWtz3Ik8VivRF8YTBk
         ixnnzTiotHGIvARJIRnz6uk5aQYz11oUJE+cM5/A7hqcqm3D28AB4Doqov60u99BGkzf
         wYxmuOtBzZwnHiCbfcrIBhCfHFV8AadgZzs5yt4o7frpThczNEz19bS2QJ38ohWeM/6Z
         Em8QGmB8ljcSO81PpmAh3x14PCXvUPvVWtdEpccBxM17WMsg41rUA0OLxgmBXNxgikCg
         rCuHHKNeSnmvbq3ZW4EC+rdKQEyTs8PlXsZQn2ugwfVcLWEJ2/IbnSinlik3M+NXvjun
         6bgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyJ9oWuadvp9kgFsXzxFyA9KMwy2kIFrmqC26mwgVqXwnH4P+11UQWQYstPum2jj/j6XQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz629kD+5wMb+616KPft9scuBw8HQ2FWlmusLJI6+fBBkbbsjyf
	DH3b3WisBrnRrZeQJgUx4CevoGUV8+BRrlmfeCb9bcNhoUGTFKX3n7Vh
X-Gm-Gg: AZuq6aJbKrGBDBAY2AISSnVkbUT/Ls70Hc3tiI4REPAcW1QHkm8Db0L/S+v7Z/vC8NC
	r8UOZq36/zAegPu4g5329gHuEGaCSqsfwIOrAaPMS6wcoRKBltB5bQHtO6vtr+bWzf354tpZYR1
	0YafqVaOH2gK2IVBBeOIAqwkGz0l+Gab5cIGomW0cD4eSR49vCJ7dEnRBIvaeYsaYGO1Dbroro3
	V8EAcDyro/L6YcoYZb6ZSdVOe0Bj4ipm5hK/OPHUHKjnrg3OYvyGeZIUB/MRQq6wc526V49EhfD
	xtvyCn7DayJGSLWNi+34E1cw/tPgPNdcYsptMbeHFRwRtvoKNVrZEnC8fa2yDv6z4YC7396/0h5
	50/PIZN8RSjwnp2OM7O+86L9IQhKQtcfJZ/BYbmDBp/dC2Fb3y2v6zZjX382TsGqCSKDJFwpKgv
	zmRUjBoW2t3Vo=
X-Received: by 2002:a05:6122:311f:b0:55f:c6c9:e4ba with SMTP id 71dfb90a1353d-563b5c43481mr5674295e0c.13.1769087405368;
        Thu, 22 Jan 2026 05:10:05 -0800 (PST)
Received: from sam-fedora ([2605:b100:535:a12c:3f00:2b8a:86ec:9cc])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e516fsm4487884e0c.13.2026.01.22.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 05:10:03 -0800 (PST)
Date: Thu, 22 Jan 2026 08:09:59 -0500
From: Samuel Kayode <samkay014@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, imx@lists.linux.dev,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
Message-ID: <aXIhp_c0zjS9dfWQ@sam-fedora>
References: <20251210211149.543928-1-vaibhavgupta40@gmail.com>
 <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>

On Sat, Dec 13, 2025 at 01:38:57AM -0800, Dmitry Torokhov wrote:
> On Wed, Dec 10, 2025 at 09:11:41PM +0000, Vaibhav Gupta wrote:
> > If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
> > *resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
> > fixes it.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> 
> Applied, thank you.
> 
I think this patch was dropped.

Thanks,
Sam
