Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517A32B10E
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674021; cv=none; b=Vx7LXd6cbdaQN/vwMnEe43/z3m4TMBAhlZ4E2XzN7CfALNUMnUggKqP5mFJrcWX55N3hl7reYXlsilTxPKvh3cWovqoQwBoc+dDVqWSQWzbYI6Ht44uGbMQKGtwiytifyAmhvGPhtI/m24KkL4tIuoEbq0NH0Yy+qk847IRwNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674021; c=relaxed/simple;
	bh=DvKH2fFcZ/uhD/ZuKu0uGpyMl16LVSMA9icM14BxbOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFeLmYwCPEJu+CpXYodIJ8izZj9f3cD7c5+BKX1jFclJgbMBd9A9ecHvuYuB4IQY3QTLwwXjQ1cBc1tWzBqQ1T9g0Te8UafHURyNWx6hmyiV3cfJup47Wp8tgBk8IaO4kyGp4/KH/zdzwnXfcTXPAqwvZC51HNAfQdzLqfZCFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDqWrCj9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDqWrCj9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c25099bb1fbso25585566b.3
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787674018; x=1788278818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdqXyZVZhBIDnSDIcLKPXaIgy8TBNW5ywHFUYDexGKw=;
        b=eDqWrCj9lTm4Z18xOaO9vtfldxal7Pq5uf+hxycp+UB7K0ISD9v68yjmkcsMIjm00y
         HzB70H14JY7wogYGn9ugKceeT7xCxjMTD77+GgWVechS1EMEFcqSLtRk0t2+91PY+4Gu
         Pl87DvVyIetnwnNYEegV1xLC/MvqJbAwxZ/KBOrX6m12+iDqPuUVWqaEH1Hr0cjZrbTB
         Er18VfN0hKNwytV6TKX5W9RcJ1gO65T0dx773ZhhdWB+7Y/2dvvjWgtWibkVR0hpUa62
         38K+8v8ZLkZsbNU6xXWWbafEBX3ZNaMugzfHZLGXTVJY5Qu1jdGSEmoye1eMwKDB1Rcn
         z0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674018; x=1788278818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdqXyZVZhBIDnSDIcLKPXaIgy8TBNW5ywHFUYDexGKw=;
        b=FFcnj9rkP+tg9FCMgUC9Ie3kwbmzNDhPU4kl4Ief/c4EzULNmIN6bzrBdI2Px53BOz
         XjAmCEUzbCdPrylMOZSoi6Dz1+PMdgJKeFm3l4lnBTiwyL5yskUia+Gt87Qzr2wEA2R9
         Pfp7IC35URnoi86aXzGw67d4HHIDdOa7mlPCITWf4OAtNrguqt9dP5Tb/R0rPkKBIVKO
         v647XhZK0qZ9v8ddhMcaifWi3PxZF7qoRfTTLnSuArRBGfnAXjiBkKvNeU0wlMxqsmLd
         g9PR00fxVvTZMk3GW2WAW+lSWOMBYQaDZZ/za+eXKYoRFOzAvmJ4dq+YOl+e1q4RiLhw
         Oc9w==
X-Forwarded-Encrypted: i=1; AHgh+Rru3fGnnAHL+cSH8iS/huggS9+9E2KS72n4jQ2T1GMDuZrxa5/I2+YQtxkrWAhx7RZQl7g=@lists.linux.dev
X-Gm-Message-State: AFuF++kUPXGIg62PH/eDsZqeY+auDrHcjwTb7ZzUhy9yZ4+L2IUEhlyE
	DIb1+PuC/lLLCT7oE6qqREQonWe4Dy/D7TxgBM9SZJ1jfsDEDPwxTYbO
X-Gm-Gg: AR+sD13Xbl5YgRdu32Z98eCTy3meVJDidXq6iiBM0g4mKfVhoMbkDd4STOEXX6BJqd5
	eR77TkPGLSqQLh0HTrgr5bHvk4Z+DSWOY7tWnvwsLrzA3PD8mMWPn5to97BD1dI7+i5y/1h5BVU
	EZ9zVhXWb1XoB20D/azNNS/IkK8LSnafEvjCjr7bYgsJKZHDiXGrhW8SV+PdVCRSHqqANvrfuuu
	/gdqmlp10hFyf/7CAoPLEESWwsGvfX2bYgkNdcuXqjIW5O4ZDXTVd1h7HzyMydlsJ89vuvrbWVt
	qzBcLj8hliOiIS057oNNiHwocFzEeWvueJkY0YWPr+YTcC5haSCZWfGqlbdNi7iJwbj+mLwUlnq
	J/d1csY7JdYRZ1TqWKWjkT3zrczfQUSbcMYNR3NSqR0LUT6UWaKOYQcKWOriFRch6oMj/P0bLgb
	IKZ+T6g/PqypGFIZM+Kpmrgz0i04PS/A6EKx422qKz5OmgAPrcFWpcHFWPdb1Qb4lhRJLcU1UNJ
	S7tVXq4+p8c5cXPkAQsCI1TkMSu7YLG
X-Received: by 2002:a05:6938:a08e:10b0:c21:7584:fc58 with SMTP id a640c23a62f3a-c24e5b5531emr663869666b.12.1787674017582;
        Tue, 25 Aug 2026 09:06:57 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d62dfsm24369966b.4.2026.08.25.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:06:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:06:53 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <ao29neQwKSWlK4Lx@GLaDOS.station>
References: <cover.1787586961.git.stefano.r@variscite.com>
 <2b7fabe6b1c4d08e58d2542742492564b67c4c32.1787586961.git.stefano.r@variscite.com>
 <20260825071648.B547C1F000E9@smtp.kernel.org>
 <ao2p-Yj1HfJeeVOM@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao2p-Yj1HfJeeVOM@SMW015318>

On Tue, Aug 25, 2026 at 09:43:05AM -0500, Frank Li wrote:
> >
> > [Severity: Medium]
> > Does this GPIO hog conflict with the native usdhc3 pinctrl configuration
> > for SD3_RESET_B?
> >
> > The sd3-pwr-hog statically claims gpio6 11, which corresponds to
> > MX7D_PAD_SD3_RESET_B. The pinctrl_usdhc3 later claims the exact same pad as
> > SD3_RESET_B in its native mode.
> >
> 
> Is it true?

It's true, I'll fix it.

> 
> > [Severity: High]
> > Does setting the sw1a maximum voltage to 3.3V violate the hardware limits
> > for the i.MX7D core voltage?
> >
> > The sw1a regulator supplies the cpu0 and cpu1 cores. The PFUZE3000 SW1A limit
> > for this design is typically around 1.475V, and the absolute maximum rating
> > for the i.MX7D ARM cores is usually around 1.15V.
> >
> > If a driver scales the core voltage up to 3.3V based on these boundaries,
> > could this result in hardware damage?
> 
> Please double check this one?
> 
I double-checked this.
PFUZE3000 SW1A supports selector values up to 3.3 V;
the 1.475V limit applies to SW1B, not SW1A.
The regulator-max-microvolt value only defines the regulator constraint,
while the actual CPU voltage is selected according to the i.MX7 OPP table.
Therefore, the 3.3 V constraint does not cause the CPU supply to be
driven to 3.3 V.


Best Regards,
Stefano
