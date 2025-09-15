Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B906221E097
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757945121; cv=none; b=IkZx1adjKGZKxe1KYtd2OJ019a7/3ikEO5+S2o7zpTxbZ+BBFSb3NPoAEFboeYpX/SS966tddCkWMESOHxQK4gAsJj3ZGkrKZVL2MDyIF+yOTwwHeVdbU4n+7ePcXxp5Y4DqOTzJ+zz3oBWWjlVz/tYr0tQCv4MSlq743LAGs2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757945121; c=relaxed/simple;
	bh=C+r9QydbdeWXlv7FnOvwDgfSKZyi0JtsDi6wUiXpcAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3435bnFa0OYPTOsFrDCuFORBYmVjyfAk6C/RQUJQ4X1BTqMIwdJH3WwKXuvKDcsG0yXXsx6mjNt2w7e2/PQ8bxeX3O3ExQpddbPGMvkoMPyi/0tovhNjefmISchbWRZJvfXyzzvzkxK5Zwzk2jsSMo4Zzbjzuocfml4Nu6/0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NC8Ozsjk; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NC8Ozsjk"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-606b375eeb3so1980164d50.1
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1757945119; x=1758549919; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwYnkwtdfCqWLl9gcBIyB33wD9YpSZTIVWI9Hj0NbHI=;
        b=NC8OzsjkImU6OC+mdOnlJtDUMyFjhq8WZjoGBruGLESyUTX8fomcsFjngNfZbVmd8H
         aUKhR0VVOMdcPH4Y5OXEZhCU4sx80/FkPl6LoJV1JxdjZlpOXOt5brUGXF/mKSjPXB2l
         IynVQ3fYl/Oq+bg2iqqHqGz4Rp4lFLhHpQJu45gAp8HatnWmxRg+exoBN1SDCbZK+HCe
         n+0b7qpXwfOYuHPmWpXcgFc1JVR7CDQDZKLfLr3/oljDxNoC/+9JBtRsug9qPuQ14jiz
         odhHpHhYGhfexc2P4qUIQE0seqzIKnl/s+sSLGCkmLyeAY46MDx+d06Pv6AILGTsdgcN
         Ygng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945119; x=1758549919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwYnkwtdfCqWLl9gcBIyB33wD9YpSZTIVWI9Hj0NbHI=;
        b=T+VCGnIS0DFKgy9+XUPmf6tKedS1MdY2psGl4o8YnVjf+3FzlHmDHqjV0JizzQbJTA
         VPSeJ1VTRuuhb/vbbnJYm9w8TU2vC5GNJ6AOQ0F7FW0gLRJ8BzaSP8He5kavnaj/Pqan
         7K9PU45FcGR1/dQhSJrPD1GNo38Y1LoZCuYn1Z+AbClaqc2ISJ+xfH8Dnn/CZpsiZXGy
         7+UT7kTuKcNLfXXKFJMplhhL89J6LCSuB3nZRtPI0fGR0b0p3hmMq4GAEf177hFCny8O
         NF3uzr0ykjhzCyj1Q17N73p+ylRZCASOfXN0u57V1QvLNTnJQzkjYeestKEX9Dq+kGJ7
         TIqA==
X-Forwarded-Encrypted: i=1; AJvYcCUTzm5CHw2sh2b9DH3VuzV9w7lExxRkka6xnhJc++OJO1ZC9ejPBLSa9uzVuWf874vyNb8=@lists.linux.dev
X-Gm-Message-State: AOJu0YydwYo2Evn5uivXvLaFSPKM7N0Hxquvg4AKyfRp9zVI1e5b3nZD
	MRReu5T9Yg1aDlN7EcmAakh8yhRA4zKBXgWmqDGcjWm9xABXAtC37Y2G9jlGKsjIkA==
X-Gm-Gg: ASbGncvr5nvp3ZVq0b6G7169WvWYPAwEKs5cSItyf+DKQngjeHO2WKV1RLVbXqbExbw
	QRo21/M3FYUMe51ZcWUWLUm2xhw8VdP6EnYTpF/mU5cBigHNSjVyriINQX5wBb3GhbiBTt9rHk9
	MIMWSpUImTk6xik5w8DDxinaJbKi9F9WMHk9CTOlhOidZeg25oTgGtCpCOBmvQ9Cz4ozChvaele
	QeB5UbCqOWeRKETS7MjPy5bjz4LHA84ok2Gb8FXtinoUkSGyAWtsN2oXIM3TTj9NhBexMbSD4bW
	IQ9KKDn08k+sTZPYqNaQ5xT6ULozhTI6eaG++ocqDRCr+/tw3ln2yhZ6Vdb/RtLGnYbex9S0Dw4
	M77NNqlBjlQzHUzMEkd1D28PPG1hkVqhxHMuP6ce3zYBDYUyq0tH+
X-Google-Smtp-Source: AGHT+IHKOwAZPyuZ8MCrgdObQBKROdhMB9ALbM4MZEg1IGWdFzuJ1297fvboQyVsLtiGKky0GtLGFg==
X-Received: by 2002:a53:e8cb:0:b0:62c:204:5dfe with SMTP id 956f58d0204a3-62c02046306mr5284610d50.4.1757945118538;
        Mon, 15 Sep 2025 07:05:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-77a987c2099sm32195346d6.35.2025.09.15.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:05:17 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:05:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: zero: add function wakeup support
Message-ID: <95ff48ae-5cdb-4e3d-aeb9-1b6cc33412dd@rowland.harvard.edu>
References: <20250915090230.1280460-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915090230.1280460-1-xu.yang_2@nxp.com>

On Mon, Sep 15, 2025 at 05:02:30PM +0800, Xu Yang wrote:
> When the device working at enhanced superspeed, it needs to send function

Is this also true when the device is connected at regular (not enhanced) 
SuperSpeed?

> remote wakeup signal to the host instead of device remote wakeup. Add
> function wakeup support for the purpose.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/legacy/zero.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
> index a05785bdeb30..fe286b597f9f 100644
> --- a/drivers/usb/gadget/legacy/zero.c
> +++ b/drivers/usb/gadget/legacy/zero.c
> @@ -147,6 +147,12 @@ static struct usb_gadget_strings *dev_strings[] = {
>  	NULL,
>  };
>  
> +static struct usb_function *func_lb;
> +static struct usb_function_instance *func_inst_lb;
> +
> +static struct usb_function *func_ss;
> +static struct usb_function_instance *func_inst_ss;
> +
>  /*-------------------------------------------------------------------------*/
>  
>  static struct timer_list	autoresume_timer;
> @@ -156,6 +162,7 @@ static void zero_autoresume(struct timer_list *unused)
>  {
>  	struct usb_composite_dev	*cdev = autoresume_cdev;
>  	struct usb_gadget		*g = cdev->gadget;
> +	int status;

Please use the same style for your new code as for the existing code.  
In this case, use tabs to align "status" with "*g" and "*cdev".

Alan Stern
