Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F1334C28
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637855; cv=none; b=g+gDHKPFaxambnVI8H6dtzRBPvgoakNPOeZ4MjNQpUm6F8+HpFDOBmDiDURei1eiyE8Eg8yQr5AW1JIFR+SP3U94pzm/CpakZOUYJ+aVyXfHVfCBnB+55P5tsc0PaXSCblJsnBZmgzIivfO4fINv50zsvooA0ftIgeP/wjCrga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637855; c=relaxed/simple;
	bh=dfE4q7Thd4sYvAKlXBLqeJG6yDSF0ZgLNXzgSZoQgtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S25lPOR9sIV1nxWlrE9gWEgRQlvTxAlNUPghCfzTZ6jiljrDznYKjUxZTQBnmcjDdIFldWKNsd+7nlFjQWipjgmw2IIDo+t7Vp84wkPsqiy4DjeFurEy+Qsff2eTdlp+h3IaR2iCxeUVI4PZ/OsoMFypATwUPvHJoKE5g6W05s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lp4aDmwG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lp4aDmwG"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c70b5594f4so720111085a.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772637853; x=1773242653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mldFBg2hMy87EWdNzYofBYb0Zx4ZHm48yGEZLUqC4O0=;
        b=lp4aDmwGBt8xyGxLEEs33qoaHD2PM+Y7w95qRS9Ie/0jtKtngc85YskPmv8o27tJk7
         0iyqkcICWXyso2oIrt1XEhOSsuc7KrVqE6OcA3WGk+n/P/LexS6y3Pj4aEAE6EnCtjG5
         3oRFqbvqr9A5SQjcLTxm6U8e4ZR2jryYA1ptV7Y5BwfHJANTgpohbuMXpC4t8S9m+Wps
         fS2k8dNHpMuvGgqOz3a7Pyx42RKQtUyP58B7UHThv9zbAimk6ZlRCueiylSLQW86XMV7
         aZqPYXJyjXLjCfe4Vgapf2F/7+cHN9B/hZVPBQs0mBlqbLeiZyIcDJAYHoUpVIClxibE
         hrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772637853; x=1773242653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mldFBg2hMy87EWdNzYofBYb0Zx4ZHm48yGEZLUqC4O0=;
        b=XhW3/yg8/+JXIHGrWUS8B6wzkKC7mTmJzxyVoPcJ8gcavjvMTZD6P/EOvBdZcgS3/s
         vAbX0v7CIoWwWijHNdeI6qGv+ZnFXUw5Fzb3G/sfdKW6Omh1ligNekRky79D7nq3zwCJ
         ohiUiGspi+RTcepytrOqzp2YlhcgDRwlOAkvlGQABUonZxmsaGBDLnFFx8iATETIyDRF
         YF3xw22Wu3JWVuFaOAle57fcn2oYcwFwNrqdeUAPMupK0bYgvrzsIgfysEmuWZ3GQu2h
         NtPjGJAopeLAnm4DpCtBt6TUO8lXgDRhFOahJlM3ApqfsUmEG8cr1uNwBo4lKCK7Kftd
         bvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT3xWtfUiCvGSft/serrxZD5IsU1w/nq+kaEaeJ6fsbjT60QECYWBGVCm8w0ogf4x3JqQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxihTSXRldfY+LiRaZaYY4/ck1wwp9g89IQmruymtPYvHE2UX+Y
	E43HyDWsaw+F9TYkMGgJ/SlRv1J7U75gG0Wgz7RF2l4H5k1FW9VfVT4zFxlHfEAV6g==
X-Gm-Gg: ATEYQzxqqHlZdOKT0w+LR74bEI9cQiPPrjQZifV5D+XPunL00UuLNzSKo3FwyfPjfWF
	FH1k55kZY9mdCVR+4hK+zZzcNaPtv/Z7Z18vZ2lBfOW47/ACd7x/E+OdI4BQqvhw6ZSn+P2a+PF
	IijjXeiPuYW/LmIGQssc1VbnFbUqKvpfnfPUmgUFA6szH0//VmGlUtQMpa1CqJu0o7T2d31Cpl1
	Zb02Uzd/cURvzXoyDpnFvKEfpEjyyJON1ilL9XFiHHQhlc4H9GEdPi01yVr+ZHxVRJrzLiI5Jzt
	VwNpOgSA+tbY3WSvaN2iO272+ni73MIZ7PTCRM+LRIQ3RzexnKZ/C88sGVooV/F29ERxt2IR90J
	8GhN7tDKae1s+YIwRLNZh8caF7n0wJ/nweWsZFrty5hNVzK9NWPYuTDGqzjxDOKzPui7gWPyVRD
	EymbSl8WBPtJ7DTa/WcP1WmJVLADQarDEqHKe+k9u76A==
X-Received: by 2002:a05:620a:4511:b0:8cb:50f9:20f6 with SMTP id af79cd13be357-8cd50bc3181mr725909685a.34.1772637852980;
        Wed, 04 Mar 2026 07:24:12 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6fb519sm1667252185a.29.2026.03.04.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:24:12 -0800 (PST)
Date: Wed, 4 Mar 2026 10:24:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: gregkh@linuxfoundation.org, tglx@kernel.org, mingo@kernel.org,
	claudiu.beznea.uj@bp.renesas.com, kees@kernel.org,
	bigeasy@linutronix.de, ulf.hansson@linaro.org,
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq
 workqueue
Message-ID: <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
References: <20260304115729.857136-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304115729.857136-1-xu.yang_2@nxp.com>

On Wed, Mar 04, 2026 at 07:57:29PM +0800, Xu Yang wrote:
> After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
> as freezable"), pm_wq workqueue will be unfreezable during system pm. This
> brings issue as below:

...

> The reason is if the host controller resume routine xhci_resume() call
> usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
> Then usb_autoresume_device() will be called and usb device will exit
> runtime suspended state (if it was suspended before). For a hub device,
> hub_resume()/hub_reset_resume() will be called accordingly.
> 
> After the host controller device system resume is finished, the root hub
> usb device "usb1" will do system resume too. Then hub_resume() will be
> called again.
> 
> Above sequence will cause hub->urb to be submitted twice. To avoid this
> issue, restore the previous behavior by queuing wakeup_work to
> system_freezable_wq workqueue.

I don't think this patch is an appropriate fix for the problem.  One 
indication of this is the fact that you have not considered the reasons 
for making the runtime PM workqueue freezable in the first place, as 
described in the 4fb352df14de commit.

A better question to ask would be: Why does xhci_resume() call 
usb_hcd_resume_root_hub()?  That does not seem like the right thing to 
do -- at least, not in this scenario.  The proper time to resume the 
root hub after a system sleep is when the PM core calls its resume 
routine.

Alan Stern
