Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A931F707D
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735313310; cv=none; b=QxrnTCBvptjqq1Rk00XR28OZUh5GqqBHOoldExTGDyWaFk87Z3yq/LVMJvolPN/LOYav3HrvMntjZhNL0t0wjlPypfGdRpTc8Xl7RLe8xQl6TQpk6HAvkvHDM+Ou3PgnV25va3LH4UzCtMERPdcYLlHACdHuekQFqzSGmkF26oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735313310; c=relaxed/simple;
	bh=1FSYKsWchUpb2extaSJcxcaJbzkmUAPagBKsMfUTAe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8pFSnDEGDE8GmOsGgcbKqjBrJLEYF0oMLkbfwnAHey4+bNCJXyOs6ybP90rtLaze32pNlQxQipWPa5eFPVe+DeaVaUMeZ/nQD1VWEvy2cAPIYTuHVWz0BFGZRLQ57B1tuhX9fG4CJU3J6VeK/y6/Rx4ao6sXoWK2eE1DzRW4Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5911E2F;
	Fri, 27 Dec 2024 07:28:56 -0800 (PST)
Received: from bogus (unknown [10.57.92.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2FD23F673;
	Fri, 27 Dec 2024 07:28:24 -0800 (PST)
Date: Fri, 27 Dec 2024 15:28:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <20241227152807.xoc7gaatejdrxglg@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>

On Wed, Dec 25, 2024 at 04:20:45PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
>

I wonder if we can prevent creation of "pinctrl-imx" scmi device on non
i.MX platforms instead of this hack which IMO is little less hackier
(and little more cleaner as we don't create problem and then fix here)
than this change.

--
Regards,
Sudeep
