Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997801AE844
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698004; cv=none; b=i33wevxaeE2mrcIH789rtbAegEqb3Woam3Am9Hy70Bi8SzBtaO9S1RC/3eH2SLzUXEAuV07kSSjzvhpAqbbGo5D0wUlVXAd/Rjg2wUu9xdRAgRaPu1thW8R21OIkEmRyCdJ2V8PJxiqzXh/jJrLmY8XIRRQqeCM6/YCs5QmipGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698004; c=relaxed/simple;
	bh=k4GwsWLqDfFVA8BBIrdKPqII7sa00eXmkGduE3C7iQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcHlorEGX4zApLDAzOqODWZvOy2yOWRfSGadcSUftRSpaR2Yu+xM+WMz4WNurmGh85lvuoOcwAXVGx1hxmioNQEZFqcImxN9o/FjrhsmztnV8FQ9HqqXI9ZM7DMgavUSogm1UTXvl3dECloKak/OV2Sea7as8w3oD+ajcO/YqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDC031D31;
	Wed, 20 Aug 2025 06:53:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 040873F63F;
	Wed, 20 Aug 2025 06:53:20 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:53:18 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: imx: Add stub functions for SCMI CPU API
Message-ID: <aKXTTqoIBAMWbeCI@pluto>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-3-3489e41a6fda@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-imx9-sm-v1-3-3489e41a6fda@nxp.com>

On Thu, Aug 07, 2025 at 09:47:44AM +0800, Peng Fan wrote:
> To ensure successful builds when CONFIG_IMX_SCMI_CPU_DRV is not enabled,
> this patch adds static inline stub implementations for the following
> functions:
> 
>   - scmi_imx_cpu_start()
>   - scmi_imx_cpu_started()
>   - scmi_imx_cpu_reset_vector_set()
> 
> These stubs return -EOPNOTSUPP to indicate that the functionality is not
> supported in the current configuration. This avoids potential build or
> link errors in code that conditionally calls these functions based on
> feature availability.
> 
> Fixes: 1055faa5d660 ("firmware: imx: Add i.MX95 SCMI CPU driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/linux/firmware/imx/sm.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
> index f2a72177bb37c1d46145a60710e3809641e0f5a2..a33b45027356751f4b8ad9b9136f0dd302a82520 100644
> --- a/include/linux/firmware/imx/sm.h
> +++ b/include/linux/firmware/imx/sm.h
> @@ -41,10 +41,28 @@ static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_IMX_SCMI_CPU_DRV)
>  int scmi_imx_cpu_start(u32 cpuid, bool start);
>  int scmi_imx_cpu_started(u32 cpuid, bool *started);
>  int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
>  				  bool resume);
> +#else
> +static inline int scmi_imx_cpu_start(u32 cpuid, bool start)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_started(u32 cpuid, bool *started)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start,
> +						bool boot, bool resume)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
