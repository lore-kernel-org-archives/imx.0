Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C5B652
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448789; cv=none; b=aLsAXzPMvsxTDCRLeOxfRpnNEngTuL/GEz2563Sm2JcUbvMlQRQFQefCXAnZulT+fwq8wMQFUxEeoeAI8LAlIDAdyEAJ2q3cevBiHcpzOvOZwnhU3Dbq37Agfa3T6DP1OyvLPCKHE1u2z1Ag0zBfXhNfUf60NHRTnJeyh0SRmj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448789; c=relaxed/simple;
	bh=fAwq717gxOG/gzksvHcfVeqsyH5k6BHHvFVv/kB6CwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzQYy8dSwQsk+R7T1wPAm+5+GDN7KYjaxFPw8BKkV/dTFgDzzTyXGXfr8ZxGhPjsH/5g0x9dKRamTY7qyE8h2zH9YZyuq2Ujis2XwA3lmdNKGU1ESMaw0w2WX1IDI4kzasVTy+oLONgQVn60cfR1caDf1dKFv75BzY8cErfrq4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0h2sLt/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0h2sLt/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-327b3e24637so986461a91.3
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448787; x=1757053587; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=w0h2sLt/ERu6cGe+35dGlsadI9+75Lzf3wwIqb2sI1ahbUbTJwL6VcDxrYw6f15vLq
         SwafC6/N5k4QaG4wqcc8THZjrJeNgwZ0S0/fyvsFLfcHTCa20wNnp1kW/eUYLb66f6TL
         OkVO4qxLD0FDTRBczmh/IKEeq4TG3ypF51HdcAQAg8/26XXMawm4SIzQ8j+5xRBxvF/s
         lu8xr+UcRoceZkNXXC7k57SjgeXQR/1qSJ3LOgOBV3XODBb67wlGLyotOIXmwTnmV9bH
         drwUow0MBiDxEPy+hz3/QO9zDUS4dLuJUoYe2RKZDM91eGv4oSQiKYQ+DLvPHWSSb3ht
         QQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448787; x=1757053587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=fZnjOjCjTvVSWazaq6iCOHnbgKiozqQFob71OFvvsBJOeGUrAkV41QpdRgQYSR84FJ
         CPDcKsFIVZxO8g5jvWjd1f0NZvN8vu/+p3KZ2zCwsn7Cvfu9+a7MRi/xrnieF2ti+TBu
         TImHo1wTxAt9yxyOied80EpOU1iEK1ECJb0MByqf6BAIa22dVlrK/wZaBCU90IREEi5G
         03gOHOxCaqIIKiRB5G0NDNwiDhP8KwfKqrJt7l/pQgnIylZHtK46FvgmIRWguxKE0rD8
         oAk5wV3LDffnnjv1SN75PBU8Xu5jKBOHYwNEp8MIXbkii6kxQO9vMN0i63z77v6V0uI1
         GEqw==
X-Forwarded-Encrypted: i=1; AJvYcCUybgcK9az0b3SrdOZDcBmAY10cMxbEA3Y/RHg7Gkm4UjrTgywFbHWN4/NP0tbt0FQpXKs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdh/NNIk7NqIoku4Z+sW7qHQHG3YsLwyKiX9godb2GBbu9NIjq
	54Jy/9NpnihsBkWCBjY5+oNPwDhE59vsiQCehIl1mFrng0rwfQqHB7cUSnkOI9K9Lnc=
X-Gm-Gg: ASbGncttoKxbaY58IzgtlMIj5NaNOBKlxcQuSqb+gj85FztuVxr3HKGzCIeXaiPZXVl
	ExZDBBT2pgHkt0yBoyb0GIFN3+DHpn06GAv2O5C2wqj6soIWD8Pgjc63Xw8hnQGAV0KJNIeqiUQ
	/Wr0oRswWjbRjXGc96wdCY5eE7/som+PcnVs/siw5rO8GqOGuvFscIP5fSMjHcbZupLNIXb/cfA
	d+8l5n+fBW56mE52vWIKtwjzEbVKDygc1r8BBvlIYXz7rXMgoSAAGgd9z2F39XFh5X6FHDRl7YZ
	nkcWDT9EaIOFFWjxwyHHF0hQ+MrkwvZCqiywzvVNStmyQsVJIw45jr7ZJiAmUTLnKRf0yMaltcp
	GMYVg2B1ZeIVFnedViT+ZzWWC
X-Google-Smtp-Source: AGHT+IFHYb22k9tJefksk8Ol8WzLcbkUpFNWBPL7w5JQ2Y92t38N6cXrTs0utCYM4huh3xQWCdkxbA==
X-Received: by 2002:a17:90b:57ce:b0:31f:210e:e34a with SMTP id 98e67ed59e1d1-32515eacfddmr32147827a91.8.1756448787009;
        Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd4bd6sm6984417a91.15.2025.08.28.23.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:26:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:56:24 +0530
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
Message-ID: <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
 <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
 <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>

On 29-08-25, 14:16, Zihuan Zhang wrote:
> Thanks for applying the patch!
> 
> I’ve been thinking further — instead of using __free directly, maybe we
> could introduce a small macro wrapper around it to make the release scope
> more controllable and consistent.
> 
> Link:
> https://lore.kernel.org/all/6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylinos.cn/
> 
> Do you think this would be a better approach, or should we just stick with
> the current use of __free?

Lets keep it simple for now and use __free directly. And keep this
similar with other parts of the kernel.

-- 
viresh
