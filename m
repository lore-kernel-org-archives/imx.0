Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA0182B7
	for <imx@lists.linux.dev>; Sat, 31 May 2025 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748713645; cv=none; b=beVwT1jbSSMOWbR5Ia9s4CbGNcsdoND/k+YEIzxz5UfpeT+By/dM/lcysvpuWhEaj39UIkTRd3QJ0SiltPhoWbUFIMy51Uw3LWBoAO/Ht1Zyw5hdplkNwbib9eppQZlVAI+C8PEKa/VgWHH0Fg9PMXvBhkqRFnxeag4Cao+lX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748713645; c=relaxed/simple;
	bh=rTj2AIRIccwVu0KtTjttNFvLcxNqqZA9tQ/jwxhFYzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKB17CZopISdFE4Fct63Sxo+CYmsetxSkAOleuRp/QRUtK7ah6dsM3SOW0QgK4Feb+t1578yZ67tW1z2o56MQhtIhDxjb6admx8SCZio0PR8tzzpfNirSx6an5h6qACiRaxCgl+zRIz65CayMqNGjuBUOh1jFHxjZzzQpHX106M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jo3NdQD3; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jo3NdQD3"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376e311086so3215418b3a.3
        for <imx@lists.linux.dev>; Sat, 31 May 2025 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748713643; x=1749318443; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBHGQdqSeWvGB9mY6qlXaI9AwWyEpcoU+ydjWvyeZw8=;
        b=jo3NdQD3GKYzGybaseBj896fkgoP/9Zzx5P9MS5zIXwAEhul6A/sf7zBBvuaiRZanq
         BRC7o0kxYXMUCmvyCKDIqxO9dwXODFo4zV5n8dXX+kuAKgn0NaygX6TpvkZyX3JSsNU6
         6W3/+0+MxHqRimgYqeP6E5L8Dj0+t9ky95QYw0eIcpv4zUfii8W1hxVi3wg1+Z7PZnbr
         I/XeqRMR584Nw/Uwlbdret074Jf/vkGDBCZZD+1bHifyUIWuC09TEatAgCF1/PFTg9/G
         LDVdm4bValIVja7q7BPlH7oq97FmbHhjTzbk/1o13+DXIjHupIK+c7qKMW3PxJ4Vpd1c
         Kxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713643; x=1749318443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBHGQdqSeWvGB9mY6qlXaI9AwWyEpcoU+ydjWvyeZw8=;
        b=qRCvxHi+ozXdZ4k8pEAp56riTrTyvC7Mihfxi8h/HwT12uDWbtcyOCPnIodXLSNACL
         UKg5iW4OU30UsAIyVT6TpBipeou9FJ9C1TY0fYAQlvXWOjZN+6ODtQ9wn6uDyktxdEsi
         Tf3QWfSKB4VUBYB+UGgWX/f9QWdY9423IYVfnZJ4EfPyD1HLxDo53RKw5JwKSSleBsbe
         eJmg/0BA8RVrS4tvb9JHCWz7qqJjYFu0fJCD1LE7JN1o6RNgrEBKnup/79QMuk5OQfN0
         nZo2gPyCjb4XnOriYTf4IN2yoaFDSa6gyeoJauB4aALOXx8pTypOGW30YCNU7eVDHVBT
         TVhA==
X-Forwarded-Encrypted: i=1; AJvYcCX0sll7guOEl/IYt6BafUya0tjih4I1BM8heDauKYCH7jFxzrqsX37Ak8B442dRg245+SQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJsFFQqmjc1PYTXOBHLqKLsiiDAi+7sZEdXDh0Czwbcyc0n1my
	BCx/64PweniHiXobttjvMAntlsnGvWh7zJPy6g5IIa5APXXYS5qV4Khn84nS1oK44w==
X-Gm-Gg: ASbGncuBDwu3eqJwo376oxPCTw9feInYy+M7HXi6CyigWOh3GyQ7qd12QUKoAA/P2KV
	XvMS11mi2wRKTDCQ1OheB+dbAOFfugR3fb4dv+0g/KYuXXxxl2uadj68y2+0+ajvnHA9cI8MMEO
	T8vR/hy3vARCSV99libBtFImN65My4YvrMD8u8+4Qp1SwepLjutbeTlm83/E+BV5iOM0J0Pfc+1
	byj3rZCQpSMN3oyt2UQeYIBj9bbh8R6DcT/piD//bxNLuDEK55MzZNJ+QAKuT56yw+j46+TzW5B
	BByCzJYCDnpBnapedo4AI0gTMAc0gs/LqF3Wl5Zunea84/gEHM3NQRDL8aLk4Oo1uHBnVQXcg+L
	K7OtNuts=
X-Google-Smtp-Source: AGHT+IEQudPQU3BshE97L4wC1n51Mdqw3QLAzjvyvN2bu8Bm77uJvbC7suQxxrFON6iwO1js+sJc9Q==
X-Received: by 2002:a05:6a00:8d0:b0:73e:970:731 with SMTP id d2e1a72fcca58-747d1ab6968mr3580149b3a.16.1748713642662;
        Sat, 31 May 2025 10:47:22 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf6ebsm5018495b3a.141.2025.05.31.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:47:19 -0700 (PDT)
Date: Sat, 31 May 2025 23:17:13 +0530
From: 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	Frank Li <frank.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] PCI: dwc: Add quirk to fix hang issue in L2 poll
 of suspend
Message-ID: <tv67nul5owjqywhqmekb2cf5q2acyb3jpcfvz6k62jd6sxd5gv@izy7uomaakei>
References: <20250408065221.1941928-2-hongxing.zhu@nxp.com>
 <20250408145840.GA231894@bhelgaas>
 <AS8PR04MB86766063C3A9E969234779EB8CB42@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86766063C3A9E969234779EB8CB42@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Wed, Apr 09, 2025 at 02:31:22AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2025年4月8日 22:59
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: jingoohan1@gmail.com; Frank Li <frank.li@nxp.com>;
> > l.stach@pengutronix.de; lpieralisi@kernel.org; kw@linux.com;
> > manivannan.sadhasivam@linaro.org; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1 1/4] PCI: dwc: Add quirk to fix hang issue in L2 poll of
> > suspend
> > 
> > On Tue, Apr 08, 2025 at 02:52:18PM +0800, Richard Zhu wrote:
> > > i.MX6QP PCIe is hang in L2 poll during suspend when one endpoint
> > > device is connected, for example the Intel e1000e network card.
> > >
> > > Refer to Figure5-1 Link Power Management State Flow Diagram of PCI
> > > Express Base Spec Rev6.0. L0 can be transferred to LDn directly.
> > 
> > Please include the section number.  Section numbers are easy to find
> > because they're in the spec PDF contents, but figures are not.  E.g., "PCIe
> > r6.0, sec 5.2, fig 5-1"
> > 
> Okay, would add them later.
> 
> > > It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> > > PME_Turn_Off is sent out, whatever the ltssm state is in L2 or L3 on
> > > some PME_Turn_Off handshake broken platforms.
> > 
> > Maybe we don't need to poll for these LTSSM states on *any* platform, and
> > we could just remove the poll and timeout completely?
> > 
> Yes, I used to suggest remove the L2 poll and timeout in the following
>  discussion.
> https://lkml.org/lkml/2024/11/18/200
> Hi Krishna:
> Is it feasible to eliminate the L2 poll and timeout in this context?
> 

Spec r6.0, sec 5.2 mandates L2/L3 Ready state:

"L2/L3 Ready transition protocol support is required."

Also in many places, it suggests waiting for L2/L3 Ready state before powering
down the device. So I don't think we should just remove the poll for all
platforms.

> > If not, we need to explain why it is safe to skip the poll on some platforms.
> > "Skipping the poll avoids a hang" is not a sufficient explanation.
> > 

So the issue is that the device doesn't transition to L2/L3 Ready state and the
host platform just 'hangs'? Do we know why the hang happens?

> > s/ltssm/LTSSM/
> Okay.
> > 
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -947,7 +947,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)  {
> > >  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > >  	u32 val;
> > > -	int ret;
> > > +	int ret = 0;
> > >
> > >  	/*
> > >  	 * If L1SS is supported, then do not put the link into L2 as some @@
> > > -964,15 +964,17 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  			return ret;
> > >  	}
> > >
> > > -	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> > > -				val == DW_PCIE_LTSSM_L2_IDLE ||
> > > -				val <= DW_PCIE_LTSSM_DETECT_WAIT,
> > > -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> > > -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> > > -	if (ret) {
> > > -		/* Only log message when LTSSM isn't in DETECT or POLL */
> > > -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n",
> > val);
> > > -		return ret;
> > > +	if (!dwc_check_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> > > +		ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> > > +					val == DW_PCIE_LTSSM_L2_IDLE ||
> > > +					val <= DW_PCIE_LTSSM_DETECT_WAIT,
> > > +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> > > +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> > > +		if (ret) {
> > > +			/* Only log message when LTSSM isn't in DETECT or POLL */
> > > +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM:
> > 0x%x\n", val);
> > > +			return ret;
> > > +		}
> > >  	}
> > >
> > >  	/*
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h
> > > b/drivers/pci/controller/dwc/pcie-designware.h
> > > index 56aafdbcdaca..05fe654d7761 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -282,6 +282,9 @@
> > >  /* Default eDMA LLP memory size */
> > >  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
> > >
> > > +#define QUIRK_NOL2POLL_IN_PM		BIT(0)
> > > +#define dwc_check_quirk(pci, val)	(pci->quirk_flag & val)
> > 
> > Maybe just my personal preference, but I don't like things named "check"
> > because that just means "look at"; it doesn't give any hint about how to
> > interpret the result of looking at it.
> > 
> How about dwc_match_quirk(pci, val) (pci->quirk_flag & val)?
> 

Maybe just dwc_quirk()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
