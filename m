Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392E191F79
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265867; cv=none; b=UhJeYaSc5wxWkG89njj2lHg3izUbrOlZi3fyhFsfGwhVBKIC7Ve+CSW92wS0zoTE34ZxKZ5JCNRwXhV9jRQT3vbjsC81zkRT4/ePEzNQAygm9i8fIoqsyKob6TmwtNwnEj+G25rNrr1ky0vkXMNFhuU3rF1pfCoRWeghm4Ciygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265867; c=relaxed/simple;
	bh=RuJkx0SME0u7KQoXNcdSFo1kg/bczJSkO6Gfd1eD3s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBNdlrULXDiZa8Ka8WV6HB0gU26OjzN3r8tWiVIWZY6GN6aLwAecQgPrNGhReMIlKPCLK9vkEyDm4d7aLKORrIZgZI1xQfBpWkUJaW2SF807UsWHKAmusXBvggDxc4O9SxiWYF5cpkjSPknu+4364EybfFCMg2hCTQHsq9q2B00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=en/ci6Jr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="en/ci6Jr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so262593f8f.2
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265864; x=1744870664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=en/ci6Jr1N4kYx5mSB7mzZgAb4m4P6aVT61rsfRZAyCRvGZlmwMLUDpZ/SuXg4lcLh
         2Js4pCZ2pJi3cI/h1/6ni6nmRya5Ng1Fg5X9Yr+23FCHtEOJqoTWDLy6ts38dQeL6LRV
         egqUKmngkZDXTgpBIpsBO+TkRetbiP4jfZXD23+/rUxXRdW+2DUW7KeDQ49W8APB76m8
         QJV/hgRt9yt3KPX0eyan1KaaF/scH+f58LqNaZ80QBu/28ufHGc38zOyiHRUxgJqrMK2
         FzaCbtPSEfde1NFCbazYeux4hq7Dp2lcHKBIY9NOGVVH+oWDdIA7XLwT01tkoK5lAXjU
         pbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265864; x=1744870664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=LVEXaLtmIaiZDxFkZYSb3UNrWojY6l4FQlM9GHA/SvaQlKbKXxcOCH+YhoSpWRquam
         0AJUtIKzarOfP4Mf3LBKPFtDJbpWSpP5MJI7LawoqP2jFUoFR0LZYj830uMXPx7U45WE
         XJWHBrACzwRLCgOCI+otjheZ9H9kcdn25MIFLLhu7QDWRR5SLxoRA2snJj1TQe473HY3
         6WNmeM0WFSY/6U7IQFzwn5TLbxxNJTwiizvsTVfpoijTADZZzkYlO/5hTjvXiZPrCFBm
         6sx8W0dsDHmJKwgG5FvA17pUoxIUBjnOe1izCt6RyRmW2HfFeMslysejy7sXbQ0h9gRy
         fFTA==
X-Forwarded-Encrypted: i=1; AJvYcCXzwD7KeFVOueWHlnoPWiT/SHfHKmPcLdbi/vWpu4arJADsXW6aEJMstJ2I525IzRx+sc0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbYclvtGRnN50piA1c6OLm9SHCZ47Z03G48sJ2RG/XBmNqo3B/
	NfGrazHw573Rlmw5GEfFK26ZCXtDKwGSV/239VcPTYUZpvo+MGIld56SSw/EmJ4=
X-Gm-Gg: ASbGncsdwpVHlDxmmrurY4+GxwXtpqyf0fx1e+BAWkof+BvoXaEbV/FnL48ldMSO36v
	WXjB4Dr7a1795bzkJJzXYM2vKgXtnnaZxT89KTP7ieWI3r6O3L8CfRGRKNoEeeou1NrX2eLfscZ
	NDTy2PcjINQ+gRriyUz27w8+F7D6GufXykq7ifDJtJ4cugOiQJ7blDZiMP41wAX9MEYETKN0ccZ
	ios+JZLyFYNeSvFEj5Tg/9ijYDvPyX/nTKUvNer9UEpzNiLRWRPfjZhOXEbMjIkUPyuEeHdRRH7
	V2CNKEweRDcd7rV6o+9dCngmaTy/Vn2U1s9DBzhhvkJjv9RdTPrfQUUe
X-Google-Smtp-Source: AGHT+IGPf0mN33Z8VXMC6vHoEgIYPUGu+ettg097AataOUXjxz6bSk1dsUcrvcjBIRQZplQw7qTkLw==
X-Received: by 2002:a05:6000:18ae:b0:39c:2692:425a with SMTP id ffacd0b85a97d-39d8fd63d92mr746462f8f.6.1744265864279;
        Wed, 09 Apr 2025 23:17:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893611d0sm3664353f8f.6.2025.04.09.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:17:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:17:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging/media/imx: fix null pointer dereference
Message-ID: <0d496695-ce20-4774-8e86-4d5c98dc220b@stanley.mountain>
References: <20250409211727.62710-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211727.62710-1-siddarthsgml@gmail.com>

On Thu, Apr 10, 2025 at 02:47:27AM +0530, Siddarth G wrote:
> Cppcheck warnings:
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> error: Null pointer dereference: fi [ctunullpointer]
>   if (fi->denominator == 0) {
> 
> drivers/staging/media/imx/imx-media-csi.c:795:27:
> note: Calling function imx_media_fim_set_stream, 2nd argument is null
>   imx_media_fim_set_stream(priv->fim, NULL, false);
                                              ^^^^^
This is a false positive.  The false means that we don't call
update_fim_nominal().  Btw, Smatch parses this one correctly.

> 
> drivers/staging/media/imx/imx-media-fim.c:388:3:
> note: Calling function update_fim_nominal, 2nd argument is null
>   update_fim_nominal(fim, fi);
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> note: Dereferencing argument fi that is null
>   if (fi->denominator == 0) {
> 
> To fix the issue, add a check to validate that the 'fi' is not
> null before accessing its members.
> 
> Signed-off-by: Siddarth G <siddarthsgml@gmail.com>

Don't resend because we just ignore false positives instead of
trying to silence them.  But if this were a real bug then it
would need a Fixes tag.

> ---
>  drivers/staging/media/imx/imx-media-fim.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index ccbc0371fba2..25f79d0f87b9 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
>  static void update_fim_nominal(struct imx_media_fim *fim,
>  			       const struct v4l2_fract *fi)
>  {
> +	if (!fi)
> +		return;

If this were a real bug, then probably the NULL check would be better in
the caller.

regards,
dan carpenter

> +
>  	if (fi->denominator == 0) {
>  		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
>  		fim->enabled = false;
> -- 
> 2.43.0
> 
