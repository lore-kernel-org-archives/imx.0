Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15CF304BDC
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755624503; cv=none; b=AmvGxUdtoUR7/QClSaNII5FTlw3DDP+2kvkP2GdGgRMSZG0cTOQQH3Eg5tfNZZswqtfpoIEGpSS5O0d3iX7oo1NZbEFI6xTIWnD9N6XmohCl/WBUMxwLHRI8AlVvwF62j9/OQfpWeQ3maK/1EOIMVBEtubKPaz4Yu62xWzfhmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755624503; c=relaxed/simple;
	bh=SaWrsMEXT6LOvAuAkZaeNYxYBToFhovSonBw19Ndjwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUAMXmciejgRSZzTBW/TNbDgbqDl5TaV1+tj0R65UHPpCE2JC8J0ah+Rx+VkgFQVyN/0lHF7KjFqBd6EFHyPrx/Sl7yon9n6ylt4GBcBZbeMh0ZvD6sAnyGqxMTSU1SrZWkyUWzA8HzAOSKGRobgf1QUQoLRFp4AXeUgSwPaRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7B9152B;
	Tue, 19 Aug 2025 10:28:13 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994F53F738;
	Tue, 19 Aug 2025 10:28:19 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:28:17 +0100
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
Subject: Re: [PATCH v2 6/6] firmware: imx: sm-misc: Dump syslog info
Message-ID: <aKS0MUXlQvMTfV4d@pluto>
References: <20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com>
 <20250710-sm-misc-api-v1-v2-6-c3e953e34be6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sm-misc-api-v1-v2-6-c3e953e34be6@nxp.com>

On Thu, Jul 10, 2025 at 04:33:31PM +0800, Peng Fan wrote:
> Add sysfs interface to read System Manager syslog info
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/sm-misc.c | 178 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> index fc3ee12c2be878e0285183e3381c9514a63d5142..10aab5b127f65ecc57db9ab6c0c2c2b84d1dd864 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -3,6 +3,7 @@
>   * Copyright 2024 NXP
>   */
>  

Hi,

I have not so much to say about this: you expose one value per-sysfs
entry as prescribe BUT this also means a lot of messages to exchage to
retrieve a whole new fresh log each time a single sysfs entry is
queried...a bit ugly but I wouldn't now how to handle this differently
with the current log command format indeed...

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
