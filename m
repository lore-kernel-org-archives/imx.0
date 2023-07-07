Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61071FD5
	for <imx@lists.linux.dev>; Fri,  7 Jul 2023 05:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5010C433C7;
	Fri,  7 Jul 2023 05:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688708272;
	bh=6W39rcO0mo+MX7jP0Rws3FAS7SxpwgwiBILDqfm4DBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9IOERvYN7BRwEBDVq/vqnzvKVtsFGl6S5ganEQmziXK8TORpqQOF9LZFRfN1/sWn
	 9amCjXxZc0nheITnMkVqkDrhQNZHeh4e2e+rc6KC4tSqODoT8nhiQtcA0O9LyC2W53
	 fz+omtSeQOi4INedOPP+cwGPhORe1z03xcu7cMZbrhABNScuTf92fv/nf8V/Dbhsyi
	 G+/DzfBra1+fClMKJ6TKxiXnShb4xEDs+AI2EdiWs1auGOvadxGYrcaNFZRDdCRxIV
	 kInlF8hx/ikhfVukuJaQFi/tNC9UkmNvlVbGAmifp4Uy8+OxyRvuYT0/YJJkSvzsta
	 7MpZR7fPPm1FQ==
Date: Fri, 7 Jul 2023 11:07:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, joy.zou@nxp.com,
	shenwei.wang@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH v9 01/13] dmaengine: fsl-edma: fix build error when arch
 is s390
Message-ID: <ZKekrGdWWNOXNg0M@matsya>
References: <20230620201221.2580428-1-Frank.Li@nxp.com>
 <20230620201221.2580428-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620201221.2580428-2-Frank.Li@nxp.com>

On 20-06-23, 16:12, Frank Li wrote:
> fixed build error reported by kernel test robot.
> 
> >> s390-linux-ld: fsl-edma-main.c:(.text+0xf4c): undefined reference to `devm_platform_ioremap_resource'
>    s390-linux-ld: drivers/dma/idma64.o: in function `idma64_platform_probe':
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306210131.zaHVasxz-lkp@intel.com/
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 644c188d6a11..c1065c444cde 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -210,7 +210,7 @@ config FSL_DMA
>  
>  config FSL_EDMA
>  	tristate "Freescale eDMA engine support"
> -	depends on OF
> +	depends on ARCH_NXP

That is not really a fix! you are masking this by making the driver
build only on NXP

I think better fix is to depend on HAS_IOMEM

>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
>  	help
> -- 
> 2.34.1

-- 
~Vinod
