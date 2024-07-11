Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D4014D2BF
	for <imx@lists.linux.dev>; Thu, 11 Jul 2024 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703773; cv=none; b=G9X0wKF9YzgKF7nJfsRaI29UnBghCwM2+BfhVbN/64N0o3t9klYNbW7iqWphXumQDh6m6rud4IeJBkVSumoKv7V5Zkypqs8v0GAMhKKe4H/4kH3MsP736lJbYH0MpFLZEtXA2c4EcJx8/+4lx4tcuuS1mBtI6OYx5hnGAqwbcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703773; c=relaxed/simple;
	bh=ZhZuMuRHnJIyr1f7YUiPJaPnBXIKeUBQIvzGT9F7HGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egQgK3P9PWGrQg2+VWnkTssx8FY/t13qmWruIHkzUnCMUlV1799aFZCvgBiDFae50MTEtPZqrmydbbtpz7uFLleIe2TJlNIlrN4ThH34OvzYdksEtm2aL6qoo78I5FenFguYHYnMcSGtozi4dihWDkv+NCXkz0d8Lm/hLXLLl4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A703BFEC;
	Thu, 11 Jul 2024 06:16:36 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78F383F766;
	Thu, 11 Jul 2024 06:16:08 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:16:06 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95
 SCMI documentation
Message-ID: <Zo_bFnjWixZF6seV@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:36PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add NXP i.MX95 System Control Management Interface(SCMI) vendor
> extensions protocol documentation.
> 

Hi,

beside the final location of this file in the tree, and a few nitpicks
down below.

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

[snip]

> +MISC_CONTROL_GET
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x4
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 index      |Index of the control                                       |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the control was get successfully.              |
> +|                  |NOT_FOUND: if the index is not valid.                      |
> +|                  |DENIED: if the agent does not have permission to get the   |
> +|                  |control                                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 num        |Size of the return data in words, max 8                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32            |                                                           |
> +|val[0, num - 8]   |value data array                                           |

    val[0, num - 1]   --- typo ?

which I suppose means that this  field is variable in size depending on
num value...

In the gneral SCMI spec I think usually we write something like

   uint32 val[N] with N as specified in num.

... but I am fine even with this val[0, num - 1] if it is intended to
meanb this same thing, i.e. variable size field depending on another
field.

> ++------------------+-----------------------------------------------------------+
> +
> +MISC_CONTROL_ACTION
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x5
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 index      |Index of the control                                       |
> ++------------------+-----------------------------------------------------------+
> +|uint32 action	   |Action for the control                                     |
> ++------------------+-----------------------------------------------------------+
> +|uint32 numarg	   |Size of the argument data, max 8                           |
> ++------------------+-----------------------------------------------------------+
> +|uint32            |                                                           |
> +|arg[0, numarg -1] |Argument data array                                        |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the action was set successfully.               |
> +|                  |NOT_FOUND: if the index is not valid.                      |
> +|                  |DENIED: if the agent does not have permission to get the   |
> +|                  |control                                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 num        |Size of the return data in words, max 8                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32            |                                                           |
> +|val[0:num-1]      |value data array                                           |

    val[0, num - 1] ... for consistency

> ++------------------+-----------------------------------------------------------+
> +
> +MISC_DISCOVER_BUILD_INFO
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This function is used to obtain the build commit, data, time, number.
> +
> +message_id: 0x6
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the build info was got successfully.           |
> +|                  |NOT_SUPPORTED: if the data is not available.               |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buildnum   |Build number                                               |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buildcommit|Most significant 32 bits of the git commit hash            |
> ++------------------+-----------------------------------------------------------+
> +|uint8 date[16]    |Date of build. Null terminated ASCII string of up to 16    |
> +|                  |bytes in length                                            |
> ++------------------+-----------------------------------------------------------+
> +|uint8 time[16]    |Time of build. Null terminated ASCII string of up to 16    |
> +|                  |bytes in length                                            |
> ++------------------+-----------------------------------------------------------+
> +
> +MISC_ROM_PASSOVER_GET
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +ROM passover data is information exported by ROM and could be used by others.
> +It includes boot device, instance, type, mode and etc. This function is used
> +to obtain the ROM passover data. The returned block of words is structured as
> +defined in the ROM passover section in the SoC RM.
> +
> +message_id: 0x7
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the data was got successfully.                 |
> +|                  |NOT_SUPPORTED: if the data is not available.               |
> ++------------------+-----------------------------------------------------------+
> +|uint32 num        |Size of the passover data in words, max 13                 |
> ++------------------+-----------------------------------------------------------+
> +|uint32_t          |                                                           |
> +|data[0:num-1]     |Passover data array                                        |
> ++------------------+-----------------------------------------------------------+
> +

   data[0, num - 1] ...  consistency

Thanks,
Cristian

