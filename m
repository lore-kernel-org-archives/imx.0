Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B2B243399
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028377; cv=none; b=QHB+KJB4FQ8ct4MxB+/q9WuWvCjH+cDXOuwX2gxuIgR7z3oW0wbF1brXlTC1HwEnPJuDf7WnvERk1W7+26IlmYHNgiaLYZiS563VcG74gDYGudDlNHs1/i5Hvu8HCkZkNv9u4HV4ePhMzWOwl56GX6sHNIv8oUQJeYSs47qvT5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028377; c=relaxed/simple;
	bh=DHRpVhcLL5CqL1w10nhEilFh0qVpLdUWIurPRJHRKeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7lDeUO2VoUW7CWt+VeCZ6hrkMJAVNsrHfyttthBS7bk5qj+1S/80ckBORL3yfHUdSL5L/N1QyT3cSikiamvVjatoWDTxEi7ePgWmmRJ7bFHhaib1c5upQH5L/XXLPZo8bqbqFVS3gcOnSL2ERHnWH3fz5J/4CMRwmU9NanEKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80BC71A00;
	Fri, 27 Jun 2025 05:45:56 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBE523F58B;
	Fri, 27 Jun 2025 05:46:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:46:03 +0100
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
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <aF6Si846xCR5_z-z@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:44PM +0800, Peng Fan wrote:
> System Manager Firmware supports getting board information, add
> documentation for this API
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> @@ -1670,6 +1670,26 @@ protocol_id: 0x84
>  |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
>  +--------------------+---------------------------------------------------------+
>  
> +MISC_BOARD_INFO
> +~~~~~~~~~~~~~~~
> +
> +message_id: 0xE
> +protocol_id: 0x84
> +
> ++--------------------+---------------------------------------------------------+
> +|Return values                                                                 |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|int32 status        |SUCCESS: config name return                              |
> +|                    |NOT_SUPPORTED: name not available                        |
> ++--------------------+---------------------------------------------------------+
> +|uint32 attributes   |Board specific attributes                                |

..what's in here ?

> ++--------------------+---------------------------------------------------------+
> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
> +|                    |to 16 bytes in length                                    |
> ++--------------------+---------------------------------------------------------+
> +
>  NEGOTIATE_PROTOCOL_VERSION
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>

..other than this, LGTM.
  
Reviewed;by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
