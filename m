Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6F156E6
	for <imx@lists.linux.dev>; Wed, 23 Aug 2023 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rTj1IElYNKOTSmBMYjpxrfdSx9LbepvWtxSNuEiKNdw=; b=hHYRdJ7m4WSrKp4bO0ErMQbX5Y
	jI/RK4zD9Qm8SHN3Sc/fxT1nh7BAEJmaCHiT9LYPb/AuRmqrrB2x6q1ZENmhHp+KaYftwDwpY7rsZ
	qP63np7rFNVdMBDRjxwtmws+ETdzyAAqbkHCx+KzTuJgGzqRgX0ruvB1veuRos3Dolr9sMKe4Szv9
	nlkbxwq+OW2EtbTOpekrnwBtSmPCIgT5xAcKKspW6IJs4KARjdRSOTuVtLjoY2bPEUATK/tUmJ3/y
	vem3xVrn3Rrfj9LaZrFIhDHUrH5cDKmtx8Q6HxFPtLxDqBnwQLYX2IYsHFeHflkvBNZNq5JX9MDLl
	uw4npG5A==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtJ5-001OUT-34;
	Wed, 23 Aug 2023 19:14:20 +0000
Message-ID: <3e7ec5cf-2e51-c999-d71d-86bfebda8ceb@infradead.org>
Date: Wed, 23 Aug 2023 12:14:18 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] MAINTAINERS: Add entries for NXP(Freescale) eDMA
 drivers
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, joy.zou@nxp.com, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, shenwei.wang@nxp.com
References: <20230823184439.2618694-1-Frank.Li@nxp.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230823184439.2618694-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/23/23 11:44, Frank Li wrote:
> Add the MAINTAINERS entries for NXP(Freescale) eDMA drivers
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23eafda02056..eba417bb5ffb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8228,6 +8228,14 @@ L:	linuxppc-dev@lists.ozlabs.org
>  S:	Maintained
>  F:	drivers/dma/fsldma.*
>  
> +FREESCALE eDMA DRIVER
> +M:	Frank Li <Frank.Li@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	dmaengine@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +F:	drivers/dma/fsl-edma*.*
> +

This new entry should be after the following entry to maintain
alphabetical order.

>  FREESCALE DSPI DRIVER
>  M:	Vladimir Oltean <olteanv@gmail.com>
>  L:	linux-spi@vger.kernel.org

-- 
~Randy
