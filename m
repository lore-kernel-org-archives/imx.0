Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8433DF51
	for <imx@lists.linux.dev>; Wed,  2 Aug 2023 16:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347FDC433C8;
	Wed,  2 Aug 2023 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690993900;
	bh=0lpVhKDUd7Tnt1pOBSUzHZtuD1Oebkn4+PkPwpT2kKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=j0r8Vw0e00dzFIZouvGCpEl3w6wxJOtu5r+oKgbEEIllcsLcOgwkF+oW74VmuJJBr
	 gXosxOrbTcwzjl6Ri2+Vpvwaj+dLrnCki/kBmQADQLYHTqjK1iBIe0nH+4h3waSf4r
	 M5D19Z0MEPM1/zXyX7/FVkLek5okoT7aKTw3f7d3T0A6x3xJp4N5+9kQoMj3Om7XEg
	 o4mGK6UbzNe388NZKfrgdLIRcayKsqL+xqLQhVUYoEmA3lv84UP4bfn656s9Lv9ldl
	 QzrI/ZsQwszGGQoAl5MCHtteyeekqY7TOFtRf2V5B13p4QR5qccuN6FUyqNfPADYIn
	 dtQWeEO7uAhyA==
Date: Wed, 2 Aug 2023 11:31:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: mani@kernel.org, bhelgaas@google.com, devicetree@vger.kernel.org,
	gustavo.pimentel@synopsys.com, imx@lists.linux.dev, kw@linux.com,
	leoyang.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lorenzo.pieralisi@arm.com,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	minghuan.lian@nxp.com, mingkai.hu@nxp.com, robh+dt@kernel.org,
	roy.zang@nxp.com, shawnguo@kernel.org, zhiqiang.hou@nxp.com
Subject: Re: [PATCH v7 1/2] PCI: dwc: Implement general suspend/resume
 functionality for L2/L3 transitions
Message-ID: <20230802163138.GA61043@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802155748.212377-1-Frank.Li@nxp.com>

On Wed, Aug 02, 2023 at 11:57:47AM -0400, Frank Li wrote:
> Introduce helper function dw_pcie_get_ltssm to retrieve SMLH_LTSS_STATE.

s/dw_pcie_get_ltssm/dw_pcie_get_ltssm()/

> Add callback .pme_turn_off and .exit_from_l2 for platform specific PME
> handling.
> 
> Add common dw_pcie_suspend(resume)_noirq() API to avoid duplicated code
> in dwc pci host controller platform driver.
> 
> Typical L2 entry workflow/dw_pcie_suspend_noirq()
> 
> 1. Transmit PME turn off signal to PCI devices and wait for PME_To_Ack.
> 2. Await link entering L2_IDLE state.
> 
> Typical L2 exit workflow/dw_pcie_resume_noirq()
> 
> 1. Issue exit from L2 command.
> 2. Reinitialize PCI host.
> 3. Wait for link to become active.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Change from v6 to v7
>  - change according to Manivannan's comments.
>    fix sleep value 100 (should be 1000 for 1ms).

> +	 * PCI Express Base Specification Rev 4.0 Section 5.3.3.2.1 PME
> +	 * Synchronization Recommends 1ms to 10ms timeout to check L2 ready.
> +	 */
> +	ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> +				1000, 10000, false, pci);

Thanks for the spec citation.  Can you please reference the current
spec, i.e., "PCIe r6.0, sec 5.3.3.2.1".

s/Recommends/recommends/

It would really be great to have a #define for this since the bare
numbers are not very meaningful and they're not specific to DWC so a
#define would let us find similar situations in other drivers.

Bjorn
