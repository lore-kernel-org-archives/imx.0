Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23509376BD9
	for <imx@lists.linux.dev>; Fri,  8 May 2026 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256294; cv=none; b=MQHCwRxvh2SCTbTmGMXDTNrcQmIugUU4bcBrN9T2aGwmiqJXrSY3rCH2AVLbY15Ec13NM1AqZYARh+NXCTf4rZ1T0leKg5cZ/lwVSXV1aIQ8DU9nLqLjKmSZnQnqdpAoiIB0mkEJk6ZlVqr8E/YRsYaZZb8DbUZEUHZKXGFDZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256294; c=relaxed/simple;
	bh=cX+mME8r0BfrH9qUIlp1d8D8d65znefW7jh2nQwbSyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LD6a+0CdzAbR3rqq08fkMPROpUXxcChrI0EbrBOJVv2OaxmynQeesRcSBfYHaFD5tl/gKAi1mVJGMp5Hw6+LS8pAdoCGs6EILI4vhgKwnpJhHUgS2Q2P4mi+nptYnF+GvSZRMGatcgISggn3RMAsrS3dliyp+QMg3CxNoU41YnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b68EVh7+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b68EVh7+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so20719435e9.0
        for <imx@lists.linux.dev>; Fri, 08 May 2026 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778256291; x=1778861091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=;
        b=b68EVh7+Q+IU7bSliE1NL+z8FxqYoanVpdF/pJ+vB6WiwYQwYaAH0ys8Zkq0vu4XLd
         i+sCfa9nM80YmlXDwTXgnaABKI5sfP3WBWlW55uAXlzXxOTp4z5cZShzXk5znRh+JxgB
         RsNUbkZlTYEXbTAxMrMJfm5y1r/42LYzvod/bKbgFXR/4qQGj/vAlD5CRQ5lVjoAG4qF
         G3PE3xEy8dAMMY0hxP7/Zl+oz0cyF20hgBMmwH0JgSFtt+6XruE4Bva8Lw1IC41YiX8H
         E1EfwBxGDo2KWppdNlGg6YKqPGy3jDtj1wE9+w3/6j7GNOnYF05O6c2tSjbgNEt9E9mI
         6KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778256291; x=1778861091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=;
        b=qVgjX3dgeGwppU4fbwhnLdhUUpLejAhW1mxBY0ztN5odCrAc0kEakTbZjPMHUn1DKE
         fuPY9+2VE2KjTDMplMfwPqrwMAFKqfqX+oisJa0epwQDwSV63cKvokxv5qFiAyN1Nizj
         /l6+mUTN7Ree3bxIClLEF0q4WiBecN9et47WrTWziZjA9HPrWlnjw0gSVARtxdGfgC47
         mAoUXTSYCwVba+gBiocQ/qEvuftfXYhD2IoHvRe+m25U6AdZlVm1Uf6uoO6vh1ELhJO0
         4SkDg22WVMnctbAgbU8gqeD7BN0qm/NEAgdqM6sUwi2TEJ0uNFh+lzCpo/jsgB5aSgr4
         jFKg==
X-Forwarded-Encrypted: i=1; AFNElJ8knVXZse5+Iu8kUIxEX+hMn5el/72Vz7GuBY7HYkhVMfDy7Zk9lLMkCoHhr9JxJPDIVR8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3L4QhI0wr6UjsCTd1VISpUbgSRleYJyViLDAHZylXJ4FFbISD
	LTxTrXaLYTdR8PWJPu/dO8XsfsbAlRM0RPDTfA8+tBgKqSPYlP5cqu8S
X-Gm-Gg: AeBDietB3JocnHffXB5Wiz78RLyzIxnZSUwy1/9kHR3IEzcl7oHzul7hne4xg9H5QE5
	nwNfD7VGALhj05uPk1JzUPnomx+NBQUjGf4e/BqlgCV9mDCng0svFwterzJ5roXG0G2jYAoPqsg
	XhK17WB00aJyYAqzFCr3zrOFXdqlW3lMYwWjznj2pk4tJBaXBFH+47TaeImtPsn3Uu7mP25gbTC
	0B6LlQHFxWYElf7BBgDiWa4m3/7kXlGP5sRW0qtu4jwfqIKPGl3FXurgxRtzqbIPz0QSqU6AcfX
	HzKSWlE/vIe4o7XZogRpVOOq7aZx4BUuyUxITi58sIEJ93SdiJU3mPMlQo0KjgVw+ZBrgadyiCT
	GRAS1m88R/clMu9DU31gMm/YA9y2WS6LzeNdl81EAKoroyvxNGi/rGuU4HBraIEGux9wd09qfhU
	RJmsEROQxI7T4/h/ULdIbTg6M9KGA+KV8R6YPLt8QTO/HEpp9UfHz82Q2NZG3EwtEbpcDNN+d3A
	+Dc75+DdJ8tT23+1ME1JlhQLeUhSIJLV+gHDkFUClIm2qFDpsXS+dWXLyI8D2VPigjmIgDQfw==
X-Received: by 2002:a05:600c:32af:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48e5dfcd722mr75004745e9.1.1778256291123;
        Fri, 08 May 2026 09:04:51 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd35abcsm4248055e9.7.2026.05.08.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:04:50 -0700 (PDT)
Date: Fri, 8 May 2026 18:04:49 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>

Hi Xu,

On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> the time which means the device core may not properly unbind consumer devices
> or handle something. The patch does a simple thing so the issue may not come
> from the patch itself.
> 
> 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> 1641:			link->status != DL_STATE_NONE);
> 1642:		__device_link_del(&link->kref);
> 1643:	}
> 
> Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> controller and related DTS nodes look like?

I was using kernel version 7.1-rc2 and noticed it while working on 
sending the Aquila iMX95 upstream.
https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> 
> Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?

I did various boot attempts with the commit reverted and couldn't 
reproduce the issue. With the commit I ran into the issue in about one 
third of all boot attempts. So most of the time dwc3_imx8mp_prove 
actually succeeds.

> 
> Could you add "#define DEBUG" in the head of drivers/base/core.c, rerun and share the log?
>
I can provide you with the data next week.
 
> Yes, if you use the new driver, I think this issue won't happen at all.
> 
So once your work is merged in the imx95.dtsi we should be fine.

> Thanks,
> Xu Yang

Best regards,

Franz
