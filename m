Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A01ACEA5
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 06:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191275; cv=none; b=RsNvF7GMxi29pXUeV6ABOZoS8aZGdofUk03retIL8ztA+a7Onw3di2vXLRRgOsQnQe+jynjPqXbVecS66mYs/jUZ2Z+D6w6TntsblufbBWmlYMkG+C2TdYzvcbWyAxB8KmId9fB9+S9LOLlIo48IPYJM8wfGrl//7psPZFQxktU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191275; c=relaxed/simple;
	bh=sYhKHIY1kH/Sv85aMyZfq/DmcwiJ9qI1WjhsBbWJhMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hh7Bci4R798+pwhXvPPaBfpLi0Qk1WwBKG/Qh7mguJNi+vAispFV1ZYEw/aDmD808VemHL938M9adwAe75IsPZ0nFMF2f7N70gUNkKgzgUVJjst2TVYttRUHnquQefjJxFMvXNJxMhZ72itxYZVu5xdWn4L2RkeVRUkHZBNlVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbS0Ohez; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbS0Ohez"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224341bbc1dso70969735ad.3
        for <imx@lists.linux.dev>; Sun, 16 Mar 2025 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742191273; x=1742796073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=;
        b=sbS0OhezBkaxhz65y7tyVisWQqJuVoe8zMv0ss8vy+VVBTuQd/mul+/sxVU24cjJdJ
         VePEeIon+Thcv/rDJG4lb1dl4KHvDWUfvd4dfUi3Ag7/lQzEa8I7LCwZnxQaJQcz+BG6
         PLQyl8BqG+V3WfoMfzr3JJfL3Qn8LtJnpsfJOW8PAGKLcd60RBFkdgzCUp9q5LOfZxqd
         TG7Sck1pNmf9JNEZcnpsp0QZ5NR9LM+oCY9H2/tlDkCQUOGraPNeChKp2Mhfg89C5Vlw
         ogES9lZIMurHVIElG6U7mHA0ySlPhLL080KjwK91sfq+ndW9AhMr2KrgWqPYzJ3qP7LW
         oZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742191273; x=1742796073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=;
        b=jDW44gD7F8ApjGp/xRMm2y7ZSvy6Qc1DHvUpmHHGhobbdFQ3LejhXayFVtSpZUObUg
         amAVx60fFoxGbLz8Ufbe/gflPm7XKPY7vhzbRvIs080DNlScohesXueI9iNnDf+x0poJ
         AFqDxjUVY/YLTfXrBuucKOvL3uMVC+YurnukFbeA4R8lCXTcrhp8/yPT9BMfDR6apLHw
         3vi5kgoPm5vJmrF+4kUx8SEBnEvPlEMnJPGtErH4pyhphnimjG+mCLg6XpXc0VASzSNY
         M0KuTGGX5ofPAhQ49p0ZC31MPER1U0XtIgjfJt8pWvdryY5XmSMGXkBoiMrMhswGxpmK
         E16A==
X-Forwarded-Encrypted: i=1; AJvYcCVWVxby885satjdbCKpJbiOZFjvSFrk/R9N96F6aPxQ6XibL7jGrrCUl5WpaxeZvwFQ2xw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHrfqYlE7nx/LaLDeSB8rVeNjNFuls7tcaOYMJqhcOGV8Fu8oG
	hCzWd8qERGD/T8hRmPszE/LlIUg6rly9YKmAcfmo1kjnOigaG1cBJ9W+MUKGRPLYdazDsV8SRRB
	t
X-Gm-Gg: ASbGncuOPKeCRdLxjnjRwBV2yoxn8Vcy/ra2W6MvbMz+Y0Qm8V5E5SsEZaQgkkRG90s
	BmkAvROJUUy5IS0DaPSXUafmJ6EGNLxloSw5J8N9rtZm+Vp0B7/7+Jdq7lKvsjn5cRf/R7XEJrZ
	CaCSERgM6WJIGW7DLE37qTU8XImr13k9aD4JSBwS1hkgL63RfOM9mC46ftj/X/qm0N/ENMNmsV3
	rdtaDYMOk466vQZncx7irDC0Uf74YlT8IzmSF7aW/YWSVRQ68Ud7rNuh680dPqs4rMFPc5XrZkU
	JHzVVllfGArkbRU/ST/l/5fWjnUb84/XhZ8QsSFRHSSS5Q==
X-Google-Smtp-Source: AGHT+IGZgTvwmbnlN60aL/w128MQKSBVf0ulmLghu2RqTVsFN9YIVHdgYTn08PK0fXwGZKBluWTVCg==
X-Received: by 2002:a17:902:e74c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-225e0a40bb3mr160011395ad.12.1742191273540;
        Sun, 16 Mar 2025 23:01:13 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbeb94sm66648165ad.199.2025.03.16.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:01:12 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:31:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: rafael@kernel.org, sudeep.holla@arm.com, ilia.lin@kernel.org,
	tiny.windzz@gmail.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3] cpufreq: Init cpufreq only for present CPUs
Message-ID: <20250317060110.tvjat7ugmaceayyk@vireshk-i7>
References: <20250313013928.529926-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313013928.529926-1-ping.bai@nxp.com>

On 13-03-25, 09:39, Jacky Bai wrote:
> for_each_possible_cpu() is currently used to initialize cpufreq.
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
> 
> With nosmp or maxcpus=0, only the boot CPU is present, lead
> to the cpufreq probe failure or defer probe due to no cpu device
> available for not present CPUs.
> 
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> above cpufreq drivers to ensure it only registers cpufreq for
> CPUs that are actually present.
> 
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v3 changes:
>   - refine the changlog to drop the changed driver list.

Applied. Thanks.

-- 
viresh
