Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD8B1A9FB4
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697846; cv=none; b=FvLPxqxZ+jPxuPihghygwf1wsYFBedYoUyOD1zS8RoakxQRotR2deZyi6o9rhGvyKQDG51SQO4ZrGb3BImGXRXonBgb9+SwDhDhZIC4a3ocWFHs7c+xupAAVw3idQfTu3PccD8hKvaYwcmhXwEKFXD97IxKV4jKVf6+5tPfi2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697846; c=relaxed/simple;
	bh=PlAWtq9hXEASVA9AC3Q6Gsd2Mw3o6eeAzFIF3c9LDvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHxyz5XLT5hWviX8OSallLasWnmU7NmfZsZI/9QU8b2NAExL1PWupLjTf69uFlA3elEAztvy7BL2/YHRPPfOQJa0paBhWZtEpDMogEjPQ/j1Zeyl5rBahJN9wYGoSlpGiFwQTFol1xFK4eNmi+fp2Bdjzk4xg7Ygu8G+zX03WDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE5521D31;
	Wed, 20 Aug 2025 06:50:33 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4683F738;
	Wed, 20 Aug 2025 06:50:39 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:50:37 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] firmware: imx: Add stub functions for SCMI MISC API
Message-ID: <aKXSrZEudO_bOoPr@pluto>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>

On Thu, Aug 07, 2025 at 09:47:42AM +0800, Peng Fan wrote:
> To ensure successful builds when CONFIG_IMX_SCMI_MISC_DRV is not enabled,
> this patch adds static inline stub implementations for the following
> functions:
> 
>   - scmi_imx_misc_ctrl_get()
>   - scmi_imx_misc_ctrl_set()
> 
> These stubs return -EOPNOTSUPP to indicate that the functionality is not
> supported in the current configuration. This avoids potential build or
> link errors in code that conditionally calls these functions based on
> feature availability.
> 
> Fixes: 540c830212ed ("firmware: imx: remove duplicate scmi_imx_misc_ctrl_get()")
> Fixes: 0b4f8a68b292 ("firmware: imx: Add i.MX95 MISC driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/linux/firmware/imx/sm.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
> index d4212bc42b2c17fb8f94d58856a75beb5611ce4b..99c15bbb46aa8329b5aa8e03017e152074cdf492 100644
> --- a/include/linux/firmware/imx/sm.h
> +++ b/include/linux/firmware/imx/sm.h
> @@ -26,8 +26,20 @@
>  #define SCMI_IMX94_CTRL_SAI3_MCLK	5U	/*!< WAKE SAI3 MCLK */
>  #define SCMI_IMX94_CTRL_SAI4_MCLK	6U	/*!< WAKE SAI4 MCLK */
>  
> +#if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
>  int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
>  int scmi_imx_misc_ctrl_set(u32 id, u32 val);
> +#else
> +static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
