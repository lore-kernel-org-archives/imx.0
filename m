Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2531ABEB0
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398546; cv=none; b=LdPinl0JKl8chf8H6/1OU+c+V7YCxpf7FZyic9HjicR1nNVh9XtYIxifgtatZ2NsTadmHpl+jCJWtNsDG3JPed/ohO0+CBTV//vZGcmNCGHYDU8MnM1JvDuB6xGf3wwZHpT8eoUyIwOzFTw5oelFM5FoAp/hiOPbaoSiOOcRs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398546; c=relaxed/simple;
	bh=Gdzfz6nuF3Mv2sztvCsvN7kvDs3V6ahV1Si39NMWwFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8+hiMpv+SyIW08TdA1mu4we/K12NvbDLploOvDf1gCvW/pyGu3F0sDJNuS1W8f496EWrFHPCSIL8/cpYSBZtiMUh2f5iSS5A1sC3kZKuhn9huZiJhTz4lbsi1+bHBodMqPl/X45Xf8WzCoatw3cSODKhzPkCaveCgbwO9Ij5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mj4PBb0m; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mj4PBb0m"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso4355095a91.1
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 00:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731398544; x=1732003344; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdmcDJQb0kxtWtYlqvMLgav0HJpmDO9A2F6bQ8vcVVk=;
        b=mj4PBb0meIYIc6iQwVZ6jtFRgddcOXDrD8S9whb7K9TsR42IpRk/3T+GykGd/ExQqI
         iKb9Qk11tBjHfEdvY5kmWjieB5fhhSbImcxPJTZXyh15Rc6LE89CbFnkml/RZW9uy5Wk
         IXfJAdt39yygFEurQEdqGgHQ5jhh+F1htUO6o6pEo8FHLpW0T4v29EPxSgx2LZLNqX7A
         1s1Cp5Rw1e6XJgZZEyO4n8m3PzZOgAvql0GgayzyzwHqP43p2Y5fiPwXarSRq9Zojr53
         13okV5a3hB6py49/0Ivi9p/2IwgVwDLu+wy54gc7Y6EI6oPRWLrFZa+MOJMVjvlDRG7W
         dMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398544; x=1732003344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdmcDJQb0kxtWtYlqvMLgav0HJpmDO9A2F6bQ8vcVVk=;
        b=Z2rCBuR7TwCS9L+OLBjPMctUzAOunWinXRr5bGfCQxT25yZKyUVm8UdldgZf2PYzph
         0ctaP/DSMZJ44ayJrbsrgYR8PxiB6ZCungoZkefqPXdctwym5SbX+oHC2CnRAUGZUUTs
         25vP53kquPYyASabx+L58/Le986KsJsqFeb/R3FafJ1FZ8GBgGau7LaNjmanhjYOhZX4
         vGp4Y5hpiXrd7E4njMNpCnuciqagI+2St16OsQmQY6jsJjrTMvDeJlUydlzGkfkRlio8
         mCqInLmig1Mei8/Cr508HECOMdfHpybWdZsz7alUhj4IkF6Pt5fV6lr2LwN9KYVCTXVg
         HeQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ccWOXIMEkNNblXm6pSasIBepb0SSnSUdhLe87jisWmNSMlW1GDlEZyEn4i/h6sIOrnM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4wZTmIHhwq0VdpwB8p8p1s26jbkVdnp5nrmXs2RVNVzpCK7t2
	nsRkMJLO6iZOhEncOm0xJupzW0gvYXjtYUyFLhTOSEYnZUgm38r36umEQqBJcg==
X-Google-Smtp-Source: AGHT+IGxmuoFDE3JbNsNx57MeL6QGeI+BKO4bDu8QDdKhoNLOa8X4pga/l3/7VWn1aeLrpGmDD9L0Q==
X-Received: by 2002:a17:90b:4a87:b0:2e2:aef9:8f60 with SMTP id 98e67ed59e1d1-2e9b14ddb3bmr20379534a91.0.1731398544255;
        Tue, 12 Nov 2024 00:02:24 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9b23a510bsm8093555a91.15.2024.11.12.00.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:02:23 -0800 (PST)
Date: Tue, 12 Nov 2024 13:32:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	jingoohan1@gmail.com, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] PCI: dwc: Clean up some unnecessary codes in
 dw_pcie_suspend_noirq()
Message-ID: <20241112080216.6kzdybe2su5ozp44@thinkpad>
References: <20241107111334.n23ebkbs3uhxivvm@thinkpad>
 <20241108002425.GA1631063@bhelgaas>
 <20241111060902.mdbksegqj5rblqsn@thinkpad>
 <ZzJCGkenhxgJxoC4@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzJCGkenhxgJxoC4@lizhi-Precision-Tower-5810>

On Mon, Nov 11, 2024 at 12:42:50PM -0500, Frank Li wrote:
> On Mon, Nov 11, 2024 at 11:39:02AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Nov 07, 2024 at 06:24:25PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Nov 07, 2024 at 11:13:34AM +0000, Manivannan Sadhasivam wrote:
> > > > On Thu, Nov 07, 2024 at 04:44:55PM +0800, Richard Zhu wrote:
> > > > > Before sending PME_TURN_OFF, don't test the LTSSM stat. Since it's
> > > > > safe to send PME_TURN_OFF message regardless of whether the link
> > > > > is up or down. So, there would be no need to test the LTSSM stat
> > > > > before sending PME_TURN_OFF message.
> > > >
> > > > What is the incentive to send PME_Turn_Off when link is not up?
> > >
> > > There's no need to send PME_Turn_Off when link is not up.
> > >
> > > But a link-up check is inherently racy because the link may go down
> > > between the check and the PME_Turn_Off.  Since it's impossible for
> > > software to guarantee the link is up, the Root Port should be able to
> > > tolerate attempts to send PME_Turn_Off when the link is down.
> > >
> > > So IMO there's no need to check whether the link is up, and checking
> > > gives the misleading impression that "we know the link is up and
> > > therefore sending PME_Turn_Off is safe."
> > >
> >
> > I agree that the check is racy (not sure if there is a better way to avoid
> > that), but if you send the PME_Turn_Off unconditionally, then it will result in
> > L23 Ready timeout and users will see the error message.
> >
> > > > > Remove the L2 poll too, after the PME_TURN_OFF message is sent
> > > > > out.  Because the re-initialization would be done in
> > > > > dw_pcie_resume_noirq().
> > > >
> > > > As Krishna explained, host needs to wait until the endpoint acks the
> > > > message (just to give it some time to do cleanups). Then only the
> > > > host can initiate D3Cold. It matters when the device supports L2.
> > >
> > > The important thing here is to be clear about the *reason* to poll for
> > > L2 and the *event* that must wait for L2.
> > >
> > > I don't have any DesignWare specs, but when dw_pcie_suspend_noirq()
> > > waits for DW_PCIE_LTSSM_L2_IDLE, I think what we're doing is waiting
> > > for the link to be in the L2/L3 Ready pseudo-state (PCIe r6.0, sec
> > > 5.2, fig 5-1).
> > >
> > > L2 and L3 are states where main power to the downstream component is
> > > off, i.e., the component is in D3cold (r6.0, sec 5.3.2), so there is
> > > no link in those states.
> > >
> > > The PME_Turn_Off handshake is part of the process to put the
> > > downstream component in D3cold.  I think the reason for this handshake
> > > is to allow an orderly shutdown of that component before main power is
> > > removed.
> > >
> > > When the downstream component receives PME_Turn_Off, it will stop
> > > scheduling new TLPs, but it may already have TLPs scheduled but not
> > > yet sent.  If power were removed immediately, they would be lost.  My
> > > understanding is that the link will not enter L2/L3 Ready until the
> > > components on both ends have completed whatever needs to be done with
> > > those TLPs.  (This is based on the L2/L3 discussion in the Mindshare
> > > PCIe book; I haven't found clear spec citations for all of it.)
> > >
> > > I think waiting for L2/L3 Ready is to keep us from turning off main
> > > power when the components are still trying to dispose of those TLPs.
> > >
> >
> > Not just disposing TLPs as per the spec, most endpoints also need to reset their
> > state machine as well (if there is a way for the endpoint sw to delay sending
> > L23 Ready).
> >
> > > So I think every controller that turns off main power needs to wait
> > > for L2/L3 Ready.
> > >
> > > There's also a requirement that software wait at least 100 ns after
> > > L2/L3 Ready before turning off refclock and main power (sec
> > > 5.3.3.2.1).
> > >
> >
> > Right. Usually, the delay after PERST# assert would make sure this, but in
> > layerscape driver (user of dw_pcie_suspend_noirq) I don't see power/refclk
> > removal.
> >
> > Richard Zhu/Frank, thoughts?
> 
> Generally, power/refclk remove when system enter sleep state. There is
> signal "suspend_request_b", which connect to PMIC. After CPU trigger this
> signnal, PMIC will turn off (pre fused) some power rail.
> 
> Refclk(come from SOC chip), OSC will be shutdown when send out
> "suspend_request_b".
> 

Thanks for clarifying! Then it would be better to add the 100ns delay after
receiving the L23 Ready message from endpoint.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
