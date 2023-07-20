Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A4182C0
	for <imx@lists.linux.dev>; Thu, 20 Jul 2023 14:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4977CC433C7;
	Thu, 20 Jul 2023 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689862851;
	bh=8czobt6b2nGsykSx6kshr/iFGD0uIXglebqw3BxMl0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haWaSmUPYpKqdiouAbxDguEGIvEqUHnC7vPIYIcwQKsBSwxUFcGAF9sMZEiY/ojZb
	 ibHhJv/G2EP7b5dMf4Xc8dpD0Zd6sewpWtA3/2FlqHFbZN0FucgSIRtbBqqhPHha3R
	 BEj33Xqr0v+q1bkMoJhKaHtXWnGONgMWpydDPGGMs5cyQ2T0dAFMScwWKEK/PjDCeJ
	 m2kgl8BBopE0SZQF0BCMAW6ho9gCmcfPK5LwrB6U34xZDvrudvzk8uPrPLQiiILxfp
	 8Npe/NoYCP8yC4By7mKrIZqN5LTADOn7+vfPsT1o5OvcrA62bpbNbSZIZLEDlH6Qpr
	 Ft+7xwlWglzzw==
Date: Thu, 20 Jul 2023 19:50:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	helgaas@kernel.org, imx@lists.linux.dev, bhelgaas@google.com,
	devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com,
	kw@linux.com, leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lorenzo.pieralisi@arm.com, minghuan.lian@nxp.com,
	mingkai.hu@nxp.com, robh+dt@kernel.org, roy.zang@nxp.com,
	shawnguo@kernel.org, zhiqiang.hou@nxp.com
Subject: Re: [PATCH v3 1/2] PCI: dwc: Implement general suspend/resume
 functionality for L2/L3 transitions
Message-ID: <20230720142034.GA48270@thinkpad>
References: <20230419164118.596300-1-Frank.Li@nxp.com>
 <20230717164526.GC35455@thinkpad>
 <ZLWKI1lRqxejfUgK@lizhi-Precision-Tower-5810>
 <20230718100400.GB4771@thinkpad>
 <ZLg2oObBfmhSzTFg@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLg2oObBfmhSzTFg@lizhi-Precision-Tower-5810>

On Wed, Jul 19, 2023 at 03:16:48PM -0400, Frank Li wrote:
> On Tue, Jul 18, 2023 at 03:34:00PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jul 17, 2023 at 02:36:19PM -0400, Frank Li wrote:
> > 
> > Fine then. But can we check for PM_LINKST_IN_L2 SII System Information Interface
> > (SII) instead of LTSSM state?
> >
> where define PM_LINKST_IN_L2? I just find one at
> 
> drivers/pci/controller/dwc/pcie-qcom.c:#define PARF_DEBUG_CNT_PM_LINKST_IN_L2           0xc04
> 

Yes, this register is not exposed by the DWC core itself but the vendors may
expose such as Qcom as you pointed out. If it is not available on all platforms,
then feel free to ignore my advice.

- Mani

> Frank
>  

-- 
மணிவண்ணன் சதாசிவம்
