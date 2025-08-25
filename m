Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5872F363B
	for <imx@lists.linux.dev>; Mon, 25 Aug 2025 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131221; cv=none; b=NNk+1anGQIofIy5PACe5JbqUCEwM0Od38Dla8r6wpPFSlkef7yWVdavu3S9m7XtL4TgP8VfRZ+jGmSpg52Avaqqz29xGdHZePZOrIiMGkXMjMlS3HUnz4iwexP2EcMV9q+/byHp1nqLXIac1qGBbVz2EClyOpycISVWSG1MZI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131221; c=relaxed/simple;
	bh=3RLeKCKpDIk2eBgGx5sPwZfoBKyVmeEo49RWhYh8Kh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f84xgHSdfyNNE/Bm/aiaY0aKOiU3nglhqiaHAbeg601Q5XQa1zOjtWM/2NrStYDa0Wam0HgIoGjmKoY3XjWYea6GkppFNDhLdvhEUBJD3sGKvA0cbxvV9UgQtjgotC193nh9LjZoyDIGPAwO7gC8PFJr60QmlNqvoNljY9OL+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4fvRADW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4fvRADW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50749C2BC86
	for <imx@lists.linux.dev>; Mon, 25 Aug 2025 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131220;
	bh=3RLeKCKpDIk2eBgGx5sPwZfoBKyVmeEo49RWhYh8Kh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e4fvRADWc2SiGyvairwMKdDw1zm1wGOXThGQeER0f4MYqsGYBRhD4UrfH+q2kimaE
	 978Vxb2gnRrcxwK29zKxBr5sDuyaM7DyuM68nemBfDcJoWAJvdefCrMf4ky3tm3mTR
	 ZEf5XaC0Deu8RHdTatQRuIX1UHKAPHYmvItTm0G3jHrBoDa0LYl7qMs/ZPY2JpgApc
	 lQtDHIn1yKhsLsiU+tvHyxR+ZutYlrHGoRZcd4IzOHtkeInzrDGgR65atrSWLdNsYt
	 TaeLwZDvBl70cfWDcKc3Px3Inhk2GTRE0IlvBDIzWF32uT29HeibPtjI2oz6UM54HE
	 cW6lqbzTmXm7Q==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-74381df387fso1148733a34.0
        for <imx@lists.linux.dev>; Mon, 25 Aug 2025 07:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRHzZadQz+xgTDbjqajZNP/Zhu3TZTxAVA8GeHuCEfHHQPiHx9tIbWyhuU6De01FHallY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTQ104oXfxl+dObXAXXs/4O3XQXaaxXJy3xGfjSAVGd1acevvi
	utSdBoqNDeIwMTsSERRe+Xag4YXKGMlKbb+jXgH97U0jynapfFqtiJqszZ0DF22GaJdQoM06y1n
	pVEbRV2hOQNVTyH3Fdl5jPhsdxFRMxyI=
X-Google-Smtp-Source: AGHT+IGEnV+1YshDCmjAscdFjkSNQru4o/XG/DWYuObgbMiwP57k9JdqOZlPe3YdSW0fnLXsvsMiCF3QToEZVDUm+Q8=
X-Received: by 2002:a05:6830:d18:b0:742:fd7f:e105 with SMTP id
 46e09a7af769-74500aafdb9mr6734918a34.19.1756131219164; Mon, 25 Aug 2025
 07:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
In-Reply-To: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 25 Aug 2025 16:13:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
X-Gm-Features: Ac12FXwCyvYKc8Ipwt4NeaLRZNsWY9t1kMBiUFhDRbkfLg-XPnoGM5Pxq1PIQzg
Message-ID: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get() references
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

On Mon, Aug 25, 2025 at 11:29=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.=
cn> wrote:
>
> This patch replaces all remaining uses of cpufreq_cpu_get() with
> the __free(cpufreq_cpu_put) annotation.
>
> Motivation:
> - Ensures automatic cleanup of policy references when they go out of scop=
e,
>   reducing the risk of forgetting to call cpufreq_cpu_put() on early retu=
rn
>   or error paths.
> - Brings the code in line with the latest kernel coding style and best
>   practices for managing reference-counted objects.
> - No functional changes are introduced; behavior remains the same,
>   but reference counting is now safer and easier to maintain.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  arch/arm64/kernel/topology.c                  |  9 +++----
>  arch/x86/kvm/x86.c                            | 10 ++++----
>  drivers/acpi/processor_thermal.c              | 13 ++++------
>  drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>  drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>  drivers/cpufreq/intel_pstate.c                |  3 +--
>  drivers/cpufreq/longhaul.c                    |  3 +--
>  drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>  drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>  drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>  drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>  drivers/devfreq/governor_passive.c            | 19 ++++-----------
>  drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>  drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>  drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
>  drivers/thermal/imx_thermal.c                 |  7 ++----
>  .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>  kernel/power/energy_model.c                   |  7 ++----
>  18 files changed, 40 insertions(+), 93 deletions(-)

This changes different pieces of code maintained by different people
and the changes are not interdependent AFAICS, so better send it as a
series of separate patches.

Thanks!
