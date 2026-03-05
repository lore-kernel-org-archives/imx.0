Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C003A9D85
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725680; cv=none; b=P+KAOQ/vyGvt53NGmTgY9bDiuvg156MLYYcR3v4lRCXryNcWXD/JoyBOPuqC3dvLEyr4z+zizseR9MDu4teiJ65g3ZpWd2pJDK12SOJqI4ZVH3IVvuphtt0SrmNA72s2sRoBICbAy/xqiUx8uMsyL4uJ0aSn3Pyvl0PI6y7V2xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725680; c=relaxed/simple;
	bh=8cJHgdbKxrkm2+66tHARPeIMw4/HQWrbzP6RxeZN95Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plQgNbPmz0ss2PKpMuAtTeLsJhe9N+pyHVS+VjsKMH0UG3Js64VmVLS54ijs8kaLm3zrUX71kJiJkM7aFxuV2MFbpbiNjaPXvLa93S7CbylvKeMkbFHLZSa5KjPnK8XybR6OkTl0z+tcKF2WSSknXRkTLG1eC/iIP5aRl6ptQis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KQC3gl3h; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KQC3gl3h"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1311644585a.2
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772725678; x=1773330478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+93b4rncmSMzYKKF9LRnkkK5vmWko9G930mePvUh1Z8=;
        b=KQC3gl3hIB0a5Er8821EpMF4xQe7C5Z+DkEE2y74TNSiNfVIIUJWpHvQTAHY0irCVO
         CL4hm7kESc4XhlfPPC9v+TMB8qr9yx1o9VkuMnJ0QCZ6bJYp+jNidoGNwqW0aJt1r6oq
         U7eRhdryrUe/aQnu6TGil6H9WhJOSRXENwdJ5ZTm01F+k4WsRqRAtF6J8gXhLCJyx5t0
         zQ21kIQkK0a8Rva95/gc/w9RR01K/nEumwhItHqHKEQMeaor6ShLR2i9/GUjktXzL3lb
         8DhVjO1J605Mi1DK9ckbwR2StFmz+7d63XUb9uku2B5ozot8ireaq/6vBje+WaI12GyP
         Q1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772725678; x=1773330478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+93b4rncmSMzYKKF9LRnkkK5vmWko9G930mePvUh1Z8=;
        b=anyQwBJfgS/cGtC4/ApMb465QwJUOPHxi73hdcI2oY9GDiVKULTLW5OY8OWWTC8Vku
         +CwJyy5dw4eHXsSVsjC8Yv4OlmUsYBrnvKWQMj0U79+ql9bdzn3ieBfkZ4M7/t15Mhd6
         jbqFwoH+dbesH9JL+E/+EKlIfktKcrW2X5xipvEVLCUZd7xfy9ublaOk/U2dGmTt2KD3
         GvKn6CaDR+/lu/0xo+OkPII/RnITrPCub2WaCDAJfMmLUl+to1NrGLyfgI86yOP8gLxU
         tC+XPnv6nKjGU867o7umIRbuyOejpI7ZmciahTIrRaF/vFnSeNWdLnWLtmriL5aX3H6h
         fwsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCBeqUX64aAxG76uT4ZUxjW70iV/VN9VZWZbjHbe1DOTg6X3JIjfQhjsbAosvKQ0yVNeY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyemuIGQoEf76kn1A/x/gQ5t4vcOTPaThD/6vPw1NUfPRPwi/xi
	F83ZKgWUqZLuuFepjTAU0YEfj1jKS5QypN5RUjQ3RsXQJuTFS0uMfq8amWwoDNs7kw==
X-Gm-Gg: ATEYQzxxlJkXu6qtXsuh9MQ1r305PNR2U4vN9dDePbsVMPipJBVbYh7qlYFKnLMIiEt
	9Ko9cowoquOOVtxw5xTYCfqi9s0vcoQLwjonHnSYEGQqfoI65M5PJ01ByRqVX7nTug36CepPAdO
	2IQzBeAdg8kio5Ra1EAsGDTjpNhCsdkkwyS6Clu0ts7LKZ4Pe4Qu/httCfTawbmwPD4X30Dky9o
	u7H3wtMcBMmD/pqaKpxSt1fHk/LGRlXuCNycLIjLCpeIT4cBVzzxR9PPIP7uC6WGYExkDO1Fo6D
	XbPVHSYpkxJxoeq1ro3hN3lqnaek2DxOJ7KwMtQtT5Ew6A11n3VSX07r4LD6rbdM2YfmYXjyzWo
	i6QIVGE0mbsQ0zy0YwOqIIuVXomFgDA/hP3ayRgfJNXM5KF7lQk08j4bERjA8TBYjnxwq1m3ylS
	U+CKwuLNd0MPOqMLj71v9IQ4hhWry2bV4ZS8bVdiR9aw==
X-Received: by 2002:a05:620a:1922:b0:8c7:f79:bd70 with SMTP id af79cd13be357-8cd5af7589dmr797306385a.44.1772725678084;
        Thu, 05 Mar 2026 07:47:58 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf72d3casm1937310085a.42.2026.03.05.07.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 07:47:57 -0800 (PST)
Date: Thu, 5 Mar 2026 10:47:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, gregkh@linuxfoundation.org,
	tglx@kernel.org, mingo@kernel.org, claudiu.beznea.uj@bp.renesas.com,
	kees@kernel.org, bigeasy@linutronix.de, ulf.hansson@linaro.org,
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq
 workqueue
Message-ID: <b5a3d627-8cc5-41a9-848a-1e67c96bc191@rowland.harvard.edu>
References: <20260304115729.857136-1-xu.yang_2@nxp.com>
 <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
 <dia6g5nbekt6brmi73dovchyklugjnd6ok3tsifbd6nfcjnnvd@xus2sw5wodhe>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dia6g5nbekt6brmi73dovchyklugjnd6ok3tsifbd6nfcjnnvd@xus2sw5wodhe>

On Thu, Mar 05, 2026 at 03:18:29PM +0800, Xu Yang wrote:
> On Wed, Mar 04, 2026 at 10:24:09AM -0500, Alan Stern wrote:
> > On Wed, Mar 04, 2026 at 07:57:29PM +0800, Xu Yang wrote:
> > > After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
> > > as freezable"), pm_wq workqueue will be unfreezable during system pm. This
> > > brings issue as below:
> > 
> > ...
> > 
> > > The reason is if the host controller resume routine xhci_resume() call
> > > usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
> > > Then usb_autoresume_device() will be called and usb device will exit
> > > runtime suspended state (if it was suspended before). For a hub device,
> > > hub_resume()/hub_reset_resume() will be called accordingly.
> > > 
> > > After the host controller device system resume is finished, the root hub
> > > usb device "usb1" will do system resume too. Then hub_resume() will be
> > > called again.
> > > 
> > > Above sequence will cause hub->urb to be submitted twice. To avoid this
> > > issue, restore the previous behavior by queuing wakeup_work to
> > > system_freezable_wq workqueue.
> > 
> > I don't think this patch is an appropriate fix for the problem.  One 
> > indication of this is the fact that you have not considered the reasons 
> > for making the runtime PM workqueue freezable in the first place, as 
> > described in the 4fb352df14de commit.
> 
> Making runtime PM workqueue freezable is to prevent runtime PM tasks from
> interfering with the system PM tasks. We also don't want usb wakeup work
> to affect the root hub device system resume process, right?

You're right.  My first reaction to the patch was too hasty; I 
apologize.

> > A better question to ask would be: Why does xhci_resume() call 
> > usb_hcd_resume_root_hub()?  That does not seem like the right thing to 
> > do -- at least, not in this scenario.  The proper time to resume the 
> > root hub after a system sleep is when the PM core calls its resume 
> > routine.
> 
> Good question, it seems like commit 79989bd4ab86 ("xhci: always resume
> roothubs if xHC was reset during resume") is added to fix some issues.

The changelog for that commit says that it was meant to take care of 
problems during runtime resume, but it also affects system resume.  This 
appears to be an oversight.

> I also find ohci_resume will do the same thing: a8b43c00ef06 ("USB: Fix
> runtime wakeup on OHCI")
> 
> Assume the above fixes are necessary, then switch to system_freezable_wq
> should be a proper fix. Because this just restores it to a previous state.
> Otherwise, the fixes need to be implemented in other ways.

Yes, okay, I withdraw my objections to this patch.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
