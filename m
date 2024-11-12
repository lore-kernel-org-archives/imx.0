Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D24214423
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434665; cv=none; b=DxpwPMmESq/bBBqt2DxPxLQP0F1W6mDIsc+kt8qCoLlCi32w/QOIbU7PRUYP94IDFEBRPE2du2RhJAamHE0/cYYJGzzeC65hzKh8J+KvVSx7Rd2Zl16kkqQoz2GZoOkf+NvOZCDG1R4SJW/+VAww978xl7UMtaw7GNWb/4v4wBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434665; c=relaxed/simple;
	bh=kiHvwDGa1v/MXG+BQ5FjLjKtxIEGVLc8ycijHOantfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caD4xniZzwCKDC61KZjy+EqZ1c+7CUZM6Oszc6AjlggPXc3TYtyfjtQhg9DSypzfPdBy28cU7ePR8+HigHc7jMVJYasNtgIr4D1bE/qCsPHRKMxvKpxLq4abw/annQOuQgGpKAKHWXQnCrxvRCYRk2L4ahC5WxQ6GiH9OFwpMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clXpB14z; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clXpB14z"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so5113274b3a.0
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 10:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731434663; x=1732039463; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VeXkIgWbLSCzsISs/oTGsSq58/Qd//+A0sauzP5H6WU=;
        b=clXpB14zewG4hz8Eyy6cV7Uf1JrYn2NpCc38juThtPn4gmzvtL4yG+N6UvWBIMAjI4
         emhAtdgthwyWPzW4p6IxSCjJHJ4fciLBrJhioPltSenjIjclXtKwxvyH834k1hbPB0PL
         gIpiJ4jZaRUFXq4VGp1P8vZZgfZ9ctQRbBeWkkANtLOfF5h5uyVfrFQkepvUz0kiRydb
         liKZNleBu71c/mUfd9pUESOvt8tk5xDnllgNm2hToyIJR4s0VxMa2CXtbZuDTuHSh6Eq
         ciyXobFi9x8GK95bgZzs/AaZdQ/8qTKi2XQIWjM3kwfziLmjH1Bqch0FcjE9A8Ho2DLY
         Kqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731434663; x=1732039463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeXkIgWbLSCzsISs/oTGsSq58/Qd//+A0sauzP5H6WU=;
        b=Mh/qYEmMmpQ+qww9492A9YEfdoAa4agH4PSRemRNEZlIcq6C93WyrGV06JUNDG/GyK
         CSeMqqUbQz2OOrmO9DkkT9OHqfC3TOL2sF6O56/8im0xk5CwDqwrDawcjSfxQvkKdEcD
         F2QRK/kw/o1hvHX9NDEnTIwUzl2+unt+zw25VCefasjjRVBOfvg6zWYbPeEE23zw5QCi
         kwRBALQ7ZQYAHUQI3IH3+1vL8ZINti7Pe7O1/ZJ1K2UObLnFeRCwGrR7ffbOdNtw0SsH
         nGy5ujRJhI3kVr4aLQZE1hDubNgOfqergncNg9b//uqN57iYODuFjZ3nocMRy+/Nv9Oj
         WyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJppkgSw2zcjI0OI6J2FV9YXK/RhLUFS8zpAGG6JKE/zPanp9F25AmHOqehdJRowYGiKg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ31gt8lKiLY/NSQdG6xfaZosk0psC1FXaR+XuCZs2V0AvSWPw
	oarEbOi8ygN7VzDrYL+tVhy3SyNZmV1XNMP9V757UBqbEZG8c/VXqIxniECLlA==
X-Google-Smtp-Source: AGHT+IF9YlSU/A2R3S+EGE+zy9TUlP6Jr0MK4kIBFc23KyUhQBv+qDrdn7yK6/DV+IBVJHUvw9ppag==
X-Received: by 2002:a05:6a00:14d3:b0:71d:ee1b:c854 with SMTP id d2e1a72fcca58-724132a134dmr24121068b3a.9.1731434663170;
        Tue, 12 Nov 2024 10:04:23 -0800 (PST)
Received: from thinkpad ([117.213.103.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a8a6asm11490854b3a.76.2024.11.12.10.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 10:04:22 -0800 (PST)
Date: Tue, 12 Nov 2024 23:34:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: dwc: Clean up some unnecessary codes in
 dw_pcie_suspend_noirq()
Message-ID: <20241112180416.ssyivc53h7i6w2wq@thinkpad>
References: <20241107111334.n23ebkbs3uhxivvm@thinkpad>
 <20241108002425.GA1631063@bhelgaas>
 <20241111060902.mdbksegqj5rblqsn@thinkpad>
 <AS8PR04MB8676B2B98473900A6310246C8C592@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676B2B98473900A6310246C8C592@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Tue, Nov 12, 2024 at 09:25:57AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月11日 14:09
> > To: Bjorn Helgaas <helgaas@kernel.org>
> > Cc: Hongxing Zhu <hongxing.zhu@nxp.com>; jingoohan1@gmail.com;
> > bhelgaas@google.com; lpieralisi@kernel.org; kw@linux.com;
> > robh@kernel.org; Frank Li <frank.li@nxp.com>; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1] PCI: dwc: Clean up some unnecessary codes in
> > dw_pcie_suspend_noirq()
> > 
> > On Thu, Nov 07, 2024 at 06:24:25PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Nov 07, 2024 at 11:13:34AM +0000, Manivannan Sadhasivam
> > wrote:
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
> > I agree that the check is racy (not sure if there is a better way to avoid that),
> > but if you send the PME_Turn_Off unconditionally, then it will result in
> > L23 Ready timeout and users will see the error message.
> > 
> I understand Manivannan' s concerns.
> When check the link is up or not before dumping error message, 
> there is another check racy.

Right.

> How about to replace the dev_err() by dev_info(), and no error return?
> Whatever the timeout is caused by no EP connected or something else. Just
> inform user the real stat it is.
> 

But users don't want the timeout message if no EP is connected, that's my point.

- Mani

> Best Regards
> Richard Zhu
> 
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
> > Not just disposing TLPs as per the spec, most endpoints also need to reset
> > their state machine as well (if there is a way for the endpoint sw to delay
> > sending
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
> > 
> > - Mani
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
