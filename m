Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C76298CC0
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755619155; cv=none; b=KCewdZVn6mIcFcqu+Xx2inxuaF9LiagrfFSNIJUO6VioVx2V1vuFLG1KE4Igijrw+sGdO0ghvKAI6iksrpSHpfiWPRUabEAkyknOXNurPI/HreRN2/HFt+CtcplXjJS8L4LkS+yqrq0RsbcNd1FKyk3Itn3c1XNw+qPMDIHebag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755619155; c=relaxed/simple;
	bh=cUvOmmSVi8EgHXGDEz4RjYvK/h6LmNIHxazVjG6Hs7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1oM8znmR7UJbqdZS7IJLzzJU/ioUR/T8bbIzDhqynM7xHenohkHwjsHblTs9TL5OmHrCw9Cjoo8XkrXX9kF8S2kP/3sztTBio4097bCxbMk7LYAmCFjhxZGczYvpawxzeoxRS3xf6wrk7SUbicuZZaM8ZIPMvaP36mjcLVahKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04D1B152B;
	Tue, 19 Aug 2025 08:59:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E95F3F63F;
	Tue, 19 Aug 2025 08:59:10 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:59:08 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] firmware: arm_scmi: imx: Support getting cfg info
 of MISC protocol
Message-ID: <aKSfTL4fCaDsoHQX@pluto>
References: <20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com>
 <20250710-sm-misc-api-v1-v2-3-c3e953e34be6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sm-misc-api-v1-v2-3-c3e953e34be6@nxp.com>

On Thu, Jul 10, 2025 at 04:33:28PM +0800, Peng Fan wrote:
> MISC protocol supports getting the System Manager(SM) mode selection
> and configuration name. Retrieve the information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index b301f09ab6cc65d286edb8819031d7f4c02e8272..dc6ea67255b8b1ac95dfb552fa88b65044de8d3f 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -75,6 +76,12 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_cfg_info_out {
> +	__le32 msel;
> +#define MISC_MAX_CFGNAME	16
> +	u8 cfgname[MISC_MAX_CFGNAME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -310,6 +317,30 @@ static int scmi_imx_misc_discover_build_info(const struct scmi_protocol_handle *
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_imx_misc_cfg_info_out *out;
> +	char name[MISC_MAX_CFGNAME] = {'\0'};

Same considerations here...

> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CFG_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		strscpy(name, out->cfgname, MISC_MAX_CFGNAME);
> +		dev_info(ph->dev, "SM Config\t= %s, mSel = %u\n",
> +			 name, le32_to_cpu(out->msel));

...other than this...LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
