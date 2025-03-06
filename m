Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899AF1A76BC
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258433; cv=none; b=flT2IMbaIZTvoBXcLgFAC8J2sghKbdr5mW8TQrkklciAFdh1YkmwFN4CDFSwbn7xIzENE7WfSsPJa+DivJZk+FGEzmn8Qgc2xpUSSyudl+r9zjQ5/dgF5ujvQVihoVH0G6dmfbm/zZeTAvIQyBYY5/o/+6dEX2150u/BOvDUNoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258433; c=relaxed/simple;
	bh=BjCm5PBqyHKmjMucOFRQC1jdtY0RK6Pqe0onnAO5mwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slhAOhaR4VMBc28doELNWzxnLZm7fhvzw4v3Y1KlbPGy6O03gEJ7qUNNCanlW3S0VrxPQQgg7GLR4z2i+5yfSYq8atc602I1SM4TAMTT7I9gOEt1GC4PcwrdqvPt8EjDDEfT3piDuHcHSNhj62GB+osLUSEP9GncGoK9tCeax+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQk0zvXB; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQk0zvXB"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6fda22908d9so3714657b3.1
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 02:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258430; x=1741863230; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3kxF9s0s10HtMJFdaStPVy028iaechePMj70+RdBiw=;
        b=uQk0zvXB9ICtiSOmG2m1ak5+OtoNybW9hO2fNrAwyfCK60Sx2OgK8wo4bEvhjVroIi
         6JB8IwmCOvRYOb8bncJoGZyhQ1TlQX+MenrDPcQgLxoCOVPWm7PVrE7xwstaIV9nKBeW
         VgFn08C6wnazmg9I93j2XTJ9llPBF3pwQ58P8dUisQeRs8SxHYUmTWt7H6/B/WjX7ScE
         rK1F+LVK6gv/vXaHLyZkGekz5pu4Dz5Zu9X2kiekXYBckxc1WsRMZx8hQM/+5BI9YAOW
         2ib38orMVR0LIM2QrITiezDbxAcqpfEFOFxXEtnR4OmxlB0qzOKiIVzHuAyaxnQSzPQ5
         hTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258430; x=1741863230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3kxF9s0s10HtMJFdaStPVy028iaechePMj70+RdBiw=;
        b=ISfxb3csqR4B3yxUJi35hhqjgjXDTKn6acLbbHu/JT8ypPJQ/eAdhriTvXkAaEwPFe
         IS9Tzx7hEQ3NXAx+6GmW6kf9LKPpHBRNx8ZZQg/h6oUhuddEkqRTsn1edsrpuwN9Nuej
         0UWHIlhJvO50o9YbUyktEfiSOwawj6oxeS3g9blZzFhFGiTmi8TLL5xoHjE9gTSIN8Yy
         34eo8WUZ5nYdrxMxczBDXzxaBk0jOxRmvh/95QNNpTQoQL4fZMZfZ8PQ+uNa+VWI/tN6
         7NPTp+GITxmxUke2crH2IFv6kb1AuskIs4Tz+e7pX73FyWtVB75LhrKOkoGtlq3KW8sp
         Xh+w==
X-Forwarded-Encrypted: i=1; AJvYcCWUBYIz0UznivHcLJa+uFNJwopk9PmnzuNPHpsy1SFT8CORdI3Qu46dI4ApGgwhqG80mzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9lAs9smzxlvix1mCH1RHnJtEiLwt0JAGfDqJ0ih6O9uH2ZbGk
	bpZWZA1Zue6JLs0+Enouw/mwVLJbMKfdPcu3g2RN6imSiKBey97DjNdhmGySqnKdUxALUEHGy4l
	qS0UcQGmpqNM8C84Rm12OtEbKKJ2ONB9npeGnBw==
X-Gm-Gg: ASbGncsgZtBNHg6awonOL2cpe1/nq/EbjLAOF3UqvGkNQedHbnPvj5neu3qmUswm36i
	P58+A3Wgix+yCvMQMT7vZ8u44oKnenn2AcGCLRgcMhzM4oXzYLTE46HU0yZcH0yCKnjPyXVkANn
	ifOeW6dG3YcIZIr9F1pCSsC8WjLGY=
X-Google-Smtp-Source: AGHT+IHveALh7pfAJxb1zQDrWysmjfRsRboRORBFdyusSPBVnlo9Xnd8mhzTm+ZPYxFyYXm4hgY3Nu9iytramRNs4y8=
X-Received: by 2002:a05:690c:64c1:b0:6fd:44a5:5b68 with SMTP id
 00721157ae682-6fda306fffbmr91783397b3.35.1741258430563; Thu, 06 Mar 2025
 02:53:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306061805.2318154-1-ping.bai@nxp.com>
In-Reply-To: <20250306061805.2318154-1-ping.bai@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 6 Mar 2025 11:53:14 +0100
X-Gm-Features: AQ5f1JoVI52ootMQgeP7Rja3_fKhyfkFzcUyyz4qn2NojBs4a97d8HfR3zSlUrg
Message-ID: <CAPDyKForY4VNZtqietDPt2FQM3p4OsaoE_oJb0PPLUAh98WsHQ@mail.gmail.com>
Subject: Re: [PATCH v3] cpuidle: psci: Init cpuidle only for present CPUs
To: Jacky Bai <ping.bai@nxp.com>
Cc: lpieralisi@kernel.org, sudeep.holla@arm.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, james.morse@arm.com, d-gole@ti.com, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, khilman@baylibre.com, 
	quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 07:17, Jacky Bai <ping.bai@nxp.com> wrote:
>
> for_each_possible_cpu() is currently used to initialize cpuidle
> in the PSCI cpuidle driver.
>
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
>
> With nosmp or maxcpus=0, only the boot CPU is present, leading
> to the failure:
>
>   |  Failed to register cpuidle device for cpu1
>
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> PSCI cpuidle driver to ensure it only registers cpuidle devices
> for CPUs that are actually present.
>
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Is this problem specific to cpuidle-psci?

Others are using for_each_possible_cpu() when registering their cpuidle drivers.

Kind regards
Uffe

> ---
>  - v2 changes:
>   - Improve the changelog as suggested by Sudeep
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 2562dc001fc1..00117e9b33e8 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -410,7 +410,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
>         struct cpuidle_driver *drv;
>         struct cpuidle_device *dev;
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = psci_idle_init_cpu(&pdev->dev, cpu);
>                 if (ret)
>                         goto out_fail;
> --
> 2.34.1
>
