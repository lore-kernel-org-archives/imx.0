Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146B91F95C
	for <imx@lists.linux.dev>; Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065717; cv=none; b=feiHNTUt5JOohbCpRTWLcpgrpFeJHPBQKssECUzDNSNmgc5NhtEgiXLRh8qZ8D0YFhZkxHtGd14TaFk9KCdFTDLf7Q1yqXzzAzm1REe87Snt5rA/X9F3hLWI8W6me0DbpuXSmdJiHgqbVmqxREJ3pJdBsf//0CzQF9x/pf+0tmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065717; c=relaxed/simple;
	bh=60j1mYXfx8imU4XQiFjnOOvCwt0U79tykqDPzODIpZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rN/sTuoFcTpd5mKPGT5WVqs0rkvsBQ2wdoNcW+Rnf+vdF5Eg2rHSoFrxUVzEH6HAI58GYQBXbUm0OP88+JzeQcBPWX6Y7VFZfNPPmtoFJ5taIle5Uq4LoEk9c7ccTq7pva86FrLdrJZd4SPps6tEZFnm/+PVHD6H8to6doJ8pFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maFSgfUy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maFSgfUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F94C113D0
	for <imx@lists.linux.dev>; Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757065716;
	bh=60j1mYXfx8imU4XQiFjnOOvCwt0U79tykqDPzODIpZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=maFSgfUyMQwnqV1XKC3DkrSxo3c4Gr1bocEJUa0cLC/fCnWL7VKM4c2Bo9v1SmE4u
	 yVQjdnUaUzl/q7oOdXDTBWOziVgkW3OUauQ8yDbUzkhD+Ea/pnt8pUGe+qn8Hxy6DP
	 errowBQd2WgD8DTePq4VnEhBOJnbeJmsXbrCagkdiWyhFzq39BzhmUenO0511YEV7n
	 jg+iBtIvamrBFBb9f8DY9bEXpN3pl+sA7SKU5wB9iLK+S2xWlmrKw+vsNDCdZOVn3Y
	 RFDI8L2baCVkbbjmpaN5vYKIn9ynTjCxTDJPLLx6OTo4NvTKH9jSoNhMTydU60UEnS
	 1fR3EU3FDmD7Q==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-61e536ada47so689742eaf.1
        for <imx@lists.linux.dev>; Fri, 05 Sep 2025 02:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdQ5yoDVcppxwQ1fjNA91/iwF3gHy0bZEtqoUusF5RLE5GefPXMu+TtTG8bOP7TiX6eEE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ExNHIKqxMju/D1j4wLf/I1OP2PKfqs4u/+V9yG97FuzL1dvV
	qeVg+uBMUzGHfl95DnHqlBOL7XFKQdkHJYZOn4FqzUJwThvDzgOzAsXc0HdjqiL1AJqS9DRZKk+
	+i0UDpl8WHchFa19GtqsL9xpEzv2rWiw=
X-Google-Smtp-Source: AGHT+IHkVwjUQLo7sTj2SxSH10cahTF1EYNw9jM6xcyVmF8yMApnd+1WPw0MFaTQWrdPzjCgm5hFMvaNgP7dcxRbczQ=
X-Received: by 2002:a05:6820:1b96:b0:61e:154c:5b01 with SMTP id
 006d021491bc7-61e3374776emr14360839eaf.6.1757065715741; Fri, 05 Sep 2025
 02:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn> <20250903131733.57637-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 11:48:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
X-Gm-Features: Ac12FXwjp9ef-jXM-6Nr2o91cs1h2j3e0FpihiJghXWzXAbogv1aACVXGXzJKyM
Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] cpufreq: intel_pstate: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/intel_pstate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..925efb1e65be 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1209,6 +1209,17 @@ static bool hybrid_clear_max_perf_cpu(void)
>         return ret;
>  }
>
> +static struct freq_qos_request *intel_pstate_cpufreq_get_req(int cpu)
> +{
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
> +       if (!policy)
> +               return NULL;
> +
> +       return policy->driver_data;
> +}
> +
>  static void __intel_pstate_get_hwp_cap(struct cpudata *cpu)
>  {
>         u64 cap;
> @@ -1698,19 +1709,13 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>  static void update_qos_request(enum freq_qos_req_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
>         int i;
>
>         for_each_possible_cpu(i) {
>                 struct cpudata *cpu =3D all_cpu_data[i];
>                 unsigned int freq, perf_pct;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> -
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +               req =3D intel_pstate_cpufreq_get_req(i);
>
>                 if (!req)
>                         continue;
> --

This change would have been fine if the modified code had been
correct.  Unfortunately, this is not the case because below req is
passed to freq_qos_update_request() which accesses the policy object
indirectly through it, so the policy object should be
reference-counted until freq_qos_update_request() completes.

I will send a fix for this shortly (it is better to fix it before
rearranging the code to allow the fix to be backported more easily)
along with my version of the change in question.

Thanks!
