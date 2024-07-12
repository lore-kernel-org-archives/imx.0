Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE81BC3C
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720825474; cv=none; b=CvJoEFZNo6ZWFkoZJP6eN1tSaDfDn+0tM0mXmrsOLjUIet7eMl0Qsp2ajMogfxxDQ6jObf0gtxbFoOEOhuJjFFqWhH87pxwbpVgdpaopoJph8o490Y/O2WJb4pv8euaiaXiQ8Ch/65XMctZznNe3LqQyxPF6B/G+8cswqTKNumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720825474; c=relaxed/simple;
	bh=4tRm09TPXpCEyy3LvCmgwHvnRENscf9x+aOAnSlP5h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDBWWQ/VxDmHUsyAyWznEbfioNCKcdYJXTkbPqMrxJeq/9h3mHj2fWQVc6cSorKPFFbAUFFscR8DZ+MvsC2WzNcbxZ3/MjYa0gPKEgKmmpB01UaW9n6ulZXpkhWFFsDWZV8D9i09zJz+Bckoilg8RCSog4MMsWSIe40Jd8xa7/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyQwBxTv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyQwBxTv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa9ecfb321so19702225ad.0
        for <imx@lists.linux.dev>; Fri, 12 Jul 2024 16:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720825472; x=1721430272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6PkwLVXmjDu8JCo3lFiQsP3XB0Gj7L4wUEjZB1YeKs=;
        b=SyQwBxTvGFLAddfc8QCpasx3cRMfkZ5H93ZBWcXgDgLooDWXz0rsaIPRVBOQG8+3te
         Lhbijs87I9kNIUKpTSjIgeDps4Y8ZEiMNpQhJf8xfMpjRisuL6/KP3EYme63zW9Bm4RH
         ckkpYiuW+kp5EwXmJgM0iQWfLT84R3U9EDAmmrkOCytPn7U9LaL2AlQrjobMRiG3IqUa
         sOQCQoZJ/0NGDQNqxl3+Ng0h+QsmvLIc7e4+NoQlZm9tHigfsYPp4hM0ClLWVIgx46fr
         80GtUwdONyaRKhLECU6kk/mqpl60inHK6UOajc8BhC0RctC9Lb/aQgUSns8S/kOKyrnm
         GDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720825472; x=1721430272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6PkwLVXmjDu8JCo3lFiQsP3XB0Gj7L4wUEjZB1YeKs=;
        b=wSMCWnTr/7md8Ye3eTysd6OZTHcJ0SpBeCQcno7lw9YJoHaL8crfqpnwJFCnfNBfiU
         Z6sD8S/KUMzzVLKVjgqL5NsLj+C7jYvZXWFgu4L44OcUs3w2Bilj/QfSoFg3qpO8M2OW
         Xk9r+jsRsc7gPJnPNBwRqAZFGvDOvw5i3VDQTM71adhcm12E+5kw8wTNicxqWcwuDp05
         0OS1vvQAFmrGorMJSm+z4jrNl7PbWW7iY/r9RiUfu3rtrUpH8jyV0hGwQQ7jkQ2ncFBG
         V4W7IJ/JZF/iZKRW3yueSJE86Q1NMv22t00RYN3zt+m9lYQBL32CKiMczielqul8zQue
         Cg3w==
X-Forwarded-Encrypted: i=1; AJvYcCWZbC4myctR2sPiwCQor5NqL4RhvbzcKqyXkQLabvD6lcO6U/E2Ala/7ZEVLvasq18UIxzJqij+k9TbTYAb59VMvr1P
X-Gm-Message-State: AOJu0YwhwCWoRSWLhnoOcfn1aLvMjKIVZ5PplvmuqZx2zuFDTueHMM9z
	WsWgVGvpMQZMWl3tMh9gMi5TDVCDDOSD7/r6Z7V4tgvKzDvL/Vph
X-Google-Smtp-Source: AGHT+IH6LwHfJ9xNahECYgGCkYn+Fym6L86i+95zmDKv3irVaet+zCM7AP+TDWGT6r30YuMn2QY4zg==
X-Received: by 2002:a17:902:e5cd:b0:1fb:6794:b474 with SMTP id d9443c01a7336-1fbb6edfa99mr112486295ad.60.1720825471793;
        Fri, 12 Jul 2024 16:04:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:669e:eb9d:e30c:18b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2bbd2sm74117565ad.90.2024.07.12.16.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 16:04:31 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:04:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpG2fNQ9-inLN8-Q@google.com>
References: <20240712224352.82190-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712224352.82190-1-Frank.Li@nxp.com>

Hi Frank,

On Fri, Jul 12, 2024 at 06:43:51PM -0400, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Report input event directly on wakeup to ensure no press event is missed
> when resuming from suspend.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/input/misc/nxp-bbnsm-pwrkey.c | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> index 1d99206dd3a8b..9675717ecbdfe 100644
> --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> @@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
>  	int irq;
>  	int keycode;
>  	int keystate;  /* 1:pressed */
> +	bool suspended;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
>  };
> @@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
>  {
>  	struct platform_device *pdev = dev_id;
>  	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +	struct input_dev *input = bbnsm->input;
>  	u32 event;
>  
>  	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> @@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
>  	mod_timer(&bbnsm->check_timer,
>  		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
>  
> +	/*
> +	 * Directly report key event after resume to make sure key press
> +	 * event is never missed.
> +	 */

How do you know that wakeup was caused by the key press on this device?
As far as I can see the driver requests the interrupt as shared, so we
could end up in bbnsm_pwrkey_interrupt() even if button was not pressed.

Thanks.

-- 
Dmitry
