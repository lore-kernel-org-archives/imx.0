Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C429B20D
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756374016; cv=none; b=hj59LgdjNkHpfH4gYrKg4+sSPuPe5G+w3SqGTJHnL01NT3T3+Mv4VQRHkKP45SErWPA3LLqYIwSPrCBcC1hPi2DrYJ41zeiEkIzBEAPv4yDfdWpqnF3vLCeWLKZup5KXcqeGn+cFTOGUmQpvVKzvAb4lx+BOXUPXNp0EEmEmK/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756374016; c=relaxed/simple;
	bh=Cl0m1kDKpWeagimjoCyJC2nNVcFJOKHXK8N9AWWvIRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWjtMwHik0IV1dxaOdgqBsNcnTrTTzRXi0xgmGTD70kRkbs85J1F6ZZl0+Qt+6t8HMN0NpxvqxK1HGg0ONZmXhDIPAE+X64uh+FnnERGPWPFsphMPWTReCE+VzzXEOoU2OLQnTao2V0WJuIVE7KflxadzHBZr67z9z3IPUyUOpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeB3KckJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeB3KckJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EFCC4CEFA
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756374015;
	bh=Cl0m1kDKpWeagimjoCyJC2nNVcFJOKHXK8N9AWWvIRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PeB3KckJWzuoF1tZ8tTiVp8npbP2q+yNr/EHkOOaeU7xc9lzd2ByA9SF/XlL86p84
	 Q204jbf0wqqR/rdATVAYnf9KZQ7oxD7tM+xSEgzpAwadzvk1MQMdY6+QTtivALX9Tq
	 jFtDlCkKcBKFNSTqMRp2M51BjnNBjj6cDiReGYduYaEfHcUbPDnrI6tWVtQt8DwXg8
	 N80qhGFLA5QZlDLF+BB8wt7Qd/1RV+dBEWZDGH/6tRo4Yaa9tWL8JXrEPJSWSztFna
	 eF1nQfq1cHjirFd4nhIbANXiz4xhwfgopXwH6/PpVvwEMEs+1/DVJ2ltgy3NagTLaY
	 e6Xc6anmZqmyg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-30ccec59b4bso684894fac.3
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 02:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx8LreV5Brgmr6HV+vk/dO2+hmTEzypeglnCcMMrJfLiAO2D2A73aVEVp7XJr9KYbZGOw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz2z0tjKJlZUVDqDpM72h+Jk2xV4E9njAwQAuK1gBpUbFc2tgi
	6z036F+hNWS2lfEM8w+bW2d8KL1CZthD6Rl1v+zRMw9izeqENYpjTiyPZZpDhVqCjTaRHnpJ3wd
	p4Jfk4ItpoKeO5WK4UbH4nkpLvzleUnQ=
X-Google-Smtp-Source: AGHT+IGV4ScW5OAU3iglUFz6GOl/SaxSbnlEKhbCLP2wFA8xAwCena16hSLRSa/lAp17g1juuguW4VQdAzFwj9/LUxc=
X-Received: by 2002:a05:6870:9710:b0:310:b613:5fdb with SMTP id
 586e51a60fabf-314dcb575e6mr9287838fac.7.1756374014938; Thu, 28 Aug 2025
 02:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn> <20250827023202.10310-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250827023202.10310-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Aug 2025 11:40:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
X-Gm-Features: Ac12FXyk8AzMIpXHgrT8Z1UHGDrWUNjtTLP9mZxojpyASBCiNu69qRn54WdH-2Y
Message-ID: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] ACPI: processor: thermal: Use
 __free(put_cpufreq_policy) for policy reference
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer <mmayer@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 4:33=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/acpi/processor_thermal.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..f99ed0812934 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -64,17 +64,13 @@ static int phys_package_first_cpu(int cpu)
>
>  static int cpu_has_cpufreq(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);
>
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
>         policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       return !!policy;

If you want to make this change, please also change the return type of
the function to bool.

>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -95,7 +91,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);

This isn't correct AFAICS at least formally because the scope of the
variable is the whole function, so it won't get out of scope at the
point where you want cpufreq_cpu_put() to be called.

The policy variable should be defined in the block following the "for"
loop (and actually all of the local variables except for "i" can be
defined there).

Or better still, please move that block to a separate function
containing all of the requisite local variable definitions and call
that function for each online CPU.

>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -127,8 +123,6 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
>                 max_freq =3D (policy->cpuinfo.max_freq *
>                             (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
>
> -               cpufreq_cpu_put(policy);
> -
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
>                         pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> --
