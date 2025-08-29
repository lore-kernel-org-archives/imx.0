Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05221859A
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756447190; cv=none; b=X4NBLZzmhveMeI0hqhnmcImi8JP9NFjuJZizRLXFXE3loDbmK15wMgUZwyItB695n6W1ePgZMtRGV6n1Ouvo+ecVE+KOzgDab7zTY/01NAbeZ05tghr9a5svSzsmk1dDZIfgY537czoYZQob51eG9oeq0j9Ufq+1nuSxczgm5WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756447190; c=relaxed/simple;
	bh=3Us6gLaZK2VccDGA6IMnqvs0nFzgbS6I49Q/8l1+6ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjJj/y72cyuez4dkU/yWpJr3vnrGPyrdHROaN5mIRiGHUQDWV70qnvjusJRf73KRmxrtUsp9qQjQ7TvXdjetX6U8CAr6i4WCltu86ID7v2+nP7Q42YDO4fhFhDAKqyeQIWpFT7NaaeiDbmS/vt2u76IG8Mfu8s8mEPvQqheD5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwbPA7Hr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwbPA7Hr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7722f8cf9adso210269b3a.0
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447188; x=1757051988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=ZwbPA7Hr5TuucVORvbF/w2DjawSpTIz1Z0wQGbFkaZ8P3oBTPjjsPj62lp3UtRGybS
         ZVrTOx+uZzANALLXUhg+PmBEtMF6LCXfheWVWRcubMaVXg44w5RXW1uMvcscKe7xPnGl
         Xe+3C9RfQps4xzw/IwcYjbho9u+Q8XtH5jsyPi4J8cez/tPCWQX+ZHOrnGZROEKyiIgD
         5PhJzdhIxp7C8bfC/JV3rJOusHbwhKX3jBApdJ0ekNCPcG9oYI/vXHM8Xqb1YmPeVbCz
         AcqMoZenqxV0uyAaWiUwaOdKEE8TrHrAw/H0TOFKu2YluJhC+PM2I2rrPTQftwMxgev4
         pbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447188; x=1757051988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=HhOc9NUM+WavN3PlkNGnuBFaDkyVnJda2yB/iVPgADEblgsPHyEaB+V/yIJnr/HEOW
         qni1iJ1jkVTt67E4jK5ZwtV9REuZAuii4WZydYlgI6Gu452H+1zegJ2bCdGgQzpPLFbl
         5vwCpKRbELWWdKFu/99I9UI0D/280bxSuWnxy2w/8PzBjjw9+iu0obKsLeh8oJEBox6y
         pys5q+VTyoylGY1251xOsdJDLAwBTgzB14JmZ8DDiYeXCYWbdX+17dyDCR5DEE/KAfeM
         5NrS9SYpT8QdgW7xu5H0D54xkxBgWohwNrax+I9WurZmi4jM+5d+TKKAhJizV6s4bbqE
         DMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqxLDGRTX70MZ1BPmbWqFHG4j67Y+KAbSp7tOKnBGn13pRkoVr7061MdG3l2UwD6rEjcA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtC/ROgbXTEoQr7VDyKLBJYSMhST5w72o6pmk8lAsPUt6AAXlt
	K828yWhs9AvwxAoC6WuzBXCJxldPcFGg8mj3Lng75ZweYHFKwxJp9AzxvbW6I0pNG8g=
X-Gm-Gg: ASbGncuqTVEsuBKe8Mso5jjcTT0XzwCjyR0XNKrfKXG5IMpoS/sjQCiYgZ7aaxYJorV
	Q2TX5xM9y2WZodvwsVHi8sgK2atJ7TLYz8OipCK9b9glm+IDugmBnXuNoGI3yzpU8RPmC8zMi1f
	jH1dsr7cqcgxLDW0442uVRyHIx0eEvjaxlsLupIb6PX0Bzy2WaDpGkJR/cPW/SfMnTn6Riw5f2n
	WeX6XGUagFmyj9D1/LymjpQiRvtfJvEQiPPC25huxS2dCtKiVPY7yjZDX/l+qvKXc+LqKrtGjkS
	cUNkWL5jLL6qtdMEqqyFJK7Q1PeLynDxX7nArw5k2OmbyROIRbSIh/13uCAQseEjjxaUQifv7pq
	VXeau12zT79KKTHRmRyL2t28GPXjSbvCkDj8=
X-Google-Smtp-Source: AGHT+IFsar3WOaSA9RKNM7TPFf9gG0iXTxdUF2CW8raU1SyelgEQswrlDbapLb2rA7PUFkb3M17NCQ==
X-Received: by 2002:a05:6a00:10d5:b0:772:2850:783d with SMTP id d2e1a72fcca58-772285079c4mr3285667b3a.22.1756447188084;
        Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b14c1sm1263485b3a.31.2025.08.28.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:59:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:29:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-5-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
