Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387725C6E8
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741704190; cv=none; b=bstHU0Yh7Jqc4hmBUxhU8+/nMjJy3szPZecysRYeIEBXMe9it86w3T/E0EZw+mzbFsGB4ViFLjiaVqOym/CCzPE6oyPLq18Mi1gxl2SUvsLl1zAGbLZ3gVDe3rLtTNref7DXhrGMZkewVIhboA+kaxMJ7hbksFlyfI5X0TK3wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741704190; c=relaxed/simple;
	bh=VkUyoAyyCmW63H5OQPvbiafh/ZxBkE7JGT7ZH6ENAKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMll/XcKSym6Mc2QHDw6WmXJFs9nAGwLi6hYEcHla22bNF0QXdagLpYINJlW2K2c9ER+0yUxzOiMA/9EMeTt8PARrH7HfsYNI7BnFzSP7eL2Opd5zi4+dJV1KbpzIt9VBqXIqW/20OhFs03J6Lh6C/D68H25N+rMDKAGbZtFQJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gii9pqpU; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gii9pqpU"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6fd8be1e534so52470547b3.3
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741704187; x=1742308987; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8eN7PsSljamLFmL3eAZGuj/XK8vFI8v0YSA3pxuzua8=;
        b=Gii9pqpU86ELEKkcbT5tSYuifVZVDAqbTL5l9tCrgYLAI6/B3pkfKp6LeJPzto9v4g
         t7Seh1fs+fBzHTVEZJesiZvUEBR5PlnrDiUcyePBgsOMBLjfBA7zjV2ad4NXI23j28FK
         rmvcM6R1Bkb7XUQ5XsCgdkO/tBl3RYmkaV1NVhtWwYfVI7oFpJCqI4wU4qsUC4Fbn/H1
         oMnlpuF3d2XOT0zoc102JiYv7XqL1op7oyB4oJQQSPl7c6+0Co8MiYVpqeYE2HNdP04C
         FRheDgJ+bJ3jV7AEUItjqrjmac3gDoJQWkDePwsHwr0d7XlyF7zkTqxn5LZ+GYt/yE9B
         BlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704187; x=1742308987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eN7PsSljamLFmL3eAZGuj/XK8vFI8v0YSA3pxuzua8=;
        b=CrXqfDwrqudoIrVgEjyRRyCYqiPrpOfJKLfVcbanLwQlIusETr+kcudfIe+d5gL4RR
         cPRzOpPS3QfPfTq51O3YTJBHMspj51jqhZWCK2MCAEhMwJZNwUqu8pxUco065sUkhZ1L
         5EcVgh0UHJjeUCt6Q1cH9vvrnJ/6Dhn6Z2rIXpdOBdaEX23uTHoNfHGbJwPAtNIlqvLC
         jGtfEn2ojnJDMpZ3YwVw1A2C7DYM7B3rTjm38U6CLysZBP8yjmKH2Y6s6l+tQ6eFP7Ye
         LS0USKVBekFMf6UMwnpK9aEw6E4PjBpR+zVpYxCUujg/SDyx6PeUD5MbeTTXBnzQeYaP
         r7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXg6dGho4GKXjIhYMKWqDTS57B2BUnYbxkjWKqchhDKYkwMgddRRRfVd2qXjFLQGpYeN0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFtkaaB9lx4YR2LFFJ+AGGJASwn8q1C9fokXLtfSMZbcBrxQfh
	iHhQrN2D/5eL0dx4k05wd4Da0htEPt+q0VcsvlT3ETvvDZ4rgLlZKfOBCNOhD70g0EcuT4OyVC0
	KvN/9tumLvp40fYma3s0bcBXxkpVBTSQMoZlO1g==
X-Gm-Gg: ASbGncsa+SXMhVpDFP41YFnwTRcHDqMbTf29+6Xy9xhg/w030nXWEZA6jRnNftXAfWh
	P/3vuWkjqPIn/Hd4jromhE+0SpZ7WW4fvcwYOR1AidLrkNeFkrV0eb2oBUgSW/kgpspgSn2xbcU
	axVR18PXXEx1zLNP0Uh7YG+bobDvg=
X-Google-Smtp-Source: AGHT+IG/Nkb2MMo911BY6LZyKSsboklHqls3Mfm0CSui2XrmwBdOBouV0yL+jXkPDlFtJivejjAsU40tXjhf+7Ul5/s=
X-Received: by 2002:a05:690c:3706:b0:6fb:a696:b23b with SMTP id
 00721157ae682-6febf3c519dmr225655647b3.33.1741704187487; Tue, 11 Mar 2025
 07:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307145547.2784821-1-ping.bai@nxp.com>
In-Reply-To: <20250307145547.2784821-1-ping.bai@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Mar 2025 15:42:31 +0100
X-Gm-Features: AQ5f1JpuVnMxrQT-gRgqkxyP6H2nzFhKukp5aY_RBibf6JhIgaCor4IM8qvGE-0
Message-ID: <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
Subject: Re: [PATCH v5] cpuidle: Init cpuidle only for present CPUs
To: rafael@kernel.org, Jacky Bai <ping.bai@nxp.com>
Cc: daniel.lezcano@linaro.org, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	james.morse@arm.com, d-gole@ti.com, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	imx@lists.linux.dev, khilman@baylibre.com, quic_tingweiz@quicinc.com, 
	quic_yuanjiey@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Mar 2025 at 15:54, Jacky Bai <ping.bai@nxp.com> wrote:
>
> for_each_possible_cpu() is currently used to initialize cpuidle
> in below cpuidle drivers:
>   drivers/cpuidle/cpuidle-arm.c
>   drivers/cpuidle/cpuidle-big_little.c
>   drivers/cpuidle/cpuidle-psci.c
>   drivers/cpuidle/cpuidle-qcom-spm.c
>   drivers/cpuidle/cpuidle-riscv-sbi.c
>
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
>
> With nosmp or maxcpus=0, only the boot CPU is present, lead
> to the failure:
>
>   |  Failed to register cpuidle device for cpu1
>
> Then rollback to cancel all CPUs' cpuidle registration.
>
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> above cpuidle drivers to ensure it only registers cpuidle devices
> for CPUs that are actually present.
>
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, I assume you will pick these up? Or let me know if you want me
to take them via my pmdomain tree.

Kind regards
Uffe

> ---
>  - v5 changes:
>    - add changes for cpuidle-qcom-spm
>
>  - v4 changes:
>   - add changes for other cpuidle driver that has the similar issue
>     as cpuidle-pcsi driver.
>
>  - v3 changes:
>   - improve the changelog as suggested by Sudeep
> ---
>  drivers/cpuidle/cpuidle-arm.c        | 8 ++++----
>  drivers/cpuidle/cpuidle-big_little.c | 2 +-
>  drivers/cpuidle/cpuidle-psci.c       | 4 ++--
>  drivers/cpuidle/cpuidle-qcom-spm.c   | 2 +-
>  drivers/cpuidle/cpuidle-riscv-sbi.c  | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-arm.c b/drivers/cpuidle/cpuidle-arm.c
> index caba6f4bb1b7..e044fefdb816 100644
> --- a/drivers/cpuidle/cpuidle-arm.c
> +++ b/drivers/cpuidle/cpuidle-arm.c
> @@ -137,9 +137,9 @@ static int __init arm_idle_init_cpu(int cpu)
>  /*
>   * arm_idle_init - Initializes arm cpuidle driver
>   *
> - * Initializes arm cpuidle driver for all CPUs, if any CPU fails
> - * to register cpuidle driver then rollback to cancel all CPUs
> - * registration.
> + * Initializes arm cpuidle driver for all present CPUs, if any
> + * CPU fails to register cpuidle driver then rollback to cancel
> + * all CPUs registration.
>   */
>  static int __init arm_idle_init(void)
>  {
> @@ -147,7 +147,7 @@ static int __init arm_idle_init(void)
>         struct cpuidle_driver *drv;
>         struct cpuidle_device *dev;
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = arm_idle_init_cpu(cpu);
>                 if (ret)
>                         goto out_fail;
> diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
> index 74972deda0ea..4abba42fcc31 100644
> --- a/drivers/cpuidle/cpuidle-big_little.c
> +++ b/drivers/cpuidle/cpuidle-big_little.c
> @@ -148,7 +148,7 @@ static int __init bl_idle_driver_init(struct cpuidle_driver *drv, int part_id)
>         if (!cpumask)
>                 return -ENOMEM;
>
> -       for_each_possible_cpu(cpu)
> +       for_each_present_cpu(cpu)
>                 if (smp_cpuid_part(cpu) == part_id)
>                         cpumask_set_cpu(cpu, cpumask);
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index dd8d776d6e39..b46a83f5ffe4 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -403,7 +403,7 @@ static int psci_idle_init_cpu(struct device *dev, int cpu)
>  /*
>   * psci_idle_probe - Initializes PSCI cpuidle driver
>   *
> - * Initializes PSCI cpuidle driver for all CPUs, if any CPU fails
> + * Initializes PSCI cpuidle driver for all present CPUs, if any CPU fails
>   * to register cpuidle driver then rollback to cancel all CPUs
>   * registration.
>   */
> @@ -413,7 +413,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
>         struct cpuidle_driver *drv;
>         struct cpuidle_device *dev;
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = psci_idle_init_cpu(&pdev->dev, cpu);
>                 if (ret)
>                         goto out_fail;
> diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
> index 3ab240e0e122..5f386761b156 100644
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -135,7 +135,7 @@ static int spm_cpuidle_drv_probe(struct platform_device *pdev)
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret, "set warm boot addr failed");
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = spm_cpuidle_register(&pdev->dev, cpu);
>                 if (ret && ret != -ENODEV) {
>                         dev_err(&pdev->dev,
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 0c92a628bbd4..0fe1ece9fbdc 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -529,8 +529,8 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> -       /* Initialize CPU idle driver for each CPU */
> -       for_each_possible_cpu(cpu) {
> +       /* Initialize CPU idle driver for each present CPU */
> +       for_each_present_cpu(cpu) {
>                 ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
>                 if (ret) {
>                         pr_debug("HART%ld: idle driver init failed\n",
> --
> 2.34.1
>
