Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8881ABF
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 16:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198749; cv=none; b=SFSfur3SE3TG/Cl6Vpdy7Lxa3AOFDIgruoDRPvszJL5pH7oDaIEuw6StTqjuFQAWkodw4VDAjigNKziYdbxWbe13vC9x384/kLzYiVprNbvsUtERdail8qiV1cNy1VYgLcu+fp7H3bdAA02bH6Jj3dEYesN1uFuYrzpa6sRXHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198749; c=relaxed/simple;
	bh=w+Jli2gXAqNrzzibOM83RHV530usC/LNM9MmjJsycxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ806IXH1awrJWKd+GKWgcwAH/mMbBw96fLVOnLLCEvZjVa9bjDWK5oWrwf9fRdU6rNxTzDB9kNVqW7pYCwDfLbaEhq02w/yxl4T9oWgjgZhZIPKU7EeAg+mWp3imhrSyM3LlqHIuHm15XVcCErIkt+G6F/gR8e9IrTRtMO+JsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jqzh4mg/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jqzh4mg/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e136cbcecso3964059a12.3
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 09:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713198744; x=1713803544; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CdPVT4G73fiqd7vz1POECcHJyXspCSMnftfniwcZUds=;
        b=Jqzh4mg/YUmWlkfFH+Rn+3neQzNXKsMfUxJiMBh3YvdVh/hlqUcQ5DOjBDQwUket1q
         e5dE/bAgcnNBQWakCtvEdwN9YNZKFtXNYB0tawFcKzlBq5N20IzFPY/u+S1Z0X+kk7Og
         9s2eiVrK9DXAkZYILr2RIS0mbdcjHf6bwVuzKyWW0XaWpas9wI4iUGUp1YbN6o1vmCg1
         D7ubQV3WRSiSuZcHfkBHejCAIPR1C3UtTM5C0sZTMfByj8dPVyuFBFo09zW1hGI0guS+
         XrBsZNQXAvIhmHDv0VqbGHJYSIawXUVpHRRM1Gxa4nh2wW9yONm07X6U578RtWSwoGlM
         +uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713198744; x=1713803544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdPVT4G73fiqd7vz1POECcHJyXspCSMnftfniwcZUds=;
        b=EBEM0Ex5sX7faunPBowCKXKK1rcLx3vBVl7WL18muKS1YMn8muc8Z56pgZezXy3TBc
         ycE3CNL77ewoG5eZP/tuuaOfTleL019R54KT/T4vmGhnOvd2magAj075qK4CLpEn2+Em
         iFHGxPi34UTv5TeWwYhpc8HOS/9dTYN8QsBK2Um6matFffxeGgg09pFmaWncL/DyuC9K
         y5a4DCC/LsV9V6RISvx2ME3EHGO43oS+2ySTuNECl0v5HlZaZYWqVFQyc3eDjaVe3dA5
         G3vM9vN/CfzTC8uQCOG7JnjxcN+84sTkXtlSIGEwEiSvj5dpY9Qy6vPfaysoTmVQ/i+V
         pFHw==
X-Forwarded-Encrypted: i=1; AJvYcCVmtdFteWteqxOnWxGxQ2HtysGHDvaZcqMSNHtYTdij8Wn9iCGLxoIYbkPJNsX+JAmzsufMx0tLVHInvxKRzNx2lQJi
X-Gm-Message-State: AOJu0Yx2T7DUxs5DnKDLF866KZLk33GCLLX9ezJ4uM61EOhMvFNaftS/
	GCD+qCgMRdSvee+O6aItO+zbnM1UAHpQLhvndJ6v2lik07nak13z
X-Google-Smtp-Source: AGHT+IG5111kErqtJ99UjxO28TBAoZDOYxc/kBLxTnhDOu7fNh4ku3mWNP1JtarGpo0eoVrqG9aHSw==
X-Received: by 2002:a50:8a88:0:b0:56d:f7ce:e879 with SMTP id j8-20020a508a88000000b0056df7cee879mr7558482edj.37.1713198744290;
        Mon, 15 Apr 2024 09:32:24 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-57-233.cust.vodafonedsl.it. [188.217.57.233])
        by smtp.gmail.com with ESMTPSA id y24-20020aa7d518000000b0056e68b14986sm4975937edq.29.2024.04.15.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:32:23 -0700 (PDT)
Date: Mon, 15 Apr 2024 18:32:21 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Luis Garcia <git@luigi311.com>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 24/25] media:i2c: imx258: Use v4l2_link_freq_to_bitmap
 helper
Message-ID: <Zh1WlamoDoFbvEMv@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240414203503.18402-1-git@luigi311.com>
 <20240414203503.18402-25-git@luigi311.com>
 <Zh1FUQOt9n/tO3er@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <656bf349-38bf-44b7-936c-58f424613a49@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <656bf349-38bf-44b7-936c-58f424613a49@luigi311.com>

On Mon, Apr 15, 2024 at 10:27:28AM -0600, Luis Garcia wrote:
> On 4/15/24 09:18, Tommaso Merciai wrote:
> > Hi Luis,
> > 
> > On Sun, Apr 14, 2024 at 02:35:02PM -0600, git@luigi311.com wrote:
> >> From: Luis Garcia <git@luigi311.com>
> >>
> >> Use the v4l2_link_freq_to_bitmap() helper to figure out which
> >> driver-supported link freq can be used on a given system.
> >>
> >> Signed-off-by: Luis Garcia <git@luigi311.com>
> >> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> >> ---
> >>  drivers/media/i2c/imx258.c | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> >> index 5de71cb7c1ae..65846dff775e 100644
> >> --- a/drivers/media/i2c/imx258.c
> >> +++ b/drivers/media/i2c/imx258.c
> >> @@ -693,6 +693,7 @@ struct imx258 {
> >>  	/* Current mode */
> >>  	const struct imx258_mode *cur_mode;
> >>  
> >> +	unsigned long link_freq_bitmap;
> >>  	const struct imx258_link_freq_config *link_freq_configs;
> >>  	const s64 *link_freq_menu_items;
> >>  	unsigned int lane_mode_idx;
> >> @@ -1552,6 +1553,17 @@ static int imx258_probe(struct i2c_client *client)
> >>  		return ret;
> >>  	}
> >>  
> >> +	ret = v4l2_link_freq_to_bitmap(&client->dev,
> >> +				       ep.link_frequencies,
> >> +				       ep.nr_of_link_frequencies,
> >> +				       imx258->link_freq_menu_items,
> >> +				       ARRAY_SIZE(link_freq_menu_items_19_2),
> >> +				       &imx258->link_freq_bitmap);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "Link frequency not supported\n");
> >> +		goto error_endpoint_free;
> >> +	}
> >> +
> >>  	/* Get number of data lanes */
> >>  	switch (ep.bus.mipi_csi2.num_data_lanes) {
> >>  	case 2:
> > 
> > Looks good to me.
> > 
> > ps:
> > Maybe a good plan for the future would be to use: dev_err_probe
> > (instead of dev_err into probe function)
> > 
> > But this I think is somenthing for next improvements. :)
> > 
> > Thanks & Regards,
> > Tommaso
> > 
> 
> Perfect, can i go ahead and add in your reviewed by looks like
> you didnt add it here.

Yep sorry I miss that. :'(

Thanks & Regards,
Tommaso

> 
> >> -- 
> >> 2.44.0
> >>
> >>
> 
