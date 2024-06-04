Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFEA1420B7
	for <imx@lists.linux.dev>; Tue,  4 Jun 2024 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717496830; cv=none; b=sV1VWrRrIM9mJhMW+MAqJzFv1/YTCTXOYkz1L43xYGdQSCOYDVxUdfTsrkjN1GM6L9AjxGHPaS1xenYdHbOOfFHYuN1CNppzOM+rS3LVty0/GHV+90QSWHpx4eT+oeWhmmg6ki0LCmRAByoqSx2dey1eL3Djp0BOGbXC+wg/PKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717496830; c=relaxed/simple;
	bh=s4p/kkqzKCiAh7TGz3mBbtp1qYDq3Y8HERuiXSIOO44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmhQv3P3ym0Ysodi10sAuiaucA3YHMU77a08HIeiQ9WI0vcRlosysz5h/lT9etvqiHgJkT8a54czgq8ZRHX4o093776/cHfsdFTbKUiaQtMHXrwEIo/B4R9i2+/ODA/ads8K50BGZaAVxD3UfdIxBOLM2gLA3FRig9P7ugU30ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DCB11042;
	Tue,  4 Jun 2024 03:27:31 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF6D43F792;
	Tue,  4 Jun 2024 03:27:04 -0700 (PDT)
Date: Tue, 4 Jun 2024 11:27:02 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Message-ID: <Zl7r9sN8EH8Xmnqn@pluto>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>

On Tue, May 21, 2024 at 02:25:59PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The generic pinctrl-scmi.c driver could not be used for i.MX95 because
> i.MX95 SCMI firmware not supports functions, groups or generic
> 'Pin Configuration Type and Enumerations' listed in SCMI Specification.
> 
> i.MX95 System Control Management Interface(SCMI) firmware only supports
> below pin configuration types which are OEM specific types:
>     192: PIN MUX
>     193: PIN CONF
>     194: DAISY ID
>     195: DAISY VAL
> 
> To Support fsl,pins property together with SCMI OEM protocol, add this
> driver.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/freescale/Kconfig            |   9 +
>  drivers/pinctrl/freescale/Makefile           |   1 +
>  drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 357 +++++++++++++++++++++++++++
>  3 files changed, 367 insertions(+)
>

Only tested compilation and interactions with Generic Pinctrl SCMI
driver, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
