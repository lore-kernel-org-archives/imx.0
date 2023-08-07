Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731EF10797
	for <imx@lists.linux.dev>; Mon,  7 Aug 2023 13:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94ECC433C7;
	Mon,  7 Aug 2023 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414375;
	bh=whOUAc25oLPzlTpk5wjf+E0XCgf/YkQr5OBFvqrLFMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKEK6BMxrpiWRwp2S9CbhIz3SmULNKcn9new/RwN2ZAQoeJZfSRPpNx2cGwvRdomH
	 6IJeLSZaURsKDJtHh36gLqDMabWypSEYUiZo8zqdDqcFopUugllVS+VFs7dFW/E/YP
	 En8M5i7xYD3SOyra8439XomdCWqvQR3InUxIl6eXBF/1jMky8FBtKEH/5h6KuP5nOS
	 LLjws0OaHXxJfWfdJh5Sw8iMCQHrpENG8id9r23/oUj7+5DJ5nw1Fzs0ve7ZTMhfXT
	 E5fZYZ/VkHmtWhyHX8ov0j+8tiwFQYPMgGL4K4s4KZI5nbm1gUXPDZFFvXuSqOR6MC
	 7R3jZmMtCR8WQ==
Date: Mon, 7 Aug 2023 18:49:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: helgaas@kernel.org, bhelgaas@google.com, devicetree@vger.kernel.org,
	gustavo.pimentel@synopsys.com, imx@lists.linux.dev, kw@linux.com,
	leoyang.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lorenzo.pieralisi@arm.com,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	minghuan.lian@nxp.com, mingkai.hu@nxp.com, robh+dt@kernel.org,
	roy.zang@nxp.com, shawnguo@kernel.org, zhiqiang.hou@nxp.com
Subject: Re: [PATCH v9 1/3] PCI: Add macro PCIE_PME_TO_L2_TIMEOUT_US
Message-ID: <20230807131918.GC18257@thinkpad>
References: <20230804180637.462573-1-Frank.Li@nxp.com>
 <20230804180637.462573-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804180637.462573-2-Frank.Li@nxp.com>

On Fri, Aug 04, 2023 at 02:06:35PM -0400, Frank Li wrote:
> Introduces the PCIE_PME_TO_L2_TIMEOUT_US macro to facilitate checking the

s/Introduces/Introduce

> PME (Power Management Event) timeout in the PCI subsystem.
> 

L2 ready timeout

> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With above changes,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/pci.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index a4c3974340576..da8156663c825 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -13,6 +13,12 @@
>  
>  #define PCIE_LINK_RETRAIN_TIMEOUT_MS	1000
>  
> +/*
> + * PCIe r6.0, sec 5.3.3.2.1 <PME Synchronization>
> + * Recommends 1ms to 10ms timeout to check L2 ready.
> + */
> +#define PCIE_PME_TO_L2_TIMEOUT_US	10000
> +
>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
