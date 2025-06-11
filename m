Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BCA198A1A
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669472; cv=none; b=lEXPtUy9kQM+1Jd9D1jBvKvhoPvoCWkRnwZ1lp8a87W1QokBCKPFJBIRMsjvorWtPBXLHYLPdqextY9sgDDVqTFrtVc+vb2+iXGyqgvLqKzgIAWOw6+bCkS/Se9jMz61WTgM6aSzCQbogLfJxiE8f2/0MVuve6DLalsEiMYCkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669472; c=relaxed/simple;
	bh=fUrUvj/NKrnOKNMJe9QMJYc8JHU2TblrN3dQxgOBq8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUK1ZLYpvzlzN2qy0m0DlNPeHpHru7vd9AQ9+7zjJOWgD8l8Cj6sFuk0LqsLdaEEyUzyodWP9UknrKIAeZImRI03oScl2+gcul95I1Y+nLq6APwTxVN4hVniDhBweSZRFfaXyhTNnW75qtR61uI61LViO4BmwAe5kC2TbvTkOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y1CXcam8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1CXcam8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4531e146a24so973485e9.0
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749669469; x=1750274269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=y1CXcam8mkHeGNEF3YDAxMywDTWDYdQ/ME/Iv1xwDnDs1yx45vbfkDXcBTDeF4g1DT
         ukRRg0RzQ4iI7pfqr+K57e6vURgC1UsTRL7sop5IARxyT3sqPPhxh2l9YjLYtwtcuVUG
         TAcKZQlq0Kjbj4f3S8XqLmfyjSji59VfsS/ipsANVFNkFAwRl41MLDRMJ9JOM7vM0Hul
         Mz1DrgKaHqyJ50gs2kOMy+ERYPafcIsTxWkfsyM0EyMRxBsqAUhrJ21F8DZrJGx4s+qk
         KmFtWVuE4xlowHHaMo3hVD4ktKMgSWahbWbaM2WbikJfx7S2x/gDBpfucau8zXXLtbg8
         VaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749669469; x=1750274269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=tVPrLJsdD0uMOSUcyJMOx2Q5pH06FyMj4Uh9dmzeXPeK/UzMs6/qyrbYENDoLKv3KQ
         aWQlBsUFIYmPjin6MN63s5Xavn9MPB92PVCWEXlsx0SmVOQZ0vnFrjl+nuJ1A2SdyAl3
         iysbVDPAYQNHxNvvlJzGZhOM5jFeWV7DROJoV+mQsJ2SSBg1HrHdiwq6JD3VsSH06A8Q
         EFPa1kPq7M+6lqUaZxUuuXRL30SXwZ9IiIPApzfGwdJXsZnXXpNkhTXGAx3YSEPzG1Xe
         iVtS9PyI1tFenqimCjU0ZKV1bAmzTf0aPcegoEBU2a6YG1Fzk8++ywK0zFKNyv0SXjpP
         UjNw==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZTg66NH+eaUoOTnm+3rJUck1AhCMRV4P/LomoMHlMyNb/DiUWhMtmehqEBhipd7auUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUiem8fMGo7pMiKQLwXFMmPtX+rlxf3OOC2/HdtnnUmFMbr4QR
	pFDwlYg3yc6uHPq3SNDzOb/1nePE1ZqHIV/y/7/8AS5IyaH/OE6419iZPj44V79E8a0=
X-Gm-Gg: ASbGncv6jCuTv2TsI4iE9uQp5c6nawPfASYmoVzomk40NXjzoxn19TEaYUgU6QaVHdi
	+TW2lTdBbR62mEgu21Cg5I8SrrL1cYBHG4I+sjYwS9xXwOBcIq57mP04//W9r6EI54L8VLwTrA9
	w1Oz+UE1BtIfo20jj27OvxCko9wKUORAVLkMLsphRP9q40zImmVOMVpE0P0V1EP3B7tcuWjOh4t
	L4XZ+AEWY7KRrTTKweHSbQF4XlW0xTSMGTh3ets+n2xBBIkYAF3qCSG4Ix78zk3+QOID7vzeDd8
	QHl72yLF+HO3pEIXHHXFsMjIXVc8fAIpeiWlphYgtds9q9BnTIAnsFP6Pg6XwYjMtSg=
X-Google-Smtp-Source: AGHT+IGJ3NQ8AU+WANwLf0nZAuX7XDSfVjhF8GwX89vHnWLiFcZb6a/55FgYJ7VjRdDmwl1wu3ltxw==
X-Received: by 2002:a05:600c:6612:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4532487b346mr48416505e9.14.1749669468976;
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm29370725e9.21.2025.06.11.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:17:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <aEnWWPgXseRGdSz1@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
 <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:40:17PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:39PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > Enable USB driver for the s32g3 USB device.
> >
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
> >  drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index ce207f8566d5..d062399ce15e 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
> >  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
> >  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> >  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
> > +	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
> 
> If it is same, suggest compatible string fallback to nxp,s32g2-usb
> 
> compatible = "nxp,s32g3-usb", "nxp,s32g2-usb".
> 

These are the same, yeah.  I'm not sure I understand.  Did you mean just
add the "nxp,s32g2-usb" string to the driver, and put both the g2 and g3
in the devicetree file?

regards,
dan carpenter

