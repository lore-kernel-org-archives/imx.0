Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E5F1F03FB
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756447473; cv=none; b=Odty97yG6AMmyLyorhFadOcw8txn1cXDaWxe10gc1XgWCir4SGhtZDpVxon0ROu6ksSGT47gjas6V+cU7pc8vp6D1sawmEconzrhDLIYGy7jXcmekuAAeKUNyi2tGSPDMpyfLc8/hFAaCCrz7b8Ui2Vewa9q1vsMSKZmLtesKnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756447473; c=relaxed/simple;
	bh=R1W3jiVVzxWYPVNevFrweFrVDinP+HnDaHhtFMQbjkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0mscLwOXdCCoi7Clr5pFgxjGgogiqb+nNxzezyh6ZcUHeHZjq1PsW9MUBbDR/iAlMFLevIZfTQqeAW9nqwPUay5qCxZk4Q6xKFZw71V1tfsVC8DV1XFVULIiOWDcF7AoHXCh5naKQJ7DlYK+TAzXzmIwOBHeNWAcTnbVmp6biY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AMdx4SkS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AMdx4SkS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-327f87275d4so10570a91.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447471; x=1757052271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=AMdx4SkSriYr5pQxtIA9W8OCwqBZHDFzB09yQRJwLm9Gm9nb3VNFPzGO9a0+4PpT2U
         ZOYPosw6DUDrPZdZJ/sd3soP0aJ70l6lT5Lhwz+o5Rae4zP4PpO5xyQla0mNE0j6wR/E
         gyMcGsKqJmNXXhMXFcSEWWC1hHgt2ppuvi5EjMXesctH3flN0ocrWBhlJ3MdIWj92qon
         f9dzBX6OVQTmqhAojxXbJhmFHQIGt5b/pBB1Glkr4ROD/uvZ2QSUmk4W1+nvW3cIZS73
         u7q3t/aNj/7LYxdznWH7tLkuEYO3TVxf9ePrxfNy4bbkGMtxW/YDCK7NStjhuu6nSeWJ
         tD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447471; x=1757052271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=Zcnd8jDn5xw/FGOPGu0bNDBzUtYlTVZrpQBSJ9h5hImp/sj4Md6DdQdMcJONalfsOG
         fqIpBheGsy6bu1mmMVtCL/n9T1s0YCvQYx1G3BLeui+hkaU8ZanHY/QpooXrID7FxMed
         yubXo4hD87k4RaYdJY9XdmCLmrA1nOKt+yHkvNHPns8mO2xoabaueb1rJ7ZQI4Tcx7fB
         6ToUJu14sS8x2BCWFimftDUCFluGAIp27N7RJSzjrmON9kPH0n8INIkSJ5arQVGVhBMw
         WhLmvyvvIBUroveLFxE1LlZH5Nvp6f6909pclr/UiUOuVsfKW9aYWUvAKwni8nY6mXWX
         dD5w==
X-Forwarded-Encrypted: i=1; AJvYcCUdlGRd4sgJYOFaGEPYkmvyJopg+ev91p+Bzsa3ean3Uh0FozbLbF6syHDEmGGuz5HOkXA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz+Jm9ds487AEX1A8C6m5PSiD+BKp33j1E1tO0O6ltn1f/tNBy
	mx7ZPiGOYpyNhdAd8tnGU0xORb9UKTq/4EVBGAveL/uTzyM+xP4V1Aez2EfaZBgnbgA=
X-Gm-Gg: ASbGnctmhRACsy6Vj8AKLJCDNIfSUravV4y6fqstk29KcpipZ2+LrlePN3/hK7ovU4B
	gSoUVsA+eE+JOpP4KGRpKUoaXreg9TerBJ/3pePqE0vI9S989SQDmvU1jCTgWim8OofVrr4DLGL
	uaiSeUdEH8PkojiZmEu7TV1ppafh65KHDHS6UAarj5ku6dkeWLYdZh2bvt49PH9wJaj9V1BVqxD
	SYqqrHv1oU9davWBcheTltxIXiQ8jr37j1A9sphiMpfb3woY3Mxf5Yjy2JLuxR6BpuJIEjrc9VT
	s0nrqdOXWRueqelTITBrH4RlcpUktmzTksBtcSlhidAtsByzYvibMMd0s8sn6e+w+t2ns4+07ad
	EouUhuV5oDGi/P9B0LhuPlC1l
X-Google-Smtp-Source: AGHT+IHJm0ouStNvxO+mrh5P3XbGCZbjhM83KCGZEDW+lDzAXYoH2OUF1pt2Xet0QmziR4vBgyThHQ==
X-Received: by 2002:a17:90b:4ec7:b0:31f:42e8:a896 with SMTP id 98e67ed59e1d1-32518b8233amr31504637a91.34.1756447471082;
        Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57ab9esm7074127a91.4.2025.08.28.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:04:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:34:28 +0530
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
Subject: Re: [PATCH v2 05/18] cpufreq: CPPC: Use __free(put_cpufreq_policy)
 for policy reference
Message-ID: <20250829060428.aoo4wlp67celupv5@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-6-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-6-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/cppc_cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
