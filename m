Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F7F9CD
	for <imx@lists.linux.dev>; Wed, 27 Sep 2023 12:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9FAC433C8;
	Wed, 27 Sep 2023 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695818788;
	bh=yur1lIib+MwlO3G13u5slhNv5izV70kTNuXNh85akv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCKu0Q83mtA+/cOefVFb4tQpEBvyJOqtu9iQ6NQiatNAdI4ptP52X2BoZwD6ToknT
	 H1LzC/biabj/L2oKT3gPEC3fNlrLY5sCnYelvnyItmu3MW+e9tHaD/iIvGM9jq74Su
	 cjhozkVVEkuCbqNcZsmRdwjCou8lxdFd1/dyvo481oLo+kF+Y9XMsMgIAZ4CuomM+U
	 dEcsdT2z2qQArfP7MJbs0bpQgg9vp3FSpPsG5jcME63VN4IlM1FUTUbhAP5lTa/mVt
	 KMIB960gL8I2Nm9GxoR9CXm7FevWBgwfuCRk1k5Uc0gRrWGsNOA+xURidh1tUE7GAx
	 gEnrE4Mah85AA==
Date: Wed, 27 Sep 2023 14:46:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: hch@infradead.org, bhelgaas@google.com, christophe.jaillet@wanadoo.fr,
	imx@lists.linux.dev, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	robh@kernel.org, roy.zang@nxp.com
Subject: Re: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <20230927124621.GD18050@thinkpad>
References: <20230926140445.3855365-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926140445.3855365-1-Frank.Li@nxp.com>

On Tue, Sep 26, 2023 at 10:04:45AM -0400, Frank Li wrote:
> From: Guanhua Gao <guanhua.gao@nxp.com>
> 
> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> 
> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     change from v2 to v3
>     - remove check return value of dma_set_mask_and_coherent. 64bit mask always
>     return success.
>     - remove redundate comments
>     change from v1 to v2
>     - Remove 32bit DMA mask set.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index de4c1758a6c3..2c2c9aaa8700 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -249,6 +249,8 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  
>  	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>  
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +
>  	platform_set_drvdata(pdev, pcie);
>  
>  	ret = dw_pcie_ep_init(&pci->ep);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
