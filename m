Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33AC1DACB8
	for <imx@lists.linux.dev>; Fri,  7 Mar 2025 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741341035; cv=none; b=AdYuM+GxQ9PMUH/I3jcL5FT4p77gXAeXyTVycoJwuEGBcTs6aupX1+5gdSoWEeOraR8Nk7Yl/du7NACHktvYOnN80XT5xfEpm6CyiFAF1n1BwC/xQOpZjY9OYhS0T4qfXOjf37YhnusWXcqOEhD4Q5uA9s56BaarwKbHupDYx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741341035; c=relaxed/simple;
	bh=d3agI50q2xWFJ5p1wa9JH4JwPRcj3aWovddGpnxeI40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np9WDvYYBbj6JQcO1H4n9m4MsLEwDX3RKTqLM6+RzPXEaQASYXlIS9P2EnZFS81Qvht/JOHqaks9FIlLjdQXR1rcOKBrpk6o5hlhjOepckH7XqJAFoP1/XHz33+Ly5HqP1BHFWCuvywv0nZdYfSYVZ24khFxAYIDkL9UZoz1gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A661150C;
	Fri,  7 Mar 2025 01:50:45 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCEF93F66E;
	Fri,  7 Mar 2025 01:50:29 -0800 (PST)
Date: Fri, 7 Mar 2025 09:50:26 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<lpieralisi@kernel.org>, <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <james.morse@arm.com>,
	<d-gole@ti.com>, <anup@brainfault.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<imx@lists.linux.dev>, <khilman@baylibre.com>,
	<quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
Message-ID: <Z8rBYuDiIyo8y6HT@bogus>
References: <20250307080303.2660506-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307080303.2660506-1-ping.bai@nxp.com>

On Fri, Mar 07, 2025 at 04:03:03PM +0800, Jacky Bai wrote:
> for_each_possible_cpu() is currently used to initialize cpuidle
> in below cpuidle drivers:
>   drivers/cpuidle/cpuidle-arm.c
>   drivers/cpuidle/cpuidle-big_little.c
>   drivers/cpuidle/cpuidle-psci.c
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
> ---
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
>  drivers/cpuidle/cpuidle-riscv-sbi.c  | 4 ++--


Why have you spared drivers/cpuidle/cpuidle-qcom-spm.c ? IIUC the issue
exists there as well.

-- 
Regards,
Sudeep
